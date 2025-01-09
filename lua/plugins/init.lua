-- You can add your own plugins here or in other files in this directory!
return {
    "nvim-lua/plenary.nvim",
    {
        "b0o/incline.nvim",
        event = "VeryLazy",
        config = function()
            local helpers = require("incline.helpers")
            local devicons = require("nvim-web-devicons")
            require("incline").setup({
                window = {
                    padding = 0,
                    margin = { horizontal = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if filename == "" then
                        filename = "[No Name]"
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    return {
                        ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
                        " ",
                        { filename, gui = modified and "bold,italic" or "bold" },
                        " ",
                        -- guibg = "#44406e",
                    }
                end,
            })
        end,
    },
    {
        "nvchad/ui",
        config = function()
            require("nvchad")
            -- vim.o.statusline = ' '
        end,
    },
    {
        "nvchad/base46",
        lazy = true,
        build = function()
            require("base46").load_all_highlights()
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            return { override = require("nvchad.icons.devicons") }
        end,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "devicons")
            require("nvim-web-devicons").setup(opts)
        end,
    },
}
