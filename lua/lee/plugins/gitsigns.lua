-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- configure/enable gitsigns
gitsigns.setup()

-- 参考文档
-- https://github.com/lewis6991/gitsigns.nvim
