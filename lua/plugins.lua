return {
  { -- colorscheme
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd[[colorscheme tokyonight-moon]]
    end
  },
  { -- indneline
    'Yggdroot/indentLine'
  },
  { -- web devicons
    'nvim-tree/nvim-web-devicons'
  },
  { -- status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { -- deno
    'vim-denops/denops.vim',
  },
  { -- markdown preview
    'kat0h/bufpreview.vim',
    build = 'deno task prepare',
    ft = {
      "markdown",
    },
    dependencies = {
      'vim-denops/denops.vim'
    }
  },
  { -- make table comand
    'mattn/vim-maketable'
  },
  { -- comment
    'tpope/vim-commentary'
  },
  { -- copilot
    'github/copilot.vim',
  },
  { -- auto pairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },
}
