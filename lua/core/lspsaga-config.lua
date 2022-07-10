local saga = require 'lspsaga'

-- change the lsp symbol kind
local kind = require('lspsaga.lspkind')
--kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua
saga.init_lsp_saga({
  code_action_icon = '💡',
  border_style = "single",
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  symbol_in_winbar = nil,
})


local bufopts = {
  noremap=true,
  silent=true,
  buffer=bufnr,
}
-- Mode(Normal/Insert/Visual),"key",action,opts)
--vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gD', vim.lsp.buf.definition, bufopts)
--vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

vim.keymap.set("n", "gh", require("lspsaga.finder").lsp_finder, { silent = true })
local action = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    action.range_code_action()
end, { silent = true })

vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true })
local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })
-- show signature help
vim.keymap.set("n", "gs", require("lspsaga.signaturehelp").signature_help, { silent = true })
-- rename
vim.keymap.set("n", "grn", require("lspsaga.rename").lsp_rename, { silent = true })
-- preview definition
vim.keymap.set("n", "gd", require("lspsaga.definition").preview_definition, { silent = true })

--diagnostic
vim.keymap.set("n", "<leader>cd", require("lspsaga.diagnostic").show_line_diagnostics, { silent = true })
vim.keymap.set("n", "[e", require("lspsaga.diagnostic").goto_prev, { silent = true })
vim.keymap.set("n", "]e", require("lspsaga.diagnostic").goto_next, { silent = true })
