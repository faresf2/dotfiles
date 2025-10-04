return {
	"nvim-lualine/lualine.nvim",
	commit = "1517caa",
	dependencies = { "nvim-tree/nvim-web-devicons", "letieu/harpoon-lualine" },

	config = function()
		--- Get lualine theme colors from kanagawa.nvim
		-- local function GetTheme()
		-- 	-- Correctly get the palette from the kanagawa colors module
		-- 	local colors = require("kanagawa.colors").setup()
		-- 	local palette = colors.palette
		--
		-- 	-- Define the lualine theme using the kanagawa palette
		-- 	local lualine_theme = {
		-- 		normal = {
		-- 			a = { bg = palette.crystalBlue, fg = palette.sumiInk0, gui = "bold" },
		-- 			b = { bg = palette.sumiInk1, fg = palette.fujiWhite }, -- Changed background
		-- 			c = { fg = palette.fujiWhite },
		-- 		},
		-- 		insert = {
		-- 			a = { bg = palette.springGreen, fg = palette.sumiInk0, gui = "bold" },
		-- 			b = { bg = palette.sumiInk1, fg = palette.springGreen }, -- Changed background
		-- 		},
		-- 		command = {
		-- 			a = { bg = palette.roninYellow, fg = palette.sumiInk0, gui = "bold" },
		-- 			b = { bg = palette.sumiInk1, fg = palette.roninYellow }, -- Changed background
		-- 		},
		-- 		visual = {
		-- 			a = { bg = palette.oniViolet, fg = palette.sumiInk0, gui = "bold" },
		-- 			b = { bg = palette.sumiInk1, fg = palette.oniViolet }, -- Changed background
		-- 		},
		-- 		replace = {
		-- 			a = { bg = palette.waveRed, fg = palette.sumiInk0, gui = "bold" },
		-- 			b = { bg = palette.sumiInk1, fg = palette.waveRed }, -- Changed background
		-- 		},
		-- 		terminal = {
		-- 			a = { bg = palette.autumnGreen, fg = palette.sumiInk0, gui = "bold" },
		-- 			b = { bg = palette.sumiInk1, fg = palette.autumnGreen }, -- Changed background
		-- 		},
		-- 		inactive = {
		-- 			a = { bg = palette.sumiInk1, fg = palette.fujiWhite, gui = "bold" },
		-- 			b = { bg = palette.sumiInk1, fg = palette.sumiInk6 },
		-- 			c = { fg = palette.fujiWhite },
		-- 		},
		-- 	}
		--
		-- 	return lualine_theme
		-- end

		vim.o.laststatus = vim.g.lualine_laststatus
		require("lualine").setup({
			-- options = {
			-- 	theme = require("nightfox.util.lualine")("carbonfox"),
			-- 	component_separators = "|",
			-- 	section_separators = { left = "", right = "" },
			-- 	globalstatus = vim.o.laststatus == 3,
			-- 	disabled_filetypes = {
			-- 		statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
			-- 	},
			-- },

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "harpoon2", "fileformat", "filetype" },
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
