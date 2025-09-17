return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    local wk = require("which-key")

    wk.add({
      { "<leader>w",  group = "Window" },
      { "<leader>w-", "<cmd>split<cr>",  desc = "Horizontal Split" },
      { "<leader>w|", "<cmd>vsplit<cr>", desc = "Vertical Split" },
    })
  end,
}
