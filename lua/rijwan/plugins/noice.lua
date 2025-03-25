-- This configuration sets up the 'noice.nvim' plugin for Neovim.
-- It enhances Neovim's UI with improved cmdline, messages, popupmenu, and more.

return {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {
        -- Ensure to add proper `module="..."` entries if you lazy-load any plugin below
        "MunifTanjim/nui.nvim",
        -- Optional: 'nvim-notify' is needed if you want to use the notification view
        "rcarriga/nvim-notify",
    },

    opts = {
        -- Add any options here
    },

    config = function()
        local noice = require("noice")
        noice.setup{
            cmdline = {
                enabled = true,  -- Enables the Noice cmdline UI
                view = "cmdline_popup",  -- View for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                opts = {},  -- Global options for the cmdline. See section on views
                ---@type table<string, CmdlineFormat>
                format = {
                    -- Conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                    -- View: (default is cmdline view)
                    -- Opts: any options passed to the view
                    -- Icon_hl_group: optional hl_group for the icon
                    -- Title: set to anything or empty string to hide
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "🕮 "},
                    input = { view = "cmdline_input", icon = "󰥻 " },  -- Used by input()
                    -- lua = false, -- To disable a format, set to `false`
                },
            },
            messages = {
                -- NOTE: If you enable messages, then the cmdline is enabled automatically.
                -- This is a current Neovim limitation.
                enabled = true,  -- Enables the Noice messages UI
                view = "notify",  -- Default view for messages
                view_error = "notify",  -- View for errors
                view_warn = "notify",  -- View for warnings
                view_history = "messages",  -- View for :messages
                view_search = "virtualtext",  -- View for search count messages. Set to `false` to disable
            },
            popupmenu = {
                enabled = true,  -- Enables the Noice popupmenu UI
                ---@type 'nui'|'cmp'
                backend = "nui",  -- Backend to use to show regular cmdline completions
                ---@type NoicePopupmenuItemKind|false
                -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
                kind_icons = {},  -- Set to `false` to disable icons
            },
            -- Default options for require('noice').redirect
            -- See the section on Command Redirection
            ---@type NoiceRouteConfig
            redirect = {
                view = "popup",
                filter = { event = "msg_show" },
            },
            -- You can add any custom commands below that will be available with `:Noice command`
            ---@type table<string, NoiceCommand>
            commands = {
                history = {
                    -- Options for the message history that you get with `:Noice`
                    view = "split",
                    opts = { enter = true, format = "details" },
                    filter = {
                        any = {
                            { event = "notify" },
                            { error = true },
                            { warning = true },
                            { event = "msg_show", kind = { "" } },
                            { event = "lsp", kind = "message" },
                        },
                    },
                },
                -- :Noice last
                last = {
                    view = "popup",
                    opts = { enter = true, format = "details" },
                    filter = {
                        any = {
                            { event = "notify" },
                            { error = true },
                            { warning = true },
                            { event = "msg_show", kind = { "" } },
                            { event = "lsp", kind = "message" },
                        },
                    },
                    filter_opts = { count = 1 },
                },
                -- :Noice errors
                errors = {
                    -- Options for the message history that you get with `:Noice`
                    view = "popup",
                    opts = { enter = true, format = "details" },
                    filter = { error = true },
                    filter_opts = { reverse = true },
                },
                all = {
                    -- Options for the message history that you get with `:Noice`
                    view = "split",
                    opts = { enter = true, format = "details" },
                    filter = {},
                },
            },
            notify = {
                -- Noice can be used as `vim.notify` so you can route any notification like other messages
                -- Notification messages have their level and other properties set.
                -- Event is always "notify" and kind can be any log level as a string
                -- The default routes will forward notifications to nvim-notify
                -- Benefit of using Noice for this is the routing and consistent history view
                enabled = true,
                view = "notify",
            },
            lsp = {
                progress = {
                    enabled = true,
                    -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                    -- See the section on formatting for more details on how to customize.
                    --- @type NoiceFormat|string
                    format = "lsp_progress",
                    --- @type NoiceFormat|string
                    format_done = "lsp_progress_done",
                    throttle = 1000 / 30,  -- Frequency to update lsp progress message
                    view = "mini",
                },
                override = {
                    -- Override the default lsp markdown formatter with Noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    -- Override the lsp markdown formatter with Noice
                    ["vim.lsp.util.stylize_markdown"] = false,
                    -- Override cmp documentation with Noice (needs the other options to work)
                    ["cmp.entry.get_documentation"] = false,
                },
                hover = {
                    enabled = true,
                    silent = false,  -- Set to true to not show a message if hover is not available
                    view = nil,  -- When nil, use defaults from documentation
                    ---@type NoiceViewOptions
                    opts = {},  -- Merged with defaults from documentation
                },
                signature = {
                    enabled = true,
                    auto_open = {
                        enabled = true,
                        trigger = true,  -- Automatically show signature help when typing a trigger character from the LSP
                        luasnip = true,  -- Will open signature help when jumping to Luasnip insert nodes
                        throttle = 50,  -- Debounce lsp signature help request by 50ms
                    },
                    view = nil,  -- When nil, use defaults from documentation
                    ---@type NoiceViewOptions
                    opts = {},  -- Merged with defaults from documentation
                },
                message = {
                    -- Messages shown by lsp servers
                    enabled = true,
                    view = "notify",
                    opts = {},
                },
                -- Defaults for hover and signature help
                documentation = {
                    view = "hover",
                    ---@type NoiceViewOptions
                    opts = {
                        lang = "markdown",
                        replace = true,
                        render = "plain",
                        format = { "{message}" },
                        win_options = { concealcursor = "n", conceallevel = 3 },
                    },
                },
            },
            markdown = {
                hover = {
                    ["|(%S-)|"] = vim.cmd.help,  -- Vim help links
                    ["%[.-%]%((%S-)%)"] = require("noice.util").open,  -- Markdown links
                },
                highlights = {
                    ["|%S-|"] = "@text.reference",
                    ["@%S+"] = "@parameter",
                    ["^%s*(Parameters:)"] = "@text.title",
                    ["^%s*(Return:)"] = "@text.title",
                    ["^%s*(See also:)"] = "@text.title",
                    ["{%S-}"] = "@parameter",
                },
            },
            health = {
                checker = true,  -- Disable if you don't want health checks to run
            },
            ---@type NoicePresets
            presets = {
                -- You can enable a preset by setting it to true, or a table that will override the preset config
                -- You can also add custom presets that you can enable/disable with enabled=true
                bottom_search = false,  -- Use a classic bottom cmdline for search
                command_palette = false,  -- Position the cmdline and popupmenu together
                long_message_to_split = false,  -- Long messages will be sent to a split
                inc_rename = false,  -- Enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,  -- Add a border to hover docs and signature help
            },
            
            throttle = 1000 / 30,  -- How frequently does Noice need to check for UI updates? This has no effect when in blocking mode.
            ---@type NoiceConfigViews
            views = {},  ---@see section on views
            ---@type NoiceRouteConfig[]
            routes = {},  ---@see section on routes
            ---@type table<string, NoiceFilter>
            status = {},  ---@see section on statusline components
            ---@type NoiceFormatOptions
            format = {},  ---@see section on formatting
        }
    end,
}
