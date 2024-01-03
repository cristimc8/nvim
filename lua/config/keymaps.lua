-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- map d to only delete, not cut the selection
map("n", "d", '"_d', { noremap = true })
map("v", "d", '"_d', { noremap = true })
