local map = vim.keymap.set
local opts = { noremap = true, silent = true }
--  See `:help map()`
--
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>xq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-N>", { desc = "Exit terminal mode" })

-- map("i", "<M-f>", "<ESC>")
map("n", "<leader>cz", ":RunCode<CR>", { desc = "Run code" })
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
--LeetCode
map("n", "<leader>ce", ":Leet list difficulty=easy<CR>", { desc = "LeetCode Easy" })
map("n", "<leader>cn", ":Leet list difficulty=medium<CR>", { desc = "LeetCode Medium" })
map("n", "<leader>ch", ":Leet list difficulty=hard<CR>", { desc = "LeetCode Hard" })
map("n", "<leader>cl", ":Leet lang<CR>", { desc = "LeetCode Language" })
map("n", "<leader>cw", ":Leet open<CR>", { desc = "LeetCode Open Web" })
map("n", "<leader>ct", ":Leet run<CR>", { desc = "LeetCode Run" })
map("n", "<leader>ci", ":Leet info<CR>", { desc = "LeetCode Info" })
map("n", "<leader>cg", ":Leet submit<CR>", { desc = "LeetCode Submit" })
map("n", "<leader>cc", ":Leet console<CR>", { desc = "LeetCode Console" })

map("n", "<leader>cp", ":CompetiTest receive problem<CR>", { desc = "Create Problem" })
map("n", "<leader>cR", ":CompetiTest run<CR>", { desc = "Run CompiTest" })

--Obsidian
map("n", "<leader>on", ":ObsidianNew<CR> ")
map("n", "<leader>ot", ":ObsidianTags<CR>")
map("n", "<leader>os", ":ObsidianSearch<CR>")
map("n", "<leader>oo", ":ObsidianToggleCheckbox<CR>")
map("n", "<leader>ox", ":ObsidianCheck<CR>")

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<S-l>", vim.cmd.bnext, opts)
map("n", "<leader>qq", ":q<CR>", opts)
--neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", opts)
-- map("n", "<leader>e", function()
--         require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
--     end,opts)
map("n", "<leader>tt", "<cmd>Telescope themes<cr>", { desc = "NvChad Themes" })
map("n", "<leader>tp", function()
    require("nvchad.themes").open()
end, { desc = "Picker nvchad themes" })
map("n", "<leader>tc", "<cmd>NvCheatsheet<cr>", { desc = "Cheatsheet" })
-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>ll", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
map("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", "<leader>t-", function()
    require("nvchad.term").new({ pos = "sp" })
end, { desc = "Terminal new horizontal" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

--windows
map("n", "<leader>db", "<cmd>bd<CR>", { desc = "Delete Buffer", remap = true })
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>dw", "<C-W>c", { desc = "Delete Window", remap = true })
