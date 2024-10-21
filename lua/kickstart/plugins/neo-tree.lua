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
        hijack_netrw_behavior = "open_current",
        filesystem = {
            bind_to_cwd = true,
            follow_current_file = { enabled = true, leave_dirs_open = false },
            use_libuv_file_watcher = true,
            filtered_items = {
                hide_hidden = false,
                hide_dotfiles = false,
                -- hide_by_pattern = {"*/"}, -- This will hide all subdirectories
                hide_by_pattern = { "*/", "!./" }, -- Oculta todas las subcarpetas excepto la actual
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
