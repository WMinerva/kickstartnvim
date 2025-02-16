local map = vim.keymap.set
local opts = { noremap = true, silent = true }
--  See `:help map()`
--

map("n", "<S-l>", vim.cmd.bnext, opts)
map("n", "<leader>h", function()
    Snacks.notifier.show_history(opts)
end, { desc = "Show Notification" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- Diagnostic keymaps
map("n", "<leader>x", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>fb", vim.lsp.buf.format, { desc = "Format Buffer" })

map("n", "<leader>cc", ":RunCode<CR>", { desc = "Run Code" })
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
map("n", "<leader>co", ":Leet console<CR>", { desc = "LeetCode Console" })

map("n", "<leader>cp", ":CompetiTest receive problem<CR>", { desc = "Create Problem" })
map("n", "<leader>cR", ":CompetiTest run<CR>", { desc = "Run CompiTest" })

--Obsidian
map("n", "<leader>on", ":ObsidianNew<CR> ")
map("n", "<leader>ot", ":ObsidianTags<CR>")
map("n", "<leader>os", ":ObsidianSearch<CR>")
map("n", "<leader>oo", ":ObsidianToggleCheckbox<CR>")
map("n", "<leader>ox", ":ObsidianCheck<CR>")

--neo-tree
-- map("n", "<leader>df", "<cmd>Neotree toggle<CR>", { desc = "Explorer Neotree" })
map("n", "<leader>tt", "<cmd>Telescope themes<cr>", { desc = "NvChad Themes" })
map("n", "<leader>tc", "<cmd>NvCheatsheet<cr>", { desc = "Cheatsheet" })

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>l", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
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
-- map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>dw", "<C-W>c", { desc = "Delete Window", remap = true })
