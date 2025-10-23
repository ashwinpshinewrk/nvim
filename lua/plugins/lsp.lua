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
            ensure_installed = { "lua_ls", "ts_ls", "pyright", "zls", "rust_analyzer", "clangd", "svelte", "tailwindcss", "gopls" }, -- Add more if needed
            automatic_installation = true,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
        })

        vim.o.updatetime = 250
        vim.cmd([[
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })
    ]])

        vim.lsp.config('*', {
            capabilities = capabilities,
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
    end
}
