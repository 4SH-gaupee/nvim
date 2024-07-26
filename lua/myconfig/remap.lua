local map = vim.api.nvim_set_keymap
map("n", "<Space>", "", {})
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>pv", ":Vex<CR>")
vim.keymap.set("n", "<Leader>ex", ":Ex<CR>")
vim.keymap.set("n", "<Leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<Leader>j", ":cnext<CR>")
vim.keymap.set("n", "<Leader>k", ":cprev<CR>")

vim.keymap.set("n", "<Leader>cc", ":Telescope conventional_commits<CR>")
