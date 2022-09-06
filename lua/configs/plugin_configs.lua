--[[ for hop ]]--
vim.keymap.set('', '<leader>hc', "<cmd>lua require'hop'.hint_char2()<cr>", {})
vim.keymap.set('', '<leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})

--[[ indent blankline --]]
require("indent_blankline").setup {
  enabled = false,
  show_first_indent_level = false,
}
vim.keymap.set('', '<leader>i', ":IndentBlanklineToggle<CR>", {})

--[[ telescope ]]--
require("telescope").setup {
  defaults = {
    path_display = {
      shorten = 3
    },
    mappings = {
      i = {
        ["<C-a>"] = { "<Home>", type = "command" },
        ["<C-e>"] = { "<End>", type = "command" },
        ["<C-u>"] = false,
      },
    },
    file_ignore_patterns = { "*.pyz", "*.o", "*.pyc", "__pycache__/*", "^.git" }
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      dir_icon = "+",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  }
}
require("telescope").load_extension("file_browser")
vim.keymap.set({'n'}, '<leader>f', ":Telescope find_files<CR>", {})
vim.keymap.set({'n'}, '<leader>bf', ":Telescope buffers<CR>", {})
vim.keymap.set({'n'}, '<leader>ds', ":Telescope lsp_document_symbols<CR>", {})
vim.keymap.set({'n'}, '<space>f', function()
  local file_dir = vim.fn.expand("%:p:h")
  require('telescope').extensions.file_browser.file_browser({path=file_dir, cwd_to_path=true})
end, {noremap = true})

--[[ tree sitter ]]--
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true or a list of languages will run `:h syntax` and tree-sitter at the same time.
    additional_vim_regex_highlighting = false,
  },
}

--[[ git blame ]]--
require("gitblame").disable()
vim.keymap.set('n', '<leader>gg', ":GitBlameToggle<CR>", {})
vim.g.gitblame_message_template = '<sha> • <author> • <date> • <summary>'
vim.g.gitblame_date_format = '%x %H:%M'

--[[ ToggleTerm ]]--
vim.keymap.set('n', "<leader>cp", function()
  local file_dir = vim.fn.expand("%:p:h")
  vim.cmd([[ToggleTerm dir="]] .. file_dir ..  [["]])
end)

--[[ use toggle term to execute user script ]]--
local function execute_user_script()
  local user_script_path = vim.fn.getcwd() .. "/run.sh"
  if vim.fn.findfile(user_script_path) == "" then
    return
  end
  local cmd = [[/bin/bash ]] .. user_script_path .. [[ && exit]]
  vim.cmd([[TermExec cmd="]] .. cmd .. [[" direction=float]])
end
vim.keymap.set('n', "<F5>", execute_user_script, {})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction='float' })

vim.keymap.set("n", "<leader>lg", function() lazygit:toggle() end, {noremap = true, silent = true})
