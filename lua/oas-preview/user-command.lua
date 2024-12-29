local conf = require("oas-preview.conf")
local main_module = require("oas-preview.main-module")
local util = require("oas-preview.utils")
local status, message = util.cekuistatus(conf.options.ui)

vim.api.nvim_create_user_command("OASPreview", function()
  if status then
      print("Starting OAS-Preview..")
      print(conf.options.api_route .. ":" .. conf.options.port .. " - " .. conf.options.ui)
      main_module.run()
  else
    print("Error Starting OAS-Preview")
    print("status: ", status)
    print("desc: ", message)
  end
end, {})

vim.api.nvim_create_user_command("OASPreviewStop", function()
	print("Stoping Services..")
	-- vim.cmd(":bd!")
	-- vim.cmd(':exec "!docker rm -f swagger-ui"')
  -- background command to run not out opt it on messange like vim.cmd() do..
	-- local result = vim.fn.system('docker rm -f ' .. conf.options.ui .. '-ui')
  -- but then i just move it to main-module.lua
  main_module.stop()
end, {})

