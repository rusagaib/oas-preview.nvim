local util = require("oas-preview.utils")

local M = {}

-- M.default_api_route = "http://127.0.0.1"
-- M.default_port = "1111"
-- M.default_ui = "swagger"

M.default_opts = { "api_route", "port", "ui" }

M.default = { api_route = "http://127.0.0.1", port = "1111", ui = "swagger" }

M.put = function(opt, val)
	if util.cekopts(M.default_opts, opt) == true then
		M.default[opt] = nil
		M.default[opt] = "'" .. val .. "'"
	end
end

-- M.list = { api_route="http://127.0.0.1", port="1111", ui="swagger" }
M.list = function()
	return { api_route = "http://127.0.0.1", port = "1111", ui = "swagger" }
end

return M
