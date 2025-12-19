-- File Tree
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  },
  lazy = false,
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,

    filesystem = {
      window = {
        mappings = {
          ['<C-\\>'] = 'close_window',
        },
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_ignored = false,
        hide_hidden = false,
        hide_by_name = {
          '.git',
          '.github',
        },
      },

      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  },
}
