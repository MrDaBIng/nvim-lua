-- require("nvim-tree").setup({
--   open_on_tab = false,
--   view = {
--     mappings = {
--       list = {
--         { key = "-", action = "split" },
--         { key = "\\", action = "vsplit" },
--       },
--     },
--   },
--     
-- })

local function nvimtree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', '\\',    api.node.open.vertical,                opts('vsplit'))
  vim.keymap.set('n', '-',     api.node.open.horizontal,              opts('horizontal'))

  -- vim.keymap.set("n", 'tt',    api.tree.toggle,                       opts('toggle')) 
end

require("nvim-tree").setup ({
  ---
  on_attach = nvimtree_on_attach,
  ---
})


vim.keymap.set("n","tt",":NvimTreeToggle<cr>", { noremap=true, silent=true, buffer=bufnr })

