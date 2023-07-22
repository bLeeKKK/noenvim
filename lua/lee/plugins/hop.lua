-- import gitsigns plugin safely
local setup, hop = pcall(require, "hop")
if not setup then
  return
end

hop.setup({ keys = "etovxqpdygfblzhckisuran" })
