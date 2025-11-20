-- whichkey.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",  -- Load when the plugin is lazily loaded
  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = {
        spelling = { enabled = true },
      },
      win = {
        border = "single",
      },
      layout = {
        spacing = 6,
      },
    })

    -- Add keybindings here
    wk.add({
      -- fzf.lua
      { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
      { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help Tags" },

      -- lspconfig & mason
      { "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP Info" },
      { "<leader>lm", "<cmd>Mason<CR>", desc = "Mason Installer" },

      -- lazy.nvim
      { "<leader>ui", "<cmd>Lazy install<CR>", desc = "Install Plugins" },
      { "<leader>uc", "<cmd>Lazy check<CR>", desc = "Check Plugins" },
      { "<leader>uu", "<cmd>Lazy update<CR>", desc = "Update Plugins" },

      -- Nested mappings (Normal and Visual modes)
      { mode = { "n", "v" },
        { "<leader>q", "<cmd>q<CR>", desc = "Quit" },
        { "<leader>w", "<cmd>w<CR>", desc = "Save" }
      },
    })
  end,
}

