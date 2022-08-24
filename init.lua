vim.g.mapleader=";"

vim.o.number = true 
vim.o.encoding="utf-8"
vim.o.scrolloff = 7
vim.o.fileencodings = "utf-8,ucs-bom,gb18030,cp936"
vim.o.fileformats = "unix,dos,mac"

-- no <tab> insert <space>
vim.o.expandtab = true

-- shift width is when you shift blocks >> <<
-- or if smarttab is on, the first indent of the graph
vim.o.shiftwidth = 2
vim.o.smarttab = 2
vim.o.tabstop = 2

-- override vim's stupid default format for python
vim.cmd[[autocmd FileType python setlocal shiftwidth=2 softtabstop=2 tabstop=2]]

-- no need for all the backup mechnism
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- use gqip/gwip to format
vim.o.textwidth = 80

-- if you are at EOL, hit l, it will goto the next line
-- the default is not the case, so use whichwrap
vim.o.whichwrap="<,>,h,l"

-- when search abc, match Abc, abc, ABC
vim.o.ignorecase = true
-- when search Abc, match Abc
vim.o.smartcase = true
-- if you want to match only abc, use \Cabc


--[[ General Mapping ]]--
vim.api.nvim_set_keymap("n", "<leader>nl", ":nohl<CR>:let @/=''<CR>", {})
vim.api.nvim_set_keymap("c", "<C-A>", "<HOME>", {noremap=true})
vim.api.nvim_set_keymap("c", "<C-K>", "<END><C-U>", {noremap=true})

-- [[ plugins ]]--
require("plugins")

require("telescope").load_extension "file_browser"
require'lspconfig'.pyright.setup{}
