local function find_neovim_config()
  require('telescope.builtin').find_files({
    cwd = '~/.config/nvim'
  })
end

local function find_home_share()
  local p = require('plenary.path')
  local cwd = p.new(vim.fn.getcwd())
  local model_backtest = cwd/'model_backtest'
  local scripts = cwd/'scripts'
  local model_train = cwd/'model_train'

  if (model_backtest:is_dir() and scripts:is_dir() and model_train:is_dir()) then
    require('telescope.builtin').find_files({
      search_dirs = {model_backtest:expand(), scripts:expand(), model_train:expand()}
    })
  else
    print("model_backtest/scripts/model_train are missing")
  end

end

vim.keymap.set('n', '<leader>hs', find_home_share)
vim.keymap.set('n', '<leader>cf', find_neovim_config)
