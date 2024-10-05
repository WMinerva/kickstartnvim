return { -- Autoformat
    -- "stevearc/conform.nvim",
    -- event = { "BufWritePre" },
    -- cmd = { "ConformInfo" },
    -- keys = {
    --     {
    --         "<leader>bf",
    --         function()
    --             require("conform").format({ async = true, lsp_fallback = true })
    --         end,
    --         mode = "",
    --         desc = "[B]uffer [F]ormat",
    --     },
    -- },
    -- opts = {
    --     notify_on_error = false,
    --     format_on_save = function(bufnr)
    --         -- Disable "format_on_save lsp_fallback" for languages that don't
    --         -- have a well standardized coding style. You can add additional
    --         -- languages here or re-enable it for the disabled ones.
    --         local disable_filetypes = { c = true, cpp = true }
    --         return {
    --             timeout_ms = 500,
    --             lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    --         }
    --     end,
    --     formatters_by_ft = {
    --         lua = { "stylua" },
    --         -- Conform can also run multiple formatters sequentially
    --         -- python = { "isort", "black" },
    --         --
    --         -- You can use 'stop_after_first' to run the first available formatter from the list
    --         -- javascript = { "prettierd", "prettier", stop_after_first = true },
    --     },
    -- },
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                --formating
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                -- null_ls.builtins.diagnostics.eslint,
                -- null_ls.builtins.completion.spell,
            },
        })
        vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "[B]uffer [F]ormat" })
    end,
}
