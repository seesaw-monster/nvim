-- basic configuration ##################################################################
require("base")
-- plugin manager #######################################################################
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", --latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = require('plugins')

require('lazy').setup(plugins)

-- others ################################################################################
require("options")
require("autocmd")
require("keymaps")
require("colorscheme")

-- plugins ###############################################################################
-- neo-tree
-- require('neo-tree').setup({

-- })

-- disabling netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- keymap
vim.api.nvim_set_keymap('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })
