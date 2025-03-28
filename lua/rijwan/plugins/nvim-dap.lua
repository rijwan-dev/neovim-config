
return {
    'mfussenegger/nvim-dap',
    requires = {
        'theHamsta/nvim-dap-virtual-text',
        'rcarriga/nvim-dap-ui',
        'Pocco81/DAPInstall.nvim',
    },
    config = function()
        local dap = require("dap")

        ----** Python Debugging **----
        dap.adapters.python = function(cb, config)
            local cwd = vim.fn.getcwd()  -- Get the current working directory

            if config.request == 'attach' then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port  -- Get the port for the connection
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or '127.0.0.1'  -- Default to localhost if no host is specified

                cb({
                    type = 'server',
                    port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                    host = host,
                    options = {
                        source_filetype = 'python',  -- Specify the source file type
                    },
                })
            else
                cb({
                    type = 'executable',
                    command = cwd .. '/.venv/bin/python',  -- Path to the Python executable in the virtual environment
                    args = { '-m', 'debugpy.adapter' },  -- Arguments to run the debugpy adapter
                    options = {
                        source_filetype = 'python',  -- Specify the source file type
                    },
                })
            end
        end

        dap.configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = 'python',  -- Link to the adapter definition: `dap.adapters.python`
                request = 'launch',  -- Request type
                name = "Launch file",  -- Name of the configuration

                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
                program = "${file}",  -- This configuration will launch the current file if used.

                pythonPath = function()
                    -- debugpy supports launching an application with a different interpreter than the one used to launch debugpy itself.
                    -- The code below looks for a `venv` or `.venv` folder in the current directory and uses the Python within.
                    -- You could adapt this to use the `VIRTUAL_ENV` environment variable.
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                        return cwd .. '/venv/bin/python'
                    elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                        return cwd .. '/.venv/bin/python'
                    else
                        return '/usr/bin/python'  -- Default Python path if no virtual environment is found
                    end
                end,
            },
        } ----** C++ Debugging **----

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",  -- Path to the GDB executable
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }  -- GDB arguments
        }

        dap.configurations.cpp = {
            {
                name = "Launch",  -- Name of the configuration
                type = "gdb",  -- Link to the adapter definition: `dap.adapters.gdb`
                request = "launch",  -- Request type
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')  -- Prompt for the path to the executable
                end,
                cwd = "${workspaceFolder}",  -- Current working directory
                stopAtBeginningOfMainSubprogram = false,  -- Do not stop at the beginning of the main subprogram
            },
        }

        ----** Key Mappings **----
        local keymap = vim.keymap
        keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
        keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = " Continue <F5>" })
        keymap.set("n", "<leader>de", "<cmd>DapStepOver<CR>", { desc = " Step over <F7>" })
        keymap.set("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = " Step into <F8>" })
        keymap.set("n", "<leader>do", "<cmd>DapStepOut<CR>", { desc = " Step out <F10>" })
        keymap.set("n", "<leader>dt", "<cmd>DapStepBack<CR>", { desc = " Step back <F12>" })
        keymap.set("n", "<leader>dp", "<cmd>DapPause<CR>", { desc = " Pause" })
        keymap.set("n", "<leader>dr", "<cmd>DapReplOpen<CR>", { desc = " Open REPL" })
        keymap.set("n", "<leader>ds", "<cmd>DapStop<CR>", { desc = " Stop <F6>" })
        keymap.set("n", "<leader>dd", "<cmd>DapDisconnect<CR>", { desc = " Disconnect" })
        ----** IDE like KeyMapping **----
        keymap.set("n", "<F5>", "<cmd>DapContinue<CR>", { desc = " Continue" })
        keymap.set("n", "<F7>", "<cmd>DapStepOver<CR>", { desc = " Step over" })
        keymap.set("n", "<F8>", "<cmd>DapStepInto<CR>", { desc = " Step into" })
        keymap.set("n", "<F10>", "<cmd>DapStepOut<CR>", { desc = " Step out" })
        keymap.set("n", "<F9>", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
        keymap.set("n", "<F12>", "<cmd>DapUIStepBack<CR>", { desc = " Step back" })
        keymap.set("n", "<F6>", "<cmd>DapStop<CR>", { desc = " Stop" })
     end,
}
