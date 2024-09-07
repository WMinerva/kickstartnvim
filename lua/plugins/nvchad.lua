-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'NvChad/base46',
    lazy = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },
  {
    'NvChad/ui',
    config = function()
      require 'nvchad'
      -- vim.o.statusline = ' '
    end,
  },
  -- dependency for ui
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    opts = function()
      return { override = require 'nvchad.icons.devicons' }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. 'devicons')
      require('nvim-web-devicons').setup(opts)
    end,
  },
}
