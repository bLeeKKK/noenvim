-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status_ok, tokyonight = pcall(require, "tokyonight")

if not status_ok then
  return
end

tokyonight.setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})

vim.cmd([[colorscheme tokyonight]])
