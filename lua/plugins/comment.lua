return {
  "numToStr/Comment.nvim",
  event = "BufRead",  -- Load when a buffer is read
  config = function()
    require('Comment').setup({
      toggler = {
        line = 'gcc',  -- Toggle Comment on a Line
        block = 'gbc', -- Toggle Comment on a Block
      },
      opleader = {
        line = 'gc',   -- Toggle Comment on select Line
        block = 'gb',  -- Toggle Comment on select Block
      },
      mappings = {
        basic = true,
        extra = true,
      },
    })
  end,
}

