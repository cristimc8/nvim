return { -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = { -- make sure mason installs the server
      servers = { angularls = {
        root_dir = require("lspconfig/util").root_pattern("angular.json", "project.json"),
      } },
    },
  },
}
