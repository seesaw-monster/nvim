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
  {
    'github/copilot.vim',
  },
  {
    'nvim-lua/plenary.nvim'
  },
  { -- copilot chat
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = "main",
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
    },
    build = 'make tiktoken',
    opts = {
      debug = true,
    },
  },
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
    'lambdalisue/vim-fern',
  },
  {
    'lambdalisue/vim-fern-hijack'
  },
  -- DAP #############################
  {
    'mfussenegger/nvim-dap'
  },
  {
    'nvim-neotest/nvim-nio'
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {'nvim-dap', 'nvim-nio'}
  },
  {
    'nvim-treesitter/nvim-treesitter',
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = {'nvim-dap'}
  },
  -- Treesitter Context ##############
  {
    'nvim-treesitter/nvim-treesitter-context'
  },
  -- Accelerated jk ##################
  {
    'rainbowhxch/accelerated-jk.nvim'
  },
  -- #################################
}
