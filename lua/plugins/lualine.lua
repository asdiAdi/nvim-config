-- https://github.com/nvim-lualine/lualine.nvim

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'tokyonight',
        disabled_filetypes = { 'oil', 'neo-tree' },
      },
      -- TODO: Add diagnostics display
      sections = {
        lualine_b = { { 'filename', path = 1 } },
        lualine_c = {},
      },
      inactive_sections = {
        lualine_b = { { 'filename', path = 1 } },
        lualine_c = {},
      },

      tabline = {
        lualine_a = { { 'buffers', mode = 4 } },
        -- lualine_b = { 'branch' },
        -- lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = { 'branch' },
        lualine_z = { { 'datetime', style = 'default' } },
      },
    }
  end,
}
