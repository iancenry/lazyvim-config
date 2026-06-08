return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = 20,
    open_mapping = false,
    start_in_insert = true,
    persist_size = true,
    shade_terminals = false,
    auto_scroll = true,
    close_on_exit = true,
    on_create = function(term)
      term.display_name = "Terminal"
      if term:is_float() and term.window and vim.api.nvim_win_is_valid(term.window) then
        local ui = require("toggleterm.ui")
        vim.api.nvim_win_set_config(term.window, ui._get_float_config(term, false))
      end
    end,
    highlights = {
      FloatBorder = { link = "FloatBorder" },
    },
    float_opts = {
      border = "curved",
      winblend = 0,
      title_pos = "center",
      width = function()
        return math.floor(vim.o.columns * 0.85)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
    },
  },
  keys = {
    -- Floating terminal
    { "<leader>tT", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
    -- Horizontal split terminal
    { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
  end,
}
