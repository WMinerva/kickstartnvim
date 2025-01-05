return {
    "xeluxee/competitest.nvim",
    cmd = {"CompetiTest receive problem","CompetiTest run"},
    dependencies = "MunifTanjim/nui.nvim",
    opts = {
        testcases_use_single_file = true,
        received_files_extension = "py",
        received_problems_path =
        "$(CWD)/Escritorio/workspace/competitive_programming/codeForces/Solute/$(PROBLEM).$(FEXT)",
        received_contests_directory = "$(CWD)/Escritorio/workspace/competitive_programming/codeForces/Solute/",
        received_contests_problems_path =
        "$(CWD)/Escritorio/workspace/competitive_programming/codeForces/Solute/$(PROBLEM).$(FEXT)",
    },
}
