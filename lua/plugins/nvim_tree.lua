return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    -- lazy = false,
    cmd = { "NvimTreeToggle" },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true, -- Habilita la actualización del archivo enfocado
                update_cwd = true, -- Cambia el directorio de trabajo según el archivo
                -- ignore_list = {}, -- Puedes agregar archivos a ignorar si lo deseas
            },
        })
    end,
    keys = {
        { "<leader>z", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
}
