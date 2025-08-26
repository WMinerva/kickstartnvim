return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        cmdline = {
            -- view = "cmdline",
            opts = {
                -- relative = 'editor',
                position = { row = "10%", col = "50%" },
            },
        },
        lsp = {
            progress = {
                enabled = false,
            },
        },
        hover = { enabled = false },
        signature = { enabled = false },
    },
}
