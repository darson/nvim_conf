--[[ for hop ]]--
vim.keymap.set('', '<leader>hc', "<cmd>lua require'hop'.hint_char2()<cr>", {})
vim.keymap.set('', '<leader>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})

--[[ indent blankline --]]
require("indent_blankline").setup {
  enabled = false,
  show_first_indent_level = false,
  indent_blankline_char = "|"
}
vim.keymap.set('', '<leader>i', ":IndentBlanklineToggle<CR>", {})

--[[ telescope ]]--
require("telescope").load_extension("file_browser")

