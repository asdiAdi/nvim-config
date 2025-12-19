vim.g.have_nerd_font = true -- must have Nerd Font installed and selected in the terminal

-- Setting options
--  NOTE: See
-- :help option-list
-- :help lua-options
-- :help lua-options-guide

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false -- Don't show the mode, since it's already in the status line

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.confirm = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'
-- Show which line your cursor is on
vim.o.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Experimental Commands
vim.opt.foldmethod = 'indent'
-- vim.o.foldexpr = 'nvim_treesitter#foldexper()'
vim.o.foldlevelstart = 99
