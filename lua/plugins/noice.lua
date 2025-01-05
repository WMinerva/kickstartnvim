return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        cmdline = {
            opts = {
                -- relative = 'editor',
                position = { row = "15%", col = "50%" },
            },
        },
    },
}
