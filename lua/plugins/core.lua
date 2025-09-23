return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      -- 覆盖 root_dir 函数以正确识别 Maven 多模块项目的根目录
      -- 核心：使用 vim.fs.root 向上搜索 pom.xml 文件
      root_dir = function()
        local root_markers = { "gradlew", ".git", "mvnw" }
        return require("jdtls.setup").find_root(root_markers) or vim.loop.os_homedir()
      end,
      -- 覆盖 JDTLS 启动命令以使用持久化的工作空间数据目录
      -- 避免每次启动都重新索引，提高性能
      full_cmd = function(opts)
        local project_name = opts.project_name(opts.root_dir(vim.api.nvim_buf_get_name(0)))
        local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. project_name

        local cmd = vim.deepcopy(opts.cmd)
        vim.list_extend(cmd, {
          "-data",
          workspace_dir,
        })

        return cmd
      end,
    },
  },
  {
    "gbprod/substitute.nvim",
    vscode = true,
    opts = {
      -- your your comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      require("substitute").setup({
        vim.keymap.set("n", "gs", require("substitute").operator, { desc = "substitute operation", noremap = true }),
        vim.keymap.set("n", "gss", require("substitute").line, { desc = "substitute line", noremap = true }),
        vim.keymap.set("n", "gS", require("substitute").eol, { desc = "substitute eol", noremap = true }),
        vim.keymap.set("x", "gs", require("substitute").visual, { desc = "substitute visual", noremap = true }),
      })
    end,
  },
}
