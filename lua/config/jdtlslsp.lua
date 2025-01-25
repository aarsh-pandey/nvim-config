
M = {}

local on_attach = function(client, bufnr)
  local buf_map = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- General LSP actions
  buf_map('n', 'gd', vim.lsp.buf.definition)         -- Go to definition
  buf_map('n', 'gD', vim.lsp.buf.declaration)        -- Go to declaration
  buf_map('n', 'gi', vim.lsp.buf.implementation)     -- Go to implementation
  buf_map('n', 'gr', vim.lsp.buf.references)         -- List references
  buf_map('n', 'K', vim.lsp.buf.hover)               -- Show hover documentation
  buf_map('n', '<leader>s', vim.lsp.buf.signature_help)  -- Show signature help
  buf_map('n', '<leader>rn', vim.lsp.buf.rename)     -- Rename symbol
  buf_map('n', '<leader>ca', vim.lsp.buf.code_action) -- Show code actions
  buf_map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end) -- Format code

  -- Diagnostics
  buf_map('n', '[d', vim.diagnostic.goto_prev)       -- Go to previous diagnostic
  buf_map('n', ']d', vim.diagnostic.goto_next)       -- Go to next diagnostic
  buf_map('n', '<leader>e', vim.diagnostic.open_float) -- Show diagnostics in a floating window
  buf_map('n', '<leader>q', vim.diagnostic.setloclist) -- Add diagnostics to the location list

  -- Workspace management
  buf_map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)    -- Add workspace folder
  buf_map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder) -- Remove workspace folder
  buf_map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end) -- List workspace folders
end

function M.setup()

  vim.diagnostic.config({
    virtual_text = true,  -- Show inline diagnostics
    signs = true,         -- Show signs in the gutter
    underline = true,     -- Underline problematic code
    update_in_insert = false, -- Update diagnostics while typing in insert mode
    severity_sort = true, -- Sort diagnostics by severity
  })


  -- for autocompiltion, delete this if you don't want autocomplition
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local home = os.getenv("HOME")
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local workspace_dir = home .. "/.workspace/" .. project_name

  vim.api.nvim_create_autocmd('FileType', {
    -- This handler will fire when the buffer's 'filetype' is "java"
    pattern = 'java',
    callback = function(ev)
      vim.lsp.start({
        name = 'java-jdtls',
        cmd = {'jdtls', '-data', workspace_dir },
        capabilities=capabilities,
        root_dir = vim.fs.root(ev.buf, {'.root','.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}),
        settings = {
          java = {
            eclipse = { downloadSources = true, },
            configuration = { updateBuildConfiguration = "interactive", },
            maven = { downloadSources = true, },
            implementationsCodeLens = { enabled = true, },
            referencesCodeLens = { enabled = true, },
            references = { includeDecompiledSources = true, },
            format = {
              enabled = true,
              settings = {
                url = home .. '/.config/nvim/eclipse-java-google-style.xml',
                profile = "GoogleStyle",
              },
            },
          },
        },
        on_attach=on_attach
      })
    end,
  })

end

return M
