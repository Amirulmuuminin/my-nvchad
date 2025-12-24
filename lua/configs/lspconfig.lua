require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls", -- JavaScript/TypeScript/TSX/React
  "tailwindcss", -- Tailwind CSS
  "astro", -- Astro
  "terraformls",
  "terraform",
  "tflint",
  "tfsec",
}
vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers
