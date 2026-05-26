vim.opt.number = true
vim.opt.relativenumber = true

vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup()
