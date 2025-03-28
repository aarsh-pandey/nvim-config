return {
	{
		"gorbit99/codewindow.nvim",
		dependencies = {

			{
				"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		}
		},
		-- Define plugin options and configuration using `opts`
		disabled = true,
		opts = {
			minimap_width = 20, -- Width of the minimap's text part
		},
		-- Apply default keybindings after the plugin is loaded
		init = function()
			require("codewindow").apply_default_keybinds()
		end,
	},
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	event = "InsertEnter",
	-- 	config = true,
	-- 	-- use opts = {} for passing setup options
	-- 	-- this is equivalent to setup({}) function
	-- },
}
