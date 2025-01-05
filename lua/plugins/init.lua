-- You can add your own plugins here or in other files in this directory!
return {
    "nvim-lua/plenary.nvim",
    {
        "b0o/incline.nvim",
        event = "VeryLazy",
        opts = {},
    },
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
}
