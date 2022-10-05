local function preview(api, api_serve)
  -- load filename
  local file = vim.fn.expand("%:p")

  -- serving with redoc must insttall redocly via npm first
  -- vim.cmd("5split")
  -- local command = ':call jobsend(b:terminal_job_id, "redocly preview-docs ' .. file .. '\\n")'
  -- vim.cmd(command)

  -- serving with swagger-ui
  -- default serving api with this url sorry i still can't figure it out T_T
  -- make 'docs' directory and put your OAS3 spec .yaml on it
  -- then name it api-docs.yaml
  -- local api = "http://127.0.0.1:3333/docs/api-docs.yaml"
  -- local api_serve = "http://127.0.0.1:1111/"

  local api = api
  local api_serve = api_serve

  -- serving http-server && docker swaggerapi/swagger-ui
  -- first you'll need install http-server via npm & pull swaggerapi/swagger-ui from docker hub
  vim.cmd("5split")
  local command = ':te echo -e "\\x1b[36;1mSwagger-UI: '.. api_serve ..'\\n\\x1b[32;1mCotainer running:" && docker run -d --init --name swagger-ui -p 1111:8080 -e API_URL='.. api ..' swaggerapi/swagger-ui && http-server -p 3333 -c-1 --cors'
  vim.cmd(command)
end

return preview
