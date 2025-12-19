-- https://github.com/akinsho/bufferline.nvim

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        themable = true,
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
      },
    }

    -- Options Dependency
    vim.opt.termguicolors = true
    vim.o.showtabline = 0
    -- Custom Keymaps
    vim.keymap.set('n', '<TAB>', '<cmd> bnext <CR>', { desc = 'Go to next buffer' })
    vim.keymap.set('n', '<S-TAB>', '<cmd> bprevious <CR>', { desc = 'Go to previous buffer' })
    vim.keymap.set('n', '<leader>tb', function()
      if vim.o.showtabline == 0 then
        vim.o.showtabline = 2
      else
        vim.o.showtabline = 0
      end
    end, { desc = 'Toggle Bufferline' })
    vim.keymap.set('n', '<leader>q', '<cmd> bdelete! <CR>', { desc = '[q] Close current buffer' })
    -- vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts()) -- new buffer
  end,
}
