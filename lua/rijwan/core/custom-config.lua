-- We can create custom commands and functions here

-- Define a function
local function my_custom_function()
    require("bufferline").buf_delete(vim.fn.bufnr())
end

-- Create or override the command
vim.api.nvim_create_user_command('Qa', my_custom_function, {})
