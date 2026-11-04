vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd.colorscheme("habamax")

vim.g.mapleader = " "

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "basedpyright" },
})

vim.lsp.config("basedpyright", {
  capabilities = lsp_capabilities,
})
vim.lsp.config("gopls", {
  capabilities = lsp_capabilities,
})
vim.lsp.enable("basedpyright")

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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
  end,
})

vim.lsp.enable("gopls")
