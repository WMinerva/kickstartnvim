return { -- Fuzzy Finder (files, lsp, etc)
    -- "nvim-telescope/telescope.nvim",
    -- event = "VimEnter",
    -- branch = "0.1.x",
    -- dependencies = {
    --     -- "nvim-lua/plenary.nvim",
    --     { -- If encountering errors, see telescope-fzf-native README for installation instructions
    --         "nvim-telescope/telescope-fzf-native.nvim",
    --
    --         -- `build` is used to run some command when the plugin is installed/updated.
    --         -- This is only run then, not every time Neovim starts up.
    --         build = "make",
    --
    --         -- `cond` is a condition used to determine whether this plugin should be
    --         -- installed and loaded.
    --         cond = function()
    --             return vim.fn.executable("make") == 1
    --         end,
    --     },
    --     -- { "nvim-telescope/telescope-ui-select.nvim" },
    --     -- { "nvim-telescope/telescope-file-browser.nvim" },
    --     -- { "jonarrien/telescope-cmdline.nvim" },
    --
    --     -- Useful for getting pretty icons, but requires a Nerd Font.
    --     -- { "nvim-tree/nvim-web-devicons" },
    -- },
    -- -- keys = {
    -- --     {
    -- --         "<Leader>e",
    -- --         -- ":Telescope file_browser path=%:p:h<cr>",
    -- --         function()
    -- --             require("telescope").extensions.file_browser.file_browser({
    -- --                 path = "%:p:h",
    -- --                 select_buffer = true,
    -- --                 initial_mode = "normal",
    -- --                 hidden = true,
    -- --                 -- border = false,
    -- --             })
    -- --         end,
    -- --         desc = "Browse Files",
    -- --     },
    -- -- },
    -- config = function()
    --     -- [[ Configure Telescope ]]
    --     -- See `:help telescope` and `:help telescope.setup()`
    --     require("telescope").setup({
    --         defaults = {
    --             prompt_prefix = "  ",
    --             selection_caret = " ",
    --             entry_prefix = " ",
    --             sorting_strategy = "ascending",
    --             layout_config = {
    --                 horizontal = {
    --                     prompt_position = "top",
    --                     preview_width = 0.55,
    --                 },
    --                 width = 0.87,
    --                 height = 0.80,
    --             },
    --         },
    --         -- You can put your default mappings / updates / etc. in here
    --         --  All the info you're looking for is in `:help telescope.setup()`
    --         --
    --         -- defaults = {
    --         --   mappings = {
    --         --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
    --         --   },
    --         -- },
    --         -- pickers = {}
    --         -- extensions = {
    --         --     ["ui-select"] = {
    --         --         require("telescope.themes").get_dropdown(),
    --         --     },
    --         -- },
    --     })
    --     -- require("telescope").load_extension("file_browser")
    --     -- require("telescope").load_extension("cmdline")
    --
    --     -- Enable Telescope extensions if they are installed
    --     pcall(require("telescope").load_extension, "fzf")
    --     -- pcall(require("telescope").load_extension, "ui-select")
    --
    --     -- See `:help telescope.builtin`
    --     local builtin = require("telescope.builtin")
    --     vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    --     vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    --     vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    --     vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    --     vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    --     vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    --     vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    --     vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    --     vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    --     vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
    --
    --     -- Slightly advanced example of overriding default behavior and theme
    --     -- vim.keymap.set("n", "<leader>sb", function()
    --     --     -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    --     --     builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    --     --         winblend = 10,
    --     --         previewer = false,
    --     --     }))
    --     -- end, { desc = "Fuzzily search in current buffer" })
    --
    --     -- It's also possible to pass additional configuration options.
    --     --  See `:help telescope.builtin.live_grep()` for information about particular keys
    --     vim.keymap.set("n", "<leader>s/", function()
    --         builtin.live_grep({
    --             grep_open_files = true,
    --             prompt_title = "Live Grep in Open Files",
    --         })
    --     end, { desc = "[S]earch [/] in Open Files" })
    --
    --     -- Shortcut for searching your Neovim configuration files
    --     vim.keymap.set("n", "<leader>fc", function()
    --         builtin.find_files({ cwd = vim.fn.stdpath("config") })
    --     end, { desc = "[F]ind [C]onfig files" })
    -- end,
}
