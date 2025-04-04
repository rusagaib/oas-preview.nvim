local M = {}
local util = require("oas-preview.utils")

M.default_opts = {
  -- default api_route
	api_route = "http://127.0.0.1",
  -- options to changes on setup()
	port = "1111",
	ui = "swagger",
	auto_open_url = true,
  expose = false,
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

---@param is_exposed boolean
---@param host string
---@param port integer
---@param ui string
---@return string service_container
---@return string serve_url
M.host_route = function(is_exposed, host, port, ui)
  local service_container, serve_url = util.host_port_to_serve(is_exposed, host, port, ui)
  return service_container, serve_url
end

M.info = function()
  util.print_config(
    M.get('port'),
    M.get('ui'),
    M.get('auto_open_url'),
    M.get('expose')
  )
end

return M
