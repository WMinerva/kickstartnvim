return {
    {
        "romus204/tree-sitter-manager.nvim",
        dependencies = {}, -- tree-sitter CLI must be installed system-wide
        config = function()
            require("tree-sitter-manager").setup({
                ensure_installed = {
                    "gdscript",
                    "godot_resource",
                    "gdshader",
                    "bash",
                    "c",
                    "cpp",
                    "diff",
                    "html",
                    "java",
                    "lua",
                    "luadoc",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "query",
                    "vim",
                    "vimdoc",
                },

                -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
                -- auto_install = false, -- if enabled, install missing parsers when editing a new file
                -- highlight = true, -- treesitter highlighting is enabled by default
                -- languages = {}, -- override or add new parser sources
                -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
                -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufAdd",
        -- event = "VeryLazy",
        lazy = true,
        opts = {},
    },
}
