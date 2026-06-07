local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move between windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- split management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

map("n", ";", ":", { desc = "General enter CMD mode" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines down in visual selection" })

map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- paste without replacing clipboard content
map("x", "<leader>p", [["_dP]])

-- enable pasting in visual mode
map("v", "p", '"_dp', opts)

-- delete without copying to clipboard to keep clean
map({ "n", "v" }, "<leader>d", [["_d]])

-- exist insert mode with ctrl+c and also do :nohl using ctrl+c
map("i", "<C-c>", "<Esc>")
map("n", "<C-c>", ":nohl<CR>", { desc = "Clear Search hl", silent = true })

-- insert new line in normal mode using enter and shift+enter
map("n", "<CR>", "m`o<Esc>``")
map("n", "<S-CR>", "m`O<Esc>``")

-- format code with leader+f
map("n", "<leader>f", vim.lsp.buf.format)

--disables Q
map("n", "Q", "<nop>")

-- prevents x from copying deleted character
map("n", "x", '"_x', opts)

-- replace word under cursor gobally
map(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
