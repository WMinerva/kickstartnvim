local M = {}

M.base46 = {
    theme = "everforest",
    theme_toggle = { "gruvbox_light", "gruvbox_light" },
    -- transparency = true,
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
        -- theme = "minimal",
        -- separator_style = "round",
        order = { "mode", "file", "git", "%=", "diagnostics", "cwd", "cursor" },
        -- order = { "mode", "file", "git", "%=", "lsp", "%=", "lsp_msg", "cwd", "cursor" },
    },
    -- telescope = { style = "bordered" },
}
return M
