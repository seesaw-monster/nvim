-- disable automatic formatting in text files e.g.) .md
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown" },
  callback = function()
    vim.opt_local.textwidth = 0
  end,
})

-- don't continue comment line
vim.api.nvim_command('autocmd FileType * setlocal formatoptions-=c formatoptions-=o')

vim.opt.formatoptions:remove('c')
vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')
