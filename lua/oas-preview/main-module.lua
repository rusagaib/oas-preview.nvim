local M = {}

local conf = require('oas-preview.conf')
local api_serve = conf.get('api_route')
local is_expose = conf.get('expose')
local port = conf.get('port')
local ui = conf.get('ui')
local host_route, serve_url = conf.host_route(is_expose, api_serve, port, ui)

function M.run()
	-- load filename
	local file = vim.fn.expand("%:p")

	local relative_path = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t")

  -- redoc-ui (redocly)
  -- official docker-images:
  -- https://hub.docker.com/r/redocly/redoc/
  -- docker pull redocly/redoc
	if ui == "redoc" then
    local command = 'docker run -d --rm --init --name ' .. ui .. '-ui'
        .. host_route .. ':80'
        .. ' -v ' .. relative_path .. '/:/usr/share/nginx/html/swagger/'
        .. ' -e SPEC_URL=swagger/' .. file_name
        .. ' redocly/redoc '

    -- background command to run not out opt it on messange like vim.cmd() do..
    local result = vim.fn.system(command)

    -- error handle
    if vim.v.shell_error ~= 0 then
      print("Error: " .. result) -- If the command fails, display the error
    else
		  print(serve_url)
    end
  -- end if ui redoc
	end

  -- stoplight-ui
  -- until now still no official docker image for stoplight dayum.. _( \_ -_-)_
  -- issue here: https://github.com/stoplightio/elements/issues/765
  -- unofficial npm & docker-images:
  -- https://github.com/skriptfabrik/elements-cli
  -- https://www.npmjs.com/package/@skriptfabrik/elements-cli
  -- docker pull skriptfabrik/elements-cli
  -- this one is unofficial docker images release but i love this tbh..
  -- they add some hot-reload stuff on it so we could write/save docs spec 
  -- and see changes on fly <3_(:3 _| )_
  if ui == "stoplight" then
    local command = 'docker run -d --init --name ' .. ui .. '-ui'
      .. host_route .. ':8000'
			.. ' -v ' .. relative_path .. ':/data:ro'
      .. ' skriptfabrik/elements-cli '
      .. 'preview -cw ' .. file_name

    -- background command to run not out opt it on messange like vim.cmd() do..
    local result = vim.fn.system(command)

    -- error handle
    if vim.v.shell_error ~= 0 then
      print("Error: " .. result) -- If the command fails, display the error
    else
		  print(serve_url)
    end
  -- end if ui stoplight 
  end

  -- swagger-ui
  -- official docker-images:
  -- https://hub.docker.com/r/swaggerapi/swagger-ui
  -- docker pull swaggerapi/swagger-ui
	if ui == "swagger" then
    local command = 'docker run -d --init --name ' .. ui .. '-ui'
      .. host_route .. ':8080'
      .. ' -e SWAGGER_JSON=/foo/' .. file_name
			.. ' -v ' .. relative_path .. ':/foo'
      .. ' swaggerapi/swagger-ui '

    -- background command to run not out opt it on messange like vim.cmd() do..
    local result = vim.fn.system(command)

    -- error handle
    if vim.v.shell_error ~= 0 then
      print("Error: " .. result) -- If the command fails, display the error
    else
		  print(serve_url)
    end
  -- end if ui swagger
	end
-- end run()
end

function M.stop()
  -- background command to run not out opt it on messange like vim.cmd() do..
  local result = vim.fn.system('docker rm -f ' .. ui .. '-ui')

  -- error handle
  if vim.v.shell_error ~= 0 then
    print("Error: " .. result) -- If the command fails, display the error
  else
    print(result)
  end
-- end stop()
end

function M.cek()
  -- Format output get container meta info ID, Nama, Image, Port, dan Status
  local cmd = 'docker ps --filter "name=' .. ui .. '-ui" --format "{{.ID}}|{{.Names}}|{{.Image}}|{{.Ports}}|{{.Status}}"'
  local result = vim.fn.system(cmd)

  -- error handle
  if vim.v.shell_error ~= 0 then
    print("Error: " .. result) -- If the command fails, display the error
  else
    -- matching ui config opt-out descriptions info of container ui services
    if result == "" or result:match("^%s*$") then
      print("Container '" .. ui .. "-ui' is not available")
    else
      print("Container is running:")
      for line in result:gmatch("[^\r\n]+") do
        local id, name, image, ports, status = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]*)|([^|]+)")
        print("Name     : " .. name)
        print("ID       : " .. id)
        print("Image    : " .. image)
        print("Port     : " .. (ports ~= "" and ports or "N/A"))
        print("Status   : " .. status)
        print("Url      : " .. api_serve .. ':' ..port)
        if is_expose == true then
          print("ExposeUrl: " .. serve_url:gsub(" %- .*", ""))
        end
      -- end for 
      end
    -- end result if 
    end
  -- end error handle()
  end
-- end cek()
end

return M
