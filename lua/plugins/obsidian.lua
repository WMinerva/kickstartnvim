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
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
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
}
