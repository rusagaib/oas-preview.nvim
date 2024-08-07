local M = {}
local conf = require("oas-preview.conf")

M.setup = function(opts)
  opts = opts or {}
  for key, value in pairs(opts) do
    conf.set(key, value)
  end
  -- Load user commands
  require("oas-preview.user-command")
end

return M
