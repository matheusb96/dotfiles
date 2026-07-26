-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Put mise's shims first on PATH so subprocesses (bundle, rdbg, ruby, bin/rails,
-- node) resolve to each project's pinned toolchain by cwd at exec time. Without
-- this, nvim freezes the PATH it launched with (the global ruby) and test runs /
-- DAP debugging break on projects pinned to a different ruby version.
do
  local shims = vim.fn.expand("~/.local/share/mise/shims")
  if vim.fn.isdirectory(shims) == 1 and not vim.env.PATH:find(shims, 1, true) then
    vim.env.PATH = shims .. ":" .. vim.env.PATH
  end
end
