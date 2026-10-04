-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local set = vim.opt
local fn = vim.fn

local utils = require("config.utils")

------------------------------------------------------------------------
--                          custom variables                          --
------------------------------------------------------------------------
vim.g.is_win = (utils.has("win32") or utils.has("win64")) and true or false
vim.g.is_linux = (utils.has("unix") and (not utils.has("macunix"))) and true or false
vim.g.is_mac = utils.has("macunix") and true or false

vim.g.logging_level = "info"
vim.g.minianimate_disable = true

------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0 -- Disable perl provider
vim.g.loaded_ruby_provider = 0 -- Disable ruby provider
vim.g.loaded_node_provider = 0 -- Disable node provider
vim.g.did_install_default_menus = 1 -- do not load menu

-- Windows fallback used only when Neovim cannot resolve a Python host from PATH.
-- Replace this template with a real absolute path on Windows if `python3`/`python` are not discoverable.
local windows_python_fallback = [[C:\Users\YOUR_USERNAME\AppData\Local\Programs\Python\Python312\python.exe]]

-- Prefer automatic discovery first, and only fall back to a fixed Windows path as a last resort.
if utils.executable("python3") then
  vim.g.python3_host_prog = fn.exepath("python3")
elseif vim.g.is_win and utils.executable("python") then
  vim.g.python3_host_prog = fn.exepath("python")
elseif vim.g.is_win and vim.uv.fs_stat(windows_python_fallback) then
  vim.g.python3_host_prog = windows_python_fallback
else
  vim.notify("Python host not found in PATH; Python provider will be unavailable.", vim.log.levels.WARN)
end

-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader = ","

---------------- vim options  ----------------

if vim.g.ndx == 1 then
  -- Ndx 用配置， https://github.com/fanlusky/Ndx
  -- 列表中第一个已安装的字体作为主字体，后续字体用于补齐缺失字形。:h12 用于指定字号。Lua 写法如下：
  vim.opt.guifont = { "Sarasa Term J NF", "Maple Mono NF CN", "Consolas", ":h11" }
elseif vim.g.is_mac then
  vim.o.guifont = "UDEV Gothic NF,Monaco,Menlo:h12"
elseif vim.g.nvy == 1 then -- for nvy gui client
  vim.o.guifont = "UDEV Gothic 35NFLG:h10:Consolas"
else
  vim.o.guifont = "Sarasa Fixed CL Nerd Font SemiB,Maple Mono NF CN,Consolas:h10"
end

set.scrolloff = 10

-- Tabs/spaces
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.smartindent = true

-- Clipboard
set.clipboard = "unnamedplus"

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

-- lua/config/options.lua
vim.opt.termguicolors = true -- 启用真彩色支持
vim.opt.background = "dark" -- 设置深色/浅色背景

-- 解决找不到 fzf, fd 等的问题.
if vim.g.is_mac then
  -- 在你的 init.lua 或相关配置文件中
  vim.env.PATH = vim.env.PATH .. ":/usr/local/bin:/opt/homebrew/bin" -- 添加可能的 fzf 路径
end
-- ,a:Cursor means in all modes hl group Cursor is applied
--vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor"
