return {
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({})

			local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
			  pattern = "*.go",
			  callback = function()
			   require('go.format').gofmt()
			  end,
			  group = format_sync_grp,
			})
		end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
	}
}

