return {}
-- local options = { -- Autocompletion
--     -- return {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--
--     dependencies = {
--         -- Snippet Engine & its associated nvim-cmp source
--         {
--             "L3MON4D3/LuaSnip",
--             build = "make install_jsregexp",
--             version = "v2.*",
--             dependencies = {
--                 {
--                     "rafamadriz/friendly-snippets",
--                 },
--             },
--             config = function()
--                 require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
--                 require("luasnip.loaders.from_vscode").lazy_load()
--                 -- local ls = require("luasnip")
--                 -- local s = ls.snippet
--                 -- local t = ls.text_node
--                 -- local i = ls.insert_node
--                 -- ls.add_snippets("lua", {
--                 --     s("hel", {
--                 --         t('print("Hello, world!")'),
--                 --     }),
--                 -- })
--             end,
--         },
--         -- {
--         --     "windwp/nvim-autopairs",
--         --     dependencies = { "hrsh7th/nvim-cmp" },
--         --     config = function()
--         --         require("nvim-autopairs").setup({})
--         --         -- If you want to automatically add `(` after selecting a function or method
--         --         local cmp_autopairs = require("nvim-autopairs.completion.cmp")
--         --         local cmp = require("cmp")
--         --         cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--         --     end,
--         -- },
--         "saadparwaiz1/cmp_luasnip",
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-path",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-cmdline",
--         {
--             "zbirenbaum/copilot-cmp",
--             -- dependencies = "copilot.lua",
--             opts = {},
--             config = function(_, opts)
--                 local copilot_cmp = require("copilot_cmp")
--                 copilot_cmp.setup(opts)
--                 -- attach cmp source whenever copilot attaches
--                 -- fixes lazy-loading issues with the copilot cmp source
--             end,
--         },
--     },
--     config = function()
--         -- See `:help cmp`
--         local cmp = require("cmp")
--         local luasnip = require("luasnip")
--         luasnip.config.setup({})
--
--         cmp.setup({
--             snippet = {
--                 expand = function(args)
--                     luasnip.lsp_expand(args.body)
--                 end,
--             },
--             completion = { completeopt = "menu,menuone,noinsert" },
--             experimental = {
--                 ghost_text = true,
--             },
--             -- completion = { completeopt = "menu,menuone,noselect" },
--             -- formatting = { fields = { "kind", "menu","abbr" } },
--
--             -- No, but seriously. Please read `:help ins-completion`, it is really good!
--             mapping = cmp.mapping.preset.insert({
--                 -- Select the [n]ext item
--                 ["<C-n>"] = cmp.mapping.select_next_item(),
--                 -- Select the [p]revious item
--                 ["<C-p>"] = cmp.mapping.select_prev_item(),
--
--                 -- Scroll the documentation window [b]ack / [f]orward
--                 ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--                 ["<C-f>"] = cmp.mapping.scroll_docs(4),
--
--                 -- Accept ([y]es) the completion.
--                 --  This will auto-import if your LSP supports it.
--                 --  This will expand snippets if the LSP sent a snippet.
--                 ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--
--                 -- If you prefer more traditional completion keymaps,
--                 -- you can uncomment the following lines
--                 -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
--                 -- ["<Tab>"] = cmp.mapping.select_next_item(),
--                 -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
--
--                 -- Manually trigger a completion from nvim-cmp.
--                 --  Generally you don't need this, because nvim-cmp will display
--                 --  completions whenever it has completion options available.
--                 ["<C-Space>"] = cmp.mapping.complete({}),
--
--                 -- Think of <c-l> as moving to the right of your snippet expansion.
--                 --  So if you have a snippet that's like:
--                 --  function $name($args)
--                 --    $body
--                 --  end
--                 --
--                 -- <c-l> will move you to the right of each of the expansion locations.
--                 -- <c-h> is similar, except moving you backwards.
--                 -- ["<C-l>"] = cmp.mapping(function()
--                 ["<Tab>"] = cmp.mapping(function()
--                     if luasnip.expand_or_locally_jumpable() then
--                         luasnip.expand_or_jump()
--                     end
--                 end, { "i", "s" }),
--                 ["<S-Tab>"] = cmp.mapping(function()
--                     if luasnip.locally_jumpable(-1) then
--                         luasnip.jump(-1)
--                     end
--                 end, { "i", "s" }),
--
--                 -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--                 --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--             }),
--             sources = {
--                 {
--                     name = "lazydev",
--                     -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
--                     group_index = 0,
--                 },
--                 {
--                     name = "copilot",
--                     group_index = 1,
--                     priority = 100,
--                 },
--                 {
--                     name = "nvim_lsp",
--                     -- priority = 900,
--                     -- group_index = 2,
--                 },
--                 {
--                     name = "luasnip",
--                     -- group_index = 1,
--
--                     -- priority = 1000,
--                 },
--                 { name = "path" },
--                 { name = "cmdline" },
--                 -- { name = "supermaven" ,group_index = 2},
--             },
--         })
--         cmp.setup.filetype({ "sql" }, {
--             sources = {
--                 { name = "vim-dadbod-completion" },
--                 { name = "buffer" },
--             },
--         })
--     end,
-- }
-- options = vim.tbl_deep_extend("force", options, require("nvchad.cmp"))
--
-- require("cmp").setup(options)
--
-- return options
