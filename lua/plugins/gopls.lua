return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            -- staticcheck runs via golangci-lint (editor lint + CI); disabling
            -- it in gopls avoids duplicate analysis and ~900MB of RAM.
            staticcheck = false,
          },
        },
      },
    },
  },
}
