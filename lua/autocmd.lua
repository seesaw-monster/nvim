-- disable automatic formatting in text files e.g.) .md
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown" },
  callback = function()
    vim.opt_local.textwidth = 0
  end,
})
