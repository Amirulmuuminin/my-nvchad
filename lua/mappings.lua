require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

-- 1. UNBIND/DELETE DEFAULT NVCHAD MAPPINGS
-- Kita hapus mapping default Ctrl + h/j/k/l agar tidak konflik atau membingungkan
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

-- 2. CUSTOM MAPPINGS
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Simpan File
map("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc><cmd> w <CR>", { desc = "Save file and go to normal mode" })
map("n", "<leader>s", "<cmd> w <CR>", { desc = "Save file" })

-- Navigasi Window (Ganti Ctrl ke Leader)
map("n", "<leader>h", "<C-w>h", { desc = "Window left" })
map("n", "<leader>j", "<C-w>j", { desc = "Window down" })
map("n", "<leader>k", "<C-w>k", { desc = "Window up" })
map("n", "<leader>l", "<C-w>l", { desc = "Window right" })

-- Toggle Terminal (Sekarang menggunakan <leader>tt)
map({ "n", "t" }, "<leader>tt", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal Toggle Horizontal" })

-- Close Buffer atau Quit
map("n", "<leader>x", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs <= 1 then
    vim.cmd "quit"
  else
    require("nvchad.tabufline").close_buffer()
  end
end, { desc = "Close buffer or quit nvim" })

-- Move Lines (Alt + j/k)
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Cursor Centering
map("n", "j", "jzz", { noremap = true })
map("n", "k", "kzz", { noremap = true })

-- File Tree & Git
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Toggle LazyGit" })

-- Select All
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("i", "<C-a>", "<Esc>ggVG", { desc = "Select all" })
map("v", "<C-a>", "<Esc>ggVG", { desc = "Select all" })
