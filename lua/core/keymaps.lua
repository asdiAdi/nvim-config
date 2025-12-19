--  Basic Keymaps
--  NOTE: See
--  :help vim.keymap.set()
--  :help wincmd for a list of all window commands

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- prevent recursive mapping, don't echo command in the command line
local function opts(extra)
  local common = { noremap = true, silent = true }
  if extra == nil then
    return common
  else
    return vim.tbl_extend('force', common, extra)
  end
end

-- KICKSTART
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic quickfix list' })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--  Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- BUFFERS
vim.keymap.set('n', '<TAB>', '<cmd> bnext <CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<S-TAB>', '<cmd> bprevious <CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>tb', function()
  if vim.o.showtabline == 0 then
    vim.o.showtabline = 2
  else
    vim.o.showtabline = 0
  end
end, { desc = 'Toggle Bufferline' })

vim.keymap.set('n', '<C-q>', function()
  local prev = vim.fn.bufnr '#'
  vim.cmd 'bnext'
  vim.cmd('bdelete! ' .. prev)
end, { desc = 'Close current buffer' })

---------------------------------------------------------------------------------------

-- PLUGINS
-- Oil, close Neotree first
vim.keymap.set('n', '\\', function()
  vim.cmd 'Neotree close'
  vim.cmd 'Oil --preview'
end, opts())
-- Neotree, Close Oil first
vim.keymap.set('n', '<C-\\>', function()
  local oil = require 'oil'
  oil.close()
  vim.cmd 'Neotree reveal'
end, opts())

-- CUSTOM
-- save all files
vim.keymap.set('n', '<C-s>', '<cmd> wall <CR>', opts())
-- save file without auto-formatting
-- vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts())
-- quit all files
vim.keymap.set('n', '<leader>q', '<cmd> qall <CR>', { desc = '[Q]uit all files' })
-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts())
-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts())
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts())
-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts())
vim.keymap.set('n', 'N', 'Nzzzv', opts())
-- Toggle line wrapping
vim.keymap.set('n', '<C-S-l>', '<cmd>set wrap!<CR>', opts())
-- Keep last yanked when pasting inside visual mode
vim.keymap.set('v', 'p', '"_dP', opts())
-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts())
vim.keymap.set('v', '>', '>gv', opts())

-- MIGHT USE
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Window management
-- vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
-- vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
-- vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
-- vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
-- vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
-- vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
-- vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
-- vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
-- vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
-- vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
-- vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
-- vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Resize with arrows
-- vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts())
-- vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts())
-- vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts())
-- vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts())
