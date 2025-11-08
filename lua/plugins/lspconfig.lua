---@diagnostic disable: missing-fields
return {
    "mason-org/mason-lspconfig.nvim",
    -- lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "mason-org/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local servers = {
            -- gdscript = {},
            -- clangd = {},
            -- gopls = {},
            bashls = {},
            shellcheck = {},
            shfmt = {},
            pyright = {},
            -- ruff = {},
            html = {},
            cssls = {},
            -- eslint = {},
            prettierd = {},
            -- jdtls = {},
            -- rust_analyzer = {},
            -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
            -- phpactor = {},
            -- vtsls = {
            --     filetypes = {
            --         "javascript",
            --         "javascriptreact",
            --         "javascript.jsx",
            --         "typescript",
            --         "typescriptreact",
            --         "typescript.tsx",
            --     },
            --     settings = {
            --         complete_function_calls = true,
            --         vtsls = {
            --             enableMoveToFileCodeAction = true,
            --             autoUseWorkspaceTsdk = true,
            --             experimental = {
            --                 maxInlayHintLength = 30,
            --                 completion = {
            --                     enableServerSideFuzzyMatch = true,
            --                 },
            --             },
            --         },
            --         typescript = {
            --             updateImportsOnFileMove = { enabled = "always" },
            --             suggest = {
            --                 completeFunctionCalls = true,
            --             },
            --             inlayHints = {
            --                 enumMemberValues = { enabled = true },
            --                 functionLikeReturnTypes = { enabled = true },
            --                 parameterNames = { enabled = "literals" },
            --                 parameterTypes = { enabled = true },
            --                 propertyDeclarationTypes = { enabled = true },
            --                 variableTypes = { enabled = false },
            --             },
            --         },
            --     },
            -- },
            lua_ls = {
                -- cmd = {...},
                -- filetypes = { ...},
                -- capabilities = {},
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                        -- diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            },
        }

        -- require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "stylua", -- Used to format Lua code
            "black",
            -- "ruff",
            -- "isort",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}

                    -- This handles overriding only values explicitly passed
                    server.on_attach = function(client, _)
                        client.server_capabilities.semanticTokensProvider = nil
                    end
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for tsserver)
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    if server_name ~= "jdtls" then
                        -- require("lspconfig")[server_name].setup(server)
                        vim.lsp.config(server_name, server)
                        vim.lsp.enable(server_name)
                    end
                end,
            },
        })
    end,
}
