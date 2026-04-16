return {
    -- "epwalsh/obsidian.nvim",
    "obsidian-nvim/obsidian.nvim",
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
    dependencies = {
        -- "nvim-lua/plenary.nvim",
        -- "obsidian-nvim/cosma.nvim",
    },
    opts = {
        legacy_commands = false,
        ui = { enable = false },
        completion = {
            blink = true,
        },
        checkbox = {
            order = { " ", "x" },
        },
        workspaces = {
            {
                name = "notes",
                path = "~/Notes/",
            },
            {
                name = "work",
                path = "~/Notes/work/",
            },
            {
                name = "personal",
                path = "~/Notes/personal/",
            },
            {
                name = "universidad",
                path = "~/Notes/universidad",
            },
        },
        attachments = {
            folder = "~/Notes/assets/images", -- Imágenes en ~/Notes/Personal/assets/images
        },
    },
    keys = {
        --Obsidian
        { "<leader>on", ":Obsidian new<CR> ", desc = "New Obsidian Note" },
        { "<leader>ot", ":Obsidian tags<CR>", desc = "Obsidian Tags" },
        { "<leader>os", ":Obsidian search<CR>", desc = "Obsidian Search" },
        { "<leader>ow", ":Obsidian workspace<CR>", desc = "Obsidian Workspace" },
        { "<leader>ox", ":Obsidian check<CR>", desc = "Obsidian Check" },
    },
}
