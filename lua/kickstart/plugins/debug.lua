-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- Creates a beautiful debugger UI
        "rcarriga/nvim-dap-ui",
        -- Required dependency for nvim-dap-ui
        "nvim-neotest/nvim-nio",
        -- Installs the debug adapters for you
        "williamboman/mason.nvim",
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
        "jay-babu/mason-nvim-dap.nvim",
        -- Add your own debuggers here
        -- "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
    },
    keys = function(_, keys)
        local dap = require("dap")
        local dapui = require("dapui")
        return {
            -- Basic debugging keymaps, feel free to change to your liking!
            { "<leader>bs", dap.continue,          desc = "Debug: Start/Continue" },
            { "<F1>",       dap.step_into,         desc = "Debug: Step Into" },
            { "<F2>",       dap.step_over,         desc = "Debug: Step Over" },
            { "<F3>",       dap.step_out,          desc = "Debug: Step Out" },
            { "<leader>bp", dap.toggle_breakpoint, desc = "Debug: Toggle Breakpoint" },
            {
                "<leader>B",
                function()
                    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Debug: Set Breakpoint",
            },
            -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
            { "<F7>", dapui.toggle, desc = "Debug: See last session result." },
            unpack(keys),
        }
    end,
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                -- "delve",
                "debugpy",
                "java-debug-adapter",
                "java-test",
            },
        })
        -- require("dapui").setup()

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        -- Install golang specific config
        -- require("dap-go").setup({
        --     delve = {
        --         -- On Windows delve must be run attached or it crashes.
        --         -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        --         detached = vim.fn.has("win32") == 0,
        --     },
        -- })
        require("dap-python").setup("~/.local/share/kickstart/mason/packages/debugpy/venv/bin/python3")
        dap.configurations.java = {
            {
                name = "Debug Launch (2GB)",
                javaExec = "java",
                request = "launch",
                type = "java",
            },
            {
                type = "java",
                request = "attach",
                name = "Debug (Attach) - Remote",
                hostName = "127.0.0.1",
                port = 5005,
            },
        }
    end,
}
