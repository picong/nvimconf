-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
if vim.g.vscode then
  -- ===========================================================================
  -- VS Code 专用配置
  -- ===========================================================================

  -- vim.keymap.set("n", "<leader>/", [[<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>]])
  -- vim.keymap.set("n", "<leader>ss", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])
  --
  -- -- Keep undo/redo lists in sync with VsCode
  -- vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
  -- 示例：调用VS Code命令的键绑定
  -- 映射<leader>e以切换VS Code文件资源管理器
  vim.api.nvim_set_keymap(
    "n",
    "<leader>e",
    ':lua require("vscode").action("workbench.action.toggleSidebarVisibility")<CR>',
    { noremap = true, silent = true }
  )

  -- 格式化选中的行
  vim.api.nvim_set_keymap(
    "n",
    "<leader>gs",
    '<Cmd>lua require("vscode").action("editor.action.formatSelection")<CR>',
    { noremap = true, silent = true }
  )

  vim.api.nvim_set_keymap(
    "n",
    "<Leader>gb",
    '<Cmd>lua require("vscode").action("gitlens.toggleFileBlame")<CR>',
    { noremap = true, silent = true }
  )
end
