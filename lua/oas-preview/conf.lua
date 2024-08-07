local M = {}
local util = require("oas-preview.utils")

M.default_opts = {
  api_route = "http://127.0.0.1",
  port = "1111",
  ui = "swagger"
}

M.options = vim.deepcopy(M.default_opts)

M.set = function(key, val)
	if util.cekopts(M.default_opts, key) then
		M.options[key] = val
	end
end

M.get = function(key)
  return M.options[key]
end

return M
