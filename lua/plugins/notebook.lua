local M = {}

local orgmode = {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = { "org" },
	config = function()
		-- Setup orgmode
		require("orgmode").setup({
			org_agenda_files = "~/Documents/orgfiles/**/*",
			org_default_notes_file = "~/Documents/orgfiles/refile.org",
		})

		-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
		-- add ~org~ to ignore_install
		-- require("nvim-treesitter.configs").setup({
		-- 	ensure_installed = "all",
		-- 	ignore_install = { "org" },
		-- })
	end,
}

local neorg = {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	ft = "norg",
	version = "*", -- Pin Neorg to the latest stable release
	config = true,
	run = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Documents/neoorg/",
					},
					default_workspace = "notes",
					index = "index.norg",
				},
			},
		},
	},
}

local obsidian = {
	-- "epwalsh/obsidian.nvim",
	-- NOTE: see this MR:https://github.com/epwalsh/obsidian.nvim/pull/798, want to be merged
	"git@github.com:hashpad/obsidian.nvim.git",
	branch = "relative-attachment-path",
	-- version = "*", -- recommended, use latest release instead of latest commit
	-- lazy = true,
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	init = function()
		vim.opt.conceallevel = 2
	end,
	opts = {
		workspaces = {
			{
				name = "default",
				path = "~/Documents/ObsidianVault",
			},
		},

		-- see below for full list of options 👇
		daily_notes = {
			folder = "Journal/",
			date_format = "%Y/%m/%Y-%m-%d",
		},
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},
		attachments = {
			relative_dir = true,
			img_folder = "image/",
			img_name_func = function()
				-- Prefix image names with timestamp.
				return string.format("%s-", os.time())
			end,
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![[%s]](%s)", path.name, path)
			end,
		},
	},
}

M.config = { obsidian }

return M
