vim.g.mapleader = " "
vim.g.maplocalleader = " "

DEFAULT_KB_LAYOUT = 0
SET_KB_LAYOUT = function(layout_index)
  io.popen("hyprctl switchxkblayout at-translated-set-2-keyboard " .. layout_index)
end
SET_KB_LAYOUT_RU = function()
  io.popen "hyprctl switchxkblayout at-translated-set-2-keyboard 1"
end
SET_KB_LAYOUT_EN = function()
  io.popen "hyprctl switchxkblayout at-translated-set-2-keyboard 0"
end

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
