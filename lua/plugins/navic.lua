return {
    {
        "SmiteshP/nvim-navic",
        event = "BufAdd",
        -- lazy = true,
        config = function()
            dofile(vim.g.base46_cache .. "navic")
            require("nvim-navic").setup({
                lsp = { auto_attach = true },
                highlight = true,
                click = true,
            })
        end,
    },
    {
        "b0o/incline.nvim",
        -- opts = {},
        event = "BufAdd",
        -- lazy = true,
        config = function()
            local devicons = require("nvim-web-devicons")
            require("incline").setup({
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    -- local gitsigns = vim.b[vim.api.nvim_get_current_buf()].gitsigns_status_dict
                    -- local branch_name = gitsigns and gitsigns.head or ""
                    -- local branch_name = " " .. vim.b[vim.api.nvim_get_current_buf()].gitsigns_status_dict.head
                    if filename == "" then
                        filename = "[No Name]"
                    end
                    -- if vim.bo[props.buf].modified then
                    --     filename = filename .. " [+]"
                    -- end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)

                    local function get_git_diff()
                        local icons = { removed = " ", changed = " ", added = " " }
                        local git_palette = {
                            added = "#83c092",
                            changed = "#dbbc7f",
                            removed = "#e67e80",
                        }
                        local signs = vim.b[props.buf].gitsigns_status_dict
                        local labels = {}
                        if signs == nil then
                            return labels
                        end
                        for name, icon in pairs(icons) do
                            if tonumber(signs[name]) and signs[name] > 0 then
                                table.insert(labels, {
                                    icon .. signs[name] .. " ",
                                    guifg = git_palette[name],
                                    guibg = "none",
                                    -- group = "Diff" .. name,
                                })
                            end
                        end
                        if #labels > 0 then
                            table.insert(labels, { " " })
                        end
                        return labels
                    end

                    local function get_diagnostic_label()
                        local icons = { error = " ", warn = " ", info = " ", hint = "󰛩 " }
                        local label = {}

                        for severity, icon in pairs(icons) do
                            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                            if n > 0 then
                                table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
                            end
                        end
                        if #label > 0 then
                            table.insert(label, { " " })
                        end
                        return label
                    end

                    return {
                        -- { branch_name },
                        { get_git_diff() },
                        -- { ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = "none" } or "", " " },
                        { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
                        { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
                        -- { filename or "" },
                        { get_diagnostic_label() },
                        -- { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
                    }
                end,
            })
        end,
    },
}
