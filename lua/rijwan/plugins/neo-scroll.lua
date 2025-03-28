-- This configuration sets up the 'neoscroll.nvim' plugin for Neovim.
-- It helps achieve smoother and faster scrolling.

return {
    "karb94/neoscroll.nvim",

    dependencies = { "szw/vim-maximizer" },

    config = function()
        require('neoscroll').setup({
            -- All these keys will be mapped to their corresponding default scrolling animation
            mappings = {
                -- '<C-u>',
                -- '<C-d>',
                -- '<C-b>',
                -- '<C-f>',
                -- '<C-y>',
                -- '<C-e>',
                -- 'zt', 
                -- 'zz', 
                -- 'zb'
            },

            hide_cursor = true,  -- Hide cursor while scrolling
            stop_eof = true,  -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,  -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = false,  -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil,  -- Default easing function
            pre_hook = nil,  -- Function to run before the scrolling animation starts
            post_hook = nil,  -- Function to run after the scrolling animation ends
            performance_mode = false,  -- Disable "Performance Mode" on all buffers

            --* easing_function = "quadratic",  -- Useful option to change the easing function
        })
    end,
}
