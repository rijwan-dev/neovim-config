-- This configuration sets up the 'tmux.nvim' plugin for Neovim.
-- It helps integrate tmux with Neovim for better terminal management.

return {
    "aserowy/tmux.nvim",

    config = function()
        -- Import tmux plugin safely
        local status, tmux = pcall(require, "tmux")
        if not status then
            return
        end

        -- This is your opts table
        tmux.setup({
            copy_sync = {
                enable = true,  -- Enables copy sync. By default, all registers are synchronized.
                ignore_buffers = { empty = false },  -- Ignore specific tmux buffers
                redirect_to_clipboard = false,  -- All yanks (and deletes) will get redirected to system clipboard by tmux
                register_offset = 0,  -- Controls where register sync starts
                sync_clipboard = true,  -- Overwrites vim.g.clipboard to redirect * and + to the system clipboard using tmux
                sync_registers = true,  -- Synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers
                sync_deletes = true,  -- Syncs deletes with tmux clipboard as well
                sync_unnamed = true,  -- Syncs the unnamed register with the first buffer entry from tmux
                --* sync_paste = true,  -- Useful option to synchronize paste actions
            },
            
            navigation = {
                cycle_navigation = true,  -- Cycles to opposite pane while navigating into the border
                enable_default_keybindings = true,  -- Enables default keybindings (C-hjkl) for normal mode
                persist_zoom = false,  -- Prevents unzoom tmux when navigating beyond vim border
            },

            resize = {
                enable_default_keybindings = true,  -- Enables default keybindings (A-hjkl) for normal mode
                resize_step_x = 1,  -- Sets resize steps for x axis
                resize_step_y = 1,  -- Sets resize steps for y axis
                --* resize_to_content = true,  -- Useful option to resize panes to their content
            }
        })
    end,
}
