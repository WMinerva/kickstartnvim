return {
    "saghen/blink.cmp",
    event = { "InsertEnter" },
    -- optional: provides snippets for the snippet source
    dependencies = {
        "giuxtaposition/blink-cmp-copilot",
        {
            -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true,
        },
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
            version = "v2.*",
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                },
            },
        },
    },

    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config

    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = "default" },
        -- snippets = { preset = "luasnip" },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = {
                auto_show = true,
                -- window = { border = "single" },
            },
            menu = {
                scrollbar = false,
                -- border = "single",
            },
            ghost_text = { enabled = true },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { "lsp", "lazydev", "path", "snippets", "buffer", "copilot" },
            per_filetype = { sql = { "dadbod" } },
            providers = {
                dadbod = { module = "vim_dadbod_completion.blink" },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    score_offset = 100,
                    async = true,
                },
            },
        },
        signature = { enabled = false },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
