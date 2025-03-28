return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,

  init = function()

    -- nvim-tree.lua

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    -- OR setup with some options
  end,
  opts = {

    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 25,
    },
    renderer = {
      group_empty = true,
    },
    -- on_attach = function(bufnr)
      --   local api = require('nvim-tree.api')
      --   local opts = { buffer = 0, noremap = true, silent = true }
      --
      --   -- Toggle hidden files with the period key
      --   vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts)
      -- end,
      filters = {
        dotfiles = false,
        custom = { "^.DS_Store$" },
      },
    }
  }
