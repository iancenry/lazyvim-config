return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  cmd = "CopilotChat",
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      auto_insert_mode = true,
      headers = {
        user = "  " .. user .. " ",
        assistant = "  Copilot ",
        tool = "󰊳  Tool ",
      },
      window = {
        width = 0.4,
      },
    }
  end,
  keys = {
    {
      "<C-s>", -- Use Ctrl+S to submit
      function()
        require("CopilotChat").send()
      end,
      ft = "copilotchat",
      desc = "Submit Prompt",
      silent = true,
      remap = true,
    },
    {
      "<leader>aa",
      function()
        require("CopilotChat").toggle()
      end,
      desc = "Toggle (CopilotChat)",
      mode = { "n", "x" },
      silent = true,
    },
    {
      "<leader>ax",
      function()
        require("CopilotChat").reset()
      end,
      desc = "Clear (CopilotChat)",
      mode = { "n", "x" },
      silent = true,
    },
    {
      "<leader>aq",
      function()
        vim.ui.input({ prompt = "Quick Chat: " }, function(input)
          if input and input ~= "" then
            require("CopilotChat").ask(input)
          end
        end)
      end,
      desc = "Quick Chat (CopilotChat)",
      mode = { "n", "x" },
      silent = true,
    },
    {
      "<leader>ap",
      function()
        require("CopilotChat").select_prompt()
      end,
      desc = "Prompt Actions (CopilotChat)",
      mode = { "n", "x" },
      silent = true,
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "copilotchat" then
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end
      end,
    })

    chat.setup(opts)
  end,
}
