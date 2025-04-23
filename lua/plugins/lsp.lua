-- lsp.lua
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp", -- needed for autocomplete
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "pyright", "zls", "rust_analyzer", "clangd" }, -- Add more if needed
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = { "lua_ls", "ts_ls", "pyright", "zls","rust_analyzer","clangd" }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end
  end,
}

