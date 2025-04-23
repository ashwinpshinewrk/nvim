return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "HiPhish/nvim-ts-rainbow2",
      config = function()
        --Rainbow brackets config
        require("nvim-treesitter.configs").setup({
          rainbow = {
            enable = true,
            query = "rainbow-parens",
            strategy = require("ts-rainbow.strategy.global"),
          },
        })
      end,
    },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "javascript", "typescript", "python",
        "html", "css", "json", "bash", "markdown", "c", "cpp", "rust", "zig"
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<TAB>",
          node_decremental = "<BS>",
        },
      },
    })
  end,
}

