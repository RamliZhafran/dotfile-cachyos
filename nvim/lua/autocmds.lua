require "nvchad.autocmds"

-- Kill cord server (Discord presence) when nvim exits
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.fn.jobstart("pkill -x cord", { detach = true })
  end,
})
