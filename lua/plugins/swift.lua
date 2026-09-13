-- Swift: sourcekit-lsp ships with Xcode (Mason can't provide it),
-- so this wires the toolchain binary directly.
-- Needs: brew install swift-format swiftlint
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          cmd = { "xcrun", "sourcekit-lsp" },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- LazyVim declares opts_extend for ensure_installed,
    -- so this merges with the defaults instead of replacing them.
    opts = {
      ensure_installed = { "swift" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        swift = { "swift_format" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        swift = { "swiftlint" },
      },
    },
  },
}
