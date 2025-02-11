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
        St_porc = { fg = "dark_purple", bg = "statusline_bg" },
    },
    integrations = {
        "navic",
        -- "snacks",
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
        order = { "mode", "file", "navic", "%=", "last_keys", "lsp_info", "git", "diagnostics", "cwd", "progress" },
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
            -- get_capslock = function()
            --     local handle = io.popen("xset -q | grep 'Caps Lock' | awk '{print $4}'")
            --     if handle then
            --         local result = handle:read("*a")
            --         handle:close()
            --         return result:match("on") and "CAPS" or ""
            --     end
            --     return ""
            -- end,
            -- f = "%F",
            lsp_info = function()
                local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
                if #buf_clients == 0 then
                    return "Inactive"
                end
                local names = {}
                for _, client in ipairs(buf_clients) do
                    table.insert(names, client.name)
                end
                return table.concat(names, ",")
            end,
        },
    },
    -- telescope = { style = "bordered" },
}
return M
-- white = "",
-- black = "", -- usually your theme bg
-- darker_black = "", -- 6% darker than black
-- black2 = "", -- 6% lighter than black
-- one_bg = "", -- 10% lighter than black
-- one_bg2 = "", -- 6% lighter than one_bg2
-- one_bg3 = "", -- 6% lighter than one_bg3
-- grey = "", -- 40% lighter than black (the % here depends so choose the perfect grey!)
-- grey_fg = "", -- 10% lighter than grey
-- grey_fg2 = "", -- 5% lighter than grey
-- light_grey = "",
-- red = "",
-- baby_pink = "",
-- pink = "",
-- line = "", -- 15% lighter than black
-- green = "",
-- vibrant_green = "",
-- nord_blue = "",
-- blue = "",
-- seablue = "",
-- yellow = "", -- 8% lighter than yellow
-- sun = "",
-- purple = "",
-- dark_purple = "",
-- teal = "",
-- orange = "",
-- cyan = "",
-- statusline_bg = "",
-- lightbg = "",
-- pmenu_bg = "",
-- folder_bg = ""
