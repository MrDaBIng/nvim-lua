local M = {
  require('plugins.dress'),
  require('plugins.dress'),
  require('plugins.treesitter'),
  require('plugins.lspconfig').config,
  require('plugins.vimtree'),
  require('plugins.govim'),
  require('plugins.completecode').config,
  require('plugins.comment'),
  require('plugins.telescope').config,
  require('plugins.dap'),
  require('plugins.lspsaga'),
  require('plugins.utils').config,
  require('plugins.leap'),
  require('plugins.whichkey').config,
  require('plugins.formatter').config,
  require('plugins.orgmode').config,
}

for key, value in pairs(require("plugins.private.config")) do
   M = table.insert(M,value)
end

return M
