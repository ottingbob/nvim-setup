local status, metals = pcall(require, "metals")
if (not status) then return end

-- Startup / Setup the metals
local metals_config = metals.bare_config()
metals_config.init_options.statusBarProvider = "on"

-- Example settings
metals_config.settings = {
  showImplicitArguments = true,
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
