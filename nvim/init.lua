-- ====================================
--    Encoding & Compatibility
-- ====================================

-- Set UTF-8 as the default encoding
vim.opt.encoding = "utf-8"

-- Switch off Vi compatibility mode
vim.opt.compatible = false

-- ====================================
--    Basic Settings
-- ====================================

-- Use 'retrobox' color scheme
vim.cmd("colorscheme retrobox")

-- Enable cursorline for current line highlight
vim.opt.cursorline = true

-- Enable command-line completion menu
vim.opt.wildmenu = true

-- Scroll settings to keep context
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5

-- Ask for confirmation when quitting or making changes
vim.opt.confirm = true

-- Always show line and column numbers in statusline
-- vim.opt.statusline = "%F%m%r%h%w%=(%{&ff}/%Y) (line %l/%L, col %c)"

-- Enable line break at word boundaries
vim.opt.linebreak = true

-- Show the current Vim command in use
vim.opt.showcmd = true

-- Set the leader key
vim.g.mapleader = " " -- Spacebar as the leader key
-- ====================================
--    Mouse & Interface
-- ====================================

-- Enable mouse support for all modes
vim.opt.mouse = "a"

-- Enable filetype-specific plugins and indentation
vim.cmd("filetype plugin indent on")

-- ====================================
--    Indentation & Tabs
-- ====================================

-- Set the width of a tab character
vim.opt.tabstop = 4

-- Set indentation width for shift commands
vim.opt.shiftwidth = 2

-- Use spaces instead of tabs for indentation
vim.opt.expandtab = true

-- ====================================
--    Syntax and Highlighting
-- ====================================

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Disable Vim's startup message
vim.opt.shortmess:append("I")

-- ====================================
--    Line Numbers & Status Line
-- ====================================

-- Show absolute line numbers
vim.opt.number = true

-- Show relative line numbers in normal mode
vim.opt.relativenumber = true

-- Always show statusline, even with one window
-- Set global status for all windows 
vim.opt.laststatus = 3

-- ====================================
--    Search Settings
-- ====================================

-- Case-insensitive search, but case-sensitive if uppercase is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Incremental search (search as you type)
vim.opt.incsearch = true

-- ====================================
--    Backspace & Buffer Settings
-- ====================================

-- Make backspace work more intuitively
vim.opt.backspace = { "indent", "eol", "start" }

-- Allow hiding buffers with unsaved changes
vim.opt.hidden = true

-- Use same register for clipboard and for vim copy paste
vim.opt.clipboard = "unnamed"

-- ====================================
--    Key Mappings & Shortcuts
-- ====================================

-- Disable 'Q' key mapping in normal mode (Ex mode)
vim.keymap.set('n', 'Q', '<Nop>', { noremap = true, silent = true })

-- Disable the audible bell (visual bell instead)
vim.opt.errorbells = false
vim.opt.visualbell = true

-- Prevent usage of arrow keys for movement
-- In normal mode
vim.keymap.set('n', '<Left>', '<ESC><CMD>echoe "Use h"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Right>', '<CMD>echoe "Use l"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Up>', '<CMD>echoe "Use k"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Down>', '<CMD>echoe "Use j"<CR>', { noremap = true, silent = true })

-- In insert mode
vim.keymap.set('i', '<Left>', '<ESC><CMD>echoe "Use h"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Right>', '<ESC><CMD>echoe "Use l"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Up>', '<ESC><CMD>echoe "Use k"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Down>', '<ESC><CMD>echoe "Use j"<CR>', { noremap = true, silent = true })



-- Enable quick buffer switching
vim.keymap.set('n', '<C-K>', '<CMD>bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-J>', '<CMD>bnext<CR>', { noremap = true, silent = true })


-- Swap file path
vim.opt.directory = os.getenv("HOME") .. "/.vim/swp//"


-- Map F5 to compile and run the current Java file
vim.api.nvim_set_keymap('n', '<F5>', ':w<CR>:!javac % && java %:r<CR>', { noremap = true, silent = true })


-- Plugins
require("rpdplug").setup{
  { repo = "nvim-lualine/lualine.nvim", dir = "lualine" },

  { repo = "nvim-tree/nvim-tree.lua", dir = "nvim-tree" },
  { repo = "nvim-tree/nvim-web-devicons", dir = "nvim-tree" },
  { repo = "neovim/nvim-lspconfig", dir = "lsp-config" },

  -- nvim cmp plugins
  { repo = "hrsh7th/cmp-nvim-lsp", dir = "auto-complete" },
  { repo = "hrsh7th/cmp-buffer", dir = "auto-complete" },
  { repo = "hrsh7th/cmp-path", dir = "auto-complete" },
  { repo = "hrsh7th/nvim-cmp", dir = "auto-complete" },
  { repo = "hrsh7th/cmp-nvim-lua", dir = "auto-complete" },
  { repo = "L3MON4D3/LuaSnip", dir = "auto-complete" },
  { repo = "saadparwaiz1/cmp_luasnip", dir = "auto-complete" },
}



-- Configurations
require("config.jdtlslsp").setup()
require("config.nvim-cmp")
require("config.nvim-tree")
require('config.lualine')
