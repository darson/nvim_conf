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
      vim.diagnostic.enable(false)
    else
      vim.diagnostic.enable(true)
    end
    state = (state + 1) % 2
  end

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('i', '<C-n>', '<c-x><c-o>', bufopts)

  vim.keymap.set('n', '<space>ql', vim.diagnostic.setloclist, bufopts)
  vim.keymap.set('n', '<space>of', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<space>tt', toggle, bufopts)
end

vim.lsp.config['pyright'] = {
  on_attach = on_attach,
}
vim.lsp.enable('pyright')
vim.lsp.config('rust_analyzer', {
  on_attach = on_attach,
})
vim.lsp.enable('rust_analyzer')


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 2,
    },
    signs = true,
    update_in_insert = false,
  }
)

