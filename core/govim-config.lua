require("mason").setup()
require("mason-lspconfig").setup()
require('go').setup({
    -- lsp_cfg = false,
    dap_debug = true, -- set to false to disable dap
    dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
                             -- false: do not use keymap in go/dap.lua.  you must define your own.
                             -- windows: use visual studio keymap
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = true, -- set to true to enable dap virtual text
    icons = {breakpoint = '🔴', currentpos = '👉'}
})
-- local cfg = require'go.lsp'.config() -- config() return the go.nvim gopls setup
-- require('lspconfig').gopls.setup(cfg)

-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  },
  doc_lines = 1,
  hint_enable = false
})
