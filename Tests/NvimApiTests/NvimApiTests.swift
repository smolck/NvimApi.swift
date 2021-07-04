import XCTest
@testable import NvimApi
import CryptoKit

final class NvimApiTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        // XCTAssertEqual(NvimApi().text, "Hello, World!")

        let nvim = Nvim(notificationHandler: { (nvim: Nvim, notif: String, stuff: Any) -> Void in
            // print("got notif!", nvim, notif, stuff)
        }, requestHandler: { (nvim: Nvim, request: String, args: Any) -> Void in
        })
        /*try nvim.commandOutput(command: "echo 1 + 1").done { x in
            print("done! \(x)")
        }
        try nvim.commandOutput(command: "echo 1 + 1").done { x in
            print("done! \(x)")
        }*/
        try nvim.command(command: "efdajfdak fdaf").catch { err in
            print("ERROR! \(err)")
        }.finally {
            do {
                try nvim.getCurrentBuf().done { buf in
                    try buf.getLines(start: 0, end: -1, strictIndexing: false).done { lines in
                        print("LINES!", lines)
                    }
                }
            } catch {
                print("whatevs")
            }
        }
        sleep(6)
        // let window = try nvim.getCurrentWin()
        // nvim.nvimProc.terminate()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
