local M = {}

local neo_config = {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"ray-x/lsp_signature.nvim",
		-- event = "InsertEnter",
		opts = {
			bind = true, -- This is mandatory, otherwise border config won't get registered.
			handler_opts = {
				border = "rounded",
			},
			doc_lines = 1,
			hint_enable = false,
		},
		config = function(_, opts)
			M.lspsignature = require("lsp_signature")
			M.lspsignature.setup(opts)
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "saghen/blink.cmp" },
		},
		init = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = "yes"
		end,
		opts = {
			servers = {
				lua_ls = {},
				gopls = {},
				jsonls = {},
				bashls = {},
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"jsonls",
					"bashls",
				},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})
			local lspconfig = require("lspconfig")

			require("plugins.lsp.gopls").setup(lspconfig, nil, nil)
			require("plugins.lsp.luals").setup(lspconfig, nil, nil)
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}

local old_config = {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{
				"ray-x/lsp_signature.nvim",
				config = function()
					M.lspsignature = require("lsp_signature")
					M.lspsignature.setup({
						bind = true, -- This is mandatory, otherwise border config won't get registered.
						handler_opts = {
							border = "rounded",
						},
						doc_lines = 1,
						hint_enable = false,
					})
				end,
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local lsp = require("lsp-zero").preset({})
			lsp.ensure_installed({
				"lua_ls",
				"gopls",
				"jsonls",
				"bashls",
			})
			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			local goOnattach = function(client, bufnr)
				M.lspsignature.on_attach(signature_setup, bufnr)
			end

			local luaOnAttach = function(client, bufnr)
				M.lspsignature.on_attach(signature_setup, bufnr)
			end

			require("plugins.lsp.gopls").setup(lspconfig, goOnattach, lsp)
			require("plugins.lsp.luals").setup(lspconfig, luaOnAttach, lsp)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function(_, opts)
			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("blink.cmp").get_lsp_capabilities()
			)
		end,
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
M.config = neo_config
return M
