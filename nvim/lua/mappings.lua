require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")



-- float term
map("n", "<C-t>", ":FloatermToggle<CR>", { silent = true })

-- nav floaterm (mode normal & terminal)
map({ "n", "t" }, "<C-p>", function()
  require("floaterm.api").cycle_term_bufs "prev"
end, { desc = "Floaterm previous buffer" })
