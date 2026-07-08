return {
  "sindrets/diffview.nvim",
  opts = {
    enhanced_diff_hl = true,
    file_panel = {
      win_config = {
        position = "left",
        width = 35,
      },
    },
  },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
    { "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview file history" },
  },
}
