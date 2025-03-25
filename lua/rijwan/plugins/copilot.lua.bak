--[[
    Copilot Lua Configuration for Neovim
    ------------------------------------
    This configuration sets up the Copilot plugin for Neovim, enabling AI-powered code suggestions.
    Key bindings are defined for various actions, such as accepting suggestions, navigating suggestions, etc.
    The configuration includes settings for the suggestion panel, key mappings, file types, and more.
--]]
 
return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require('copilot').setup({
            panel = {
                enabled = true,                 -- Enable the suggestion panel
                auto_refresh = true,            -- Auto-refresh the panel
                keymap = {
                    jump_prev = "[[",           -- Key binding to jump to the previous suggestion
                    jump_next = "]]",           -- Key binding to jump to the next suggestion
                    accept = "<Tab>",          -- key binding to accept the suggestion (ctrl+enter)
                    refresh = "gr",             -- key binding to refresh the suggestions
                    open = "<M-CR>"             -- Key binding to open the suggestion panel
                },
                layout = {
                    position = "right",         -- Position of the suggestion panel (right, top, left, right, horizontal, vertical)
                    ratio = 0.4                 -- Ratio of the suggestion panel size
                },
            },
            suggestion = {
                enabled = true,                 -- Enable suggestions
                auto_trigger = true,            -- Auto-trigger suggestions
                hide_during_completion = true,  -- Hide suggestions during completion
                debounce = 100,                  -- Debounce time for suggestions
                keymap = {
                    accept = "<Tab>",          -- Key binding to accept the suggestion (Ctrl+Enter)
                    accept_word = false,        -- Disable key binding to accept the current word
                    accept_line = false,        -- Disable key binding to accept the current line
                    next = "<M-]>",             -- Key binding to navigate to the next suggestion
                    prev = "<M-[>",             -- Key binding to navigate to the previous suggestion
                    dismiss = "<C-]>",          -- Key binding to dismiss the suggestion
                },
            },
            filetypes = {
                yaml = false,                   -- Disable suggestions for YAML files
                markdown = false,               -- Disable suggestions for Markdown files
                help = false,                   -- Disable suggestions for help files
                gitcommit = false,              -- Disable suggestions for Git commit messages
                gitrebase = false,              -- Disable suggestions for Git rebase messages
                hgcommit = false,               -- Disable suggestions for Mercurial commit messages
                svn = false,                    -- Disable suggestions for SVN files
                cvs = false,                    -- Disable suggestions for CVS files
                ["."] = false,                  -- Disable suggestions for hidden files
            },
            copilot_node_command = 'node',      -- Node.js version must be > 18.x
            server_opts_overrides = {},         -- Override options for the Copilot server
        })
    end,
}
