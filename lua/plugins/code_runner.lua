return {
    "CRAG666/code_runner.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
    config = function()
        local rfile = {
            java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
            python = "python3 -u '$dir/$fileName'",
            cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
            lua = "cd $dir && lua $fileName",
            -- typescript = "deno run",
            -- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
            -- javascript = "node $dir/$fileName",
            --scss = "sass &dir/$fileName $dir/$fileNameWithoutExt.css",
        }

        require("code_runner").setup({
            filetype = rfile,
            mode = "term",
            -- mode = "float",
            focus = true,
            startinsert = true,
            term = {
                position = "vert",
                size = 50,
            },
        })
    end,
    keys = {
        { "<leader>cc", ":RunCode<CR>", desc = "Run Code" },
    },
}
