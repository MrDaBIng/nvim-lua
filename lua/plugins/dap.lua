return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "nvim-neotest/nvim-nio" },
        {
            "rcarriga/nvim-dap-ui",
            config = function ()
                local dap, dapui = require("dap"), require("dapui")
                local layouts = {
                    {
                        elements = {
                            {id = "scopes", size = 0.25},
                            {id = "breakpoints", size = 0.25},
                            {id = "stacks", size = 0.25},
                            {id = "watches",size = 0.25}
                        },
                        position = "left",
                        size = 40
                    },
                    {
                        elements = {
                            {id = "repl", size = 0.5},
                            { id = "console", size = 0.5}
                        },
                        position = "bottom",
                        size = 10
                    },
                    {
                        elements = {
                            {id = "repl",size = 1},
                        },
                        position = "bottom",
                        size = 20
                    },
                }
                dapui.setup({
                    -- layouts = layouts,
                })
                dap.listeners.after.event_initialized["dapui_config"] = function()
                  dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                  dapui.close()
                  dap.repl.toggle()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                  dapui.close()
                  dapui.repl.toggle()
                end
                -- dap.listeners.before.event_exited["e"]
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

        local adapter = require('plugins.dapadapter.adapter')
        adapter.delve(dap)
    end
}

