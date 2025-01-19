return {
    {
        "SmiteshP/nvim-navic",
        config = function()
            dofile(vim.g.base46_cache .. "navic")
            require("nvim-navic").setup({
                lsp = { auto_attach = true },
                highlight = true,
                click = true,
            })
        end,
    },
    -- {
    --     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --     enabled = false,
    --     opt = {},
    -- },
}
