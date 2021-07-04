import Foundation
import SwiftMsgPack
import PromiseKit
extension Tabpage {      func listWins() throws -> Promise<[Window]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_tabpage_list_wins" , args: id  ).map { 
           x in (x as? [Window])!  
        }
      }
          func getVar(name: String) throws -> Promise<Any> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_tabpage_get_var" , args: id  , name).map { 
           x in (x as? Any)!  
        }
      }
          func setVar(name: String, value: Any) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_tabpage_set_var" , args: id  , name, value).map { 
           _ in ()  
        }
      }
          func delVar(name: String) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_tabpage_del_var" , args: id  , name).map { 
           _ in ()  
        }
      }
          func getWin() throws -> Promise<Window> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_tabpage_get_win" , args: id  ).map { 
           x in 
        let x = (x as? [Any])!
        return Window(nvim: self.__dontYouDareUseThisIfYouArentThisLibrary, (x[2] as? UInt16)!)
     
        }
      }
          func getNumber() throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_tabpage_get_number" , args: id  ).map { 
           x in (x as? Int)!  
        }
      }
          func isValid() throws -> Promise<Bool> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_tabpage_is_valid" , args: id  ).map { 
           x in (x as? Bool)!  
        }
      }
          func currentTabpage() throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_set_current_tabpage" , args: id  ).map { 
           _ in ()  
        }
      }
    }