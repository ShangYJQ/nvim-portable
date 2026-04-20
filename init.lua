vim.loader.enable()

-- 主键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 禁用 netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.have_nerd_font = true

-- 禁用不需要的语言环境
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

vim.g.did_install_default_menus = 1

-- 不加载 tutor
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- Disable sql omni completion, it is broken.
vim.g.loaded_sql_completion = 1

-- 解决 sql 文件不断报错打断
vim.g.omni_sql_no_default_maps = 1

-- EDITOR OPTIONS
local opt = vim.opt

-- 隐藏命令行
opt.cmdheight = 0
opt.laststatus = 3

opt.shortmess:append("I")
opt.shortmess:append("W")
opt.shortmess:append("F")
opt.shortmess:append("s")
opt.shortmess:append("A")

opt.more = false

--  退出对话框
opt.confirm = true

-- Display
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.showmode = false
opt.winborder = "rounded"

-- Line wrapping and cursor movement
opt.whichwrap = "<,>,[,],h,l"
opt.wrap = false

-- listchars
opt.list = true
opt.listchars = {
    space = "·",
    tab = "→ ",
}

-- Indentation
local tablen = 4
opt.tabstop = tablen
opt.softtabstop = tablen
opt.shiftwidth = tablen
opt.expandtab = true
opt.autoindent = true

-- Clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- Window splits
opt.splitright = true
opt.splitbelow = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.smoothscroll = true

-- Persistent undo
local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

opt.undodir = undodir
opt.undofile = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- KEYMAPS

local map = vim.keymap.set

-- General editing
map("i", "<C-q>", "<Esc>", { desc = "Exit insert mode" })

-- 更好的搜索跳转
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- map("n", "<C-z>", "<cmd>undo<CR>", { desc = "Undo" })
map({ "n", "v" }, "d", '"_d', { desc = "Delete to black hole register" })
map("n", "<leader>c", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Window navigation (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus below window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus above window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

-- Window splitting (leader + hjkl)
map("n", "<leader>l", "<cmd>set splitright<CR><cmd>vsplit<CR>", { desc = "Split right" })
map("n", "<leader>j", "<cmd>set splitbelow<CR><cmd>split<CR>", { desc = "Split below" })
map(
    "n",
    "<leader>h",
    "<cmd>set nosplitright<CR><cmd>vsplit<CR><cmd>set splitright<CR>",
    { desc = "Split left" }
)
map(
    "n",
    "<leader>k",
    "<cmd>set nosplitbelow<CR><cmd>split<CR><cmd>set splitbelow<CR>",
    { desc = "Split above" }
)

-- Window resizing (Ctrl + arrows)
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })

-- Terminal
map("n", "<leader>t", function()
    vim.cmd("botright 10split | terminal")
    vim.cmd("startinsert")
end, { desc = "Open terminal" })

map("t", "<C-q>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- helix move
map("n", "gs", "0", { desc = "Move to left" })
map("n", "gl", "$", { desc = "Move to right" })

-- move code
map("n", "<A-k>", ":move .-2<CR>==", { noremap = true, silent = true })
map("n", "<A-j>", ":move .+1<CR>==", { noremap = true, silent = true })

map("n", "<A-Up>", ":move .-2<CR>==", { noremap = true, silent = true })
map("n", "<A-Down>", ":move .+1<CR>==", { noremap = true, silent = true })

-- visual mode 移动选中块
map("v", "<A-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

map("v", "<A-Up>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-Down>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

-- change x to helix mode
map("n", "x", function()
    local count = vim.v.count1
    vim.cmd("normal! V")
    if count > 1 then
        vim.cmd("normal! " .. (count - 1) .. "j")
    end
end, { noremap = true, silent = true, desc = "Helix-style line select" })
map("v", "x", "<Esc>", { noremap = true, silent = true, desc = "Helix-style x to esc v mode" })

-- Half-page scrolling for Shift/Page keys
map("n", "<S-Up>", "<C-u>", { desc = "Half page up" })
map("n", "<S-Down>", "<C-d>", { desc = "Half page down" })

-- Yank whole file without moving cursor
map("n", "<leader>u", function()
    local view = vim.fn.winsaveview()
    vim.cmd("silent keepjumps %y")
    vim.fn.winrestview(view)
end, { desc = "Yank whole file without moving cursor" })

-- auto close pairs
map("i", "'", "''<left>")
map("i", "`", "``<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "<", "<><left>")

-- autocmds

-- auto create dir
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- ui2

local ui2 = require("vim._core.ui2")

ui2.enable({
    enable = true, -- Whether to enable or disable the UI.
    msg = {
        targets = "msg",
        cmd = {
            height = 0.5,
        },
        dialog = {
            height = 0.5,
        },
        msg = {
            height = 0.3,
            timeout = 3000,
        },
        pager = {
            height = 0.5,
        },
    },
})
