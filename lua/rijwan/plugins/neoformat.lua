return {
    'sbdchd/neoformat',
    opts = {},

    config = function ()

        local keymap = vim.keymap
        keymap.set("n", "<leader>cp", "<cmd>Neoformat<CR>", { desc = "Prettify"} )
        
	--vim.api.nvim_create_autocmd("BufWritePre", { command = "Neoformat",} )

    end
}
