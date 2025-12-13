-- lsp.lua
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "hrsh7th/cmp-nvim-lsp", -- needed for autocomplete
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls", "pyright", "zls", "rust_analyzer", "clangd", "svelte", "tailwindcss", "gopls", "jdtls" }, -- Add more if needed
            automatic_installation = true,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "E",
                    [vim.diagnostic.severity.WARN] = "W",
                    [vim.diagnostic.severity.HINT] = "H",
                    [vim.diagnostic.severity.INFO] = "INFO",
                },
                linehl = { [vim.diagnostic.severity.ERROR] = 'ErrorMsg', },
                numhl = { [vim.diagnostic.severity.WARN] = 'WarningMsg', },
            },
        })

        vim.o.updatetime = 250
        vim.cmd([[
     autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })
   ]])

        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                }
            }
        })

        -- Custom targets
        vim.lsp.config('svelte', {

            capabilities = capabilities,
            filetypes = { "svelte" },
            root_dir = require("lspconfig").util.root_pattern("package.json", "svelte.config.js", ".git")
        })

        vim.lsp.config('tailwindcss', {
            capabilities = capabilities,
            filetypes = { "html", "css", "javascript", "typescript", "svelte" },
            root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "package.json")
        })
        vim.lsp.config('zls', {
            capabilities = capabilities,
            filetypes = { "zig" }
        })
    end
}
