-- This configuration sets up the 'toggleterm.nvim' plugin for Neovim.
-- It helps manage multiple terminal sessions within Neovim.

return {
    "akinsho/toggleterm.nvim",

    config = function()
        -- Import toggleterm plugin safely
        local status, toggleterm = pcall(require, "toggleterm")
        if not status then
            return
        end

        toggleterm.setup({
            open_mapping = [[<c-\>]],  -- Key mapping to open the terminal
            hide_numbers = true,  -- Hide line numbers in terminal buffers
            winbar = {
                enabled = false,
                name_formatter = function(term)  -- Name formatter for terminals
                    return term.name
                end
            },

            --* direction = "float",  -- Useful option for floating terminal
            --* size = 20,  -- Useful option to set terminal size
        })

        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "jk", "<cmd>ToggleTerm<CR>", { desc = "Exit insert mode with jk" })
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        end

        -- If you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
}
