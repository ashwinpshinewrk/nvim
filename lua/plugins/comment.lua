return {
  "numToStr/Comment.nvim",
  event = "BufRead",
  config = function()
    local comment = require("Comment")

    comment.setup({
      mappings = {
        basic = false,
        extra = false,
      },
    })

 --Toggle Comment mapped to <leader>/
    vim.keymap.set("x", "<leader>/", function()
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { noremap = true, silent = true, desc = "Toggle comment in visual mode" })
  end,
}
