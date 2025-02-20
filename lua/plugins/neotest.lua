return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
    },
    config = function()
      local function find_package_json_dir(start_dir)
        local path = vim.fn.fnamemodify(start_dir, ":p:h")
        while path and path ~= "/" do
          if vim.fn.glob(path .. "/package.json") ~= "" then
            return path
          end
          path = vim.fn.fnamemodify(path, ":h")
        end
        return nil
      end

      -- Function to find jest config file, either jest-e2e.json or jest.config.json
      local function find_jest_config_file()
        local search_paths = {
          "jest-e2e.json",
          "jest.config.json",
          "jest.config.ts",
          "jest.config.js",
        }

        for _, file in ipairs(search_paths) do
          local found_file = vim.fn.findfile(file, vim.fn.expand("%:p:h") .. ";")
          if found_file ~= "" then
            return vim.fn.fnamemodify(found_file, ":p")
          end
        end

        return nil -- Return nil if no config file is found
      end

      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npx jest",
            jestConfigFile = find_jest_config_file(), -- Use the function to find jest config file
            env = { CI = "true" },
            cwd = function()
              local buffer_dir = vim.fn.expand("%:p:h")
              return find_package_json_dir(buffer_dir) or vim.fn.getcwd()
            end,
          }),
        },
        discovery = {
          enabled = function(file_path)
            -- Match both ".spec.ts" and "-spec.ts" files
            return file_path:match("%.spec%.ts$") or file_path:match("%-spec%.ts$")
          end,
        },
      })
    end,
  },
}
