return {
    "Civitasv/cmake-tools.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/overseer.nvim",
        "akinsho/toggleterm.nvim",
    },
    config = function()
        local osys = require("cmake-tools.osys")

        require("cmake-tools").setup {
            cmake_command = "cmake", -- specify cmake command path
            ctest_command = "ctest", -- specify ctest command path
            cmake_use_preset = true,
            cmake_regenerate_on_save = true, -- auto generate when saving CMakeLists.txt
            cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- passed when invoking `CMakeGenerate`
            cmake_build_options = {}, -- passed when invoking `CMakeBuild`

            cmake_build_directory = function()
                if osys.iswin32 then
                    return "out\\${variant:buildType}"
                end
                return "out/${variant:buildType}"
            end, -- specify generate directory for cmake

            cmake_soft_link_compile_commands = true, -- auto-create soft link from compile commands file to project root
            cmake_compile_commands_from_lsp = false, -- auto set compile commands file location using lsp
            cmake_kits_path = nil, -- specify global cmake kits path

            cmake_variants_message = {
                short = { show = true }, -- show short message
                long = { show = true, max_length = 40 }, -- show long message
            },

            cmake_dap_configuration = { -- debug settings for cmake
                name = "cpp",
                type = "codelldb",
                request = "launch",
                stopOnEntry = false,
                runInTerminal = true,
                console = "integratedTerminal",
            },

            cmake_executor = { -- executor to use
                name = "quickfix", -- executor name
                opts = {},
                default_opts = {
                    quickfix = {
                        show = "always", -- options: "always", "only_on_error"
                        position = "belowright", -- position for quickfix
                        size = 10,
                        encoding = "utf-8",
                        auto_close_when_success = true, -- auto-close quickfix buffer on success
                    },
                    toggleterm = {
                        direction = "float",
                        close_on_exit = false,
                        auto_scroll = true,
                        singleton = true,
                    },
                    overseer = {
                        new_task_opts = {
                            strategy = {
                                "toggleterm",
                                direction = "horizontal",
                                auto_scroll = true,
                                quit_on_exit = "success",
                            },
                        },
                        on_new_task = function(task)
                            require("overseer").open({ enter = false, direction = "right" })
                        end,
                    },
                    terminal = {
                        name = "Main Terminal",
                        prefix_name = "[CMakeTools]: ",
                        split_direction = "horizontal",
                        split_size = 11,
                        single_terminal_per_instance = true,
                        single_terminal_per_tab = true,
                        keep_terminal_static_location = true,
                        auto_resize = true,
                        start_insert = false,
                        focus = false,
                        do_not_add_newline = false,
                    },
                },
            },

            cmake_runner = { -- runner to use
                name = "terminal", -- runner name
                opts = {},
                default_opts = {
                    quickfix = {
                        show = "always",
                        position = "belowright",
                        size = 10,
                        encoding = "utf-8",
                        auto_close_when_success = true,
                    },
                    toggleterm = {
                        direction = "float",
                        close_on_exit = false,
                        auto_scroll = true,
                        singleton = true,
                    },
                    overseer = {
                        new_task_opts = {
                            strategy = {
                                "toggleterm",
                                direction = "horizontal",
                                auto_scroll = true,
                                quit_on_exit = "success",
                            },
                        },
                        on_new_task = function(task)
                        end,
                    },
                    terminal = {
                        name = "Main Terminal",
                        prefix_name = "[CMakeTools]: ",
                        split_direction = "horizontal",
                        split_size = 11,
                        single_terminal_per_instance = true,
                        single_terminal_per_tab = true,
                        keep_terminal_static_location = true,
                        auto_resize = true,
                        start_insert = false,
                        focus = false,
                        do_not_add_newline = false,
                    },
                },
            },

            cmake_notifications = {
                runner = { enabled = true },
                executor = { enabled = true },
                spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                refresh_rate_ms = 100,
            },

            cmake_virtual_text_support = true, -- show file-related targets using virtual text
        }
    end,
}

