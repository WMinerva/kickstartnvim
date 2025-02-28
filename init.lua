-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.swapfile = false
vim.opt.undofile = true
vim.o.expandtab = true
vim.o.shiftwidth = 4 --Amount of indent
vim.o.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.o.softtabstop = 4 --How many spaces are inserted for a <Tab>
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.opt.conceallevel = 1

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- [[ Setting options ]]
-- See `:help vim.opt`

-- Make line numbers default
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.mouse = "a"
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.numberwidth = 4
vim.opt.fillchars = {
    -- foldopen = "",
    -- foldclose = "",
    -- fold = " ",
    -- foldsep = " ",
    -- diff = "╱",
    eob = " ",
}
vim.opt.shortmess:append("sI")

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
-- vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
-- vim.diagnostic.config({ virtual_text = false })

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
-- vim.opt.cursorline = true
vim.o.laststatus = 3

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
-- vim.opt.wrap = false
vim.keymap.set("n", "<leader>un", function()
    if vim.wo.number then
        vim.wo.number = false
        local e
        print("Number Disable")
    else
        vim.wo.number = true
        print("Number Enabled ")
    end
end, { desc = "Toggle Line Numbers" })
-- Alternar el wrap con <leader>w
vim.keymap.set("n", "<leader>uw", function()
    -- Verifica el estado actual y cambia
    if vim.wo.wrap then
        vim.wo.wrap = false
        print("Wrap Disable")
    else
        vim.wo.wrap = true
        print("Wrap Enabled ")
    end
end, { desc = "Toggle Wrap" })

local signs = { Error = "", Warn = "", Hint = "󱠂", Info = "" }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- NvChad config append
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

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
