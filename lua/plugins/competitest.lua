return {
    "xeluxee/competitest.nvim",
    -- event = "VeryLazy",
    cmd = { "CompetiTest receive problem", "CompetiTest run", "CompetiTest add_testcase", "CompetiTest receive testcases" },
    dependencies = "MunifTanjim/nui.nvim",
    opts = {
        runner_ui = {
            interface = "split",
        },
        testcases_directory = "testcases/",
        testcases_use_single_file = true,
        received_files_extension = "py",
        received_problems_path = "$(CWD)/Workspace/competitive_programming/codeForces/Solute/$(PROBLEM).$(FEXT)",
        received_contests_directory = "$(CWD)/Escritorio/workspace/competitive_programming/codeForces/Solute/",
        received_contests_problems_path = "$(CWD)/Workspace/competitive_programming/codeForces/Solute/$(PROBLEM).$(FEXT)",
    },
    keys = {
        { "<leader>cP", ":CompetiTest receive problem<CR>", { desc = "Create Problem" } },
        { "<leader>cR", ":CompetiTest run<CR>", { desc = "Run CompiTest" } },
        { "<leader>cT", ":CompetiTest receive testcases<CR>", { desc = "Receive Testcases CompiTest" } },
        { "<leader>cA", ":CompetiTest add_testcase<CR>", { desc = "Add Testcases CompiTest" } },
    },
}
