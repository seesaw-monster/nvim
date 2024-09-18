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

-- plugin setting ########################################################################
require("lsp")
require("filer")

-- others ################################################################################
require("options")
require("autocmd")
require("keymaps")
require("colorscheme")

-- test ##################################################################################
-- require("test")
