import Foundation
import SwiftMsgPack
import PromiseKit
extension Buffer {      func lineCount() throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_line_count" , args: id  ).map { 
           x in (x as? Int)!  
        }
      }
          func attach(sendBuffer: Bool, opts: [AnyHashable : Any]) throws -> Promise<Bool> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_attach" , args: id  , sendBuffer, opts).map { 
           x in (x as? Bool)!  
        }
      }
          func detach() throws -> Promise<Bool> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_detach" , args: id  ).map { 
           x in (x as? Bool)!  
        }
      }
          func getLines(start: Int, end: Int, strictIndexing: Bool) throws -> Promise<[String]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_lines" , args: id  , start, end, strictIndexing).map { 
           x in (x as? [String])!  
        }
      }
          func setLines(start: Int, end: Int, strictIndexing: Bool, replacement: [String]) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_set_lines" , args: id  , start, end, strictIndexing, replacement).map { 
           _ in ()  
        }
      }
          func setText(startRow: Int, startCol: Int, endRow: Int, endCol: Int, replacement: [String]) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_set_text" , args: id  , startRow, startCol, endRow, endCol, replacement).map { 
           _ in ()  
        }
      }
          func getOffset(index: Int) throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_offset" , args: id  , index).map { 
           x in (x as? Int)!  
        }
      }
          func getVar(name: String) throws -> Promise<Any> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_var" , args: id  , name).map { 
           x in (x as? Any)!  
        }
      }
          func getChangedtick() throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_changedtick" , args: id  ).map { 
           x in (x as? Int)!  
        }
      }
          func getKeymap(mode: String) throws -> Promise<[[AnyHashable : Any]]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_keymap" , args: id  , mode).map { 
           x in (x as? [[AnyHashable : Any]])!  
        }
      }
          func setKeymap(mode: String, lhs: String, rhs: String, opts: [AnyHashable : Any]) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_set_keymap" , args: id  , mode, lhs, rhs, opts).map { 
           _ in ()  
        }
      }
          func delKeymap(mode: String, lhs: String) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_del_keymap" , args: id  , mode, lhs).map { 
           _ in ()  
        }
      }
          func getCommands(opts: [AnyHashable : Any]) throws -> Promise<[AnyHashable : Any]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_commands" , args: id  , opts).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func setVar(name: String, value: Any) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_set_var" , args: id  , name, value).map { 
           _ in ()  
        }
      }
          func delVar(name: String) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_del_var" , args: id  , name).map { 
           _ in ()  
        }
      }
          func getOption(name: String) throws -> Promise<Any> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_option" , args: id  , name).map { 
           x in (x as? Any)!  
        }
      }
          func setOption(name: String, value: Any) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_set_option" , args: id  , name, value).map { 
           _ in ()  
        }
      }
          func getName() throws -> Promise<String> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_name" , args: id  ).map { 
           x in (x as? String)!  
        }
      }
          func setName(name: String) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_set_name" , args: id  , name).map { 
           _ in ()  
        }
      }
          func isLoaded() throws -> Promise<Bool> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_is_loaded" , args: id  ).map { 
           x in (x as? Bool)!  
        }
      }
          func delete(opts: [AnyHashable : Any]) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_delete" , args: id  , opts).map { 
           _ in ()  
        }
      }
          func isValid() throws -> Promise<Bool> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_is_valid" , args: id  ).map { 
           x in (x as? Bool)!  
        }
      }
          func getMark(name: String) throws -> Promise<[Int]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_mark" , args: id  , name).map { 
           x in (x as? [Int])!  
        }
      }
          func getExtmarkById(nsId: Int, id: Int, opts: [AnyHashable : Any]) throws -> Promise<[Int]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_extmark_by_id" , args: id  , nsId, id, opts).map { 
           x in (x as? [Int])!  
        }
      }
          func getExtmarks(nsId: Int, start: Any, end: Any, opts: [AnyHashable : Any]) throws -> Promise<[Any]> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_get_extmarks" , args: id  , nsId, start, end, opts).map { 
           x in (x as? [Any])!  
        }
      }
          func setExtmark(nsId: Int, line: Int, col: Int, opts: [AnyHashable : Any]) throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_set_extmark" , args: id  , nsId, line, col, opts).map { 
           x in (x as? Int)!  
        }
      }
          func delExtmark(nsId: Int, id: Int) throws -> Promise<Bool> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_del_extmark" , args: id  , nsId, id).map { 
           x in (x as? Bool)!  
        }
      }
          func addHighlight(nsId: Int, hlGroup: String, line: Int, colStart: Int, colEnd: Int) throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_add_highlight" , args: id  , nsId, hlGroup, line, colStart, colEnd).map { 
           x in (x as? Int)!  
        }
      }
          func clearNamespace(nsId: Int, lineStart: Int, lineEnd: Int) throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_clear_namespace" , args: id  , nsId, lineStart, lineEnd).map { 
           _ in ()  
        }
      }
          func setVirtualText(srcId: Int, line: Int, chunks: [Any], opts: [AnyHashable : Any]) throws -> Promise<Int> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_set_virtual_text" , args: id  , srcId, line, chunks, opts).map { 
           x in (x as? Int)!  
        }
      }
          func call(fun: LuaRef) throws -> Promise<Any> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_buf_call" , args: id  , fun).map { 
           x in (x as? Any)!  
        }
      }
          func currentBuf() throws -> Promise<Void> {
        return try __dontYouDareUseThisIfYouArentThisLibrary.sendToNvim(method: "nvim_set_current_buf" , args: id  ).map { 
           _ in ()  
        }
      }
    }