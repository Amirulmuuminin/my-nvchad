require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Dari Normal Mode: Simpan (tetap di Normal Mode)
map("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })

-- Dari Insert Mode: Simpan dan pindah ke Normal Mode
-- Kita gunakan <Esc> setelah simpan untuk menjamin keluar dari Insert Mode
map("i", "<C-s>", "<Esc><cmd> w <CR>", { desc = "Save file and go to normal mode" })

map("n", "<leader>x", function()
  -- Menghitung jumlah buffer yang valid/terbuka
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })

  if #bufs <= 1 then
    -- Jika hanya sisa 1 buffer, tutup Neovim sepenuhnya
    vim.cmd "quit"
  else
    -- Jika masih ada banyak buffer, gunakan fungsi bawaan NvChad untuk tutup buffer saja
    require("nvchad.tabufline").close_buffer()
  end
end, { desc = "Close buffer or quit nvim" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- coba dulu
