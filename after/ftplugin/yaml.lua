local function find_model_yaml()
  local p = require('plenary.path')
  local cwd = p.new(vim.fn.getcwd())
  local model_configs = cwd/'model_backtest'

  if (model_configs:is_dir()) then
    require('telescope.builtin').find_files({
      search_dirs = {model_configs:expand()},
      follow = true,
      search_file = vim.fn.expand('<cword>')
    })
  else
    print("no model_configs/configs dir")
  end
end

vim.keymap.set('n', 'gd', find_model_yaml, {buffer=true})
