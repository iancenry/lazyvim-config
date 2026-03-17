return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false }, -- Disable, using blink-copilot instead
        panel = { enabled = true },
        filetypes = {
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = true,
          ["*"] = true,
        },
      })
    end,
  },

  -- Disable copilot-cmp (incompatible with blink.cmp)
  { "zbirenbaum/copilot-cmp", enabled = false },
}
