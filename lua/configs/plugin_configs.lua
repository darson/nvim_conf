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
    mappings = {
      i = {
        ["<C-a>"] = { "<Home>", type = "command" },
        ["<C-e>"] = { "<End>", type = "command" },
        ["<C-u>"] = false,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      dir_icon = "-",
      dir_icon_hl = "+",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  }
}
require("telescope").load_extension("file_browser")
vim.keymap.set({'n'}, '<leader>f', ":Telescope find_files<CR>", {})
vim.keymap.set({'n'}, '<leader>bf', ":Telescope buffers<CR>", {})
vim.keymap.set({'n'}, '<space>f', function() 
  local file_dir = vim.fn.expand("%:p:h")
  require('telescope').extensions.file_browser.file_browser({path=file_dir}) 
end, {noremap = true})
vim.keymap.set({'n'}, '<leader>bs', ":Telescope file_browser<CR>", {})

--[[ tree sitter ]]--
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true or a list of languages will run `:h syntax` and tree-sitter at the same time.
    additional_vim_regex_highlighting = false,
  },
}

--[[ lazygit --]]--
vim.keymap.set({'n'}, '<leader>gg', "<cmd>LazyGit<cr>", {silent=true})
