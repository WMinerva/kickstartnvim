local M = {}

M.base46 = {
    theme = "everforest",
    theme_toggle = { "gruvbox_light", "gruvbox_light" },
    -- transparency = true,
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
    -- hl_add = {
    --     WinBar = { bg = "NONE" },
    --     WinBarNC = { bg = "NONE" },
    -- },
    integrations = {
        "navic",
    },
}
M.lsp = {
    -- signature = false,
}
M.ui = {
    cmp = {
        style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
    },
    statusline = {
        -- theme = "vscode_colored",
        -- theme = "minimal",
        -- separator_style = "round",
        order = { "mode", "file", "navic", "%=", "git", "diagnostics", "cwd", "cursor" },
        modules = {
            navic = function()
                return "%{%v:lua.require'nvim-navic'.get_location()%}"
                -- color_correction = "dynamic",
                -- return "%{%v:lua.dropbar.get_dropbar_str()%}"
            end,
            -- f = "%F",
        },
        -- order = { "mode", "file", "git", "%=", "lsp", "%=", "lsp_msg", "cwd", "cursor" },
    },
    -- telescope = { style = "bordered" },
}
return M
