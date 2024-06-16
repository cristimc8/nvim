-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- get the caps lock status

function Capslock()
  local status = vim.fn.system("xset q | grep Caps | awk '{print $4}'")
  return (status == "on\n" or status == "on")
end

function Update_winbar()
  vim.opt.winbar = "%=%m %f" .. (Capslock() and " [CAPS]" or "")
end

Update_winbar()

vim.cmd([[
  augroup capslock_update
    autocmd!
    autocmd CursorHold * lua Update_winbar()
  augroup END
]])

vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.g.autoformat = false
vim.opt.commentstring = "// %s"
