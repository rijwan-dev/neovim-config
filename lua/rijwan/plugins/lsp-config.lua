-- This configuration sets up the 'nvim-lspconfig' plugin for Neovim.
-- It configures language servers for code completion, linting and enhanced coding experiences.

return {
    "neovim/nvim-lspconfig",
    Event = "lazy",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        -- Define capabilities and on_attach function
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local on_attach = function(client, bufnr)
            -- Example keybinding for completion
            local opts = { noremap=true, silent=true }
            vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-Space>', '<C-x><C-o>', opts) -- Trigger completion
            -- You can add more keybindings or settings here
        end

        local lsp_flags = {
            debounce_text_changes = 150,
        }

        -- Setup pyright for Python
        require'lspconfig'.pyright.setup{
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags,
        }

        -- Setup clangd for C/C++
        require'lspconfig'.clangd.setup{
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "h", "c", "cpp", "cc", "objc", "hpp", "objcpp", "CMakeLists.txt" },
            flags = lsp_flags,
            cmd = { "clangd", "--background-index", "--compile-commands-dir=./build" },
            single_file_support = true,
            root_dir = require'lspconfig'.util.root_pattern(
                '.clangd',
                '.clang-tidy',
                '.clang-format',
                'compile_commands.json',
                'compile_flags.txt',
                'configure.ac',
                '.git'
            )
        }

        -- Setup lua_ls for lua
        require'lspconfig'.lua_ls.setup{
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "lua" },
            flags = lsp_flags,
            single_file_support = true,
        }

        require'lspconfig'.cmake.setup{
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "cmake", },
            flags = lsp_flags,
            single_file_support = true,
            cmd = { "neocmakelsp", "stdio" },
        }


    end,
}

