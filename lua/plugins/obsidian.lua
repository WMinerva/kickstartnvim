return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
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
                path = "~/Escritorio/workspace/notes/",
            },
        },

        -- see below for full list of options 👇
    },
}