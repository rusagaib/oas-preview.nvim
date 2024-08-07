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

  if ui == 'swagger' then
    status = true
  elseif ui == 'redoc' or ui == 'stoplight' then
    message = "Still wip for current Ui '" .. ui .. "'"
  elseif ui == nil then
    message = "invalid ui '" .. ui .. "'"
  end

  return status, message
end

return M
