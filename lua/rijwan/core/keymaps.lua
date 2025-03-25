-- NOTE: Don't put any keymaps related to plugins here. They should be in plugin config files.
-- This file is only for keymaps that are not related to any plugin.
-- This file is only for nvim keymaps and custom command or functions.

vim.g.mapleader = " " -- set space as map leader so all keymaps are followed by space-key
vim.g.maplocalleader = "\\"

local keymap = vim.keymap -- give short name for vim.keymap

-- Basic Editor Keys
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "<C-s>", "<cmd>w<CR><EsC>", { desc = "Save current file" })
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current file" })

keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

