local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }

--local vimtree = require "nvim-tree.api"

local mappings = {
	-- { from = "S", to = ":w<cr>" },
	-- { from = "gb", to = "<c-o>" },
	-- window
	-- { from = "<leader>s", to = "<c-w>j" },
	-- { from = "<leader>w", to = "<c-w>k" },
	-- { from = "<leader>d", to = "<c-w>l" },
	-- { from = "<leader>a", to = "<c-w>h" },
	-- vimtree
	{ from = "tt", to = ":NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
	-- {from = '<C-t>', to = vimtree.tree.change_root_to_parent},
	-- {from = '?',    to = vimtree.tree.toggle_help,},
	-- {from = '\\',   to = vimtree.node.open.vertical},
	-- {from = '-',    to = vimtree.node.open.horizontal},

	-- bufferline
	-- { from = "<leader>1", to = ":BufferLineGoToBuffer 1<CR>" },
	-- { from = "<leader>2", to = ":BufferLineGoToBuffer 2<CR>" },
	-- { from = "<leader>3", to = ":BufferLineGoToBuffer 3<CR>" },
	-- { from = "<leader>4", to = ":BufferLineGoToBuffer 4<CR>" },
	-- { from = "<leader>5", to = ":BufferLineGoToBuffer 5<CR>" },
	-- { from = "<leader>6", to = ":BufferLineGoToBuffer 6<CR>" },
	-- { from = "<leader>7", to = ":BufferLineGoToBuffer 7<CR>" },

	-- { from = "<leader>8", to = ":BufferLineGoToBuffer 8<CR>" },
	-- { from = "<leader>9", to = ":BufferLineGoToBuffer 9<CR>" },
	-- { from = "<leader>$", to = ":BufferLineGoToBuffer -1<CR>" },
	{ from = ">", to = ":BufferLineCycleNext<CR>", desc = "Cycle Buffer Next" },
	{ from = "<", to = ":BufferLineCyclePrev<CR>", desc = "Cycle Buffer Prev" },
	-- { from = "Q", to = ":bdelete<CR>" },
	-- { from = "<leader>ql", to = ":BufferLineCloseLeft<CR>" },
	-- { from = "<leader>qr", to = ":BufferLineCloseRight<CR>" },
	-- { from = "<leader>bp", to = ":BufferLinePick<CR>" },
	-- { from = "<leader>bc", to = ":BufferLinePickClose<CR>" },

	-- move cursor
	{ mode = mode_i, from = "<C-h>", to = "<Left>" },
	{ mode = mode_i, from = "<C-j>", to = "<Down>" },
	{ mode = mode_i, from = "<C-k>", to = "<Up>" },
	{ mode = mode_i, from = "<C-l>", to = "<Right>" },
	{ mode = mode_i, from = "<A-w>", to = "<S-Left>" },
	{ mode = mode_i, from = "<A-b>", to = "<S-Right>" },
	{ mode = mode_i, from = "<C-a>", to = "<Home>" },
	{ mode = mode_i, from = "<C-e>", to = "<End>" },

	-- vim go
	-- { from = "gv", to = ":GoGenReturn<CR>" },
	-- { from = "gf", to = ":GoFillStruct<CR>" },
	-- { from = "gi", to = ":GoImpl<CR>" },

	--- telescope
	-- {from = "<Leader>ff", to = require("telescope.builtin").find_files},
	-- {from = "<Leader>fg", to = require("telescope.builtin").live_grep},
	-- {from = "<Leader>fb", to = require("telescope.builtin").buffers},
	-- {from = "<Leader>fh", to = require("telescope.builtin").help_tags},
	-- {from = "<Leader>sp", to = require("telescope").extensions.media_files.media_files},

	-- dap
	--  vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
	{
		from = "<F5>",
		to = function()
			require("telescope").extensions.dap.configurations({})
		end,
	},
	-- {
	-- 	from = "<F10>",
	-- 	to = function()
	-- 		dap.step_over()
	-- 	end,
	-- },
	-- {
	-- 	from = "<F11>",
	-- 	to = function()
	-- 		dap.step_into()
	-- 	end,
	-- },
	-- {
	-- 	from = "<F12>",
	-- 	to = function()
	-- 		dap.step_out()
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>b",
	-- 	to = function()
	-- 		dap.toggle_breakpoint()
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>B",
	-- 	to = function()
	-- 		dap.set_breakpoint()
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>lp",
	-- 	to = function()
	-- 		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>dr",
	-- 	to = function()
	-- 		dap.repl.open()
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>dl",
	-- 	to = function()
	-- 		dap.run_last()
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>dh",
	-- 	to = function()
	-- 		require("dap.ui.widgets").hover()
	-- 	end,
	-- },
	-- {
	-- 	mode = mode_nv,
	-- 	from = "<Leader>dp",
	-- 	to = function()
	-- 		require("dap.ui.widgets").preview()
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>dh",
	-- 	to = function()
	-- 		require("dap.ui.widgets").hover()
	-- 	end,
	-- },
	-- {
	-- 	mode = mode_nv,
	-- 	from = "<Leader>dp",
	-- 	to = function()
	-- 		require("dap.ui.widgets").preview()
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>ds",
	-- 	to = function()
	-- 		local widgets = require("dap.ui.widgets")
	-- 		widgets.centered_float(widgets.scopes)
	-- 	end,
	-- },
	-- {
	-- 	from = "<Leader>df",
	-- 	to = function()
	-- 		local widgets = require("dap.ui.widgets")
	-- 		widgets.centered_float(widgets.frames)
	-- 	end,
	-- },

	-- { from = "<Leader>ci", to = "<cmd>Lspsaga incoming_calls<CR>" },
	-- { from = "<Leader>co", to = "<cmd>Lspsaga outgoing_calls<CR>" },
	{ from = "K", to = "<cmd>Lspsaga hover_doc<CR>" },
	{ mode = mode_i, from = "<A-k>", to = "<cmd>Lspsaga hover_doc<CR>" },

	-- { from = "[e", to = "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
	-- { from = "]e", to = "<cmd>Lspsaga diagnostic_jump_next<CR>" },
	-- { from = "<leader>sc", to = "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
	-- { from = "<leader>sb", to = "<cmd>Lspsaga show_buf_diagnostics<CR>" },
	{ from = "gh", to = "<cmd>Lspsaga finder<CR>", desc = "Lspsaga finder" },
	{ from = "gr", to = "<cmd>Lspsaga rename<CR>", desc = "Lspsaga rename" },
	{ from = "gD", to = "<cmd>Lspsaga peek_definition<CR>", desc = "Lspsaga peek_definition" },
	{ from = "gd", to = "<cmd>Lspsaga goto_definition<CR>", desc = "Lspsaga goto_definition" },
	-- { from = "<leader>sl", to = "<cmd>Lspsaga show_line_diagnostics<CR>" },
	-- {
	-- 	from = "[E",
	-- 	to = function()
	-- 		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	-- 	end,
	-- },
	-- {
	-- 	from = "]E",
	-- 	to = function()
	-- 		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	-- 	end,
	-- },
	-- { mode = mode_i, from = "<C-p>", to = "<cmd>Lspsaga hover_doc<CR>" },
	-- { mode = mode_nv, from = "<leader>ca", to = "<cmd>Lspsaga code_action<CR>" },
	-- { mode = { "n", "t" }, from = "<A-d>", to = "<cmd>Lspsaga term_toggle<CR>" },
}

local status, privates = pcall(require, "keymaps.privates")
if status then
	for _, value in ipairs(privates.keymap) do
		mappings = table.insert(mappings, value)
	end
end

local wk = require("which-key")
local map_n = {}
for _, v in ipairs(mappings) do
	if v.mode ~= nil then
		vim.keymap.set(v.mode or mode_i, v.from, v.to, { noremap = true, silent = true })
	else
		table.insert(map_n, { v.from, v.to, desc = v.desc or "" })
	end
end
wk.add({ map_n })
