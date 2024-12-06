-- smooth moving
vim.api.nvim_set_keymap('n', 'gj', 'gj', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'gk', 'gk', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'gl', 'l', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'gh', 'h', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', '', { noremap = true, silent = true })

-- Uppercase conversion
vim.keymap.set("i", "<C-u>",
    function()
        local line = vim.fn.getline(".")
        local col = vim.fn.getpos(".")[3]
        local substring = line:sub(1, col - 1)
        local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
        return "<C-w>" .. result:upper()
    end,
    {expr = true}
)
