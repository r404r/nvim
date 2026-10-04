return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.markdown = {}
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.markdown = { "prettier", "markdown-toc" }
      opts.formatters_by_ft["markdown.mdx"] = { "prettier", "markdown-toc" }
    end,
  },
}
