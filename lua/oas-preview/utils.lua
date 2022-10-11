
local M =  {}

M.cekopts = function(opts, opt)
  local allopts = opts
  for val in pairs(opts) do
    if opt == val then
      return true
    end
  end
  return false
end

return M
