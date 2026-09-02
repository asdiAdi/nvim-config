return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        timeout = 10000,
      },
      picker = {
        sources = {
          files = {
            hidden = true,
            -- ignored = true,
          },
          explorer = {
            hidden = true,
            -- ignored = true,
          },
        },
        exclude = { "node_modules" },
      },
    },
  },
}
