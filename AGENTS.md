# AGENTS.md

## Project Overview
- This repository is a personal Neovim configuration based on `LazyVim` and `lazy.nvim`.
- Entry point is [`init.lua`](init.lua). It currently loads `config.lazy`, `config.neovide_config`, and `config.ndx_config`.
- [`lua/config/options.lua`](lua/config/options.lua), [`lua/config/keymaps.lua`](lua/config/keymaps.lua), and [`lua/config/autocmds.lua`](lua/config/autocmds.lua) follow the LazyVim starter layout and are auto-loaded by the startup chain even though `init.lua` does not require them directly.
- Plugin specs live under [`lua/plugins`](lua/plugins). Custom plugin behavior should usually be added there instead of editing LazyVim upstream defaults directly.

## Current Layout
- [`init.lua`](init.lua): startup entry.
- [`lua/config/lazy.lua`](lua/config/lazy.lua): bootstraps `lazy.nvim` and imports `lazyvim.plugins` plus local `plugins`.
- [`lazyvim.json`](lazyvim.json): enabled LazyVim extras.
- [`lua/plugins/colorscheme.lua`](lua/plugins/colorscheme.lua): colorscheme setup and final theme selection.
- [`lua/plugins/snacks.lua`](lua/plugins/snacks.lua): `snacks.nvim` feature toggles and keymaps.
- [`lua/plugins/lualine.lua`](lua/plugins/lualine.lua) and [`lua/config/plugins/lualine-config.lua`](lua/config/plugins/lualine-config.lua): statusline setup.
- [`lua/plugins/nvim-treesitter.lua`](lua/plugins/nvim-treesitter.lua): active Treesitter plugin spec.
- [`lua/config/ndx_config.lua`](lua/config/ndx_config.lua): Ndx-only animations and text glow.
- [`lua/config/plugins/nvim-treesitter.lua`](lua/config/plugins/nvim-treesitter.lua): older direct setup file; currently not loaded from `init.lua`.
- [`lua/plugins/example.lua`](lua/plugins/example.lua): LazyVim sample file, effectively disabled via `if true then return {} end`.
- [`stylua.toml`](stylua.toml): formatting uses spaces, width 2, column width 120.

## Working Rules
- Preserve the LazyVim-first structure. Prefer extending or overriding via plugin specs in `lua/plugins/*.lua`.
- Do not add manual `require(...)` calls for `config.options`, `config.keymaps`, or `config.autocmds`; keep them on the standard LazyVim autoload path.
- [`lua/config/plugins/nvim-treesitter.lua`](lua/config/plugins/nvim-treesitter.lua) is different: it is currently inactive because its direct `require` line in [`init.lua`](init.lua) is commented out.
- Avoid duplicating configuration in two places. If a setting already exists in an active plugin spec, modify that source instead of the inactive legacy file.
- Keep Lua modules small and focused. New plugin definitions should usually get their own file in `lua/plugins/`.
- Follow existing Lua style in this repo: 2-space indentation, concise comments, no unnecessary abstractions.
- Keep comments and docs short. English is preferred for new comments unless the surrounding file is already predominantly Chinese or Japanese.

## Plugin-Specific Notes
- Theme selection is finalized in [`lua/plugins/colorscheme.lua`](lua/plugins/colorscheme.lua). If changing the active colorscheme, update the LazyVim `opts.colorscheme` value there.
- Treesitter parser additions belong in [`lua/plugins/nvim-treesitter.lua`](lua/plugins/nvim-treesitter.lua); keep LazyVim's current plugin setup and avoid the inactive direct setup file unless explicitly reviving it.
- `lualine` customization should stay in [`lua/config/plugins/lualine-config.lua`](lua/config/plugins/lualine-config.lua) because [`lua/plugins/lualine.lua`](lua/plugins/lualine.lua) delegates to it.
- `snacks.nvim` is loaded eagerly (`lazy = false`) and already defines several keymaps. Check for key collisions before adding more mappings.
- Neovide settings belong in [`lua/config/neovide_config.lua`](lua/config/neovide_config.lua); Ndx settings belong in [`lua/config/ndx_config.lua`](lua/config/ndx_config.lua).

## Validation
- Run `stylua` on changed Lua files when available.
- Use `nvim --headless "+Lazy! sync" +qa` only when plugin metadata or plugin specs changed and you need to verify startup/plugin resolution.
- Use `nvim --headless "+checkhealth" +qa` for broader environment checks when the change touches providers, Treesitter, clipboard, or external tooling.
- If testing startup behavior, verify against the real entry path in [`init.lua`](init.lua), not against inactive config files.

## Git And Safety
- The worktree may already contain user changes. Check `git status` before editing and do not overwrite unrelated modifications.
- Prefer additive, minimal edits. This is a personal config repo, so avoid broad refactors unless explicitly requested.
- If a task appears to require choosing between the active Treesitter path and the legacy direct-config path, call that out explicitly before making a larger structural change.
