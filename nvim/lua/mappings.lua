require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- restart cord.nvim (Discord presence)
map("n", "ZR", "<cmd>CordReconnect<cr>", { desc = "Restart Discord presence" })
