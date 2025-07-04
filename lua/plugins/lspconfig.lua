---@diagnostic disable: missing-fields
return {
    "neovim/nvim-lspconfig",
    -- lazy = true,
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
        { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        -- Allows extra capabilities provided by nvim-cmp
        -- "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                -- local map = function(keys, func, desc, mode)
                --     mode = mode or "n"
                --     vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                -- end
                --
                -- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                --
                -- map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                --
                -- map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                --
                -- map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                --
                -- map("<leader>cs", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                --
                -- --  Similar to document symbols, except searches over your entire project.
                -- map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                --
                -- map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
                --
                -- -- Execute a code action, usually your cursor needs to be on top of an error
                -- -- or a suggestion from your LSP for this to activate.
                -- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                --
                -- map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                        end,
                    })
                end

                -- if client and client:supports_method("textDocument/completion") then
                --     vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
                -- end

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                -- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                --     map("<leader>th", function()
                --         vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                --     end, "[T]oggle Inlay [H]ints")
                -- end
                -- if client.server_capabilities.documentSymbolProvider then
                -- if client.supports_method("textDocument/documentSymbol") then
                --     require("nvim-navic").attach(client, event.buf)
                -- end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = {
            -- clangd = {},
            -- gopls = {},

            -- bash lsp, linter, formatter
            bashls = {},
            shellcheck = {},
            shfmt = {},
            pyright = {},
            -- ruff = {},
            -- Web development lsp, linter, formatter
            html = {},
            cssls = {},
            -- eslint = {},
            prettierd = {},
            jdtls = {},
            -- rust_analyzer = {},
            -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
            -- phpactor = {},
            vtsls = {
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "javascript.jsx",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx",
                },
                settings = {
                    complete_function_calls = true,
                    vtsls = {
                        enableMoveToFileCodeAction = true,
                        autoUseWorkspaceTsdk = true,
                        experimental = {
                            maxInlayHintLength = 30,
                            completion = {
                                enableServerSideFuzzyMatch = true,
                            },
                        },
                    },
                    typescript = {
                        updateImportsOnFileMove = { enabled = "always" },
                        suggest = {
                            completeFunctionCalls = true,
                        },
                        inlayHints = {
                            enumMemberValues = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            parameterNames = { enabled = "literals" },
                            parameterTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            variableTypes = { enabled = false },
                        },
                    },
                },
            },
            --

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

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "stylua", -- Used to format Lua code
            "black",
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
                        require("lspconfig")[server_name].setup(server)
                    end
                end,
            },
        })
    end,
}
