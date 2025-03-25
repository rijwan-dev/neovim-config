-- This configuration sets up the 'lspsaga.nvim' plugin for Neovim.
-- It enhances the Neovim LSP experience with additional features and UI elements.

return {
    "nvimdev/lspsaga.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    after = "nvim-lspconfig",

    config = function()
        -- Import lspsaga safely
        local saga_status, saga = pcall(require, "lspsaga")
        if not saga_status then
            return
        end

        saga.setup({
            show_outline = {
                win_position = 'right',
                -- Set special filetype win that outline window split, like NvimTree or neotree
                -- defx, db_ui
                win_with = 'NvimTree',
                win_width = 50,
                auto_enter = false,
                auto_preview = true,
                virt_text = ' ',
                jump_key = 'o',
                -- Auto refresh when change buffer
                auto_refresh = true,
            },
        })

        ---** Keybindings **---
        local keymap = vim.keymap

        keymap.set("n", "<leader>co", "<cmd>Lspsaga outline<CR>", { desc = "Toggle symbol outline" })
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Show code actions" })
        keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" })
        keymap.set("n", "<leader>cR", "<cmd>Lspsaga project_replace<CR>", { desc = "Project replace" })
        keymap.set("n", "<leader>ch", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show hover documentation" })
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show hover documentation" })
        keymap.set("n", "<leader>cg", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
        keymap.set("n", "<leader>cf", "<cmd>Lspsaga finder<CR>", { desc = "Show LSP finder" })
        keymap.set("n", "<leader>ci", "<cmd>Lspsaga peek_definition<CR>", { desc = "Preview definition" })
        keymap.set("n", "P", "<cmd>Lspsaga peek_definition<CR>", { desc = "Preview definition" })

        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump to previous diagnostic" })
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump to next diagnostic" })
        keymap.set("n", "<leader>cl", "<cmd>Lspsaga term_toggle<CR>", { desc = "Open LSP terminal" })

        -- Commented as alternative plugin `trouble.nvim` is used for this purpose
        -- keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show line diagnostics" })
        -- keymap.set("n", "<leader>cc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Show cursor diagnostics" })

    end,
}

