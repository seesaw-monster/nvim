return {
  -- colorscheme #####################
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd[[colorscheme tokyonight-moon]]
    end
  },
  { -- indneline #####################
    'Yggdroot/indentLine'
  },
  { -- web devicons ##################
    'nvim-tree/nvim-web-devicons'
  },
  { -- status line ###################
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { -- deno ##########################
    'vim-denops/denops.vim',
  },
  { -- markdown preview ##############
    'kat0h/bufpreview.vim',
    build = 'deno task prepare',
    ft = {
      "markdown",
    },
    dependencies = {
      'vim-denops/denops.vim'
    }
  },
  { -- make table comand #############
    'mattn/vim-maketable'
  },
  { -- comment #######################
    'tpope/vim-commentary'
  },
  -- copilot #########################
  -- {
  --   'github/copilot.vim',
  -- },
  { -- auto pairs ####################
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },
  -- LSP #############################
  {
    'neovim/nvim-lspconfig'
  },
  {
    'williamboman/mason.nvim'
  },
  {
    'williamboman/mason-lspconfig.nvim'
  },
  -- cmp #############################
  {
    'hrsh7th/nvim-cmp'
  },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'hrsh7th/cmp-buffer'
  },
  {
    'L3MON4D3/LuaSnip'
  },
  {
    'saadparwaiz1/cmp_luasnip'
  },
  -- filer ###########################
  {
    'lambdalisue/vim-fern'
  },
  {
    'lambdalisue/vim-fern-hijack'
  },
  -- #################################
}
