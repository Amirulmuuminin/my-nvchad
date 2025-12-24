local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Terraform & HCL
    terraform = { "terraform" },
    hcl = { "terraform" },
    -- Astro, React (TSX/JSX), TS, JS
    astro = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    -- Web lainnya
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
  },

  format_on_save = {
    -- Menambah timeout ke 1000ms karena terkadang prettier butuh waktu lebih lama pada file besar
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
