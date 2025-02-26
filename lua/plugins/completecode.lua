local M = {}

local blink_cmp_extension = {
	expands = {
		"nvim_autopairs",
	},
	provifders = {
		nvim_autopairs = {
			name = "nvim-autopairs", -- IMPORTANT: use the same name as you would for nvim-cmp
			module = "blink.compat.source",
			-- all blink.cmp source config options work as normal:
			score_offset = -3,

			-- this table is passed directly to the proxied completion source
			-- as the `option` field in nvim-cmp's source config
			--
			-- this is NOT the same as the opts in a plugin's lazy.nvim spec
			opts = {
				-- this is an option from cmp-digraphs
			},
		},
	},
}

local blink_cmp = {
	{
		"windwp/nvim-autopairs", -- auto pairs
		opts = {},
	},
	{
		"saghen/blink.compat",
		-- use the latest release, via version = '*', if you also use the latest release for blink.cmp
		version = "*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-calc" },
			{ "saadparwaiz1/cmp_luasnip" }, -- Snippets source for nvim-cmp
			{ "L3MON4D3/LuaSnip" }, -- Snippets plugin

			{ "rafamadriz/friendly-snippets" },
		},

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = {
				preset = "none",
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "Nerd Font Mono",
			},

			completion = {
				list = {
					selection = {
						preselect = false,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					window = {},
				},
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
			},
			-- Show signature when cursor is on a trigger character
			-- signature = {
			-- 	enabled = true,
			-- 	trigger = {
			-- 		show_on_insert_on_trigger_character = true,
			-- 		show_on_insert = true,
			-- 	},
			-- 	window = {
			-- 		winblend = 0,
			-- 		border = "single",
			-- 	},
			-- },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
			},
		},
		opts_extend = { "sources.default" },
		-- config = function()
		-- 	require("nvim-autopairs").setup()
		-- 	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- 	local cmp = require("cmp")
		-- 	-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		-- end,
	},
}

local nvim_cmp = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-calc" },
		{ "saadparwaiz1/cmp_luasnip" }, -- Snippets source for nvim-cmp
		{ "L3MON4D3/LuaSnip" }, -- Snippets plugin
		{ "windwp/nvim-autopairs" }, -- auto pairs
	},

	config = function()
		-- luasnip setup
		local luasnip = require("luasnip")
		-- nvim-cmp setup
		local cmp = require("cmp")
		cmp.setup({
			preselect = cmp.PreselectMode.Item,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
				-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-e>"] = cmp.mapping.close(),
				["<A-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})

		require("nvim-autopairs").setup()
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}

M.config = {
	-- nvim_cmp,
	blink_cmp,
}

return M
