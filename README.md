# Neovim Config

Personal Neovim configuration built on top of `LazyVim` and `lazy.nvim`.

## Structure
- [`init.lua`](init.lua): startup entry.
- [`lua/config/lazy.lua`](lua/config/lazy.lua): bootstraps `lazy.nvim` and imports local plugins.
- [`lua/plugins`](lua/plugins): custom plugin specs and overrides.
- [`lazyvim.json`](lazyvim.json): enabled LazyVim extras.
- [`lua/config/neovide_config.lua`](lua/config/neovide_config.lua): Neovide-specific GUI settings.
- [`lua/config/ndx_config.lua`](lua/config/ndx_config.lua): Ndx-specific animations and text glow.

## Current Behavior
- Startup currently loads `config.lazy`, `config.neovide_config`, and `config.ndx_config`.
- `options`, `keymaps`, and `autocmds` follow the standard LazyVim starter layout and are auto-loaded by the startup chain even though `init.lua` does not require them directly.
- `lua/config/options.lua` is active in practice, including settings such as `mapleader = ","`, Python host setup, and macOS PATH adjustments.
- Tree-sitter uses LazyVim's current setup; [`lua/plugins/nvim-treesitter.lua`](lua/plugins/nvim-treesitter.lua) adds the CSS parser. The older direct setup file under `lua/config/plugins/` is inactive.
- Theme selection is managed in [`lua/plugins/colorscheme.lua`](lua/plugins/colorscheme.lua).

## Requirements
- Neovim `>= 0.11` recommended.
- `git` is required for bootstrapping plugins.
- Tree-sitter parser installation needs a C compiler, `curl`, `tar`, and a compatible `tree-sitter` CLI.
- Optional tools such as `npx`, `fzf`, and `fd` improve plugin behavior.

## Windows Notes
- Supported in principle, but you still need the external tools used by your enabled plugins.
- Recommended base tools on Windows:
  - `git`
  - `python3` or `python`
  - `npx` for `markdown-preview.nvim`
  - `fzf` and `fd` for fuzzy finding workflows
  - `lazygit` if you want the git shortcuts exposed by `snacks.nvim`
- Clipboard integration uses `unnamedplus`. This usually works in native Windows Neovim, but may behave differently in WSL or remote terminal setups.
- Ndx and Neovide use ordered font lists with one size per client; Nvy keeps its documented `Primary:h10:Fallback` syntax. For consistent rendering, install at least one listed monospaced font such as `Maple Mono NF CN`, `Cascadia Mono NF`, or `Consolas`.
- Ndx uses `Sarasa Term J NF`, `Maple Mono NF CN`, then `Consolas` at size 11. Its animation settings are in [`lua/config/ndx_config.lua`](lua/config/ndx_config.lua).

## Quick Checks
- Check general health:

```bash
nvim --headless "+checkhealth" +qa
```

- Check Tree-sitter specifically:

```bash
nvim --headless "+checkhealth vim.treesitter" +qa
```

- Check Python provider:

```bash
nvim --headless "+checkhealth provider" +qa
```

## Usage
Clone or link this directory to `~/.config/nvim`, then start Neovim:

```bash
nvim
```

On first launch, `lazy.nvim` will bootstrap automatically if needed.

## Development
- Format Lua files with `stylua`.
- Validate startup with:

```bash
nvim --headless "+checkhealth" +qa
```

- If plugin specs changed, also verify plugin resolution with:

```bash
nvim --headless "+Lazy! sync" +qa
```

- `lazy-lock.json` records resolved plugin revisions. Run `:Lazy restore` to restore those versions on another machine; after an intentional plugin update, review and commit the refreshed lockfile.

## Notes
- The repository may contain local, uncommitted changes during active customization.
- See [`AGENTS.md`](AGENTS.md) for contributor-specific working rules.
