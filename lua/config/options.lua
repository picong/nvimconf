-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- neovide 配置
if vim.g.neovide then
  vim.o.guifont = "Maple Mono NF CN:h10"
  vim.g.neovide_opacity = 1
  vim.g.transparency = 0.8
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
