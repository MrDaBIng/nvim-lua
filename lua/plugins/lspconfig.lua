local M = {}

M.config = {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v2.x',
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

            require('plugins.lsp.gopls').setup(lspconfig, goOnattach ,lsp)
            require('plugins.lsp.luals').setup(lspconfig, luaOnAttach, lsp)
        end
    },
}

-- M.config = {
--     {
--       'VonHeikemen/lsp-zero.nvim',
--       branch = 'v3.x',
--       lazy = true,
--       config = false,
--       init = function()
--         -- Disable automatic setup, we are doing it manually
--         vim.g.lsp_zero_extend_cmp = 0
--         vim.g.lsp_zero_extend_lspconfig = 0
--       end,
--     },
  
--     -- Autocompletion
--     {
--       'hrsh7th/nvim-cmp',
--       event = 'InsertEnter',
--       dependencies = {
--         {'L3MON4D3/LuaSnip'},
--       },
--       config = function()
--         -- Here is where you configure the autocompletion settings.
--         local lsp_zero = require('lsp-zero')
--         lsp_zero.extend_cmp()
  
--         -- And you can configure cmp even more, if you want to.
--         local cmp = require('cmp')
--         local cmp_action = lsp_zero.cmp_action()
  
--         cmp.setup({
--           formatting = lsp_zero.cmp_format({details = true}),
--           mapping = cmp.mapping.preset.insert({
--             ['<C-Space>'] = cmp.mapping.complete(),
--             ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--             ['<C-d>'] = cmp.mapping.scroll_docs(4),
--             ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--             ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--           }),
--           snippet = {
--             expand = function(args)
--               require('luasnip').lsp_expand(args.body)
--             end,
--           },
--         })
--       end
--     },
  
--     -- LSP
--     {
--       'neovim/nvim-lspconfig',
--       cmd = 'LspInfo',
--       event = {'BufReadPre', 'BufNewFile'},
--       dependencies = {
--         {'hrsh7th/cmp-nvim-lsp'},
--       },
--       config = function()
--         -- This is where all the LSP shenanigans will live
--         local lsp_zero = require('lsp-zero')
--         lsp_zero.extend_lspconfig()
  
--         lsp_zero.on_attach(function(client, bufnr)
--           -- see :help lsp-zero-keybindings
--           -- to learn the available actions
--           lsp_zero.default_keymaps({buffer = bufnr})
--         end)
  
--         -- (Optional) Configure lua language server for neovim
--         local lua_opts = lsp_zero.nvim_lua_ls()
--         require('lspconfig').lua_ls.setup(lua_opts)
--       end
--     }
--   }

return M
