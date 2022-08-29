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
require("telescope").load_extension("file_browser")
vim.keymap.set({'n'}, '<leader>f', ":Telescope find_files<CR>", {})
vim.keymap.set({'n'}, '<leader>bf', ":Telescope buffers<CR>", {})
vim.keymap.set({'n'}, '<leader>bs', ":Telescope file_browser<CR>", {})

