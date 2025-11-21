return {
    "mason-org/mason-lspconfig.nvim",
    -- lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "mason-org/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "stylua", -- Used to format Lua code
                "bashls",
                "pyright",
                "jdtls",
                -- "shellcheck",
                -- "shfmt",
                -- "black",
                -- "ruff",
                -- "prettier",
                -- "prettierd",
                -- "gdtoolkit",
                -- "gdscript",
            },
            automatic_enable = true,
        })
    end,
}
