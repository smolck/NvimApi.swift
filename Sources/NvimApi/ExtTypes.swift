import Foundation

public class ExtType {
    let __dontYouDareUseThisIfYouArentThisLibrary: Nvim
    let id: UInt16
    
    init(nvim: Nvim, _ data: UInt16) {
        __dontYouDareUseThisIfYouArentThisLibrary = nvim
        id = data
    }
}

public final class Window: ExtType {}
public final class Buffer: ExtType {}
public final class Tabpage: ExtType {}

public final class LuaRef {} // TODO(smolck)
