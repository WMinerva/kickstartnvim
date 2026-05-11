return {
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
        -- "obsidian-nvim/cosma.nvim",
    },
    opts = {
        note_id_func = function(title)
            if title ~= nil then
                -- reemplaza espacios por guiones
                return title:gsub(" ", "-")
            else
                -- fallback si no hay título
                return tostring(os.time())
            end
        end,
        frontmatter = {
            func = function(note)
                -- local months = {
                --     "enero",
                --     "febrero",
                --     "marzo",
                --     "abril",
                --     "mayo",
                --     "junio",
                --     "julio",
                --     "agosto",
                --     "septiembre",
                --     "octubre",
                --     "noviembre",
                --     "diciembre",
                -- }

                -- local month = months[tonumber(os.date("%m"))]
                local out = {
                    id = note.id,
                    aliases = note.aliases,
                    tags = note.tags,
                    -- tags = { month },
                    -- date = os.date("%d-%m-%Y"),
                    date = os.date("%b %d %Y"),
                }

                return out
            end,
        },
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
            {
                name = "dont-starve-together",
                path = "~/Notes/dont-starve-together/",
            },
        },
        -- templates = {
        --     folder = "templates",
        -- },

        -- attachments = {
        --     folder = "~/Notes/assets/images", -- Imágenes en ~/Notes/Personal/assets/images
        -- },
    },
    keys = {
        --Obsidian
        { "<leader>on", ":Obsidian new<CR> ", desc = "New Obsidian Note" },
        { "<leader>ot", ":Obsidian tags<CR>", desc = "Obsidian Tags" },
        { "<leader>os", ":Obsidian search<CR>", desc = "Obsidian Search" },
        { "<leader>ow", ":Obsidian workspace<CR>", desc = "Obsidian Workspace" },
        { "<leader>ox", ":Obsidian check<CR>", desc = "Obsidian Check" },
        { "<leader>or", ":Obsidian rename<CR>", desc = "Obsidian Rename" },
    },
}
