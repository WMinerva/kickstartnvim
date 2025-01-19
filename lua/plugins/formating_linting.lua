return { -- Autoformat
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        require("mason-null-ls").setup({
            ensure_installed = {
                -- "ruff",
                "prettierd",
                -- "eslint",
                "stylua",
            },
            automatic_installation = true,
        })
        null_ls.setup({
            sources = {
                --formating
                null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.black,
                -- null_ls.builtins.formatting.isort,
                -- require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
                -- require("none-ls.formatting.ruff_format"),
                null_ls.builtins.formatting.prettierd.with({
                    filetypes = { "javascript", "typescript", "json", "css", "scss", "html", "vue", "yaml", "markdown" },
                }),
                -- require("none-ls.diagnostics.eslint"),
                -- null_ls.builtins.completion.spell,
            },
            on_attach = function(client, bufnr)
                if client.name == "null-ls" then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })
        vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format, { desc = "Format Buffer" })
    end,
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
}
