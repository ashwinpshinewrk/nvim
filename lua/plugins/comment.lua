-- Add comment with the command `gcc` and `gc`+ a letter for specific. like w for word etc.

return {
  "terrortylor/nvim-comment",
  lazy = false,
  config = function()
    require("nvim_comment").setup({
      comment_empty = false,
      create_mappings = true,
    })
  end,
}

