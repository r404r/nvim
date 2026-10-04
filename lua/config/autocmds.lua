-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function disable_markdown_diagnostics(buf)
  vim.diagnostic.enable(false, { bufnr = buf })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.*" },
  callback = function(args)
    disable_markdown_diagnostics(args.buf)
  end,
})

-- A Markdown file opened on startup may get its FileType before VeryLazy.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  local ft = vim.bo[buf].filetype
  if ft == "markdown" or vim.startswith(ft, "markdown.") then
    disable_markdown_diagnostics(buf)
  end
end
