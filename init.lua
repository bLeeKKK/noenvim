require("lee.plugins-setup")

-- 核心配置
require("lee.core.helpers")
require("lee.core.options")
require("lee.core.keymaps")
require("lee.core.colorscheme")

-- 工具
require("lee.utils.im-select")

-- 插件配置
require("lee.plugins.comment")
require("lee.plugins.nvim-tree")
require("lee.plugins.lualine")
require("lee.plugins.telescope")
require("lee.plugins.nvim-cmp")
require("lee.plugins.lsp.mason")
require("lee.plugins.lsp.lspsaga")
require("lee.plugins.lsp.lspconfig")
require("lee.plugins.lsp.null-ls")
require("lee.plugins.autopairs")
require("lee.plugins.treesitter")
require("lee.plugins.gitsigns")
require("lee.plugins.toggleterm")
require("lee.plugins.copilot")
require("lee.plugins.cleverf")
require("lee.plugins.comment")
require("lee.plugins.bufferline")

-- 打印信息
print("Lee's NeoVim config loaded!")
