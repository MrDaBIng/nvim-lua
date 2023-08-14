return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            config = function ()
                local dap, dapui = require("dap"), require("dapui")
                dapui.setup({})
                dap.listeners.after.event_initialized["dapui_config"] = function()
                  dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                  dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                  dapui.close()
                end
            end,
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            config = function ()
               require("nvim-dap-virtual-text").setup()
            end,
        },
         "nvim-telescope/telescope-dap.nvim",
    },
    config = function ()
        vim.keymap.set('n', '<F5>', function() require 'telescope'.extensions.dap.configurations {} end)

        local dap = require("dap")

        vim.fn.sign_define('DapBreakpoint', {text = '🔴', texthl='', linehl='', numhl=''})
        vim.fn.sign_define('DapStopped', {text = '👉', texthl = '', linehl = '', numhl = ''})

        local adapter = require('config.plugins.dapadapter.adapter')
        adapter.delve(dap)
    end
}

