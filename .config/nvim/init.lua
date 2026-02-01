-- Key Remapping
vim.keymap.set('i', 'jj', '<Esc>', {})

-- Plugins installation
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('nvim-mini/mini.icons')
Plug('nvim-treesitter/nvim-treesitter')
Plug('OXY2DEV/markview.nvim')

vim.call('plug#end')

-- Plugin loading with settings
require('mini.icons').setup()
require('markview').setup({
	preview = {
		enable = true,
		enable_hybrid_mode = true,
		modes = { "R", "i", "n", "no", "c" },
		hybrid_modes = { "R", "i", "n", "no", "c" },
	}
})

