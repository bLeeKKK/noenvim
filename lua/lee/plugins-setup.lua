-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Have packer use a popup window
-- packer.init({
--   display = {
--     open_fn = function()
--       return require("packer.util").float({ border = "rounded" })
--     end,
--   },
-- })

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/popup.nvim")

  -- use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  use("folke/tokyonight.nvim") -- preferred colorscheme

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  -- 修改目标周围(https://github.com/kylechui/nvim-surround?tab=readme-ov-file)
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })
  -- use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  --  打注释
  use("numToStr/Comment.nvim")

  -- 文件资源管理器
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- 依赖关系以获得更好的排序性能
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- 模糊查找器
  -- use({ "nvim-telescope/telescope-live-grep-args.nvim" }) -- 模糊查找器：全局文字搜索插件
  -- use({ "nvim-telescope/telescope-media-files.nvim" }) --  全局媒体搜索插件

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- 安装并配置语言服务器。可以手动安装服务 ,查看服务列表 :help lspconfig-all
  use("hrsh7th/cmp-nvim-lsp") -- 请求lsp服务自动补全
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- 自动补全的图标展示，类似vscode自动补全的补全 vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  -- use("p00f/nvim-ts-rainbow")
  -- use("HiPhish/nvim-ts-rainbow2")
  use("nvim-treesitter/playground")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- 自动关闭
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- 终端
  use({ "akinsho/toggleterm.nvim" })

  -- copilot 配置
  use({ "zbirenbaum/copilot.lua" })
  use({
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  })
  use({ "nvim-lua/plenary.nvim" })
  use({ "CopilotC-Nvim/CopilotChat.nvim" })

  --  加强版的f
  use({ "rhysd/clever-f.vim" })

  -- 切换窗口
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye") -- 优化关闭buffer的时候，不关闭nvim
  -- use({ "ojroques/nvim-bufdel" }) -- 优化关闭buffer

  -- 多光标操作
  use("mg979/vim-visual-multi")

  -- debugger 操作
  -- use({
  --   "nvim-neotest/neotest",
  --   requires = {
  --     "haydenmeade/neotest-jest",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim",
  --   },
  --   config = function()
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-jest")({
  --           jestCommand = "npm test --",
  --           jestConfigFile = "custom.jest.config.ts",
  --           env = { CI = true },
  --           cwd = function(path)
  --             return vim.fn.getcwd()
  --           end,
  --         }),
  --       },
  --     })
  --   end,
  -- })

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
  use("tpope/vim-fugitive")

  -- 缩紧的线，和空格的提示
  use("lukas-reineke/indent-blankline.nvim")

  -- 极速jk运动
  use({ "rainbowhxch/accelerated-jk.nvim" })

  -- 查看代码中的颜色
  use("NvChad/nvim-colorizer.lua")

  -- 移动代码
  -- use("matze/vim-move")
  use("fedepujol/move.nvim")

  -- jsodoc插件
  use("heavenshell/vim-jsdoc")

  -- 横向快速移动光标
  use({
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true, -- 仅在按下键后显示高光
        dim = true, -- 如果设置为true，则将所有其他字符调暗(建议!)
      })
    end,
  })

  -- 全局快速移动光标
  use({
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
  })

  -- 块间快速移动光标
  use({
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
    after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
  })

  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use({ "iamcco/markdown-preview.nvim" })

  -- 选中文本后高亮闪烁
  use({ "ibhagwan/smartyank.nvim" })

  -- Lua
  use({
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup()
    end,
  })

  -- 括号间跳转
  use({
    "andymass/vim-matchup",
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  })

  -- 滚动条滚动更加平滑
  use({
    "karb94/neoscroll.nvim",
    -- config = function()
    --   require("neoscroll").setup()
    -- end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
