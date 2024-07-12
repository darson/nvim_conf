-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.wo.signcolumn = 'yes'

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  local state = 1

  local function toggle()
    if state == 1 then
      vim.diagnostic.disable()
    else
      vim.diagnostic.enable()
    end
    state = (state + 1) % 2
  end

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('i', '<C-n>', vim.lsp.omnifunc, bufopts)

  vim.keymap.set('n', '<space>ql', vim.diagnostic.setloclist, bufopts)
  vim.keymap.set('n', '<space>of', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<space>tt', toggle, bufopts)
end

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    root_dir = require('lspconfig').util.root_pattern('run.sh')
}

require('lspconfig')['bashls'].setup{
    on_attach = on_attach,
}

require'lspconfig'.clangd.setup{
  on_attach = on_attach
}
require'lspconfig'.cmake.setup{
  on_attach = on_attach
}

require'lspconfig'.gopls.setup{
  on_attach = on_attach
}


require'lspconfig'.lua_ls.setup{
  on_attach = on_attach
}

require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
  init_options = {
    completionDisableFilterText = true,
  }
}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
    },
    signs = true,
    update_in_insert = false,
  }
)

