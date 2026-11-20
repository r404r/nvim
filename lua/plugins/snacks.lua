-- Only the snacks.nvim settings that differ from LazyVim.
-- LazyVim already enables bigfile, dashboard, notifier, quickfile, statuscolumn and words, and maps most
-- Snacks features in `lazyvim/config/keymaps.lua` (toggles, git, terminal, buffers). Check there before adding keys.
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    scratch = {
      win = {
        wo = {
          wrap = true, -- Wrap long lines in scratch notes
          linebreak = true, -- Break at word boundaries, not mid-word
          breakindent = true, -- Keep wrapped lines aligned with the first line
        },
      },
    },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    {
      "<leader>gJ",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      -- Global on purpose: LazyVim only maps this when an LSP server supports file renames.
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command
      end,
    })
  end,
}
