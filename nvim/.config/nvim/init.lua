vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd.colorscheme("habamax")

vim.g.mapleader = " "

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
})

require("nvim-tree").setup({
  view = {
    width = 36,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", {
  desc = "Toggle project file tree",
})
