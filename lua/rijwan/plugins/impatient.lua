-- This configuration sets up the 'impatient.nvim' plugin for Neovim.
-- It aims to improve startup time by caching Lua modules.

return {
    "lewis6991/impatient.nvim",

    dependencies = { "wbthomason/packer.nvim" },

    config = function()
        local impatient = require("impatient")

        --* impatient.enable_profile()  -- Enable profiling to measure startup time
    end,
}

