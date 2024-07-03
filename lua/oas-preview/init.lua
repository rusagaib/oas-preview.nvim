local M = {}

M.config = {}
M.config = require("oas-preview.conf").list()

M.preview = require("oas-preview.main-module")

-- Still wip for setup command
-- require('oas-preview').setup({api_route="", port="", ui=""})
-- M.setup = function(opts)
--   M.config.api_route = default_config.set("api_route", opts.api_route)
--   M.config.port = default_config.set("port", opts.p)
--   M.config.ui = default_config.set("ui", opts.ui)
-- end

vim.api.nvim_create_user_command("OASPreview", function(p)
	print("Starting OAS-Preview..")
	print(M.config)
	print(M.config.api_route .. ":" .. M.config.port .. " - " .. M.config.ui)
	M.preview.run(M.config)
end, {})

vim.api.nvim_create_user_command("OASPreviewStop", function(p)
	print("Stoping Services..")
	vim.cmd(":bd!")
	vim.cmd(':exec "!docker rm -f swagger-ui"')
end, {})

return M
