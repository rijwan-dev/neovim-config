--This configuration sets up the 'nvim-colorizer.lua' plugin for Neovim.
-- It provides color highlighting for various color codes.

return {
    "norcalli/nvim-colorizer.lua",

    config = function()
        require("colorizer").setup()
        
    end,
}

