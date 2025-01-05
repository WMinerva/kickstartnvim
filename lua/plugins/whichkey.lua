return {                -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        require("which-key").setup({
            preset = "helix",
        })
        -- Document existing key chains
        require("which-key").add({
            { "<leader>c", group = "Code",    mode = { "n", "x" } },
            { "<leader>d", group = "Document" },
            { "<leader>s", group = "Search" },
            { "<leader>f", group = "Find" },
            { "<leader>b", group = "Debug" },
            { "<leader>o", group = "Obsidian" },
            { "<leader>t", group = "Toggle" },
            -- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
        })
    end,
}
