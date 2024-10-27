return {
    "kawre/leetcode.nvim",
    -- build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        -- configuration goes here
        lang = "python3",
        description = {
            position = "right",
        },
        storage = {
            home = "~/Escritorio/workspace/competitive_programming/leetcode/",
            cache = "~/Escritorio/workspace/competitive_programming/cache/",
        },
    },
}
