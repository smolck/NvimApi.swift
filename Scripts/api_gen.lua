local function capitalize(str)
  return vim.fn.toupper(str:sub(1, 1)) .. str:sub(2)
end

--- Converts e.g. "nvim_this_does_not_exist" to "thisDoesNotExist"
local function to_swift_func_name(is_on_ext_type, name)
  local split_name = vim.split(name, '_')
  split_name[1] = nil -- Remove the "nvim" at start of name

  local ret
  if is_on_ext_type then
    split_name[2] = nil -- Remove "buf"/"win"/"tabpage" at start of name

    ret = split_name[3]
    split_name[3] = nil -- Remove this too because we don't want it capitalized
  else
    ret = split_name[2]
    split_name[2] = nil -- Remove this because we don't want it capitalized
  end

  for _, v in pairs(split_name) do
    ret = ret .. capitalize(v)
  end

  return ret
end

local function to_camelcase(str)
  local split_name = vim.split(str, '_')
  local ret = split_name[1]
  split_name[1] = nil -- Remove this because we don't want it capitalized

  for _, v in pairs(split_name) do
    ret = ret .. capitalize(v)
  end

  return ret
end

local type_map = {
  Array     = '[Any]',
  void      = 'Void',
  Integer   = 'Int',
  Boolean   = 'Bool',
  Float     = 'Double',
  String    = 'String',
  Object    = 'Any',
  Dictionary= '[AnyHashable : Any]',
  Window    = 'Window',
  Tabpage   = 'Tabpage',
  Buffer    = 'Buffer',
  LuaRef    = 'LuaRef',
  ['ArrayOf(Integer, 2)'] = '[Int]'
}

local function to_swift_type(type_str)
  --var regex = RegExp('ArrayOf\\(\\s*(\\w+)\\s*\\)');
  --if (regex.hasMatch(x)) {
    --var match = regex.firstMatch(x)!.group(1);
    --return 'List<${typeIndex[match]}>';
  --}

  if type_map[type_str] ~= nil then
    return type_map[type_str]
  else -- Handle `ArrayOf` things
    local inner_type = type_str:sub(9)
    inner_type = inner_type:sub(1, #inner_type - 1)
    return '[' .. type_map[inner_type] .. ']'
  end
end

local function to_swift_param_list(parameters)
  if vim.tbl_isempty(parameters) then
    return '', ''
  end

  local param_list
  local param_list_no_types

  local first_param = true

  -- You wanna refactor this to use ipairs, do ya? WELL DON'T. I DID THIS FOR A
  -- REASON.
  for _, p in pairs(parameters) do
    if first_param then
      param_list = string.format(
        '%s: %s',
        to_camelcase(p[2]),
        to_swift_type(p[1])
      )
      param_list_no_types = string.format('%s', to_camelcase(p[2]))
      first_param = false
    else
      param_list = string.format(
        '%s, %s: %s',
        param_list,
        to_camelcase(p[2]),
        to_swift_type(p[1])
      )
      param_list_no_types = string.format(
        '%s, %s',
        param_list_no_types,
        to_camelcase(p[2])
      )
    end
  end

  return param_list, param_list_no_types
end

local function to_swift_return(return_type)
  return '-> Promise<' .. to_swift_type(return_type) .. '>'
end

local function gen_func(is_on_ext_type, opts)
  local name = to_swift_func_name(is_on_ext_type, opts.name)
  local param_list, param_list_no_types = to_swift_param_list(opts.parameters)

  local ret = to_swift_return(opts.return_type)
  local return_type = to_swift_type(opts.return_type)
  local has_ext_return_type = return_type == 'Window' or return_type == 'Buffer' or return_type == 'Tabpage' 

  local map_closure
  if return_type == 'Void' then
    map_closure = [[ _ in () ]]
  elseif has_ext_return_type then
    -- TODO(smolck): Make the Swift code such that this stupidity isn't necessary
    map_closure = string.format([[ x in 
        let x = (x as? [Any])!
        return %s(nvim: %s, (x[2] as? UInt16)!)
    ]], return_type, is_on_ext_type and 'self.__dontYouDareUseThisIfYouArentThisLibrary' or 'self')
  else
    map_closure = string.format([[ x in (x as? %s)! ]], return_type)
  end

  local self_arg = is_on_ext_type and ', args: id ' or ''
  local args
  if param_list_no_types == '' then
    args = ''
  else
    if is_on_ext_type then
      args = ', ' .. param_list_no_types
    else
      args = ', args: ' .. param_list_no_types
    end
  end

  return string.format([[
      func %s(%s) throws %s {
        return try %ssendToNvim(method: "%s" %s %s).map { 
          %s 
        }
      }
    ]], 
    name,
    param_list,
    ret, 
    is_on_ext_type and '__dontYouDareUseThisIfYouArentThisLibrary.' or '',
    opts.name,
    self_arg,
    args,
    map_closure
  )
end

local api_info = vim.fn.api_info()

-- local buf_meths = {}
-- local win_meths = {}
-- local tab_meths = {}
-- local nvim_meths = {}

local nvim_f = io.open('NvimMethods.swift', 'w') -- TODO(smolck): Better file name?
local win_f = io.open('NvimExtTypeMethods_Win.swift', 'w')
local buf_f = io.open('NvimExtTypeMethods_Buf.swift', 'w')
local tab_f = io.open('NvimExtTypeMethods_Tab.swift', 'w')

local header = [[
import Foundation
import SwiftMsgPack
import PromiseKit
]]

nvim_f:write(header)
win_f:write(header)
buf_f:write(header)
tab_f:write(header)

nvim_f:write('extension Nvim {')
win_f:write('extension Window {')
buf_f:write('extension Buffer {')
tab_f:write('extension Tabpage {')

for _, method in ipairs(api_info.functions) do
  local name = method.name
  local first_arg_type = method.parameters[1] and method.parameters[1][1]
  if method.deprecated_since then
    goto continue
  end

  if string.match(name, 'buf') and first_arg_type == 'Buffer' then
    method.parameters[1] = nil

    buf_f:write(gen_func(true, method))
  elseif string.match(name, 'win') and first_arg_type == 'Window' then
    method.parameters[1] = nil

    win_f:write(gen_func(true, method))
  elseif string.match(name, 'tabpage') and first_arg_type == 'Tabpage' then
    method.parameters[1] = nil

    tab_f:write(gen_func(true, method))
  -- elseif string.match(name, 'nvim_') then
  else
    nvim_f:write(gen_func(false, method))
    -- table.insert(nvim_meths, method)
  end

  ::continue::
end

nvim_f:write('}')
win_f:write('}')
buf_f:write('}')
tab_f:write('}')

nvim_f:close()
win_f:close()
buf_f:close()
tab_f:close()

vim.cmd [[ !mv NvimMethods.swift ../Sources/NvimApi/ ]]
vim.cmd [[ !mv NvimExtTypeMethods_Win.swift ../Sources/NvimApi/ ]]
vim.cmd [[ !mv NvimExtTypeMethods_Buf.swift ../Sources/NvimApi/ ]]
vim.cmd [[ !mv NvimExtTypeMethods_Tab.swift ../Sources/NvimApi/ ]]
