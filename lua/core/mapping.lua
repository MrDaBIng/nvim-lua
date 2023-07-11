vim.keymap.set("n","S",":w<cr>",{noremap=true, silent=true})

vim.keymap.set("n","<leader>s","<c-w>j",{noremap=true, silent=true})
vim.keymap.set("n","<leader>w","<c-w>k",{noremap=true, silent=true})
vim.keymap.set("n","<leader>d","<c-w>l",{noremap=true, silent=true})
vim.keymap.set("n","<leader>a","<c-w>h",{noremap=true, silent=true})

vim.keymap.set("n","gb","<c-o>",{noremap=true, silent=true})
-- bufferline
vim.keymap.set("n","<leader>1",":BufferLineGoToBuffer 1<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>2",":BufferLineGoToBuffer 2<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>3",":BufferLineGoToBuffer 3<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>4",":BufferLineGoToBuffer 4<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>5",":BufferLineGoToBuffer 5<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>6",":BufferLineGoToBuffer 6<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>7",":BufferLineGoToBuffer 7<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>8",":BufferLineGoToBuffer 8<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>9",":BufferLineGoToBuffer 9<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>$",":BufferLineGoToBuffer -1<CR>",{noremap=true, silent=true})
vim.keymap.set("n",">",":BufferLineCycleNext<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<",":BufferLineCyclePrev<CR>",{noremap=true, silent=true})
vim.keymap.set("n","Q",":bdelete<CR>",{noremap=true, silent=true})
vim.keymap.set("n",
"<leader>ql",":BufferLineCloseLeft<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>qr",":BufferLineCloseRight<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>bp",":BufferLinePick<CR>",{noremap=true, silent=true})
vim.keymap.set("n","<leader>bc",":BufferLinePickClose<CR>",{noremap=true, silent=true})

-- move cursor
vim.keymap.set("i","<A-h>","<Left>",{noremap=true, silent=true})
vim.keymap.set("i","<A-j>","<Down>",{noremap=true, silent=true})
vim.keymap.set("i","<A-k>","<Up>",{noremap=true, silent=true})
vim.keymap.set("i","<A-l>","<Right>",{noremap=true, silent=true})
vim.keymap.set("i","<A-f>","<S-Left>",{noremap=true, silent=true})
vim.keymap.set("i","<A-g>","<S-Right>",{noremap=true, silent=true})

-- vim go
vim.keymap.set("n","gv",":GoGenReturn<CR>",{noremap=true, silent=true})
vim.keymap.set("n","gf",":GoFillStruct<CR>",{noremap=true, silent=true})
vim.keymap.set("n","gi",":GoImpl<CR>",{noremap=true, silent=true})
-- vim.keymap.set("n",)