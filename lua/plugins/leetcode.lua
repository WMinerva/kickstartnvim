return {
    "kawre/leetcode.nvim",
    -- build = ":TSUpdate html",
    cmd = {
        "Leet",
        "Leet list difficulty=easy",
        "Leet list difficulty=medium",
        "Leet list difficulty=hard",
        "Leet lang",
        "Leet open",
        "Leet run",
        "Leet info",
        "Leet submit",
        "Leet console",
    },
    dependencies = {
        "nvim-telescope/telescope.nvim",
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
            home = "~/Workspace/competitive_programming/leetcode/",
            cache = "~/Workspace/competitive_programming/cache/",
        },
    },
}
