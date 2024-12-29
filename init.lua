
-- require("core.packer")
-- require("core.options")
-- require("core.mapping")
--
-- require("core.lsp-config")
-- require("core.treesitter-config")
-- -- require("core.neotree-config")
-- require("core.cmp-config")
-- require("core.lspsaga-config")
-- require("core.govim-config")
-- require("core.dap-config")
-- require("core.nvimtree-config")
-- require("core.colorscheme-config")
-- require("core.leetcode")
--
require('config.lazycore')
if vim.g.vscode then
    -- VSCode extension
    require('config.options.vscode')
else
    -- ordinary Neovim
    require('config.options.nevim')
    require('config.keymap')
end

