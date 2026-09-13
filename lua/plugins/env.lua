return {
  -- LazyVim's dot extra maps .env.* files to filetype "sh", which makes
  -- bashls + shellcheck produce false diagnostics on non-shell env files.
  -- Override to "dosini" (koanf-style ENV = "value" syntax, no diagnostics).
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      vim.filetype.add({
        pattern = {
          [".env"] = "dosini",
          [".*%.env.*"] = "dosini",
        },
      })
    end,
  },
}