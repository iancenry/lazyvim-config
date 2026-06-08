return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
    terminal = {
      win = {
        border = "rounded",
        position = "float",
        backdrop = 60,
        width = 0.85,
        height = 0.8,
      },
    },
  },
}
