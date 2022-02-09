local g = vim.g
local opt = vim.opt
local nmap = utils.nmap
local vmap = utils.vmap
local inoremap = utils.inoremap
local nnoremap = utils.nnoremap
local imap = utils.imap

g.mapleader = ","
opt.pastetoggle = "<leader>v"

nnoremap("Q", "<nop>")
imap("jk", "<Esc>")
nmap("<leader>,", ":w<cr>")
nmap("<space>", ":set hlsearch! hlsearch?<cr>")

nmap("<leader><space>", [[:%s/\s\+$<cr>]])
nmap("<leader><space><space>", [[:%s/\n\{2,}/\r\r/g<cr>]])

nmap("<leader>l", ":set list!<cr>")
inoremap("<C-j>", [[v:lua.completion_nvim.smart_pumvisible('<C-n>', '<C-j>')]], {expr = true})
inoremap("<C-k>", [[v:lua.completion_nvim.smart_pumvisible('<C-p>', '<C-k>')]], {expr = true})
vmap("<", "<gv")
vmap(">", ">gv")
nmap("<leader>.", "<c-^>")
vmap(".", ":normal .<cr>")

nmap("<C-h>", "<Plug>WinMoveLeft")
nmap("<C-j>", "<Plug>WinMoveDown")
nmap("<C-k>", "<Plug>WinMoveUp")
nmap("<C-l>", "<Plug>WinMoveRight")

-- helpers for dealing with other people's code
nmap([[\t]], ":set ts=4 sts=4 sw=4 noet<cr>")
nmap([[\s]], ":set ts=4 sts=4 sw=4 et<cr>")

nmap("<leader>z", "<Plug>Zoom")


