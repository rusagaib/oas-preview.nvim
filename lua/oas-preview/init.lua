local api_serve = "http://127.0.0.1:1111/"
local api = "http://127.0.0.1:3333/docs/api-docs.yaml"

return {
  vim.api.nvim_create_user_command("OASPreview", function()
    print "Starting OAS-Preview.."
    local ok, preview = pcall(require, "oas-preview.main-module")
    pcall(preview == preview(api, api_serve))
    if ok then
      os.execute("sleep " .. 1)
      vim.cmd(':te xdg-open "' .. api_serve .. '"')
    end
  end, {}),
  vim.api.nvim_create_user_command("OASPreviewStop", function ()
    print "Stoping Services.."
    vim.cmd(':bd!')
    vim.cmd(':exec "!kill $(lsof -t -i:1111)"')
    vim.cmd(':exec "!docker rm -f swagger-ui"')
  end, {})
}
