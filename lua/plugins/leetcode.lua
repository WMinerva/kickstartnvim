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
        -- "nvim-telescope/telescope.nvim",
        "MunifTanjim/nui.nvim",
        -- optional
        -- "nvim-treesitter/nvim-treesitter",
        -- "rcarriga/nvim-notify",
        -- "nvim-tree/nvim-web-devicons",
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
    keys = {
        --LeetCode
        { "<leader>ce", ":Leet list difficulty=easy<CR>", desc = "LeetCode Easy" },
        { "<leader>cn", ":Leet list difficulty=medium<CR>", desc = "LeetCode Medium" },
        { "<leader>ch", ":Leet list difficulty=hard<CR>", desc = "LeetCode Hard" },
        { "<leader>cl", ":Leet lang<CR>", desc = "LeetCode Language" },
        { "<leader>cw", ":Leet open<CR>", desc = "LeetCode Open Web" },
        { "<leader>ct", ":Leet run<CR>", desc = "LeetCode Run" },
        { "<leader>ci", ":Leet info<CR>", desc = "LeetCode Info" },
        { "<leader>cg", ":Leet submit<CR>", desc = "LeetCode Submit" },
        { "<leader>co", ":Leet console<CR>", desc = "LeetCode Console" },
    },
}
