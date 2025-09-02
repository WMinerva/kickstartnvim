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
    -- dependencies = {
    --     "nvim-lua/plenary.nvim",
    -- },
    opts = {
        ui = { enable = false },
        completion = {
            blink = true,
        },
        workspaces = {
            -- {
            --     name = "personal",
            --     path = "~/",
            -- },
            {
                name = "workspace",
                path = "~/Workspace/Notes/",
            },
        },
        templates = {
            folder = "Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function.
            -- Functions are called with obsidian.TemplateContext objects as their sole parameter.
            -- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#substitutions
            substitutions = {},

            -- A map for configuring unique directories and paths for specific templates
            --- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#customizations
            customizations = {},
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
