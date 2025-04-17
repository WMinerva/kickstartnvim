-- NvChad config append
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

-- To load all integrations at once
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
    dofile(vim.g.base46_cache .. v)
end
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
