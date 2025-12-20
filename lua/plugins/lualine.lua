-- https://github.com/nvim-lualine/lualine.nvim

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'tokyonight',
        disabled_filetypes = { 'oil', 'neo-tree' },
        globalstatus = true,
      },
      -- TODO: Add diagnostics display
      sections = {
        lualine_b = { { 'filename', newfile_status = true, path = 1 } },
        lualine_c = {},
        lualine_x = {
          {
            'diagnostics',
            -- sources = {'nvim_diagnostic'},
            always_visible = true,
          },
        },
        lualine_y = { 'progress' },

        lualine_z = {
          {
            'location',
            cond = function()
              return vim.v.hlsearch == 0
            end,
          },
          {
            'searchcount',
            cond = function()
              return vim.v.hlsearch == 1
            end,
          },
        },
      },
      -- inactive_sections = {
      --   lualine_b = { { 'filename', path = 1 } },
      --   lualine_c = {},
      -- },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'lsp_status', 'filetype' },
        lualine_y = { 'branch' },
        lualine_z = { { 'datetime', style = 'default' } },
      },
    }
  end,
}
