return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                style_preset = require("bufferline").style_preset.default,
                theme = "tokyonight",
                numbers = "none",
                indicator = {
                    style = 'icon',
                    icon  = '▎',
                },
                buffer_close_icon = '󰅖',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',

                separator_style = "thin",

                vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = "Next buffer" }),
                vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = "Prev buffer" }),
                vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = "Close buffer" })
            }
        })
    end
}
