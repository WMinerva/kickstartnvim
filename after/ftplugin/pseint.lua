-- -- Detectar .psc
-- vim.filetype.add({
--     extension = { psc = "pseint" },
-- })
--
-- local lspconfig = require("lspconfig")
local home = os.getenv("HOME")
--
-- lspconfig.pseint_lsp = {
--     default_config = -         cmd = {
--             home .. "/pseint-lsp/.venv/bin/python",
--             home .. "/pseint-lsp/launch.py",
--         },
--         filetypes = { "pseint" },
--         root_dir = lspconfig.util.root_pattern(".git"),
--     },
-- }
--
-- lspconfig.pseint_lsp.setup({})

-- Set up filetype detection
vim.filetype.add({
    extension = { psc = "pseint" },
})

-- Configure PSeInt LSP
vim.lsp.config("pseint-lsp", {
    cmd = {
        home .. "/pseint-lsp/.venv/bin/python",
        home .. "/pseint-lsp/launch.py",
    },

    -- cmd = { '/path/to/pseint-lsp/.venv/bin/python', '/path/to/pseint-lsp/launch.py' },
    filetypes = { "pseint" },
    root_markers = { ".git", "proyecto.psc" },
    name = "pseint-lsp",
})

-- Enable the LSP
vim.lsp.enable("pseint-lsp")
