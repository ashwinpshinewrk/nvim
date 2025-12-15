return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find Buffers" },
  },
  config = function()
    require("fzf-lua").setup({
      winopts = {
        height = 0.85,
        width = 0.8,
        preview = { layout = "vertical" },
      },
        files = {
        file_ignore_patterns = {
            "node_modules",
                    "dist",
                    ".git",
                    "build",
                    "package-lock.json",
                    ".zig-cache",
                    "zig-out"
                },
    },
    })
  end,
}

