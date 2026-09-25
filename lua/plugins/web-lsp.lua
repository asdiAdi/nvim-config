return {
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
    end,
  },
}
