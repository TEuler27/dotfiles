-- Key Remapping
vim.keymap.set('i', 'jj', '<Esc>', {})

-- Plugins installation
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('nvim-mini/mini.icons')
Plug('nvim-treesitter/nvim-treesitter')
Plug('OXY2DEV/markview.nvim')
Plug('lervag/vimtex')
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
require('nvim-treesitter.config').setup({
	ignore_install = { "latex" }
})
vim.cmd("colorscheme nordfox")

-- VimTex setting
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_open_on_warning = 0
vim.keymap.set('n', 'dsm', '<Plug>(vimtex-env-delete-math)', {})
vim.keymap.set('n', 'csm', '<Plug>(vimtex-env-change-math)', {})
vim.keymap.set('n', 'tsm', '<Plug>(vimtex-env-toggle-math)', {})
vim.keymap.set('x', 'am', '<Plug>(vimtex-a$)', {})
vim.keymap.set('x', 'im', '<Plug>(vimtex-i$)', {})
vim.keymap.set('x', 'ai', '<Plug>(vimtex-am)', {})
vim.keymap.set('x', 'ii', '<Plug>(vimtex-im)', {})
vim.keymap.set('o', 'am', '<Plug>(vimtex-a$)', {})
vim.keymap.set('o', 'im', '<Plug>(vimtex-i$)', {})
vim.keymap.set('o', 'ai', '<Plug>(vimtex-am)', {})
vim.keymap.set('o', 'ii', '<Plug>(vimtex-im)', {})
