return {
  { -- completion
    'neoclide/coc.nvim',
    branch = 'release'
  },
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
  { -- tree
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim'
    }
  },
  { -- asynchronous processing
    'nvim-lua/plenary.nvim'
  },
  { -- UI
    'MunifTanjim/nui.nvim'
  },
  { -- image support
    '3rd/image.nvim'
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
