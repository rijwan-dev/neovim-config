-- This configuration sets up the 'tokyonight.nvim' plugin for Neovim.
-- It provides a beautiful color scheme with customizable options.

return {
    "folke/tokyonight.nvim",
    priority = 1000,

    config = function()
        local transparent = false  -- set to true if you would like to enable transparency

        
local bg = "#000000"
local bg_dark = "#000000"
local bg_highlight = "#0a1e2e"
local bg_search = "#05355a"
local bg_visual = "#1a2f45"
local fg = "#a9bcc8"
local fg_dark = "#8fa6b6"
local fg_gutter = "#4b657a"
local border = "#3a5870"

        require("tokyonight").setup({
            style = "night",
            transparent = transparent,
            styles = {
                sidebars = transparent and "transparent" or "dark",
                floats = transparent and "transparent" or "dark",
            },
            on_colors = function(colors)
                colors.bg = bg
                colors.bg_dark = transparent and colors.none or bg_dark
                colors.bg_float = transparent and colors.none or bg_dark
                colors.bg_highlight = bg_highlight
                colors.bg_popup = bg_dark
                colors.bg_search = bg_search
                colors.bg_sidebar = transparent and colors.none or bg_dark
                colors.bg_statusline = transparent and colors.none or bg_dark
                colors.bg_visual = bg_visual
                colors.border = border
                colors.fg = fg
                colors.fg_dark = fg_dark
                colors.fg_float = fg
                colors.fg_gutter = fg_gutter
                colors.fg_sidebar = fg_dark
                colors.comment = "#0000ff"  -- Useful option to change comment color
            end,
        })

        -- Load color scheme for Neovim
        vim.cmd("colorscheme tokyonight")
    end,
}
