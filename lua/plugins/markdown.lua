return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            -- completions = { lsp = { enabled = true }, blink = { enabled = true } },
        },
    },
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     ft = "markdown",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     build = function()
    --         require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    --         vim.fn["mkdp#util#install"]()
    --     end,
    --     keys = {
    --         {
    --             "<leader>m",
    --             ft = "markdown",
    --             "<cmd>MarkdownPreviewToggle<cr>",
    --             desc = "Markdown Preview",
    --         },
    --     },
    --     config = function()
    --         vim.cmd([[do FileType]])
    --     end,
    -- },
}
