-- This configuration sets up the 'lualine.nvim' plugin for Neovim.
-- It provides a blazing fast and easy-to-configure statusline written in Lua.

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        -- Import lualine plugin safely
        local status, lualine = pcall(require, "lualine")
        if not status then
            return
        end

        -- Function to check if a macro is being recorded
        local function macro_status()
            return vim.fn.reg_recording() ~= '' and 'Recording Macro' or ''
        end

        -- Get lualine nightfly theme
        local lualine_nightfly = require("lualine.themes.papercolor_dark")


        -- New colors for theme
        local new_colors = {
            blue = "#0000ff",
            green = "#3EFFDC",
            violet = "#FF61EF",
            yellow = "#FFDA7B",
            black = "#000000",
        }

        -- Change nightfly theme colors
        lualine_nightfly.normal.a.bg = new_colors.blue
        lualine_nightfly.insert.a.bg = new_colors.green
        lualine_nightfly.visual.a.bg = new_colors.violet
        lualine_nightfly.command = {
            a = {
                gui = "bold",
                bg = new_colors.yellow,
                fg = new_colors.black,  -- black
            },
        }

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = 'tokyonight',
                component_separators = { left = ' ', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename', macro_status}, -- add macro status to this section
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}

