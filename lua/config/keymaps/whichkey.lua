local wk = require("which-key")

local file = {
	{ "<leader>f", group = "File" }, -- group
	{ "<Leader>ff", require("telescope.builtin").find_files, desc = "Find File" },
	{ "<Leader>fg", require("telescope.builtin").live_grep, desc = "Find string in current directory" },
	{ "<Leader>fb", require("telescope.builtin").buffers, desc = "Find string in current Buffer" },
	{ "<Leader>fh", require("telescope.builtin").help_tags, desc = "Find help tags" },
}

local buffer = {
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bp", ":BufferLinePick<CR>", desc = "Pick bbuffer" },
	{ "<leader>b1", ":BufferLineGoToBuffer 1<CR>", desc = "Goto buffer 1" },
	{ "<leader>b2", ":BufferLineGoToBuffer 2<CR>", desc = "Goto buffer 2" },
	{ "<leader>b3", ":BufferLineGoToBuffer 3<CR>", desc = "Goto buffer 3" },
	{ "<leader>b4", ":BufferLineGoToBuffer 4<CR>", desc = "Goto buffer 4" },
	{ "<leader>b5", ":BufferLineGoToBuffer 5<CR>", desc = "Goto buffer 5" },
	{ "<leader>b6", ":BufferLineGoToBuffer 6<CR>", desc = "Goto buffer 6" },
	{ "<leader>b7", ":BufferLineGoToBuffer 7<CR>", desc = "Goto buffer 7" },
	{ "<leader>b8", ":BufferLineGoToBuffer 8<CR>", desc = "Goto buffer 8" },
	{ "<leader>b9", ":BufferLineGoToBuffer 9<CR>", desc = "Goto buffer 9" },
	{ "<leader>b$", ":BufferLineGoToBuffer -1<CR>", desc = "Goto buffer 10" },

	{ "<leader>bq", group = "buffer quite/close" },
	{ "<leader>bq<", ":BufferLineCloseLeft<CR>", desc = "Close left buffer" },
	{ "<leader>bq>", ":BufferLineCloseRight<CR>", desc = "Close right buffer" },
	{ "<leader>bqp", ":BufferLinePickClose<CR>", desc = "Pick and close buffer" },
	{ "<leader>bqq", ":bdelete<CR>", desc = "Close current buffer" },
}

local code = {
	{ "<leader>c", group = "Code" },
	{ "<leader>cd", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto definition" },
	{ "<leader>cD", "<cmd>Lspsaga peek_definition<CR>", desc = "Show definition in peek" },
	{ "<leader>ct", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Goto type definition" },
	{ "<leader>cT", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Show type definition in peek" },
	{ "<leader>cr", "<cmd>Lspsaga rename<CR>", desc = "Code rename" },
	{ "<leader>ci", "<cmd>Lspsaga finder imp<CR>", desc = "Show implement" },

	{ "<leader>co", "<cmd>Lspsaga outline<CR>", desc = "Open outline" },
	{ "<leader>cf", "<cmd>Format<CR>", desc = "Format code" },
	{ "<leader>cF", "<cmd>Format<CR>", desc = "Format code and save" },

	{ "<leader>cc", group = "Calls" },
	{ "<Leader>cci", "<cmd>Lspsaga incoming_calls<CR>", desc = "Incoming calls" },
	{ "<Leader>cco", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Outgoing calls" },

	{ "<leader>e", group = "Code error and diagnostic" },

	{ "<leader>cg", group = "Golang" },
	{ "<leader>cgv", "<cmd>GoGenReturn<CR>", desc = "Genarate func return value" },
	{ "<leader>cgf", "<cmd>GoFillStruct<CR>", desc = "Fill struct" },
	{ "<leader>cgi", "<cmd>GoImpl<CR>", desc = "implemence interface" },
	{ "<leader>cgt", "<cmd>GoAddTag<CR>", desc = "Add json tag" },
	{ "<leader>cgj", "<cmd>GoJson2Struct<CR>", desc = "Cobvert json to struct" },
}

local dap = require("dap")

local code_debug = {
	{ "<leader>d", group = "Debug" },
	{ "<leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
	{ "<leader>dB", dap.list_breakpoints, desc = "List breakpoint" },
	{ "<leader>dR", dap.clear_breakpoints, desc = "Removes all breakpoints" },
	{
		"<leader>dd",
		function()
			require("telescope").extensions.dap.configurations({})
		end,
		desc = "Start debug",
	},
}

wk.add({ file, buffer, code, code_debug })
local status, privates = pcall(require, "keymaps.privates")
if status then
		wk.add(privates.whichkey)
end
