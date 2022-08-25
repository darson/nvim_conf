return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use {'kdheepak/lazygit.nvim'}
  use 'neovim/nvim-lspconfig'
end)
