return {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    opts = {
        -- testcases_use_single_file = true,
        received_files_extension = "py",
        received_problems_path = "$(CWD)/Escritorio/workspace/codeForces/$(PROBLEM).$(FEXT)",
        received_contests_directory = "$(CWD)/Escritorio/workspace/codeForces/",
        received_contests_problems_path = "$(CWD)/Escritorio/workspace/codeForces/$(PROBLEM).$(FEXT)",
    },
}
