local status, metals = pcall(require, "metals")
if (not status) then return end

-- Startup / Setup the metals
local metals_config = metals.bare_config()
metals_config.init_options.statusBarProvider = "on"

-- Example settings
metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  excludedPackages = {},
}

-- Autocmd to kick off metals
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group
})

-- Enable LSP status for metals
-- https://github.com/hudclark/.dotfiles/blob/main/.config/nvim/fnl/user/plugins/lsp/metals.fnl
local function metals_status_handler(err, status, ctx)
  local val = {}
  -- trim and remove spinner
  local text = status.text:gsub('[⠇⠋⠙⠸⠴⠦]', ''):gsub("^%s*(.-)%s*$", "%1")
  if status.hide then
    val = {kind = "end"}
  elseif status.show then
    val = {kind = "begin", title = text}
  elseif status.text then
    val = {kind = "report", message = text}
  else
    return
  end
  local info = {client_id = ctx.client_id}
  local msg = {token = "metals", value = val}
  vim.lsp.handlers["$/progress"](err, msg, ctx)
end
metals_config.handlers = {['metals/status'] = metals_status_handler}
