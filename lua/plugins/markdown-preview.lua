return {
    -- Install markdown preview, use npx if available.
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
        if vim.fn.executable("npx") == 1 then
            local result = vim.system({ "npx", "--yes", "yarn", "install" }, {
                cwd = plugin.dir .. "/app",
                text = true,
            }):wait()
            if result.code ~= 0 then
                error(result.stderr ~= "" and result.stderr or "markdown-preview.nvim install failed")
            end
        else
            vim.fn["mkdp#util#install"]()
        end
    end,
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
        { "<Leader>mp", "<Plug>MarkdownPreview", desc = "Markdown Preview" },
        { "<Leader>mt", "<Plug>MarkdownPreviewToggle", desc = "Markdown Preview Toggle" },
        { "<Leader>ms", "<Plug>MarkdownPreviewStop", desc = "Markdown Preview Stop" },
    },
}
