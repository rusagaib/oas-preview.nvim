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
	elseif ui == "redoc" or ui == "stoplight" then
		message = "Still wip for current Ui '" .. ui .. "'"
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

return M
