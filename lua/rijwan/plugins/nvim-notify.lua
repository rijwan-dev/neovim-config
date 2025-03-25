-- This configuration sets up the 'nvim-notify' plugin for Neovim.
-- It enhances the notification system within Neovim.

return {
    "rcarriga/nvim-notify",
    event = "BufEnter",

    config = function()
        -- Defer the setup of 'nvim-notify' to ensure it loads properly
        vim.defer_fn(
            function()
                local nvim_notify = require("notify")
                nvim_notify.setup {
                    stages = "fade_in_slide_out",  -- Animation style for notifications
                    timeout = 1000,  -- Default timeout for notifications
                    background_colour = "#2E3440",  -- Background color for notifications

                    --* max_width = 50,  -- Useful option to set max width of notifications
                    --* top_down = false,  -- Useful option to reverse the order of notifications
                }
                vim.notify = nvim_notify  -- Set 'nvim-notify' as the notification handler
            end,
            2000  -- Delay time in milliseconds before the function is executed
        )
    end,
}

