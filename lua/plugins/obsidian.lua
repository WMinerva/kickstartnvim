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
            img_folder = "~/Notes/assets/images", -- Imágenes en ~/Notes/Personal/assets/images
        },
        note_frontmatter_func = function(note)
            return {
                id = note.id,
                date = os.date("%m-%d-%Y"), -- Añade fecha actual
                aliases = note.aliases,
                tags = note.tags,
                -- time = os.date("%H:%M:%S"), -- Añade hora actual
            }
        end,
        -- templates = {
        --     folder = " ~/Notes/Templates",
        --     date_format = "%Y-%m-%d",
        --     time_format = "%H:%M",
        --     -- A map for custom variables, the key should be the variable and the value a function.
        --     -- Functions are called with obsidian.TemplateContext objects as their sole parameter.
        --     -- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#substitutions
        --     substitutions = {},
        --
        --     -- A map for configuring unique directories and paths for specific templates
        --     --- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#customizations
        --     customizations = {},
        -- },

        -- see below for full list of options 👇
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
