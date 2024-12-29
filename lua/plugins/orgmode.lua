local M = {}

M.config = {
	-- {
	-- 	"nvim-orgmode/orgmode",
	-- 	event = "VeryLazy",
	-- 	ft = { "org" },
	-- 	config = function()
	-- 		-- Setup orgmode
	-- 		require("orgmode").setup({
	-- 			org_agenda_files = "~/Documents/orgfiles/**/*",
	-- 			org_default_notes_file = "~/Documents/orgfiles/refile.org",
	-- 		})
	--
	-- 		-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
	-- 		-- add ~org~ to ignore_install
	-- 		-- require("nvim-treesitter.configs").setup({
	-- 		-- 	ensure_installed = "all",
	-- 		-- 	ignore_install = { "org" },
	-- 		-- })
	-- 	end,
	-- },
	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = true,
	},
}

return M
