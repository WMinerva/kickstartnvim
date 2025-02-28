-- [[ Install `lazy.nvim` plugin manager ]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
-- --  You can press `?` in this menu for help. Use `:q` to close the window
require("lazy").setup({
    -- "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

    -- Use `opts = {}` to force a plugin to be loaded.
    --
    -- Here is a more advanced example where we pass configuration
    -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
    --    require('gitsigns').setup({ ... })
    --
    -- See `:help gitsigns` to understand what the configuration keys do
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        opts = {
            numhl = true,
            signcolumn = false,
            -- signs = {
            --   add = { text = '+' },
            --   change = { text = '~' },
            --   delete = { text = '_' },
            --   topdelete = { text = '‾' },
            --   changedelete = { text = '~' },
            -- },
        },
    },
    {
        "mg979/vim-visual-multi",
        lazy = true,
        opt = {},
    },
    -- Then, because we use the `config` key, the configuration only runs
    -- after the plugin has been loaded:
    --  config = function() ... end
    -- NOTE: Plugins can specify dependencies.
    --
    -- The dependencies are proper plugin specifications as well - anything
    -- you do for a plugin at the top level, you can do for a dependency.
    --
    -- Use the `dependencies` key to specify the dependencies of a particular plugin
    -- LSP Plugins
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    -- { -- You can easily change to a different colorscheme.
    --     -- Change the name of the colorscheme plugin below, and then
    --     -- change the command in the config to whatever the name of that colorscheme is.
    --     --
    --     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    --     "folke/tokyonight.nvim",
    --     priority = 1000, -- Make sure to load this before all the other start plugins.
    --     init = function()
    --         -- Load the colorscheme here.
    --         -- Like many other themes, this one has different styles, and you could load
    --         -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --         -- vim.cmd.colorscheme 'tokyonight-night'
    --
    --         -- You can configure highlights by doing something like:
    --         vim.cmd.hi("Comment gui=none")
    --     end,
    -- },

    -- Highlight todo, notes, etc in comments
    -- { "folke/todo-comments.nvim", event = "VimEnter", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },

    -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
    -- init.lua. If you want these files, they are in the repository, so you can just download them and
    -- place them in the correct locations.

    -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
    --
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).
    --
    -- require("kickstart.plugins.debug"),
    require("kickstart.plugins.lint"),
    require("kickstart.plugins.autopairs"),
    -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
    { import = "plugins" },
}, {
    ui = {
        icons = {
            ft = "",
            lazy = "󰂠 ",
            loaded = "",
            not_loaded = "",
        },
    },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    },
})
