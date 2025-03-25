-- This configuration sets up the 'trouble.nvim' plugin for Neovim.
-- It provides a pretty list to help you solve all the trouble your code is causing.

return {
    "folke/trouble.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },

    opts = {
        focus = true,  -- Focus on the trouble window
    },

    cmd = "Trouble",

    keys = {
        { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
        { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
        { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
        { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },

        { "<leader>xx", "<cmd>Trouble<CR>", desc = "Open trouble window" },  -- Useful option to open trouble window directly
    },

    config = function ()
        require("trouble").setup()
    end,
}
