-- This configuration sets up the 'auto-session' plugin for Neovim.
-- It manages session saving and restoring automatically, helping you 
-- resume work in your preferred setup.

return {
    "rmagatti/auto-session",

    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = false,  -- Disable automatic restoration of last session
            auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },  -- Directories to exclude from auto sessions
            auto_save_enabled = true,
            auto_save_silent = false,
            auto_save_delay = 10  -- Save the session after 10 seconds of inactivity
            --* pre_save_cmds = { "NvimTreeClose" },  -- Close NvimTree before saving the session
            --* post_save_cmds = { "NvimTreeOpen" }  -- Re-open NvimTree after saving the session

        })

        local keymap = vim.keymap

        -- Keybindings for restoring and saving sessions
        keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })  -- Restore last workspace session for current directory
        keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })  -- Save workspace session for current working directory

    end,
}
