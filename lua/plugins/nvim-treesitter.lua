return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if not vim.tbl_contains(opts.ensure_installed, "css") then
      table.insert(opts.ensure_installed, "css")
    end
  end,
}
