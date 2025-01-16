return {
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    'gorbit99/codewindow.nvim',
    -- Define plugin options and configuration using `opts`
    disabled = true,
    opts = {
      minimap_width = 20,  -- Width of the minimap's text part
    },
    -- Apply default keybindings after the plugin is loaded
    init = function()
      require('codewindow').apply_default_keybinds()
    end
  },
  {

    'nvim-treesitter/nvim-treesitter',
    -- Automatically install treesitter parsers
    build = ':TSUpdate',  -- run :TSUpdate after installation for updates
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = "all",  -- Install all parsers, or specify "java" if you want just Java
      highlight = {
        enable = true,           -- Enable Treesitter syntax highlighting
        additional_vim_regex_highlighting = false,  -- Disable vim regex highlighting for better performance
      },
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    config = true
  }
}
