local M = {}

M.cekopts = function(opts, key)
	if opts[key] ~= nil then
		return true
	else
		print("Invalid or nil option opt: " .. key)
		return false
	end
end

M.cekuistatus = function(ui)
	local status = false
	local message = ""

	if ui == "swagger" then
		status = true
	elseif ui == "redoc" then
    status = true
  elseif ui == "stoplight" then
    status = true
		-- message = "Still wip for current Ui '" .. ui .. "'"
	elseif ui == nil then
		message = "invalid ui '" .. ui .. "'"
	end

	return status, message
end

M.ostype = function(route, port)
	local url = route .. ":" .. port
	local open_cmd = ""

	if vim.fn.has("mac") == 1 then
		open_cmd = "open " .. url -- macOS
	elseif vim.fn.has("unix") == 1 then
		open_cmd = "xdg-open " .. url -- Linux
	elseif vim.fn.has("win32") == 1 then
		open_cmd = "start " .. url -- Windows
	else
		print("Unsupported OS for auto-opening the browser.")
		return
	end

	return open_cmd
end

---@param is_exposed boolean
---@param host string
---@param port integer
---@param ui string 
---@return string service_container
---@return string serve_url
M.host_port_to_serve = function(is_exposed, host, port, ui)
  local service_container = ""
  local serve_url = ""
  if is_exposed == true then
    service_container = ' -p ' .. port
    serve_url = "http://YOUR_LOCAL_IP_ADDRESS:" .. port .. " - " .. ui
  else
    service_container = ' -p ' .. host:gsub("^http://","") .. ':' .. port
    serve_url = host .. ":" .. port .. " - " .. ui
  end
  return service_container, serve_url
end

---@param port string
---@param ui string
---@param auto_open_url boolean
---@param expose boolean
M.print_config = function(port, ui, auto_open_url, expose)
  print("port           : " .. port)
  print("ui             : " .. ui)
  print("auto_open_url  : " .. tostring(auto_open_url))
  print("expose         : " .. tostring(expose))
end

return M
