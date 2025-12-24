-- These settings were started from Kickstart.nvim

require 'core.options'
require 'core.keymaps'
require 'core.autocommands'

--  Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
-- prepends a path to Neovim’s runtimepath so it’s loaded before everything else
vim.opt.rtp:prepend(lazypath)

--  Configure and install plugins
require('lazy').setup {
  require 'plugins.theme',
  require 'plugins.neo-tree',
  require 'plugins.oil',
  -- require 'plugins.bufferline', -- lualine also has bufferline
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.lazydev',
  require 'plugins.autocompletion',
  require 'plugins.autoformatting',
  require 'plugins.gitsigns',

  require 'plugins.which-key',
  require 'plugins.misc',

  -- require 'plugins.debug',
  -- require 'plugins.lint',
}
