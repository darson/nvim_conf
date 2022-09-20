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

        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local multi_selection = current_picker:get_multi_selection()

        if next(multi_selection) == nil then
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          vim.api.nvim_buf_delete(selection.bufnr, { force = true })
        else
          actions.close(prompt_bufnr)
          for _, selection in ipairs(multi_selection) do
            vim.api.nvim_buf_delete(selection.bufnr, { force = true })
          end
        end

        my_buffer()
      end

      map('i', '<c-x>', delete_buf)
      map('n', 'x', delete_buf)

      return true
    end
  }
end
vim.keymap.set('n', '<leader>bf', my_buffer)
