return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    local wk = require("which-key")

    wk.register({
      w = {
        name = "Window",
        ["|"] = { "<cmd>vsplit<cr>", "Vertical Split" },
        ["-"] = { "<cmd>split<cr>", "Horizontal Split" },
      },
    }, { prefix = "<leader>" })
  end,
}
