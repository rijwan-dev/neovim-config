-- This configuration sets up the 'hlsearch.nvim' plugin for Neovim.
-- It enhances search highlighting within buffers.

return {
    "nvimdev/hlsearch.nvim", 
    event = 'BufRead', 

    config = function()
        require('hlsearch').setup()
    end,
}

