--- Send an OSC message on every keystroke.
--
-- Save this file in a `lua` directory available in your `runtimepath`.
-- Example: `~/.config/nvim/lua/osc-keydown.lua`
-- 
-- Usage: `:lua require'osc-keydown'`
--        `:OSCEnable` to start sending OSC on every keystroke.
--        `:OSCDisable` to stop sending OSC.
local osc = require'osc'.new{
  transport = 'udp',
  sendAddr = '127.0.0.1',
  sendPort = 57120,
}

local M = {}

local on_keystroke = function(k)
  local message = osc.new_message{
    address = '/nvim/key',
    types = 'si',
    k, string.byte(k)
  }
  local ok, err = osc:send(message)
  if not ok then
    print(err)
  end
end

function M.enable()
  if not M.id then
    M.id = vim.on_key(on_keystroke)
  end
end

function M.disable()
  if M.id then
    vim.on_key(nil, M.id)
  end
  M.id = nil
end
-- Register commands
vim.cmd [[ com! OSCEnable :lua require'osc_try'.enable()   ]]
vim.cmd [[ com! OSCDisable :lua require'osc_try'.disable() ]]

return M
