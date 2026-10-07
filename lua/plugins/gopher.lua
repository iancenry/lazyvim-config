return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    -- Install/update Go tools (gomodifytags, impl, gotests, iferr, json2go)
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@type gopher.Config
    opts = {
      log_level = vim.log.levels.INFO,
      timeout = 2000,
      gotests = {
        template = "default",
        template_dir = nil,
        named = false,
      },
      gotag = {
        transform = "snakecase",
        default_tag = "json",
        option = nil,
      },
      iferr = {
        message = nil,
      },
      json2go = {
        interactive_cmd = "vsplit",
        type_name = nil,
      },
    },
    keys = {
      { "<leader>cge", "<cmd>GoIfErr<cr>", desc = "Go: if err != nil", ft = "go" },
      { "<leader>cgt", "<cmd>GoTagAdd json<cr>", desc = "Go: add json tags", ft = "go" },
      { "<leader>cgT", "<cmd>GoTagRm json<cr>", desc = "Go: remove json tags", ft = "go" },
      { "<leader>cgy", "<cmd>GoTagAdd yaml<cr>", desc = "Go: add yaml tags", ft = "go" },
      { "<leader>cgc", "<cmd>GoCmt<cr>", desc = "Go: generate doc comment", ft = "go" },
      { "<leader>cgi", "<cmd>GoImpl<cr>", desc = "Go: implement interface", ft = "go" },
      { "<leader>cgn", "<cmd>GoNew<cr>", desc = "Go: generate constructor", ft = "go" },
      { "<leader>cgj", "<cmd>GoJson<cr>", desc = "Go: json to struct", ft = "go" },
      { "<leader>cgta", "<cmd>GoTestAdd<cr>", desc = "Go: generate test for func", ft = "go" },
      { "<leader>cgtA", "<cmd>GoTestsAll<cr>", desc = "Go: generate tests for file", ft = "go" },
      { "<leader>cgte", "<cmd>GoTestsExp<cr>", desc = "Go: generate tests (exported)", ft = "go" },
      { "<leader>cgg", "<cmd>GoGenerate<cr>", desc = "Go: go generate", ft = "go" },
      { "<leader>cgm", "<cmd>GoMod tidy<cr>", desc = "Go: go mod tidy", ft = "go" },
    },
  },

  -- Ensure Go parsers are installed (gopher.nvim needs the `go` parser)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "go",
        "gomod",
        "gowork",
        "gosum",
      })
    end,
  },
}
