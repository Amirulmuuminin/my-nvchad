return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Jump",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
  },
},
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

 {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Core
      "vim",
      "lua",
      "vimdoc",
      -- Web
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",           -- React/JSX dengan TypeScript
      "astro",         -- Astro

      -- Infrastructure
      "terraform",     -- Terraform
      "hcl",           -- Terraform config language
      -- Extras (recommended)
      "json",
      "markdown",
      "markdown_inline",
      "bash",
    },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",    -- Tekan Enter untuk mulai seleksi
        node_incremental = "<CR>", -- Tekan Enter lagi untuk memperlebar (otomatis deteksi {} [] tag dll)
        scope_incremental = false,
        node_decremental = "<bs>",  -- Tekan Backspace untuk memperkecil seleksi
      },
    },
  },
},

{
  "nvim-tree/nvim-tree.lua",
  opts = {
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
  },
},

  {
  "kdheepak/lazygit.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Mengatur agar LazyGit menggunakan nvim yang sedang aktif untuk mengedit file
    vim.g.lazygit_floating_window_winblend = 0 -- membuat jendela tidak transparan
    vim.g.lazygit_use_neovim_remote = 1 -- Gunakan sesi nvim yang sama
  end
}

}
