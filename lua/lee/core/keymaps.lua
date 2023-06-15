-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

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
keymap.set("n", "<C-w>", ":Bdelete<CR>") -- 关闭当前窗口
keymap.set("n", "<C-o>", ":bufdo :Bdelete<CR>") -- 关闭全部

-- Resize with arrows
keymap.set("n", "<A-Up>", ":resize -2<CR>")
keymap.set("n", "<A-Down>", ":resize +2<CR>")
keymap.set("n", "<A-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<A-Right>", ":vertical resize +2<CR>")

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
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- 查找当前工作目录下的文件，遵守 .gitignore 所忽略的文件
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>") -- 键入时在当前工作目录中查找字符串
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

--  终端
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
keymap.set("n", "<C-f>", "<Cmd>ToggleTerm direction=float<CR>") -- 打开浮动终端（普通模式）
keymap.set("i", "<C-f>", "<Esc><Cmd>ToggleTerm direction=float<CR>") -- 打开浮动终端（编辑模式）
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
