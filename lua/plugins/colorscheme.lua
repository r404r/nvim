-- lua/plugins/colorscheme.lua
-- Active colorscheme: kanagawa. LazyVim's built-in tokyonight and catppuccin stay installed as alternatives
-- for `:colorscheme` (LazyVim configures them, nothing to add here).

return {
  -- Use kanagawa instead of LazyVim's default tokyonight
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },

  -- Kanagawa, loaded on demand by `:colorscheme kanagawa`. Its defaults are used as-is
  -- (theme "wave", italic comments and keywords, bold statements); pass options through `opts` to change them.
  { "rebelot/kanagawa.nvim", lazy = true },
}
