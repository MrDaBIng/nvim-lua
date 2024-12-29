local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    install = {
        colorscheme = {"tokyonight-storm"}
    }
}

local plugins = require('config.plugins.config')

if vim.g.vscode then
    plugins = {
          require("config.plugins.vscode")
    }
end

require("lazy").setup(plugins, opts)

