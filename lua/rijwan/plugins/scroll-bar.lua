-- This configuration sets up the 'nvim-scrollbar' plugin for Neovim.
-- It provides a customizable scrollbar for better navigation.

return {
    "petertriho/nvim-scrollbar",

    config = function()
        local colors = require("tokyonight.colors").setup()

        require("scrollbar").setup({
            handle = {
                color = colors.bg_highlight,  -- Set the scrollbar handle color
            },
            marks = {
                Search = { color = colors.orange },  -- Color for search highlights
                Error = { color = colors.error },  -- Color for error highlights
                Warn = { color = colors.warning },  -- Color for warning highlights
                Info = { color = colors.info },  -- Color for info highlights
                Hint = { color = colors.hint },  -- Color for hint highlights
                Misc = { color = colors.purple },  -- Color for miscellaneous highlights

                --* Text = { color = colors.fg },  -- Useful option for text highlights
            },
        })
    end,
}

