vim.o.backup = false
vim.o.hlsearch = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4

vim.o.tabstop = 4
vim.o.showtabline = 2
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.scrolloff = 35

vim.o.fileencoding = "utf-8"

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.termguicolors = true
vim.o.wrap = false

vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.g.mapleader = " "

-- vim.opt.fillchars:append({
--     horiz = '━',
--     horizup = '┻',
--     horizdown = '┳',
--     vert = '┃',
--     vertleft = '┫',
--     vertright = '┣',
--     verthoriz = '╋',
-- })
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]
-- vim.cmd('colorscheme gruvbox-material')
