return {
  "folke/snacks.nvim",
  keys = {
    {
      "gd",
      function()
        if #vim.lsp.get_clients({ bufnr = 0 }) == 0 then
          vim.notify("No LSP detected", vim.log.levels.WARN)
          return
        end
        Snacks.picker.lsp_definitions({ jump1 = false })
      end,
      desc = "Goto Definition",
    },
    {
      "gr",
      function()
        if #vim.lsp.get_clients({ bufnr = 0 }) == 0 then
          vim.notify("No LSP detected", vim.log.levels.WARN)
          return
        end
        Snacks.picker.lsp_references({ jump1 = false })
      end,
      desc = "References",
    },
    {
      "gI",
      function()
        if #vim.lsp.get_clients({ bufnr = 0 }) == 0 then
          vim.notify("No LSP detected", vim.log.levels.WARN)
          return
        end
        Snacks.picker.lsp_implementations({ jump1 = false })
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        if #vim.lsp.get_clients({ bufnr = 0 }) == 0 then
          vim.notify("No LSP detected", vim.log.levels.WARN)
          return
        end
        Snacks.picker.lsp_type_definitions({ jump1 = false })
      end,
      desc = "Goto Type Definition",
    },
  },
}
