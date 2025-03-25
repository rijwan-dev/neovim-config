-- This configuration sets up the 'nvim-autopairs' plugin for Neovim.
-- It automatically pairs characters like brackets and quotes as you type.

return {
    "windwp/nvim-autopairs",

    config = function()
        -- Load the 'nvim-autopairs' plugin and set up its default configuration
        require("nvim-autopairs").setup {}
    end,
}
