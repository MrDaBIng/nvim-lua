return {
	{
		"folke/tokyonight.nvim",
		dependencies = {
			{
				"nvim-lualine/lualine.nvim",
				config = function()
					local get_signature = function()
						if not pcall(require, "lsp_signature") then
							return
						end
						local sig = require("lsp_signature").status_line(300)
						return sig.label .. "🐼" .. sig.hint
					end
					require("lualine").setup({
						options = {
							theme = "tokyonight-storm",
						},
						-- sections = {
						-- 	lualine_c = {
						-- 		function()
						-- 			return get_signature()
						-- 		end,
						-- 	},
						-- },
					})
				end,
			},
			{
				"nvim-tree/nvim-web-devicons",
			},
			"SmiteshP/nvim-navic",
			{
				"utilyre/barbecue.nvim",
				config = function()
					require("barbecue").setup({
						options = {
							theme = "tokyonight-storm",
						},
					})
				end,
			},
		},
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {
			-- terminal_colors = true,
			on_colors = function(colors)
				-- colors.hint = colors.bg
				-- colors.error = "ff0000"
			end,
		},
		init = function()
			vim.cmd([[colorscheme tokyonight-storm]])
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"akinsho/nvim-bufferline.lua",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					numbers = "ordinal",
					style_preset = bufferline.style_preset.no_italic,
				},
			})
		end,
	},
}
