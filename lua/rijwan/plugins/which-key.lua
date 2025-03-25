-- This configuration sets up the 'which-key.nvim' plugin for Neovim.
-- It provides a popup displaying available keybindings.

return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,

    opts = {
        -- Your configuration comes here
        -- Or leave it empty to use the default settings
        -- Refer to the configuration section below

        plugins = { marks = true, registers = true },  -- Useful option to enable marks and registers
        --* window = { border = "single" },  -- Useful option to set border style of the popup window
    },
}
