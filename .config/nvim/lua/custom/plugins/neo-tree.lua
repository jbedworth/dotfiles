-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"git@github.com:nvim-neo-tree/neo-tree.lua",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"nunifTanjim/nui.nvim",
		{ "3rd/image.nvim", opts = {} },
	},
	lazy = "false",
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		-- Set up options here
	},
}
