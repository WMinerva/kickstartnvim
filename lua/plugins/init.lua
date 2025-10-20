-- You can add your own plugins here or in other files in this directory!
return {
    "nvim-lua/plenary.nvim",
    {
        "nvchad/ui",
        config = function()
            require("nvchad")
            -- vim.o.statusline = ' '
        end,
    },
    {
        "nvchad/base46",
        lazy = true,
        build = function()
            require("base46").load_all_highlights()
        end,
    },
    -- "nvzone/minty",
    -- cmd = { "Shades", "Huefy" },
    -- dependencies = { "nvzone/volt", lazy = true },
    { "nvzone/volt", lazy = true },

    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            return { override = require("nvchad.icons.devicons") }
        end,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "devicons")
            require("nvim-web-devicons").setup(opts)
        end,
    },
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
        event = "BufAdd",
        -- lazy = true,
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
}
