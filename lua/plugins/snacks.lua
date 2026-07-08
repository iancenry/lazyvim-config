return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules", ".git", ".turbo", "dist" },
        },
        grep = {
          glob = { "!node_modules/", "!.turbo/", "!dist/" },
        },
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules", ".git", ".turbo", "dist" },
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
