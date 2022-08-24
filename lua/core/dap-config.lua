require('dap')
local dapIcon = {
    breakpoint = {
        text = '🔴',
        texthl = "",
        linehl = "",
        numhl = "",
    },
    stopped = {
        text = '👉',
        texthl = "",
        linehl = "",
        numhl = "",
    }
}
vim.fn.sign_define('DapBreakpoint', dapIcon.breakpoint)
vim.fn.sign_define('DapStopped', dapIcon.stopped)

--keymap
vim.keymap.set("n", "<A-z>", require("dap").continue)
vim.keymap.set("n", "<A-x>", require("dap").step_into)
vim.keymap.set("n", "<A-c", require("dap").step_over)
vim.keymap.set("n", "<A-v>", require("dap").step_out)
vim.keymap.set("n", "<Leader>b", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
--vim.keymap.set("n", "<Leader>r", require "dapui".toggle)

vim.keymap.set("n","<Leader>r",require("go.dap").run)
