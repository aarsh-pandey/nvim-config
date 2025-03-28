require('lspconfig').jdtls.setup{
  cmd = {"jdtls"},
  on_attach = function(client, bufnr)
    -- Disable document highlighting for jdtls
    -- client.server_capabilities.document_highlight = false
    client.server_capabilities.semanticTokensProvider = nil
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}
