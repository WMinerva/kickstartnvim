local map = vim.keymap.set
local opts = { noremap = true, silent = true }
--  See `:help map()`
--
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- map("i", "<M-f>", "<ESC>")
-- map("n", "<leader>cz", ":RunCode<CR>", { desc = "Run code" })
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- map("n", "<leader>ct", ":ObsidianNew ")
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
-- map('n', '<C-s>', ':w<CR>', opts)
map('n', '<S-l>', vim.cmd.bnext, opts)
map('n', '<leader>qq', ':q<CR>', opts)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

--nvim-tree
-- map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Nvimtree toggle window' })
-- map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvimtree focus window' })

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

--windows
map('n', '<leader>w', '<c-w>', { desc = 'Windows', remap = true })
map('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })
