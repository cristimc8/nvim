return {
  {
    "backdround/global-note.nvim",
    cmd = "GlobalNote",
    keys = {
      { "<leader>gn", "<CMD>GlobalNote<CR>", desc = "Global Notes" },
    },
    config = function()
      require("global-note").setup()
    end,
  },
}
