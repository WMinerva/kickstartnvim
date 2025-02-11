return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    -- config = function()
    --     dofile(vim.g.base46_cache .. "snacks")
    -- end,
    opts = {
        -- dofile(vim.g.base46_cache .. "snacks"),
        -- picker = {
        --     sources = {
        --         explorer = {
        --             layout = { layout = { position = "right" } },
        --         },
        --     },
        -- },
        animate = {
            enabled = true,
            -- duration = 20, -- ms per step
            -- easing = "linear",
            -- fps = 60,
        },
        bigfile = { enabled = true },
        indent = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                --    header = [[
                -- ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
                -- ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
                -- ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽
                -- ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
                -- ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
                -- ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕
                -- ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
                -- ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
                -- ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
                -- ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                -- ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
                -- ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
                -- ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
                -- ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣
                --   ]],
                header = [[
                ███╗   ██╗ ██████╗ ████████╗    ██╗   ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗
                ████╗  ██║██╔═══██╗╚══██╔══╝    ██║   ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝
              ██╔██╗ ██║██║   ██║   ██║       ██║   ██║███████╗██║     ██║   ██║██║  ██║█████╗
              ██║╚██╗██║██║   ██║   ██║       ╚██╗ ██╔╝╚════██║██║     ██║   ██║██║  ██║██╔══╝
                ██║ ╚████║╚██████╔╝   ██║        ╚████╔╝ ███████║╚██████╗╚██████╔╝██████╔╝███████╗
                ╚═╝  ╚═══╝ ╚═════╝    ╚═╝         ╚═══╝  ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
            ]],
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "p", desc = "Leet Code", action = ":Leet" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                {
                    -- icon = " ",
                    -- title = "Keymaps",
                    section = "keys",
                    indent = 2,
                    gap = 1,
                    padding = 1,
                },
                { section = "startup" },
                {
                    pane = 2,
                    -- section = "terminal",
                    section = "header",
                    -- cmd = "colorscript -e 1",
                },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 3, padding = { 2, 1 } },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 3, padding = { 2, 1 } },
            },
        },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        -- input = { enabled = true },
        words = { enabled = true },
        -- styles = {
        --     notification = {
        --         wo = { wrap = true }, -- Wrap notifications
        --     },
        -- },
    },
    -- config = function(_, opts)
    --     dofile(vim.g.base46_cache .. "snacks")
    -- end,
    keys = {
        {
            "<leader>g",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>z",
            function()
                Snacks.picker.explorer()
            end,
        },
    },
}
