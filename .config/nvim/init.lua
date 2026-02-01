-- Key Remapping
vim.keymap.set('i', 'jj', '<Esc>', {})

-- Plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('OXY2DEV/markview.nvim')

vim.call('plug#end')
