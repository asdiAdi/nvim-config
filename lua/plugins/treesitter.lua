-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter-context
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
        -- Some langjjages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      incremental_selection = { -- select inside, then upwards incrementally
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = false,
          node_decremental = '<c-s-space>',
        },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },

  { -- UI at the top, showing all the scope you are currently into. Disabled for now.
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup { enable = false }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
      }

      -- SELECT
      local select = require('nvim-treesitter-textobjects.select').select_textobject
      vim.keymap.set({ 'x', 'o' }, 'aa', function()
        select('@parameter.outer', 'textobjects')
      end, { desc = 'parameter' })
      vim.keymap.set({ 'x', 'o' }, 'ia', function()
        select('@parameter.inner', 'textobjects')
      end, { desc = 'inner parameter' })
      vim.keymap.set({ 'x', 'o' }, 'af', function()
        select('@function.outer', 'textobjects')
      end, { desc = 'function' })
      vim.keymap.set({ 'x', 'o' }, 'if', function()
        select('@function.inner', 'textobjects')
      end, { desc = 'inner function' })
      vim.keymap.set({ 'x', 'o' }, 'ac', function()
        select('@class.outer', 'textobjects')
      end, { desc = 'class' })
      vim.keymap.set({ 'x', 'o' }, 'ic', function()
        select('@class.inner', 'textobjects')
      end, { desc = 'inner class' })

      -- SWAP
      local swap_next = require('nvim-treesitter-textobjects.swap').swap_next
      local swap_previous = require('nvim-treesitter-textobjects.swap').swap_previous
      vim.keymap.set('n', '<leader>]aa', function()
        swap_next '@parameter.outer'
      end, { desc = 'swap next parameter' })
      vim.keymap.set('n', '<leader>[aa', function()
        swap_previous '@parameter.outer'
      end, { desc = 'swap previous parameter' })
      vim.keymap.set('n', '<leader>]ia', function()
        swap_next '@parameter.inner'
      end, { desc = 'swap next inner parameter' })
      vim.keymap.set('n', '<leader>[ia', function()
        swap_previous '@parameter.inner'
      end, { desc = 'swap previous inner parameter' })

      vim.keymap.set('n', '<leader>]af', function()
        swap_next '@function.outer'
      end, { desc = 'swap next function' })
      vim.keymap.set('n', '<leader>[af', function()
        swap_previous '@function.outer'
      end, { desc = 'swap previous function' })
      vim.keymap.set('n', '<leader>]if', function()
        swap_next '@function.inner'
      end, { desc = 'swap next inner function' })
      vim.keymap.set('n', '<leader>[if', function()
        swap_previous '@function.inner'
      end, { desc = 'swap previous inner function' })

      vim.keymap.set('n', '<leader>]ac', function()
        swap_next '@class.outer'
      end, { desc = 'swap next class' })
      vim.keymap.set('n', '<leader>[ac', function()
        swap_previous '@class.outer'
      end, { desc = 'swap previous class' })
      vim.keymap.set('n', '<leader>]ic', function()
        swap_next '@class.inner'
      end, { desc = 'swap next inner class' })
      vim.keymap.set('n', '<leader>[ic', function()
        swap_previous '@class.inner'
      end, { desc = 'swap previous inner class' })

      -- SWAP SHORTCUTS
      -- a = parameter, f = function c = class
      -- swap inner p[a]rameter (next, prev)
      vim.keymap.set('n', '<leader>a', function()
        swap_next '@parameter.inner'
      end, { desc = 'swap next p[a]rameter' })
      vim.keymap.set('n', '<leader>A', function()
        swap_previous '@parameter.inner'
      end, { desc = 'swap previous p[a]rameter' })
      -- swap outer [f]unction (next, prev)
      vim.keymap.set('n', '<leader>f', function()
        swap_next '@function.outer'
      end, { desc = 'swap next [f]unction' })
      vim.keymap.set('n', '<leader>F', function()
        swap_previous '@function.outer'
      end, { desc = 'swap previous [f]unction' })

      -- MOVE
      local goto_next_start = require('nvim-treesitter-textobjects.move').goto_next_start
      local goto_next_end = require('nvim-treesitter-textobjects.move').goto_next_end
      local goto_previous_start = require('nvim-treesitter-textobjects.move').goto_previous_start
      local goto_previous_end = require('nvim-treesitter-textobjects.move').goto_previous_end
      -- param
      vim.keymap.set({ 'n', 'x', 'o' }, ']a', function()
        goto_next_start('@parameter.inner', 'textobjects')
      end, { desc = 'goto next parameter' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[a', function()
        goto_previous_start('@parameter.inner', 'textobjects')
      end, { desc = 'goto previous parameter' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']A', function()
        goto_next_end('@parameter.inner', 'textobjects')
      end, { desc = 'goto next parameter end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[A', function()
        goto_previous_end('@parameter.inner', 'textobjects')
      end, { desc = 'goto previous parameter end' })
      -- function
      vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
        goto_next_start('@function.outer', 'textobjects')
      end, { desc = 'goto next function' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
        goto_previous_start('@function.outer', 'textobjects')
      end, { desc = 'goto previous function' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
        goto_next_end('@function.outer', 'textobjects')
      end, { desc = 'goto next function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
        goto_previous_end('@function.outer', 'textobjects')
      end, { desc = 'goto previous function end' })
      -- fold
      vim.keymap.set({ 'n', 'x', 'o' }, ']z', function()
        goto_next_start('@fold', 'folds')
      end, { desc = 'goto next fold' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[z', function()
        goto_previous_start('@fold', 'folds')
      end, { desc = 'goto previous fold' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']Z', function()
        goto_next_end('@fold', 'folds')
      end, { desc = 'goto next fold end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[Z', function()
        goto_previous_end('@fold', 'folds')
      end, { desc = 'goto previous fold end' })
      -- conditional
      vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
        goto_next_start('@conditional.outer', 'textobjects')
      end, { desc = 'goto next conditional' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
        goto_previous_start('@conditional.outer', 'textobjects')
      end, { desc = 'goto previous conditional' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']C', function()
        goto_next_end('@conditional.outer', 'textobjects')
      end, { desc = 'goto next conditional end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[C', function()
        goto_previous_end('@conditional.outer', 'textobjects')
      end, { desc = 'goto previous conditional end' })

      -- REPEAT MOVEMENT WITH ; and ,
      local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
    end,
  },
}
