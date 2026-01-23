-- https://github.com/olimorris/codecompanion.nvim

return {
  'olimorris/codecompanion.nvim',
  version = '^18.0.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    adapters = {
      adapters = {
        acp = {
          codex = function()
            return require('codecompanion.adapters').extend('codex', {
              defaults = {
                auth_method = 'codex-api-key',
              },
              env = {
                CODEX_API_KEY = 'CODEX_API_KEY',
              },
            })
          end,
        },
      },
      http = {
        openai = function()
          return require('codecompanion.adapters').extend('openai', {
            env = {
              api_key = 'OPENAI_API_KEY',
            },
            schema = {
              model = {
                default = 'gpt-3.5-turbo',
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = 'copilot',
        opts = {
          ---Decorate the user message before it's sent to the LLM
          -- prompt_decorator = function(message, adapter, context)
          -- return string.format([[<prompt>%s</prompt>]], message)
          -- end,
        },
      },
      -- Or, just specify the adapter by name
      inline = {
        adapter = 'copilot',
      },
      cmd = {
        adapter = 'copilot',
      },
      background = 'copilot',
    },
  },
}
