-- Insert mode <S-Tab>: jump back in a snippet, otherwise remove one indent level.
-- Without this, blink.cmp falls back to Vim's default <S-Tab>, which inserts a Tab.
return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<S-Tab>"] = {
          "snippet_backward",
          function()
            return vim.keycode("<C-d>")
          end,
        },
      },
    },
  },
}
