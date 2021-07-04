import Foundation
import SwiftMsgPack
import PromiseKit

enum NvimError: Error {
    case ResponseError(_ error: Any)
}

public final class Nvim {
    let nvimProc: Process
    let nvimOutputPipe: Pipe
    let nvimInputPipe: Pipe
    var processTerminated: Bool = false
    var dataStuff = [UInt8]()

    var pendingRequests: [Int : Resolver<Any>] = [:]
    var nextRequestId = 0

    init(
        notificationHandler: @escaping (Nvim, String, Any) -> Void,
        requestHandler: @escaping (Nvim, String, Any) -> Void,
        binaryPath: String = "/usr/local/bin/nvim",
        args: String...
    ) {
        nvimProc = Process()
        nvimProc.launchPath = binaryPath
        nvimProc.arguments = ["--embed"]

        nvimOutputPipe = Pipe()
        nvimProc.standardOutput = nvimOutputPipe

        nvimInputPipe = Pipe()
        nvimProc.standardInput = nvimInputPipe

        NotificationCenter.default.addObserver(
            forName: FileHandle.readCompletionNotification, object: nvimOutputPipe.fileHandleForReading,
            queue: nil,
            using: { (notification) in
            if let data = notification.userInfo?[NSFileHandleNotificationDataItem] as? Data {
                do {
                    let decoded = ((try data.unpack())! as? [Any])!
                    let msgType = (decoded[0] as? Int8)!
                    switch (msgType) {
                    case 0: // Request
                        requestHandler(self, (decoded[1] as? String)!, decoded[2])
                    case 1: // Response
                        if let resolver = self.pendingRequests[Int((decoded[1] as? Int8)!)] {
                            if let err = (decoded[2] as? Optional<Any>)! {
                                resolver.reject(NvimError.ResponseError(err))
                            } else {
                                resolver.resolve(decoded[3], .none)
                            }
                        }
                    case 2: // Notify
                        notificationHandler(self, (decoded[1] as? String)!, decoded[2])
                    default:
                        print("[nvim-api]: if this ever happens, the world is ending . . . or neovim was updated?")
                    }
                } catch {
                    print("[nvim-api]: failed to unpack!: \(error)")
                }

                if !self.processTerminated {
                    self.nvimOutputPipe.fileHandleForReading.readInBackgroundAndNotify()
                }
            }
        })

        NotificationCenter.default.addObserver(
            forName: Process.didTerminateNotification, object: nvimProc, queue: nil,
            using: { (n) in

            self.processTerminated = true
        })

        nvimOutputPipe.fileHandleForReading.readInBackgroundAndNotify()
        nvimProc.launch()
    }
    
    func sendToNvim(method: String, args: Any...) throws -> Promise<Any> {
        let reqId = nextRequestId
        nextRequestId += 1

        var data = Data()
        let cmd: [Any] = [0, reqId, method, args]
        try data.pack(cmd)
        nvimInputPipe.fileHandleForWriting.write(data)

        let (promise, resolver): (Promise<Any>, Resolver<Any>) = Promise.pending()
        pendingRequests[reqId] = resolver
        return promise
    }
}
