vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Define plugins
local plugins = {
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {"lua"}, -- Install the parser for Lua
        highlight = {
          enable = true,              -- Enable syntax highlighting
        },
        indent = {
          enable = true,              -- Enable indentation based on Treesitter
        },
      }
    end
  },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end
  },
  -- init.lua:
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}}

   

}

-- Options for lazy.nvim
local opts = {}

-- Setup lazy.nvim with the defined plugins and options
require("lazy").setup(plugins, opts)


--Telescopre
local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>',builtin.find_files,{})
vim.keymap.set('n','<leader>fg', builtin.live_grep,{})

--TreeSitter
local configs = require("nvim-treesitter.configs")
configs.setup({
ensure_installed={"lua","c","cpp"},
  highlight = { enable = true },
          indent = { enable = true },  

  })
