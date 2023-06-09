local im_select = function()
  local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true })
  local autocmd = vim.api.nvim_create_autocmd
  -- 自动切换输入法
  autocmd("InsertLeave", {
    group = myAutoGroup,
    callback = require("lee.core.im-select").macInsertLeave,
  })
  autocmd("InsertEnter", {
    group = myAutoGroup,
    callback = require("lee.core.im-select").macInsertEnter,
  })
end

im_select()
