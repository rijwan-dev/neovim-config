-- This configuration sets up the 'indent-blankline.nvim' plugin for Neovim.
-- It provides an indentation guide with vertical lines.

return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",

    opts = {
        indent = { char = "┊"   },  -- ┊┊│┆Character used for indentation guide
    },
}
