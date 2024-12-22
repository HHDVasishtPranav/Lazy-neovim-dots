-- ========================
-- Set Editor Options
-- ========================
vim.cmd("set autoindent")          -- Automatically indent new lines
vim.cmd("set smartindent")         -- Smarter auto-indentation
vim.cmd("set expandtab")           -- Convert tabs to spaces
vim.cmd("set tabstop=2")           -- Number of spaces for a tab
vim.cmd("set softtabstop=2")       -- Number of spaces for Tab key
vim.cmd("set shiftwidth=2")        -- Number of spaces for indentation
vim.opt.number = true 
vim.g.mapleader = " "              -- Set the leader key to space

-- ========================
-- Lazy.nvim Setup
-- ========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Use the latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)      -- Add Lazy.nvim to runtime path

-- ========================
-- Plugin List
-- ========================
local opts = {}
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- Theme plugin
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } }, -- Fuzzy finder
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },  -- Code highlighting and parsing
  {
    "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, -- Status line
  { "dracula/vim", name = "dracula" },                         -- Dracula theme for lualine
  { "neovim/nvim-lspconfig" },                                 -- Language Server Protocol configurations
  { "hrsh7th/nvim-cmp" },                                      -- Autocompletion plugin
  { "hrsh7th/cmp-nvim-lsp" },                                  -- LSP source for nvim-cmp
  { "L3MON4D3/LuaSnip" },                                      -- Snippet engine
  { "saadparwaiz1/cmp_luasnip" },                              -- Snippet completion source
  { "windwp/nvim-autopairs" },                                 -- Auto pairs
  { "kylechui/nvim-surround" },                                -- Manage parentheses, quotes, etc.
  { "akinsho/toggleterm.nvim", version = "*", config = true }, -- Integrated terminal
  { "folke/which-key.nvim" },                                  -- Display keybindings dynamically
}

require("lazy").setup(plugins, opts)                           -- Initialize Lazy.nvim with plugins

-- ========================
-- Telescope Key Mappings
-- ========================
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-f>", builtin.find_files, {})           -- Ctrl+F to find files
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})       -- <leader>fg to grep
vim.keymap.set("n", "<C-e>", ":Neotree filesystem reveal left<CR>", {}) -- Ctrl+E for file explorer
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", {})

-- ========================
-- Treesitter Configuration
-- ========================
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {
    "lua", "javascript", "python", "cpp", "html", "css", 
    "bash", "json", "markdown", "yaml", "typescript",
  },                                                         -- Languages to ensure installed
  highlight = { enable = true },                             -- Enable syntax highlighting
  indent = { enable = true },                                -- Enable indentation
})

-- ========================
-- Catppuccin Setup
-- ========================
require("catppuccin").setup({
  transparent_background = true,                             -- Enable transparent background
})

-- ========================
-- Lualine Configuration
-- ========================
require("lualine").setup({
  options = {
    theme = "dracula",                                       -- Use Dracula theme
    section_separators = { left = "", right = "" },        -- Custom section separators
    component_separators = { left = "", right = "" },      -- Custom component separators
  },
})

-- ========================
-- LSP Configuration
-- ========================
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "pyright", "clangd", "html", "cssls" }     -- Add your preferred LSP servers
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end

-- ========================
-- Autopairs Configuration
-- ========================
require("nvim-autopairs").setup({})

-- ========================
-- Surround Configuration
-- ========================
require("nvim-surround").setup({})

-- ========================
-- Toggleterm Configuration
-- ========================
require("toggleterm").setup({
  open_mapping = [[<C-\>]],                                 -- Shortcut to toggle terminal
  direction = "float",                                      -- Floating terminal
  close_on_exit = true,                                     -- Close terminal on exit
})

-- Create a second terminal mapping for the bottom terminal
vim.api.nvim_set_keymap('n', '<C-`>', '<cmd>ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })

-- Enable close on exit for the bottom terminal
vim.cmd([[autocmd TermOpen * setlocal nonumber norelativenumber]])

-- ========================
-- Which-Key Configuration
-- ========================
require("which-key").setup({})

-- ========================
-- Set the Colorscheme
-- ========================
vim.cmd("colorscheme catppuccin")                            -- Apply Catppuccin theme

