local M = {}

M.base46 = {
    theme = "everforest",
    theme_toggle = { "everforest", "gruvbox_light" },
    transparency = false,
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}
M.lsp = {
    -- signature = false,
}
M.ui = {
    cmp = {
        -- style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
    },
    statusline = {
        -- theme = "vscode_colored",
        separator_style = "block",
    },
}

return M
