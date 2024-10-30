return {
    "CRAG666/code_runner.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
    config = function()
        local status_ok, code_runner = pcall(require, "code_runner")
        if not status_ok then
            return
        end

        local rfile = {
            java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
            python = "python3 -u",
            --typescript = "deno run",
            rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
            cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
            javascript = "node $dir/$fileName",
            --scss = "sass &dir/$fileName $dir/$fileNameWithoutExt.css",
        }
        local data_exists, runscript = pcall(require, "core.config")
        if data_exists then
            if runscript.code_runner ~= nil then
                rfile = vim.tbl_deep_extend("force", runscript.code_runner, rfile)
            end
        end

        code_runner.setup({
            filetype = rfile,
            --mode = "term",
            mode = "float",
            focus = true,
            startinsert = true,
            -- term = {
            --   position = "vert",
            --   size = 40,
            -- },
            float = {
                close_key = "<ESC>",
                border = "rounded", -- window border (see :h nvim_open_win)
                --Num 0-1 for measurements
                height = 1,
                width = 0.4,
                x = 1.0,
                y = 0.2,
                --highlight (see :h winhl )
                border_hl = "FloatBorder",
                float_hl = "Normal",
                -- transparency (see :h winblend)
                -- blend = 30,
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })
    end,
}
