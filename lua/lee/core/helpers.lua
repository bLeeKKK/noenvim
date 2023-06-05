local _lazygit = nil
_G._toggle_lazygit = function()
  if vim.fn.executable("lazygit") then
    if not _lazygit then
      _lazygit = require("toggleterm.terminal").Terminal:new({
        cmd = "lazygit",
        direction = "float",
        close_on_exit = true,
        hidden = true,
      })
    end
    _lazygit:toggle()
  else
    vim.notify("Command [lazygit] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
  end
end
