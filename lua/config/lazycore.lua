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
local plugins = {
  require('config.plugins.dress'),
  require('config.plugins.treesitter'),
  require('config.plugins.lspconfig').config,
  require('config.plugins.vimtree'),
  -- require('config.plugins.bufferline'),
  require('config.plugins.govim'),
  require('config.plugins.completecode').config,
  require('config.plugins.comment'),
  require('config.plugins.telescope').config,
  require('config.plugins.dap'),
  require('config.plugins.lspsaga'),
  require('config.plugins.utils').config,
}

require("lazy").setup(plugins, opts)


