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

-- Mode Normal: Pindahkan baris aktif ke atas/bawah
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

-- Mode Visual: Pindahkan blok yang diseleksi ke atas/bawah
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Memaksa kursor selalu berada di posisi yang sama di layar setelah bergerak
map("n", "j", "jzz", { noremap = true })
map("n", "k", "kzz", { noremap = true })

-- Mengubah leader e menjadi toggle file tree (sama seperti Ctrl + n)
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>s", "<cmd> w <CR>", { desc = "Save file" })

-- Leader + h untuk toggle terminal horizontal (sama seperti Alt + h)
map("n", "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal Toggle Horizontal" })

-- Membuka LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Toggle LazyGit" })
