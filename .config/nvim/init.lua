-- Key Remapping
vim.keymap.set('i', 'jj', '<Esc>', {})

-- Plugins installation
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('nvim-mini/mini.icons')
Plug('nvim-treesitter/nvim-treesitter')
Plug('OXY2DEV/markview.nvim')
Plug('EdenEast/nightfox.nvim') 

vim.call('plug#end')

-- Plugin loading with settings
require('mini.icons').setup()
require('markview').setup({
	preview = {
		enable = true,
		enable_hybrid_mode = true,
		modes = { "v", "V", "R", "i", "n", "no", "c" },
		hybrid_modes = { "v", "V", "R", "i", "n", "no", "c" },
	}
})
vim.cmd("colorscheme nordfox")

