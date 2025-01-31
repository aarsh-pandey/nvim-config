return {
  
    'akinsho/toggleterm.nvim',
    opts = {
      size = 16,  -- Terminal height when opened at the bottom
      direction = 'horizontal' -- Set terminal to open horizontally at the bottom
    },
    init = function()
      vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { noremap = true, silent = true })
    end 
  }
