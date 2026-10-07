-- Proto: the LSP ships inside the `buf` CLI itself (installed via Mason),
-- nvim-lspconfig already provides the correct `buf lsp serve` cmd.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        buf_ls = {},
      },
    },
  },
}