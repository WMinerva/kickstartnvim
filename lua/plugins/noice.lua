return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        -- add any options here
        cmdline = {
            opts = {
                -- relative = 'editor',
                position = { row = "15%", col = "50%" },
            },
        },
    },
}
