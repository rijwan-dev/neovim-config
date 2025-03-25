-- This configuration sets up the 'lspkind-nvim' plugin for Neovim.
-- It configures the display of icons and annotations in completion menus.

return {
    "onsails/lspkind-nvim",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    },
    event = "VimEnter",

    config = function()
        local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

        local lspkind = require('lspkind')
        local cmp = require("cmp")

        cmp.setup {
            formatting = {
                format = lspkind.cmp_format({
                    with_text = true,  -- Show text (labelDetails) in the completion menu
                    expandable_indicators = {
                        '⮞',  -- Show a '>' indicator when a completion item has children
                        '⮟',  -- Show a 'v' indicator when a completion item is expandable
                    },
                    mode = 'symbol',  -- Show only symbol annotations

                    maxwidth = {
                        -- Prevent the popup from showing more than provided characters
                        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                        menu = 50,  -- Leading text (labelDetails)
                        abbr = 50,  -- Actual suggestion item
                    },

                    ellipsis_char = '...',  -- Show ellipsis_char when popup menu exceeds maxwidth
                    show_labelDetails = true,  -- Show labelDetails in menu (disabled by default)

                    before = function(entry, vim_item)
                        -- Provide more controls on popup customization
                        return vim_item
                    end
                })
            }
        }

        -- setup() is also available as an alias
        require('lspkind').init({
            -- DEPRECATED (use mode instead): enables text annotations
            -- with_text = true,

            -- Defines how annotations are shown
            -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            mode = 'symbol_text',

            -- Default symbol map
            -- options: 'default', 'codicons' (requires vscode-codicons font)
            preset = 'codicons',

            -- Override preset symbols
            symbol_map = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            },
        })
    end,
}

