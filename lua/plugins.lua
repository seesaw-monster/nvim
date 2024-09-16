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
  -- tabout ##########################
  {
    'nvim-treesitter/nvim-treesitter'
  },
  {
    'abecodes/tabout.nvim',
    lazy = false,
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp"
    },
    opt = true,  -- Set this to true if the plugin is optional
    event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },
  -- #################################
}
