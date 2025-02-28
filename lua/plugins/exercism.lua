-- Lazy
return {
    "2kabhishek/exercism.nvim",
    cmd = {
        "ExercismLanguages",
        "ExercismList",
        "ExercismSubmit",
        "ExercismTest",
    },
    keys = {
        { "<leader>qxa", "<cmd>ExercismLanguages<CR>", desc = "ExercismLanguages" },
        { "<leader>qxl", "<cmd>ExercismList<CR>", desc = "ExercismList" },
        { "<leader>qxs", "<cmd>ExercismSubmit<CR>", desc = "ExercismSubmit" },
        { "<leader>qxt", "<cmd>ExercismTest<CR>", desc = "ExercismTest" },
    },
    dependencies = {
        "2kabhishek/utils.nvim", -- required, for utility functions
        -- "stevearc/dressing.nvim", -- optional, highly recommended, for fuzzy select UI
        -- "2kabhishek/termim.nvim", -- optional, better UX for running tests
    },
    -- Add your custom configs here, keep it blank for default configs (required)
    opts = {
        exercism_workspace = "~/exercism/", -- Default workspace for exercism exercises
        default_language = "python", -- Default language for exercise list
        add_default_keybindings = true, -- Whether to add default keybindings
        -- icons = {
        --     concept = "", -- Icon for concept exercises
        --     practice = "", -- Icon for practice exercises
        -- },
    },
}
