return {
	"nvim-lualine/lualine.nvim",
	commit = "1517caa",
	dependencies = { "nvim-tree/nvim-web-devicons", "letieu/harpoon-lualine" },

	config = function()
		vim.o.laststatus = vim.g.lualine_laststatus
		require("lualine").setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
					"harpoon2",
					"fileformat",
					"filetype",
				},
				lualine_y = {},
				lualine_z = {},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "harpoon2", "location" },
				lualine_y = {},
				lualine_z = {},
			},

			extensions = {
				"nvim-tree",
			},
		})
	end,
}
