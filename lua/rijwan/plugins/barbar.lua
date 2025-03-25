-- A Neovim plugin for managing buffers with a customizable buffer line.
-- This configuration includes options for animations, icons, and key mappings.

return {
    "romgrk/barbar.nvim",

    dependencies = {
        "lewis6991/gitsigns.nvim", -- Optional: for git statusline
        "nvim-tree/nvim-web-devicons", -- Optional: for file icons
    },

    init = function()
        vim.g.barbar_auto_setup = false -- Disable automatic setup
    end,

    opts = {
        animation = true, -- Enable animations
        insert_at_start = true, -- Insert new buffers at the start
    },

    config = function()
        vim.g.barbar_auto_setup = false -- Disable auto-setup

        require 'barbar'.setup {
            animation = true, -- Enable/disable animations
            auto_hide = false, -- Automatically hide the tabline based on buffer count
            tabpages = true, -- Show current/total tabpages indicator
            clickable = true, -- Enable clickable tabs
            exclude_ft = { 'javascript' }, -- Exclude specific file types from the tabline
            exclude_name = { 'package.json' }, -- Exclude specific buffer names from the tabline
            focus_on_close = 'left', -- Focus on the left buffer when closing
            hide = { extensions = false, inactive = false }, -- Hide inactive buffers and file extensions
            highlight_alternate = false, -- Highlight alternate buffers
            highlight_current = true, -- Highlight current buffer
            highlight_inactive_file_icons = true, -- Highlight file icons in inactive buffers
            highlight_visible = true, -- Highlight visible buffers
            underline_active_file = true, -- Underline the active file

            icons = {
                buffer_index = "superscript", -- Display buffer index as superscript
                buffer_number = false, -- Do not display buffer number
                button = '', -- Button icon for buffer actions
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
                    [vim.diagnostic.severity.WARN] = { enabled = true, icon = ' ' },
                    [vim.diagnostic.severity.INFO] = { enabled = false, icon = ' ' },
                    [vim.diagnostic.severity.HINT] = { enabled = true, icon = '󰌶 ' },
                },
                gitsigns = {
                    added = { enabled = true, icon = '+' },
                    changed = { enabled = true, icon = '~' },
                    deleted = { enabled = true, icon = '-' },
                },
                filetype = {
                    custom_colors = true, -- Use default colors for filetype icons
                    enabled = true, -- Enable filetype icons
                },
                separator = { left = ' ', right = ' ' }, -- Separator icons
                separator_at_end = true, -- Add separator at the end of the buffer list
                modified = { button = '●' }, -- Icon for modified buffers
                pinned = { button = ' ', filename = true }, -- Icon for pinned buffers
                preset = 'default', -- Preconfigured buffer appearance
                alternate = { filetype = { enabled = false } }, -- Alternate buffer settings
                current = { buffer_index = true }, -- Current buffer settings
                inactive = { button = '×' }, -- Icon for inactive buffers
                visible = { modified = { buffer_number = false } }, -- Visible buffer settings
            },

            insert_at_end = true, -- Insert new buffers at the end
            insert_at_start = false, -- Insert new buffers at the start
            maximum_padding = 1, -- Maximum padding width around each tab
            minimum_padding = 2, -- Minimum padding width around each tab
            maximum_length = 30, -- Maximum buffer name length
            minimum_length = 10, -- Minimum buffer name length
            semantic_letters = true, -- Assign letters for buffer-pick mode based on name
            sidebar_filetypes = {
                NvimTree = {
                    event = 'BufWinLeave', -- Event for NvimTree sidebar
                    text = 'File Explorer', -- Text for NvimTree
                    align = 'center', -- Alignment for NvimTree
                },
                sagaoutline = {
                    event = 'BufWinLeave',
                    text = 'Symbol Outline',
                    align = 'center'
                },
                undotree = {
                    text = 'undotree', -- Text for undotree
                    align = 'center', -- Alignment for undotree
                },
                ['neo-tree'] = { event = 'BufWipeout' }, -- Event for neo-tree
                Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' }, -- Outline settings
            },

            letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP', -- Order for buffer letters in buffer-pick mode
            no_name_title = "New File", -- Title for unnamed buffers

            sort = {
                ignore_case = true, -- Ignore case differences while sorting buffers
            },
        }
        
        local theme = 'tokyonight'
        -- Key mappings for buffer management
        local keymap = vim.keymap
        keymap.set("n", "<leader> ", "<cmd>BufferNext<CR>", { desc = "Next file in buffer" })
        keymap.set("n", "<C-x>", "<cmd>BufferClose<CR>", { desc = "Close active file in buffer" })
        keymap.set("n", "<C-q>", "<cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all files in buffer except active" })
        keymap.set("n", "<C-p>", "<cmd>BufferPin<CR>", { desc = "Pin the current buffer" })
        keymap.set("n", "<A-Left>", "<cmd>BufferPrevious<CR>", { desc = "Previous file in buffer" })
        keymap.set("n", "<A-Right>", "<cmd>BufferNext<CR>", { desc = "Next file in buffer" })

        for i = 1, 9 do
            keymap.set("n", "<C-" .. i .. ">", "<cmd>BufferGoto " .. i .. "<CR>", { desc = "Go to buffer " .. i })
        end
    end,
}
