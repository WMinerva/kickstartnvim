return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    opts = {
        close_if_last_window = true,
        -- hijack_netrw_behavior = "open_current",
        filesystem = {
            use_libuv_file_watcher = true,
            follow_current_file = {enabled= true},
            filtered_items = {
                hidden = false,
                hide_dotfiles = false,
            },
            -- window = {
            --     mappings = {
            --         ["\\"] = "close_window",
            --     },
            -- },
        },
        window = {
            position = "right",
        },
        -- source_selector = {
        --     winbar = false,
        --     statusline = false,
        -- },
    },
}
