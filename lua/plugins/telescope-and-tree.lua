-- lua/plugins/telescope-and-tree.lua
return {
  -- If you prefer nvim-tree over LazyVim's neo-tree, disable neo-tree:
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Telescope: put ripgrep args & ignore rules here
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        -- Lua patterns (not globs)
        file_ignore_patterns = { "%.git/", "node_modules/", ".output/" },
        -- ripgrep args (these ARE globs where applicable)
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob",
          "!**/.git/*",
          "--glob",
          "!**/node_modules/*",
          "--glob",
          "!**/.output/*",
          "--glob",
          "**/.env*",
        },
      })
      return opts
    end,
  },

  -- nvim-tree (only if you actually use it)
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      filters = {
        dotfiles = false,
        -- nvim-tree uses Lua patterns for “custom”
        custom = { "^%.git$", "node_modules", "^%.cache$" },
      },
      git = { enable = true, ignore = false },
      renderer = { group_empty = true },
      view = { width = 32 },
    },
  },
}
