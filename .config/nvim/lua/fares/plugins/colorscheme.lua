return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main",
                styles = {
                    bold = true,
                    italic = false,
                    transparency = true,
                }
            })
            vim.cmd("colorscheme rose-pine")
        end
    },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true,
        })
      -- set the colorscheme here
      -- vim.cmd.colorscheme "catppuccin"
    end,
  },
}
