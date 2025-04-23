local custom_footer = {
  [[]],
  [[]],
  'https://github.com/ashwinpshinewrk/nvim'
}

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local db = require("dashboard")

    db.setup({
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
            footer = custom_footer,
        shortcut = {
	{ desc = '[  Github]', group = 'DashboardShortCut' },
        { desc = '[  ashwinpshinewrk]', group = 'DashboardShortCut' },
        { desc = '[  1.0.0]', group = 'DashboardShortCut' },
        },
      },
    })
  end,
}

