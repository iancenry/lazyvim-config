return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      -- golangci-lint must run from the Go module root (go.mod dir), not from
      -- nvim's cwd. Launched from the monorepo root it finds no module, falls
      -- back to a temp module, and reports bogus "no required module provides
      -- package" / "undefined" errors for every dependency.
      golangcilint = {
        cmd = "bash",
        args = {
          "-c",
          function()
            local file = vim.api.nvim_buf_get_name(0)
            local root = vim.fs.root(file, "go.mod")
            local flags = table.concat({
              "--output.json.path=stdout",
              "--output.text.path=",
              "--issues-exit-code=0",
              "--show-stats=false",
              "--path-mode=abs",
            }, " ")
            if not root then
              -- standalone file without a module: lint the file directly
              return ("golangci-lint run %s %s"):format(flags, vim.fn.shellescape(file))
            end
            -- Lint the file's directory so the whole package is analyzed;
            -- single-file scope makes `unused` report false positives when the
            -- callers live in other files of the same package.
            local dir = vim.fn.fnamemodify(file, ":h")
            return ("cd %s && golangci-lint run %s %s"):format(
              vim.fn.shellescape(root),
              flags,
              vim.fn.shellescape(dir)
            )
          end,
        },
      },
    },
  },
}
