vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.timeoutlen = 500
vim.opt.shortmess = "oOtTWIcCFS"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.virtualedit = "block"
vim.opt.jumpoptions = "stack"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.formatoptions = "tcrqjnl"
vim.opt.clipboard = "unnamedplus"
vim.cmd.syntax("off")

-- Keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local vscode = require("vscode-neovim")
vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard

local function vscode_action(cmd)
  return function()
    vscode.action(cmd)
  end
end

-- Search: code navigation
vim.keymap.set("n", "gy", vscode_action("editor.action.goToTypeDefinition"), { desc = "Go To Type Definition" })
vim.keymap.set("n", "gr", vscode_action("editor.action.goToReferences"), { desc = "Go To References" })
vim.keymap.set("n", "gi", vscode_action("editor.action.goToImplementation"), { desc = "Go To Implementations" })
