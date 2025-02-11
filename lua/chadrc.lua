local M = {}

M.base46 = {
    theme = "everforest",
    theme_toggle = { "everforest", "gruvbox_light" },
    -- transparency = true,
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
    hl_add = {
        -- WinBar = { bg = "NONE" },
        -- WinBarNC = { bg = "NONE" },
        St_porc = { fg = "dark_purple", bg = "seablue" },
    },
    integrations = {
        "navic",
    },
    -- lsp_semantic_tokens = false,
}
M.lsp = {
    -- signature = false,
}
M.ui = {
    cmp = {
        style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
    },
    statusline = {
        theme = "vscode_colored",
        -- separator_style = "round",
        order = { "mode", "file", "navic", "%=", "last_keys", "git", "diagnostics", "cwd", "progress" },
        -- order = { "mode", "file","lsp", "lsp_msg", "%=", "git", "diagnostics", "cwd", "cursor" },
        modules = {
            navic = function()
                return "%{%v:lua.require'nvim-navic'.get_location()%}"
            end,
            hour = function()
                return os.date("%R")
            end,
            progress = function()
                return "%#St_porc#  " .. "%p %%"
            end,
            last_keys = function()
                -- return "%{reg_recording()}"
                return vim.fn.reg_recording() ~= "" and "Recording: @" .. vim.fn.reg_recording() or ""
            end,
            -- f = "%F",
        },
    },
    -- telescope = { style = "bordered" },
}
return M
