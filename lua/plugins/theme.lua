-- Theme
-- https://github.com/folke/tokyonight.nvim

-- :Telescope colorscheme
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
