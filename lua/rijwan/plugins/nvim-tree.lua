-- This configuration sets up the 'nvim-tree.lua' plugin for Neovim.
-- It provides a file explorer for easier navigation and file management.

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        -- Options required for Tree-sitter
        vim.g.loaded_netrw = 1  -- Disable netrw (neovim default file explorer)
        vim.g.loaded_netrwPlugin = 1  -- Disable netrw plugin
        vim.opt.termguicolors = true  -- Enable 24bit color support

        local nvimtree = require("nvim-tree")
        nvimtree.setup {

            view = {
                width = 30,  -- Set default width to 30 characters
            },

            git = { ignore = false },  -- Don't ignore git files
            actions = {
                open_file = {
                    window_picker = { enable = false },  -- Disable window picker
                },
            },

            filters = {
                custom = { ".DS_Store" },  -- Add filters to hide unwanted files
                dotfiles = true,  -- Don't show hidden files
            },

            disable_netrw = true,  -- Disable default file explorer
            hijack_cursor = true,  -- Don't allow cursor left/right movement
            sync_root_with_cwd = true,  -- Change root directory when changing working directory
            update_focused_file = { enable = true, update_root = false },

            -- Change Folder Icons
            renderer = {
                icons = {
                    glyphs = {
                        default = "󰈚",
                        folder = {
                            default = "",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                        },
                    },
                },
                indent_markers = { enable = true },  -- Show indentation marks
                root_folder_label = false,  -- Disable showing root folder name on title
                highlight_git = true,  -- Highlight git files

                --* special_files = { "README.md", "Makefile", "CONFIG" },  -- Useful option to highlight special files
            },
        }
        -- NvimTree Kemaps
        vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree-Sitter file explorer" })
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
        vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
        vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

    end,
}
