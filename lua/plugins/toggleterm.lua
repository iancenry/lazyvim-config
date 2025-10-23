return {
  "akinsho/toggleterm.nvim",
  opts = {
    -- custom options if needed
  },
  keys = {
    -- Floating terminal
    { "<leader>tT", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
    -- Horizontal split terminal
    { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
  },
}
