local conf = require("oas-preview.conf")
local main_module = require("oas-preview.main-module")
local util = require("oas-preview.utils")
local status, message = util.cekuistatus(conf.options.ui)

vim.api.nvim_create_user_command("OASPreview", function()
	if status then
		print("Starting OAS-Preview..")
		main_module.run()
		if conf.options.auto_open_url then
      local open_cmd = util.ostype(conf.options.api_route, conf.options.port, conf.options.os)
      if conf.options.expose then
        open_cmd = util.ostype(conf.options.api_route, "80", conf.options.os)
        vim.fn.jobstart(open_cmd, {detach = true})
      else
        open_cmd = util.ostype(conf.options.api_route, conf.options.port, conf.options.os)
        -- local result = os.execute(open_cmd)
        vim.fn.jobstart(open_cmd, {detach = true})
      end
    end
	else
		print("Error Starting OAS-Preview")
		print("status: ", status)
		print("desc: ", message)
	end
end, {})

vim.api.nvim_create_user_command("OASPreviewStop", function()
	print("Stoping Services..")
	main_module.stop()
end, {})

vim.api.nvim_create_user_command("OASPreviewCheck", function()
	print("Checking Runing Services..")
	main_module.cek()
end, {})

vim.api.nvim_create_user_command("OASPreviewConf", function()
	print("oas-preview.nvim config:")
  conf.info()
end, {})
