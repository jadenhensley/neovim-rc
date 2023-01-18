local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.setup()

lsp.ensure_installed({
  'html',
  'cssls',
  'tsserver',
  'python-lsp-server'
})


