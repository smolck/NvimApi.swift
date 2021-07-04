import Foundation
import SwiftMsgPack
import PromiseKit
extension Window {      func currentWin() throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_set_current_win" , args: id  ).map { 
           _ in ()  
        }
      }
          func getBuf() throws -> Promise<Buffer> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_buf" , args: id  ).map { 
           x in 
        let x = (x as? [Any])!
        return Buffer(nvim: self.__dontYouDareUseThisIfYouArentThisLibrary, (x[2] as? UInt16)!)
     
        }
      }
          func setBuf(buffer: Buffer) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_set_buf" , args: id  , buffer).map { 
           _ in ()  
        }
      }
          func getCursor() throws -> Promise<[Int]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_cursor" , args: id  ).map { 
           x in (x as? [Int])!  
        }
      }
          func setCursor(pos: [Int]) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_set_cursor" , args: id  , pos).map { 
           _ in ()  
        }
      }
          func getHeight() throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_height" , args: id  ).map { 
           x in (x as? Int)!  
        }
      }
          func setHeight(height: Int) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_set_height" , args: id  , height).map { 
           _ in ()  
        }
      }
          func getWidth() throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_width" , args: id  ).map { 
           x in (x as? Int)!  
        }
      }
          func setWidth(width: Int) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_set_width" , args: id  , width).map { 
           _ in ()  
        }
      }
          func getVar(name: String) throws -> Promise<Any> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_var" , args: id  , name).map { 
           x in (x as? Any)!  
        }
      }
          func setVar(name: String, value: Any) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_set_var" , args: id  , name, value).map { 
           _ in ()  
        }
      }
          func delVar(name: String) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_del_var" , args: id  , name).map { 
           _ in ()  
        }
      }
          func getOption(name: String) throws -> Promise<Any> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_option" , args: id  , name).map { 
           x in (x as? Any)!  
        }
      }
          func setOption(name: String, value: Any) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_set_option" , args: id  , name, value).map { 
           _ in ()  
        }
      }
          func getPosition() throws -> Promise<[Int]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_position" , args: id  ).map { 
           x in (x as? [Int])!  
        }
      }
          func getTabpage() throws -> Promise<Tabpage> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_tabpage" , args: id  ).map { 
           x in 
        let x = (x as? [Any])!
        return Tabpage(nvim: self.__dontYouDareUseThisIfYouArentThisLibrary, (x[2] as? UInt16)!)
     
        }
      }
          func getNumber() throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_number" , args: id  ).map { 
           x in (x as? Int)!  
        }
      }
          func isValid() throws -> Promise<Bool> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_is_valid" , args: id  ).map { 
           x in (x as? Bool)!  
        }
      }
          func setConfig(config: [AnyHashable : Any]) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_set_config" , args: id  , config).map { 
           _ in ()  
        }
      }
          func getConfig() throws -> Promise<[AnyHashable : Any]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_get_config" , args: id  ).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func hide() throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_hide" , args: id  ).map { 
           _ in ()  
        }
      }
          func close(force: Bool) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_close" , args: id  , force).map { 
           _ in ()  
        }
      }
          func call(fun: LuaRef) throws -> Promise<Any> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_win_call" , args: id  , fun).map { 
           x in (x as? Any)!  
        }
      }
    }