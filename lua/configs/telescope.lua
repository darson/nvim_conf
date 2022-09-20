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
      search_dirs = {model_backtest:expand(), scripts:expand(), model_train:expand()},
      follow = true
    })
  else
    print("model_backtest/scripts/model_train are missing")
  end

end

vim.keymap.set('n', '<leader>hs', find_home_share)
vim.keymap.set('n', '<leader>cf', find_neovim_config)

local function my_buffer()
  require'telescope.builtin'.buffers{
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local action_state = require('telescope.actions.state')
        local actions = require('telescope.actions')
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
        my_buffer()
      end

      map('i', '<c-d>', delete_buf)
      map('n', 'd', delete_buf)

      return true
    end
  }
end
vim.keymap.set('n', '<leader>bf', my_buffer)
