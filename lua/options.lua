-- paste mode in using clipboard
-- if vim.o.term:find("xterm") then
--   vim.o.t_SI = vim.o.t_SI .. "\27[?2004h"
--   vim.o.t_EI = vim.o.t_EI .. "\27[?2004l"
--   vim.o.pastetoggle = "\27[201~"

--   function XTermPasteBegin(ret)
--     vim.o.paste = true
--     return ret
--   end

--   vim.api.nvim_set_keymap('i', '<Esc>[200~', 'v:lua.XTermPasteBegin("")', { noremap = true, expr = true, silent = true })
-- end

-- clipboard on WSL
-- if vim.fn.has('wsl') == 1 then
--   vim.opt.clipboard = 'unnamed'

--   vim.g.clipboard = {
--     name = 'WslClipboard',
--     copy = {
--       ['+'] = 'win32yank.exe -i --crlf',
--       ['*'] = 'win32yank.exe -i --crlf',
--     },
--     cache_enabled = 0,
--   }
-- end
