local my_projects = {
    "~/Notes",
    "~/Workspace",
    "~/.local/share/com.nesbox.tic/TIC-80",
    "~/.config/nvim",
    "~/Projects",
    "~/Documentos/Apuntes_Bash",
}
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        animate = {},
        scroll = {},
        picker = {
            prompt = "  ",
            icons = {
                tree = {
                    vertical = "│ ",
                    middle = "│ ",
                    last = "└╴",
                },
            },
            layout = {
                preset = "default",
                -- preset = "telescope",
                -- layout = {
                -- },
            },
            layouts = {
                -- telescope = {
                --     reverse = false,
                --     layout = {
                --         box = "horizontal",
                --         backdrop = false,
                --         width = 0.8, -- Cambia el ancho
                --         height = 0.8,
                --         border = "none",
                --         {
                --             box = "vertical",
                --             {
                --                 win = "input",
                --                 height = 1,
                --                 border = "rounded",
                --                 title = "{title} {live} {flags}",
                --                 title_pos = "center",
                --             },
                --             { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                --         },
                --         {
                --             win = "preview",
                --             title = "{preview:Preview}",
                --             width = 0.55, -- Cambia el ancho de la vista previa
                --             border = "rounded",
                --             title_pos = "center",
                --         },
                --     },
                -- },
                default = {
                    layout = {
                        box = "horizontal",
                        width = 0.8,
                        min_width = 120,
                        height = 0.8,
                        {
                            box = "vertical",
                            border = "rounded",
                            title = "{title} {live} {flags}",
                            { win = "input", height = 1, border = "top" },
                            { win = "list", border = "rounded" },
                        },
                        { win = "preview", title = "{preview}", border = "top", width = 0.55 },
                    },
                },
            },
        },
        bigfile = { enabled = true },
        indent = {
            indent = {
                enabled = false,
            },
            -- chunk = {
            --     enabled = true,
            --     char = {
            --         horizontal = "─",
            --         vertical = "│",
            --         corner_top = "╭",
            --         corner_bottom = "╰",
            --         arrow = "─",
            --     },
            -- },
        },
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
                    { icon = " ", key = "c", desc = "Config", action = "<leader>fc" },
                    -- { key = "d", action = ":project_picker", desc = "Mis Proyectos" },
                    -- { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
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
                {
                    -- pane = 2,
                    icon = " ",
                    desc = "Browse Repo",
                    indent = 2,
                    padding = 1,
                    -- gap = 1,
                    key = "b",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    action = function()
                        Snacks.gitbrowse()
                    end,
                },
                { section = "startup" },
                {
                    pane = 2,
                    -- section = "terminal",
                    section = "header",
                    -- cmd = "colorscript -e 1",
                },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 3, padding = { 2, 1 } },
                {
                    pane = 2,
                    icon = " ",
                    title = "Projects",
                    section = "projects",
                    dirs = my_projects,
                    indent = 3,
                    padding = { 2, 1 },
                },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    -- cmd = "git status --short --branch --renames",
                    cmd = "git --no-pager diff --stat -B -M -C",
                    -- height = 10,
                    padding = 3,
                    -- ttl = 5 * 60,
                    indent = 3,
                },
            },
        },
        notifier = { enabled = true, top_down = false, style = "compact" },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        -- input = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>h",
            function()
                Snacks.notifier.show_history(opts)
            end,
            desc = "Show Notification",
        },
        {
            "<leader>e",
            function()
                Snacks.picker.explorer({
                    -- cwd = vim.fn.expand("%:p:h"),
                    layout = {

                        -- preset = "vscode",
                        -- preview = true,
                        -- tree = false,
                        layout = {
                            width = 30,
                            -- position = "right",
                        },
                    },
                })
            end,
            desc = "Explorer Tree",
        },
        {
            "<leader>fe",
            function()
                Snacks.picker.explorer({
                    -- cwd = vim.fn.expand("%:p:h"),
                    layout = {
                        preview = true,
                        layout = {
                            box = "horizontal",
                            width = 0.8,
                            min_width = 120,
                            height = 0.8,
                            {
                                box = "vertical",
                                border = "rounded",
                                title = "{title} {live} {flags}",
                                { win = "input", height = 1, border = "top" },
                                { win = "list", border = "rounded" },
                            },
                            { win = "preview", title = "{preview}", border = "top", width = 0.55 },
                        },
                    },
                })
            end,
            desc = "Find Explorer",
        },
        {
            "<leader><space>",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        -- {
        --     "<leader>,",
        --     function()
        --         Snacks.picker.buffers()
        --     end,
        --     desc = "Buffers",
        -- },
        {
            "<leader>/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>:",
            function()
                Snacks.picker.command_history()
            end,
            desc = "Command History",
        },
        {
            "<leader>n",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notification History",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>fc",
            function()
                Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Find Config File",
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
            end,
            desc = "Find Files",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.git_files()
            end,
            desc = "Find Git Files",
        },
        {
            "<leader>fp",
            function()
                Snacks.picker.projects({ projects = my_projects, recent = false })
            end,
            desc = "Projects",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent",
        },
        -- git
        {
            "<leader>gt",
            function()
                Snacks.git.blame_line()
            end,
            desc = "Git Blame",
        },
        {
            "<leader>gb",
            function()
                Snacks.picker.git_branches()
            end,
            desc = "Git Branches",
        },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log()
            end,
            desc = "Git Log",
        },
        {
            "<leader>gL",
            function()
                Snacks.picker.git_log_line()
            end,
            desc = "Git Log Line",
        },
        {
            "<leader>gs",
            function()
                Snacks.picker.git_status()
            end,
            desc = "Git Status",
        },
        {
            "<leader>gS",
            function()
                Snacks.picker.git_stash()
            end,
            desc = "Git Stash",
        },
        {
            "<leader>gd",
            function()
                Snacks.picker.git_diff()
            end,
            desc = "Git Diff (Hunks)",
        },
        {
            "<leader>gf",
            function()
                Snacks.picker.git_log_file()
            end,
            desc = "Git Log File",
        },
        -- Grep
        {
            "<leader>sb",
            function()
                Snacks.picker.lines()
            end,
            desc = "Buffer Lines",
        },
        {
            "<leader>sB",
            function()
                Snacks.picker.grep_buffers()
            end,
            desc = "Grep Open Buffers",
        },
        {
            "<leader>sg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>sw",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Visual selection or word",
            mode = { "n", "x" },
        },
        -- search
        {
            '<leader>s"',
            function()
                Snacks.picker.registers()
            end,
            desc = "Registers",
        },
        {
            "<leader>s/",
            function()
                Snacks.picker.search_history()
            end,
            desc = "Search History",
        },
        {
            "<leader>sa",
            function()
                Snacks.picker.autocmds()
            end,
            desc = "Autocmds",
        },
        {
            "<leader>sb",
            function()
                Snacks.picker.lines()
            end,
            desc = "Buffer Lines",
        },
        -- {
        --     "<leader>sc",
        --     function()
        --         Snacks.picker.command_history()
        --     end,
        --     desc = "Command History",
        -- },
        {
            "<leader>sC",
            function()
                Snacks.picker.commands()
            end,
            desc = "Commands",
        },
        {
            "<leader>sd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>sD",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "Buffer Diagnostics",
        },
        {
            "<leader>sh",
            function()
                Snacks.picker.help()
            end,
            desc = "Help Pages",
        },
        {
            "<leader>sH",
            function()
                Snacks.picker.highlights()
            end,
            desc = "Highlights",
        },
        {
            "<leader>si",
            function()
                Snacks.picker.icons()
            end,
            desc = "Icons",
        },
        {
            "<leader>sj",
            function()
                Snacks.picker.jumps()
            end,
            desc = "Jumps",
        },
        {
            "<leader>sk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>sl",
            function()
                Snacks.picker.loclist()
            end,
            desc = "Location List",
        },
        {
            "<leader>sm",
            function()
                Snacks.picker.marks()
            end,
            desc = "Marks",
        },
        {
            "<leader>sM",
            function()
                Snacks.picker.man()
            end,
            desc = "Man Pages",
        },
        {
            "<leader>sp",
            function()
                Snacks.picker.lazy()
            end,
            desc = "Search for Plugin Spec",
        },
        {
            "<leader>sq",
            function()
                Snacks.picker.qflist()
            end,
            desc = "Quickfix List",
        },
        {
            "<leader>sR",
            function()
                Snacks.picker.resume()
            end,
            desc = "Resume",
        },
        {
            "<leader>su",
            function()
                Snacks.picker.undo()
            end,
            desc = "Undo History",
        },
        {
            "<leader>uC",
            function()
                Snacks.picker.colorschemes()
            end,
            desc = "Colorschemes",
        },
        -- LSP
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gI",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>sS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
    },
}
