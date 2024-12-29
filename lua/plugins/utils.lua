local M = {}

local window_picker = function()
	local window_number = require("window-picker").pick_window()
	if window_number then
		vim.api.nvim_set_current_win(window_number)
	end
end

M.config = {
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				hint = "floating-big-letter",
			})
			vim.keymap.set({ "n" }, "<c-w>p", window_picker, { desc = "Window picker" })
		end,
	},
	{ "folke/neodev.nvim", opts = {} },
}

return M
