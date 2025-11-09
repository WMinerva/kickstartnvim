---@diagnostic disable: missing-fields
return {
    "mason-org/mason-lspconfig.nvim",
    -- lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "mason-org/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
        "neovim/nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ensure_installed = {
            "lua_ls",
            "stylua", -- Used to format Lua code
            "bashls",
            "shellcheck",
            "shfmt",
            "pyright",
            "black",
            -- "ruff",
            "prettier",
            "prettierd",
            "jdtls",
            -- "gdtoolkit",
        }
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
        require("mason-lspconfig").setup({
            ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
            -- ensure_installed = { "bashls", "shellcheck", "shfmt", "pyright", "ruff", "prettierd" },
            automatic_enable = true,
        })
    end,
}
