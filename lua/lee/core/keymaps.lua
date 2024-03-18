-- set leader key to space
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- 保存
keymap.set("i", "<C-s>", "<ESC>:w<CR>")
keymap.set("n", "<C-s>", ":w<CR>")

-- 使用 jk, jj 退出编辑模式
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "jj", "<ESC>")

-- 清楚搜索高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 使用x删除，不放到剪切板
keymap.set("n", "x", '"_x')

-- 使用p粘贴的时候，不把覆盖的文字粘贴到剪贴板
keymap.set("v", "p", '"_dP')

-- 切换 buffers
keymap.set("n", "<C-Tab>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-q>", ":q<CR>") -- 关闭当前窗口
keymap.set("n", "<C-w>", ":Bdelete<CR>") -- 关闭当前文件
keymap.set("n", "<C-a>", ":bufdo :Bdelete<CR>") -- 关闭全部
keymap.set("n", "<C-o>", ":BufferLineCloseOthers<CR>") -- 关闭全部
keymap.set("n", "<leader>p", ":BufferLinePick<CR>") -- pick切换
keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>") -- 跳转到窗口1
keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>") -- 跳转到窗口2
keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>") -- 跳转到窗口3
keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>") -- 跳转到窗口4
keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>") -- 跳转到窗口5
keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>") -- 跳转到窗口6
keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>") -- 跳转到窗口7
keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>") -- 跳转到窗口8
keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>") -- 跳转到窗口9

-- Resize with arrows
keymap.set("n", "<A-Up>", ":resize +2<CR>")
keymap.set("n", "<A-Down>", ":resize -2<CR>")
keymap.set("n", "<A-Left>", ":vertical resize +2<CR>")
keymap.set("n", "<A-Right>", ":vertical resize -2<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>") -- toggle file explorer
keymap.set("n", "<leader>o", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- 查找当前工作目录下的文件，遵守 .gitignore 所忽略的文件
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>") -- 键入时在当前工作目录中查找字符串
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- 在当前工作目录中查找光标下的字符串
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- 查看所有commit列表 (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- 查看当前file/buffe文件的所有commit (use <cr> to checkout.可以检出Enter的提交) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- 查看所有分支 (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

--  终端
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
-- keymap.set("n", "<C-f>", "<Cmd>ToggleTerm direction=float<CR>") -- 打开浮动终端（普通模式）
-- keymap.set("i", "<C-f>", "<Esc><Cmd>ToggleTerm direction=float<CR>") -- 打开浮动终端（编辑模式）
keymap.set("n", "<C-`>", ":ToggleTerm direction=horizontal<CR>") -- 打开底部终端（普通模式）
keymap.set("i", "<C-`>", "<Esc><Cmd>ToggleTerm direction=horizontal<CR>") -- 打开底部终端（编辑模式）
keymap.set("t", "<C-q>", "<C-\\><C-n>") -- 切换终端模式
keymap.set("t", "<C-`>", "<Esc><Cmd>ToggleTerm<CR>") -- 关闭终端
keymap.set("n", "<leader>gg", ":lua _toggle_lazygit()<CR>") --  打开lazygit插件

-- clever-f 插件
-- keymap.set("n", ";", ":lua vim.api.nvim_replace_termcodes('<Plug>(clever-f-repeat-forward)', true, true, true)<CR>")

-- 极速jk运动 accelerated-jk
keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})

-- 移动代码
-- Normal-mode commands: 上下左右移动代码
keymap.set("n", "<S-j>", ":MoveLine(1)<CR>", opts)
keymap.set("n", "<S-k>", ":MoveLine(-1)<CR>")
keymap.set("n", "<S-h>", ":MoveHChar(-1)<CR>", opts)
keymap.set("n", "<S-l>", ":MoveHChar(1)<CR>", opts)
keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)
-- Visual-mode commands: 上下左右移动代码块
keymap.set("v", "<S-j>", ":MoveBlock(1)<CR>", opts)
keymap.set("v", "<S-k>", ":MoveBlock(-1)<CR>", opts)
keymap.set("v", "<S-h>", ":MoveHBlock(-1)<CR>", opts)
keymap.set("v", "<S-l>", ":MoveHBlock(1)<CR>", opts)

-- hop 快速移动光标
-- Normal-mode commands
keymap.set("n", "<leader>w", "<Cmd>HopWord<CR>")
keymap.set("n", "<leader>j", "<Cmd>HopLine<CR>")
keymap.set("n", "<leader>k", "<Cmd>HopLine<CR>")
keymap.set("n", "<leader><CR>", "<Cmd>HopChar1<CR>")
keymap.set("n", "<leader><CR><CR>", "<Cmd>HopChar2<CR>")

-- vim-matchup使用Tab键在匹配的字符对之间跳转
keymap.set("n", "<Tab>", "<Plug>(matchup-%)")
keymap.set("n", "<S-Tab>", "<Plug>(matchup-g%)")
-- keymap.set("n", "[<Tab>", "<Plug>(matchup-[%)")
-- keymap.set("n", "]<Tab>", "<Plug>(matchup-]%)")
keymap.set("v", "<Tab>", "<Plug>(matchup-%)")
keymap.set("v", "<S-Tab>", "<Plug>(matchup-g%)")
-- keymap.set("v", "[<Tab>", "<Plug>(matchup-[%)")
-- keymap.set("v", "]<Tab>", "<Plug>(matchup-]%)")
-- keymap.set("n", "z<Tab>", "<Plug>(matchup-z%)")
-- keymap.set("n", "a<Tab>", "<Plug>(matchup-a%)")
-- keymap.set("n", "i<Tab>", "<Plug>(matchup-i%)")
-- keymap.set("n", "ds<Tab>", "<Plug>(matchup-ds%)")
-- keymap.set("n", "cs<Tab>", "<Plug>(matchup-cs%)")

-- Visual-mode commands
keymap.set("v", "<leader>w", "<Cmd>HopWord<CR>")
keymap.set("v", "<leader>j", "<Cmd>HopLine<CR>")
keymap.set("v", "<leader>k", "<Cmd>HopLine<CR>")
keymap.set("v", "<leader>c", "<Cmd>HopChar1<CR>")
keymap.set("v", "<leader>cc", "<Cmd>HopChar2<CR>")
