-- lua/plugins/betterterm.lua
return {
	"CRAG666/betterTerm.nvim",
	keys = {
		{ "<C-j>",        desc = "Toggle terminal" },
		{ "<C-PageUp>",   mode = { "n", "t" },     desc = "Next terminal" },
		{ "<C-PageDown>", mode = { "n", "t" },     desc = "Prev terminal" },
	},
	opts = {
		position = "bot",
		size = math.floor(vim.o.lines / 2),
		lazy = false,
		show_tabs = true,
		new_tab_mapping = "<C-t>",
		-- jump_tab_mapping = "<C-$tab>", -- A-1, A-2, etc.
		startInserted = true,
		index_base = 1,
		predefined = {
			{ index = 1, name = "Main" },
			{ index = 2, name = "Server" },
			{ index = 3, name = "Tests" },
		},
	},
	config = function(_, opts)
		local betterTerm = require("betterTerm")
		betterTerm.setup(opts)

		vim.keymap.set({ "n", "t" }, "<C-j>", betterTerm.toggle_termwindow, { desc = "Toggle terminal" })
		vim.keymap.set({ "n", "t" }, "<C-PageUp>", function()
			betterTerm.cycle(1)
		end, { desc = "Next terminal" })
		vim.keymap.set({ "n", "t" }, "<C-PageDown>", function()
			betterTerm.cycle(-1)
		end, { desc = "Prev terminal" })
		vim.keymap.set("n", "<leader>tt", betterTerm.select, { desc = "Select terminal" })
		vim.keymap.set("n", "<leader>tr", betterTerm.rename, { desc = "Rename terminal" })
		vim.keymap.set("n", "<leader>tb", betterTerm.toggle_tabs, { desc = "Toggle tab bar" })
	end,
}
