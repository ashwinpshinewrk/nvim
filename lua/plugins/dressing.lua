return {
"stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
        require("dressing").setup({
            input = {
                enabled = true,
                default_prompt = "Input:",
                insert_only = false,
                start_in_insert = true,
                mapping = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm"
                    },
                    i = {
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext"
                    }
                },
            },
            select = {
                enabled = true,
                backend = {"telescope","builtin"},
                trim_prompt = true,
            }
        })
    end
}
