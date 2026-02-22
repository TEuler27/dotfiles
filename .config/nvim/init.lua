-- General settings
vim.opt.shiftwidth=4
vim.opt.softtabstop=-1
vim.opt.expandtab=true
vim.opt.number=true
vim.opt.cursorline=true

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
Plug('L3MON4D3/LuaSnip', {['do'] = 'make install_jsregexp'}) 

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

-- Luasnip
vim.g.tex_flavor = "latex" 
local ls = require("luasnip")
ls.config.set_config({
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    update_events = 'TextChanged,TextChangedI',
})
vim.keymap.set(
    {"i", "s"},
    "<Tab>",
    function()
        if ls.expand_or_jumpable() then 
            vim.schedule(function() ls.expand_or_jump() end)
        else 
            return "<Tab>" 
        end 
    end, 
    {silent = true, expr = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

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
vim.keymap.set('n', 'swe', '<Plug>(vimtex-env-surround-line)', {})
vim.keymap.set('x', 'swe', '<Plug>(vimtex-env-surround-visual)', {})
vim.g.vimtex_syntax_conceal_disable=true
vim.g.vimtex_indent_on_ampersands=false
vim.g.vimtex_env_toggle_math_map = {
    ["$"]="equation",
    ["equation"]="align",
}
vim.g.vimtex_delim_toggle_mod_list = {
    {"\\Big", "\\Big"},
    {"\\Bigg", "\\Bigg"},
}
