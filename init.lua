vim.g.mapleader=";"

vim.o.number = true
vim.o.ruler = true
vim.o.encoding="utf-8"
vim.o.scrolloff = 7
vim.o.fileencodings = "utf-8,ucs-bom,gb18030,cp936"
vim.o.fileformats = "unix,dos,mac"
vim.o.wildmode = "longest:full,full"
vim.o.completeopt = "menu"
vim.o.mouse = ""

-- no <tab> insert <space>
vim.o.expandtab = true

-- shift width is when you shift blocks >> <<
-- or if smarttab is on, the first indent of the graph
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.tabstop = 2

-- override vim's stupid default format for python
vim.cmd[[autocmd FileType python setlocal shiftwidth=2 softtabstop=2 tabstop=2]]

-- no need for all the backup mechnism
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- use gqip/gwip to format
vim.o.textwidth = 800

-- if you are at EOL, hit l, it will goto the next line
-- the default is not the case, so use whichwrap
vim.o.whichwrap="<,>,h,l"

-- when search abc, match Abc, abc, ABC
vim.o.ignorecase = true
-- when search Abc, match Abc
vim.o.smartcase = true
-- if you want to match only abc, use \Cabc


--[[ General Mapping ]]--
vim.keymap.set("n", "<leader>nl", ":nohl<CR>", {silent=true})
vim.keymap.set("c", "<C-A>", "<HOME>", {noremap=true})
vim.keymap.set("c", "<C-K>", "<C-\\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>", {noremap=true})
vim.keymap.set("c", "<Down>", function() return vim.fn.wildmenumode() == 1 and "<C-N>" or "<Down>" end, {expr=true})
vim.keymap.set("c", "<Up>", function() return vim.fn.wildmenumode() == 1 and "<C-P>" or "<Up>" end, {expr=true})
vim.keymap.set("", "<Leader>tc", ":tabclose<CR>")
vim.keymap.set("", "<F2>", ":tabprevious<CR>")
vim.keymap.set("", "<F3>", ":tabnext<CR>")
vim.keymap.set("t","<C-\\><C-\\>", "<C-\\><C-N><C-W>W")
vim.keymap.set("n","<C-\\><C-\\>", "<C-W>W")
vim.keymap.set("i","<C-\\><C-\\>", "<ESC><C-W>W")

-- [[ plugins ]]--
require("configs/lazy")
require("configs/lsp")
require("configs/plugin_configs")
require("configs/telescope")
