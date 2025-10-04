return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")
    nvimtree.setup({
        view = {
				side = "left",
				width = 30,
			},
			renderer = {
				full_name = false,
				indent_markers = {
					enable = true,
				},
				root_folder_label = ":t",
				icons = {
					show = {
						folder_arrow = true,
                        folder = false,
					},
				},
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},

			update_focused_file = {
				enable = true,
				update_root = true,
			},
    })


    -- Setting keymaps
    local keymap = vim.keymap 
    keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  end,
}
