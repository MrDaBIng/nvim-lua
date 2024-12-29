local opt = vim.opt
local global = vim.g

-- set options
opt.backup = false
opt.hlsearch = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.tabstop = 4
opt.showtabline = 2
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.scrolloff = 35
opt.modifiable = true
opt.fileencoding = "utf-8"
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.termguicolors = true
opt.cursorline = true
opt.mouse = "a"
opt.exrc = true

opt.cursorcolumn = true
opt.clipboard = "unnamedplus"
-- vim.highlight.create('ColorColumn', {ctermbg=0, guibg=lightgrey}, false)
-- vim.api.nvim_set_hl(0 , 'ColorColumn', {fg="#DADBDD",bg="#DADBDD",})

-- vim.opt.fillchars:append({
--     horiz = '━',
--     horizup = '┻',
--     horizdown = '┳',
--     vert = '┃',
--     vertleft = '┫',
--     vertright = '┣',
--     verthoriz = '╋',
-- })

-- set global
global.mapleader = " "
global.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
-- vim.cmd [[colorscheme catppuccin]]
-- vim.cmd('colorscheme gruvbox-material')
