-- Set tree style file manager 
vim.cmd("let g:netrw_liststyle = 1")

-- set short for vim.opt as opt
local opt = vim.opt

opt.clipboard:append("unnamedplus")     -- Use system clipboard as nvim registor
opt.virtualedit = "onemore"             -- Allow cursor go to end of line

-- show line number in the editor
opt.number = true
opt.relativenumber = false
opt.wrap = false
opt.fillchars:append({ eob = ' ' })

-- Tab and Indentations
opt.tabstop = 4         -- 4 spaces for a tab character
opt.shiftwidth = 4      -- 4 spaces for a tab
opt.expandtab = true    -- convert tab into spaces
opt.autoindent = true   -- use auto-indentation feature
opt.linespace = 0       -- disable spaces between lines
opt.backspace = "indent,eol,start"    -- Allow backspace to remove indent, end-of-line and start

-- Search setting
opt.ignorecase = true       -- Ignore case while searching
opt.smartcase = true        -- Perform case sensitive search if capital character are used

opt.signcolumn = "yes"      -- Always show a sign column to prevent shifting of text
opt.swapfile = false        -- Disable using a swap file for editing
opt.hidden = true


