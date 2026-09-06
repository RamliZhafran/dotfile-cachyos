-- default nvchad:
-- require("nvchad.configs.lspconfig").defaults()
-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers

require("nvchad.configs.lspconfig").defaults()

-- HTML: completions, hover, boilerplate via snippets
vim.lsp.config("html", {
  filetypes = { "html", "htmldjango" },
})

-- CSS / SCSS / Less
vim.lsp.config("cssls", {
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})

-- JS / TS
vim.lsp.config("ts_ls", {
  filetypes = {
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
  },
})

-- ESLint (linting JS/TS, fix on save)
vim.lsp.config("eslint", {
  filetypes = {
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
  },
})

-- JSON dengan schema support (schemastore opsional)
local ok_schema, schemastore = pcall(require, "schemastore")
vim.lsp.config("jsonls", {
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      schemas = ok_schema and schemastore.json.schemas() or {},
      validate = { enable = true },
    },
  },
})

-- Emmet: expand abbreviasi seperti ! -> HTML boilerplate, div.class -> <div class="...">
vim.lsp.config("emmet_language_server", {
  filetypes = {
    "html", "css", "scss",
    "javascriptreact", "typescriptreact",
  },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    showabbreviationsuggestions = true,
    showsuggestionsassnippets = true,
  },
})

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "eslint",
  "jsonls",
  "emmet_language_server",
}

vim.lsp.enable(servers)
