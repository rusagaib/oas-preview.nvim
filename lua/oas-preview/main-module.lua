local M = {}
local conf = require('oas-preview.conf')

function M.run()
	-- init vars from allopts table param
	local api_serve = conf.get('api_route')
	local port = conf.get('port')
	local ui = conf.get('ui')

	-- load filename
	local file = vim.fn.expand("%:p")

	-- and hmmm.. after read a while :help expand() finally can figure how to mounting dir on docker container..
	-- now we're no longer use http-server module _(:3 _| )_
	local relative_path = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t")

	if ui == "redoc" then
		-- still wip for redoc
		-- serving with redoc must insttall redocly via npm first
		-- vim.cmd("5split")
		-- local command = ':call jobsend(b:terminal_job_id, "redocly preview-docs ' .. file .. '\\n")'
		-- vim.cmd(command)
    -- official docker-images:
    -- https://hub.docker.com/r/redocly/redoc/
    -- docker pull redocly/redoc
		print("still wip for redoc..")
	end

  if ui == "stoplight" then
    -- wip for stoplight 
    -- still no official docker image for stoplight shame..
    -- issue here: https://github.com/stoplightio/elements/issues/765
    -- unofficial npm & docker-images:
    -- https://www.npmjs.com/package/@skriptfabrik/elements-cli
    -- docker pull skriptfabrik/elements-cli
    print("still wip for stoplight..")
  end

	if ui == "swagger" then
		-- serving with swagger-ui
		-- default serving api with this url sorry i still can't figure it out T_T
		-- and feel free to edit/changes api_serve on conf.lua

		vim.cmd("5split")

		-- serving OAS spec w/ docker image swaggerapi/swagger-ui
		-- first you'll need pull swaggerapi/swagger-ui from docker hub
		-- im so sory for this nasty script put on local command vars but its work tho _(:3 _|)_
		local command = ':te echo -e "\\x1b[36;1mSwagger-UI: '
			.. api_serve
			.. ":"
			.. port
			.. '\\n\\x1b[32;1mCotainer running:" && docker run -d --init --name swagger-ui -p '
			.. port
			.. ":8080 -e SWAGGER_JSON=/foo/"
			.. file_name
			.. " -v "
			.. relative_path
			.. ":/foo swaggerapi/swagger-ui"

		vim.cmd(command)
	end
end

return M
