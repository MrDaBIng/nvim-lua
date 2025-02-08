local M = {}

local neo_config = {
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {},
  },

  -- Autocompletion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   event = 'InsertEnter',
  --   config = function()
  --     local cmp = require('cmp')
  --
  --     cmp.setup({
  --       sources = {
  --         {name = 'nvim_lsp'},
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ['<C-Space>'] = cmp.mapping.complete(),
  --         ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  --         ['<C-d>'] = cmp.mapping.scroll_docs(4),
  --       }),
  --       snippet = {
  --         expand = function(args)
  --           vim.snippet.expand(args.body)
  --         end,
  --       },
  --     })
  --   end
  -- },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = 'yes'
    end,
    config = function()
      local lsp_defaults = require('lspconfig').util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}

          -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end
  }
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
