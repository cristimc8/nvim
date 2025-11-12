return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      nginx = { "nginxfmt" },
    },
    formatters = {
      nginxfmt = {
        command = "nginxfmt",
        args = { "-" }, -- read from stdin
        stdin = true,
      },
    },
  },
}
