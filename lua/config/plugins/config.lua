local private_plug = {}
local status, _private_plugs = pcall(require, 'plugins.privates')
if status then
  private_plug = _private_plugs.config
end

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
  require('plugins.motion').config,
  require('plugins.whichkey').config,
  require('plugins.formatter').config,
  require('plugins.notebook').config,
  require('plugins.multicursors'),
  private_plug,

}
-- local private_plug = require("config.plugins.privates")
-- M = table.insert(M,private_plug)
return M
