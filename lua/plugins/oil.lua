-- File Tree
-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
      --'permissions',
      'size',
      'mtime',
    },
    delete_to_trash = true,
    watch_for_changes = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        if name == '.git' or name == '.github' then
          return true
        end

        return false
      end,
    },
    keymaps = {
      ['\\'] = { 'actions.close', mode = 'n' },
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
}
