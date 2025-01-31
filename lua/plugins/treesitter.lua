return {
  "nvim-treesitter/nvim-treesitter",

    -- Automatically install treesitter parsers
    build = ":TSUpdate", -- run :TSUpdate after installation for updates
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {'java'}, -- Install all parsers, or specify "java" if you want just Java
      highlight = {
        enable = true, -- Enable Treesitter syntax highlighting
        additional_vim_regex_highlighting = false, -- Disable vim regex highlighting for better performance
      },
    },
  }
