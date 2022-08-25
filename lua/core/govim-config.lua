require('go').setup({
    dap_debug = true, -- set to false to disable dap
    dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
                             -- false: do not use keymap in go/dap.lua.  you must define your own.
                             -- windows: use visual studio keymap
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = true, -- set to true to enable dap virtual text
    icons = {breakpoint = '🔴', currentpos = '👉'}
})
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)

