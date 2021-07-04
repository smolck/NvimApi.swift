import Foundation
import SwiftMsgPack
import PromiseKit
extension Nvim {      func uiAttach(width: Int, height: Int, options: [AnyHashable : Any]) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_ui_attach"  , args: width, height, options).map { 
           _ in ()  
        }
      }
          func uiDetach() throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_ui_detach"  ).map { 
           _ in ()  
        }
      }
          func uiTryResize(width: Int, height: Int) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_ui_try_resize"  , args: width, height).map { 
           _ in ()  
        }
      }
          func uiSetOption(name: String, value: Any) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_ui_set_option"  , args: name, value).map { 
           _ in ()  
        }
      }
          func uiTryResizeGrid(grid: Int, width: Int, height: Int) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_ui_try_resize_grid"  , args: grid, width, height).map { 
           _ in ()  
        }
      }
          func uiPumSetHeight(height: Int) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_ui_pum_set_height"  , args: height).map { 
           _ in ()  
        }
      }
          func uiPumSetBounds(width: Double, height: Double, row: Double, col: Double) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_ui_pum_set_bounds"  , args: width, height, row, col).map { 
           _ in ()  
        }
      }
          func exec(src: String, output: Bool) throws -> Promise<String> {
        return try sendToNvim(method: "nvim_exec"  , args: src, output).map { 
           x in (x as? String)!  
        }
      }
          func command(command: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_command"  , args: command).map { 
           _ in ()  
        }
      }
          func getHlByName(name: String, rgb: Bool) throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_hl_by_name"  , args: name, rgb).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func getHlById(hlId: Int, rgb: Bool) throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_hl_by_id"  , args: hlId, rgb).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func getHlIdByName(name: String) throws -> Promise<Int> {
        return try sendToNvim(method: "nvim_get_hl_id_by_name"  , args: name).map { 
           x in (x as? Int)!  
        }
      }
          func setHl(nsId: Int, name: String, val: [AnyHashable : Any]) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_hl"  , args: nsId, name, val).map { 
           _ in ()  
        }
      }
          func feedkeys(keys: String, mode: String, escapeCsi: Bool) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_feedkeys"  , args: keys, mode, escapeCsi).map { 
           _ in ()  
        }
      }
          func input(keys: String) throws -> Promise<Int> {
        return try sendToNvim(method: "nvim_input"  , args: keys).map { 
           x in (x as? Int)!  
        }
      }
          func inputMouse(button: String, action: String, modifier: String, grid: Int, row: Int, col: Int) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_input_mouse"  , args: button, action, modifier, grid, row, col).map { 
           _ in ()  
        }
      }
          func replaceTermcodes(str: String, fromPart: Bool, doLt: Bool, special: Bool) throws -> Promise<String> {
        return try sendToNvim(method: "nvim_replace_termcodes"  , args: str, fromPart, doLt, special).map { 
           x in (x as? String)!  
        }
      }
          func eval(expr: String) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_eval"  , args: expr).map { 
           x in (x as? Any)!  
        }
      }
          func execLua(code: String, args: [Any]) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_exec_lua"  , args: code, args).map { 
           x in (x as? Any)!  
        }
      }
          func notify(msg: String, logLevel: Int, opts: [AnyHashable : Any]) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_notify"  , args: msg, logLevel, opts).map { 
           x in (x as? Any)!  
        }
      }
          func callFunction(fn: String, args: [Any]) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_call_function"  , args: fn, args).map { 
           x in (x as? Any)!  
        }
      }
          func callDictFunction(dict: Any, fn: String, args: [Any]) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_call_dict_function"  , args: dict, fn, args).map { 
           x in (x as? Any)!  
        }
      }
          func strwidth(text: String) throws -> Promise<Int> {
        return try sendToNvim(method: "nvim_strwidth"  , args: text).map { 
           x in (x as? Int)!  
        }
      }
          func listRuntimePaths() throws -> Promise<[String]> {
        return try sendToNvim(method: "nvim_list_runtime_paths"  ).map { 
           x in (x as? [String])!  
        }
      }
          func getRuntimeFile(name: String, all: Bool) throws -> Promise<[String]> {
        return try sendToNvim(method: "nvim_get_runtime_file"  , args: name, all).map { 
           x in (x as? [String])!  
        }
      }
          func setCurrentDir(dir: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_current_dir"  , args: dir).map { 
           _ in ()  
        }
      }
          func getCurrentLine() throws -> Promise<String> {
        return try sendToNvim(method: "nvim_get_current_line"  ).map { 
           x in (x as? String)!  
        }
      }
          func setCurrentLine(line: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_current_line"  , args: line).map { 
           _ in ()  
        }
      }
          func delCurrentLine() throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_del_current_line"  ).map { 
           _ in ()  
        }
      }
          func getVar(name: String) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_get_var"  , args: name).map { 
           x in (x as? Any)!  
        }
      }
          func setVar(name: String, value: Any) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_var"  , args: name, value).map { 
           _ in ()  
        }
      }
          func delVar(name: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_del_var"  , args: name).map { 
           _ in ()  
        }
      }
          func getVvar(name: String) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_get_vvar"  , args: name).map { 
           x in (x as? Any)!  
        }
      }
          func setVvar(name: String, value: Any) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_vvar"  , args: name, value).map { 
           _ in ()  
        }
      }
          func getOption(name: String) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_get_option"  , args: name).map { 
           x in (x as? Any)!  
        }
      }
          func getAllOptionsInfo() throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_all_options_info"  ).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func getOptionInfo(name: String) throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_option_info"  , args: name).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func setOption(name: String, value: Any) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_option"  , args: name, value).map { 
           _ in ()  
        }
      }
          func echo(chunks: [Any], history: Bool, opts: [AnyHashable : Any]) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_echo"  , args: chunks, history, opts).map { 
           _ in ()  
        }
      }
          func outWrite(str: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_out_write"  , args: str).map { 
           _ in ()  
        }
      }
          func errWrite(str: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_err_write"  , args: str).map { 
           _ in ()  
        }
      }
          func errWriteln(str: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_err_writeln"  , args: str).map { 
           _ in ()  
        }
      }
          func listBufs() throws -> Promise<[Buffer]> {
        return try sendToNvim(method: "nvim_list_bufs"  ).map { 
           x in (x as? [Buffer])!  
        }
      }
          func getCurrentBuf() throws -> Promise<Buffer> {
        return try sendToNvim(method: "nvim_get_current_buf"  ).map { 
           x in 
        let x = (x as? [Any])!
        return Buffer(nvim: self, (x[2] as? UInt16)!)
     
        }
      }
          func listWins() throws -> Promise<[Window]> {
        return try sendToNvim(method: "nvim_list_wins"  ).map { 
           x in (x as? [Window])!  
        }
      }
          func getCurrentWin() throws -> Promise<Window> {
        return try sendToNvim(method: "nvim_get_current_win"  ).map { 
           x in 
        let x = (x as? [Any])!
        return Window(nvim: self, (x[2] as? UInt16)!)
     
        }
      }
          func createBuf(listed: Bool, scratch: Bool) throws -> Promise<Buffer> {
        return try sendToNvim(method: "nvim_create_buf"  , args: listed, scratch).map { 
           x in 
        let x = (x as? [Any])!
        return Buffer(nvim: self, (x[2] as? UInt16)!)
     
        }
      }
          func openTerm(buffer: Buffer, opts: [AnyHashable : Any]) throws -> Promise<Int> {
        return try sendToNvim(method: "nvim_open_term"  , args: buffer, opts).map { 
           x in (x as? Int)!  
        }
      }
          func chanSend(chan: Int, data: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_chan_send"  , args: chan, data).map { 
           _ in ()  
        }
      }
          func openWin(buffer: Buffer, enter: Bool, config: [AnyHashable : Any]) throws -> Promise<Window> {
        return try sendToNvim(method: "nvim_open_win"  , args: buffer, enter, config).map { 
           x in 
        let x = (x as? [Any])!
        return Window(nvim: self, (x[2] as? UInt16)!)
     
        }
      }
          func listTabpages() throws -> Promise<[Tabpage]> {
        return try sendToNvim(method: "nvim_list_tabpages"  ).map { 
           x in (x as? [Tabpage])!  
        }
      }
          func getCurrentTabpage() throws -> Promise<Tabpage> {
        return try sendToNvim(method: "nvim_get_current_tabpage"  ).map { 
           x in 
        let x = (x as? [Any])!
        return Tabpage(nvim: self, (x[2] as? UInt16)!)
     
        }
      }
          func createNamespace(name: String) throws -> Promise<Int> {
        return try sendToNvim(method: "nvim_create_namespace"  , args: name).map { 
           x in (x as? Int)!  
        }
      }
          func getNamespaces() throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_namespaces"  ).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func paste(data: String, crlf: Bool, phase: Int) throws -> Promise<Bool> {
        return try sendToNvim(method: "nvim_paste"  , args: data, crlf, phase).map { 
           x in (x as? Bool)!  
        }
      }
          func put(lines: [String], type: String, after: Bool, follow: Bool) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_put"  , args: lines, type, after, follow).map { 
           _ in ()  
        }
      }
          func subscribe(event: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_subscribe"  , args: event).map { 
           _ in ()  
        }
      }
          func unsubscribe(event: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_unsubscribe"  , args: event).map { 
           _ in ()  
        }
      }
          func getColorByName(name: String) throws -> Promise<Int> {
        return try sendToNvim(method: "nvim_get_color_by_name"  , args: name).map { 
           x in (x as? Int)!  
        }
      }
          func getColorMap() throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_color_map"  ).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func getContext(opts: [AnyHashable : Any]) throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_context"  , args: opts).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func loadContext(dict: [AnyHashable : Any]) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_load_context"  , args: dict).map { 
           x in (x as? Any)!  
        }
      }
          func getMode() throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_mode"  ).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func getKeymap(mode: String) throws -> Promise<[[AnyHashable : Any]]> {
        return try sendToNvim(method: "nvim_get_keymap"  , args: mode).map { 
           x in (x as? [[AnyHashable : Any]])!  
        }
      }
          func setKeymap(mode: String, lhs: String, rhs: String, opts: [AnyHashable : Any]) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_keymap"  , args: mode, lhs, rhs, opts).map { 
           _ in ()  
        }
      }
          func delKeymap(mode: String, lhs: String) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_del_keymap"  , args: mode, lhs).map { 
           _ in ()  
        }
      }
          func getCommands(opts: [AnyHashable : Any]) throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_commands"  , args: opts).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func getApiInfo() throws -> Promise<[Any]> {
        return try sendToNvim(method: "nvim_get_api_info"  ).map { 
           x in (x as? [Any])!  
        }
      }
          func setClientInfo(name: String, version: [AnyHashable : Any], type: String, methods: [AnyHashable : Any], attributes: [AnyHashable : Any]) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_client_info"  , args: name, version, type, methods, attributes).map { 
           _ in ()  
        }
      }
          func getChanInfo(chan: Int) throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_get_chan_info"  , args: chan).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func listChans() throws -> Promise<[Any]> {
        return try sendToNvim(method: "nvim_list_chans"  ).map { 
           x in (x as? [Any])!  
        }
      }
          func callAtomic(calls: [Any]) throws -> Promise<[Any]> {
        return try sendToNvim(method: "nvim_call_atomic"  , args: calls).map { 
           x in (x as? [Any])!  
        }
      }
          func parseExpression(expr: String, flags: String, highlight: Bool) throws -> Promise<[AnyHashable : Any]> {
        return try sendToNvim(method: "nvim_parse_expression"  , args: expr, flags, highlight).map { 
           x in (x as? [AnyHashable : Any])!  
        }
      }
          func listUis() throws -> Promise<[Any]> {
        return try sendToNvim(method: "nvim_list_uis"  ).map { 
           x in (x as? [Any])!  
        }
      }
          func getProcChildren(pid: Int) throws -> Promise<[Any]> {
        return try sendToNvim(method: "nvim_get_proc_children"  , args: pid).map { 
           x in (x as? [Any])!  
        }
      }
          func getProc(pid: Int) throws -> Promise<Any> {
        return try sendToNvim(method: "nvim_get_proc"  , args: pid).map { 
           x in (x as? Any)!  
        }
      }
          func selectPopupmenuItem(item: Int, insert: Bool, finish: Bool, opts: [AnyHashable : Any]) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_select_popupmenu_item"  , args: item, insert, finish, opts).map { 
           _ in ()  
        }
      }
          func setDecorationProvider(nsId: Int, opts: [AnyHashable : Any]) throws -> Promise<Void> {
        return try sendToNvim(method: "nvim_set_decoration_provider"  , args: nsId, opts).map { 
           _ in ()  
        }
      }
    }