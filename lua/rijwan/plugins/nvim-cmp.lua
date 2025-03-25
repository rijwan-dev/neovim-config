
-- This configuration sets up the 'nvim-cmp' plugin for Neovim.
-- It provides a powerful completion framework with various sources and features.

return {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    },

    after = "nvim-lspconfig",

    config = function()
        local cmp = require'cmp'

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)  -- For `vsnip` users.
                    -- require('luasnip').lsp_expand(args.body)  -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body)  -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body)  -- For `ultisnips` users.
                    -- vim.snippet.expand(args.body)  -- For native Neovim snippets (Neovim v0.10+)

                    -- For `mini.snippets` users:
                    -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                    -- insert({ body = args.body })  -- Insert at cursor
                    -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                    -- require("cmp.config").set_onetime({ sources = {} })
                end,
            },
            window = {
                --* completion = cmp.config.window.bordered(),
                --* documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                ["<C-k>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,

                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },  -- For `vsnip` users.
                { name = 'buffer', keyword_length = 2 },
                { name = 'path' },
                { name = 'omni' },
                { name = 'emoji', insert = true },
                -- { name = 'luasnip' },  -- For `luasnip` users.
                -- { name = 'ultisnips' },  -- For `ultisnips` users.
                -- { name = 'snippy' },  -- For `snippy` users.
            })
        })

        -- To use git you need to install the plugin `petertriho/cmp-git` and uncomment the lines below
        -- Set configuration for specific filetype.
        --[[ cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            }, {
                { name = 'buffer' },
            })
        })
        require("cmp_git").setup() ]]--

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        -- Highlight customization
        vim.cmd([[
            highlight! link CmpItemMenu Comment
            highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
            highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
            highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
            highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
            highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
            highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
            highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
            highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
        ]])

        -- Gray highlight
        -- highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
        -- Blue highlight
        -- highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
        -- highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
        -- Light blue highlight
        -- highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
        -- highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
        -- highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
        -- Pink highlight
        -- highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
        -- highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
        -- Front highlight
        -- highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
        -- highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
        -- highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

        -- Set up lspconfig.
        --* local capabilities = require('cmp_nvim_lsp').default_capabilities()
        --* Replace <YOUR_LSP_SERVER> with each LSP server you've enabled.
        --* require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        --*     capabilities = capabilities
        --* }
    end,
}

