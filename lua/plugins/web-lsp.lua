return {
  -- Mason: ensure common web servers installed + auto-install on FileType with notify
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css-lsp",
        "emmet-language-server",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "tailwindcss-language-server",
        "vtsls",
        "yaml-language-server",
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
    },
  },

  -- Treesitter: ensure parsers + auto_install
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "scss",
        "tsx",
        "typescript",
        "yaml",
      })
      opts.auto_install = true
    end,
  },

  -- Notify + auto-install when opening unknown filetype
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local ft_to_server = {
        typescript = "vtsls",
        javascript = "vtsls",
        typescriptreact = "vtsls",
        javascriptreact = "vtsls",
        html = "html",
        css = "cssls",
        scss = "cssls",
        json = "jsonls",
        jsonc = "jsonls",
        yaml = "yamlls",
      }

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("web_lsp_auto_install", { clear = true }),
        callback = function(args)
          local ft = args.match
          local server = ft_to_server[ft]
          if not server then
            return
          end
          if #vim.lsp.get_clients({ bufnr = args.buf }) > 0 then
            return
          end
          local ok, registry = pcall(require, "mason-registry")
          if not ok then
            return
          end
          if not registry.has_package(server) then
            return
          end
          local pkg = registry.get_package(server)
          if not pkg:is_installed() then
            vim.notify("Installing LSP for " .. ft .. " (" .. server .. ")...", vim.log.levels.INFO)
            pkg:install()
          end
        end,
      })
    end,
  },
}
