-- <leader>+m for format. for astro .prettier.json is needed in the root file.

return {
  'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile"},
    config = function ()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                    rust = { "rustfmt", lsp_format = "fallback" },
            }
        })

        vim.keymap.set({"n","v"}, "<leader>m", function ()
            conform.format({
                lsp_format = "fallback",
                async = false,
                timeout_ms = 500
            })
        end, {desc = "Format file or range (visual mode)"})
    end
}
