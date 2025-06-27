local M = {}

function M.toggle()
    if vim.bo.filetype == "netrw" then
        vim.cmd("bd!")
    else
        vim.cmd("Explore")
    end
end

function M.setup()
    vim.keymap.set(
        "n",
        "<leader>e",
        M.toggle,
        {desc = "Toggle File Explorer"}
    )
end

return M
