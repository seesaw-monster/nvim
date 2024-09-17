-- Ctrl+nでファイルツリーを表示/非表示する
vim.api.nvim_set_keymap('n', '<C-n>', ':Fern . -reveal=% -drawer -toggle -width=30<CR>', { noremap = true, silent = true })
