return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true },
        panel = { enabled = true },
        filetypes = {
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = true,
          ["*"] = true, -- enable for all other filetypes
        },
      })
    end,
  },

  -- Optional: bridge Copilot with nvim-cmp (autocomplete)
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
