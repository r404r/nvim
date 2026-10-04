if vim.g.ndx ~= 1 then
  return
end

-- Ndx 动画默认关闭。可在 Neovim 的 Lua 配置中启用：
vim.g.ndx_cursor_animation = true
vim.g.ndx_cursor_vfx_mode = "railgun" -- 也可以传入列表，例如 { "railgun", "sonicboom" }
vim.g.ndx_scroll_animation = true
-- vim.g.ndx_neon_text = true -- 文字霓虹光晕，默认关闭
-- vim.g.ndx_neon_radius = 4.0 -- 外层光晕范围，单位像素（0.5–40）
-- vim.g.ndx_neon_intensity = 1.0 -- 光晕强度（0–2）
