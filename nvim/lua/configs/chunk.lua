require('hlchunk').setup({
  chunk = {
    enable = true,
    use_treesitter = true,
    style = {
      { fg = "#806d9c" },
    },
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = "─",
    },
  },
  indent = {
    enable = false,
  },
  line_num = {
    style = "#806d9c",
  },
})
