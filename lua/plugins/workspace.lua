-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  -- Comment plugins
  -- gcc: 行注释当前行
  -- gbc: 使用块级别注释来注释当前行
  -- ngcc: 使用行级别注释来注释当前行往后的几行数据
  -- ngbc: 使用块级别注释来注释掉当前行往后的几行数据
  -- 其它
  --    gc2w: 注释掉最近的两个单词
  --    在V模式下，使用gc 来在进行注释
  -- Kept for blockwise comments (gb / gbc), which Neovim's built-in commenting does not provide.
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
  },

  { "yorumicolors/yorumi.nvim" },

  -- for markdown table
  { "mattn/vim-maketable", cmd = { "MakeTable", "UnmakeTable" } },
}
