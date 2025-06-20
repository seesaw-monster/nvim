-- encoding ##############################################################################
vim.o.encoding = 'utf-8'
vim.scriptencodin = 'utf-8'

-- visual ################################################################################
-- show file name
vim.o.title = true
-- show line number
vim.o.number = true
-- hilight matching brackets
vim.o.showmatch = true
vim.cmd [[
  hi MatchParen cterm=bold ctermbg=black ctermfg=blue
]]
-- code coloring
vim.cmd('syntax on')
-- show relative line number
vim.o.relativenumber = true
-- Display Japanese in full-width
vim.o.ambiwidth = 'double'
-- tab setting
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
-- indent
vim.o.autoindent = true
vim.o.smartindent = true
vim.cmd('filetype plugin indent on')
-- backspace
vim.o.backspace = 'indent,eol,start'
-- moving between lines
vim.o.whichwrap = 'b,s,h,l,<,>,[,]'
-- cursor
-- vim.o.t_ti = vim.o.t_ti .. "\27[1 q"
-- vim.o.t_SI = vim.o.t_SI .. "\27[5 q"
-- vim.o.t_EI = vim.o.t_EI .. "\27[1 q"
-- vim.o.t_te = vim.o.t_te .. "\27[0 q"
-- escape sequence
-- vim.o.t_TI = ""
-- vim.o.t_TE = ""

-- search ################################################################################
-- vim.o.inserch = true
vim.o.wrapscan = true
-- highlight search result
vim.o.hlsearch = true
-- disable highlighting
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':nohlsearch<CR><C-l>', { noremap = true, silent = true })
-- comandline history
vim.o.history = 200

-- warning ###############################################################################
vim.o.hidden = true

-- device ################################################################################
-- mouse
-- vim.opt.mouse = ''
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
-- undo
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

-- terminal ##############################################################################
-- keymap
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-n>', { noremap = true, silent = true })
-- custom command
vim.api.nvim_create_user_command('T', function(opts)
  vim.cmd('split')
  vim.cmd('wincmd j')
  vim.cmd('resize 20')
  if opts.args == '' and vim.fn.has('win64') == 1 then
    vim.cmd('terminal "C:\\Program Files\\PowerShell\\7\\pwsh.exe"')
  else
    vim.cmd('terminal ' .. opts.args)
  end
end, { nargs = '*' })
-- auto insert mode
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert'
})
