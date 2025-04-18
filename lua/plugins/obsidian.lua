return {
    "epwalsh/obsidian.nvim",
    cmd = {
        "ObsidianNew",
        "ObsidianTags",
        "ObsidianSearch",
        "ObsidianToggleCheckbox",
        "ObsidianCheck",
    },
    version = "*", -- recommended, use latest release instead of latest commit
    -- lazy = false,
    ft = "markdown",
    -- dependencies = {
    --     "nvim-lua/plenary.nvim",
    -- },
    opts = {
        workspaces = {
            -- {
            --     name = "personal",
            --     path = "~/",
            -- },
            {
                name = "workspace",
                path = "~/Workspace/notes/",
            },
        },

        -- see below for full list of options 👇
    },
    keys = {
        --Obsidian
        { "<leader>on", ":ObsidianNew<CR> ", desc = "New Obsidian Note" },
        { "<leader>ot", ":ObsidianTags<CR>", desc = "Obsidian Tags" },
        { "<leader>os", ":ObsidianSearch<CR>", desc = "Obsidian Search" },
        { "<leader>oo", ":ObsidianToggleCheckbox<CR>", desc = "Obsidian Toggle Checkbox" },
        { "<leader>ox", ":ObsidianCheck<CR>", desc = "Obsidian Check" },
    },
}
