-- return {}
return {
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = false,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local colors = require("cyberdream.colors").default
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = false,

        theme = {
          highlights = {
            Constant = { fg = colors.magenta },
          },
        },
      })
      -- vim.cmd("colorscheme cyberdream")
    end,
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "ray-x/aurora",
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    config = function()
      -- override defaults
      vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      -- vim.cmd([[colorscheme tokyodark]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aurora",
    },
  },
}
