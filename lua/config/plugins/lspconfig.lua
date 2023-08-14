local M = {}

M.config = {
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
        
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
            {
                'ray-x/lsp_signature.nvim',
                config = function ()
                    M.lspsignature =  require("lsp_signature")
                    M.lspsignature.setup({
                        bind = true, -- This is mandatory, otherwise border config won't get registered.
                        handler_opts = {
                          border = "rounded"
                        },
                        doc_lines = 1,
                        hint_enable = false
                    })
                end
            }
        },
        config = function ()
            local lspconfig = require('lspconfig')
            local lsp = require('lsp-zero').preset({})
            lsp.ensure_installed({
				'lua_ls',
				'gopls',
				'jsonls',
                'bashls',
			})
            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
            end)
            
            local goOnattach = function (client, bufnr)
                M.lspsignature.on_attach(signature_setup, bufnr)
            end

            local luaOnAttach = function (client, bufnr)
                M.lspsignature.on_attach(signature_setup, bufnr)
            end

            require('config.plugins.lsp.gopls').setup(lspconfig, goOnattach ,lsp)
            require('config.plugins.lsp.luals').setup(lspconfig, luaOnAttach, lsp)
        end
    },
}

return M
