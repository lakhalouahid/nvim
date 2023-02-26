local cmd = vim.api.nvim_command
local map = vim.api.nvim_set_keymap
map('n', '<m-a>', '<c-w>', {})

-- tabs movements
cmd([[
  nmap tn :tabnew<CR>
  nmap th :tabn<CR>
  nmap tk :+tabm<CR>
  nmap tl :tabp<CR>
  nmap tj :-tabm<CR>
]])

-- visual shifting
cmd([[
  vmap < <gv
  vmap > >gv
]])

-- clipboard
cmd([[
  au! TextYankPost * call setreg("+", getreg('"'))
]])


-- foldmethod
cmd([[
  nmap <Leader>fs :set foldmethod=syntax<CR>
  nmap <Leader>fi :set foldmethod=indent<CR>
]])

-- terminal
cmd([[
  nmap <C-w>N :vnew<Cr>
  inoremap <C-b> <LEFT>
  inoremap <C-f> <RIGHT>
]])

-- vim fugitive
cmd([[
  nmap <leader>gs :G<CR>
  nmap <leader>gf :diffget //2<CR>
  nmap <leader>gh :diffget //3<CR>
]])


-- command-window
cmd([[
  cmap <A-s> <c-right>
  cmap <A-b> <c-left>
]])

-- map slime
cmd([[
nmap <Leader>is <Plug>SlimeRegionSend<CR>
vmap <Leader>is <Plug>SlimeRegionSend<CR>
nmap <Leader>il <Plug>SlimeLineSend<CR>
nmap <Leader>io <Plug>SlimeMotionSend<CR>
vmap <Leader>id <Plug>IPythonShowDoc<CR>
nmap <Leader>if :IPythonCellRun<CR>
nmap <Leader>ii :IPythonCellExecuteCell<CR>
nmap <Leader>ic :IPythonCellExecuteCellJump<CR>

nmap [C :IPythonCellPrevCell<CR>
nmap ]C :IPythonCellNextCell<CR>
]])

cmd([[
  nmap <C-W>o <nop>
  nmap <C-W>o <Plug>(vzoom)
  tmap <M-s> <C-\><C-n>
]])

cmd([[
  au! TextYankPost * lua vim.highlight.on_yank {on_visual=false}
]])

cmd([[
  nmap ]q :cnext<CR>
  nmap [q :cprev<CR>
  nmap [Q :cfirst<CR>
  nmap ]Q :clast<CR>
  nmap ]l :lnext<CR>
  nmap [l :lprev<CR>
  nmap [L :lfirst<CR>
  nmap ]L :llast<CR>
  nmap ]a :next<CR>
  nmap [a :prev<CR>
  nmap [A :first<CR>
  nmap ]A :last<CR>
]])

cmd([[
  nmap <leader>lh :!rm *.{log,toc,aux,out,nav,snm}<CR>
  nmap <leader>lc :call jobstart("lualatex -shell-escape --halt-on-error " .. expand('%')  .. "  >/dev/null")<CR>

  nmap <leader>ls :!export VIMLATEXDIR=/tmp/vim-latex-live-preview-$(randstr 8) && cp -r %:h $VIMLATEXDIR && cd $VIMLATEXDIR && lualatex -shell-escape --halt-on-error %:t<CR>
  nmap <leader>ll :silent LLPStartPreview<CR>
]])


cmd([[
  nmap <leader>cl :lua lspconfig()<CR>
  nmap <leader>yf :let @+=expand('%')<CR>
  nmap <leader>yy :let @+=getcwd()<CR>
  nmap <leader>yd :let @+=expand('%:t')<CR>
  nmap <leader>yp :let @+=expand('%:p')<CR>
]])

cmd([[
  nmap <leader>cl :lua lspconfig()<CR>
  nmap <leader>yf :let @+=expand('%')<CR>
  nmap <leader>yy :let @+=getcwd()<CR>
  nmap <leader>yd :let @+=expand('%:t')<CR>
  nmap <leader>yp :let @+=expand('%:p')<CR>
]])

cmd([[
  map <A-u> :ChatGPT<CR>
  map <A-U> :ChatGPTActAs<CR>
]])

cmd([[
  map <A-u> :ChatGPT<CR>
  map <A-U> :ChatGPTActAs<CR>
]])



vim.api.nvim_create_augroup("terminal", { clear = false})
vim.api.nvim_create_autocmd({"TermOpen", "CmdWinEnter"}, {
  group = "terminal",
  pattern = {"*"},
  command = "redraw!"
})

vim.api.nvim_create_autocmd({"TermOpen", "CmdWinEnter"}, {
  group = "terminal",
  pattern = {"*"},
  command = "setlocal norelativenumber nonumber"
})

local function buf_set_keymap(...) vim.api.nvim_set_keymap(...) end
local opts = { noremap=true, silent=false }
buf_set_keymap('i', '<A-c>', '<cmd>lua require("copilot.suggestion").accept()<CR>', opts)
buf_set_keymap('i', '<A-l>', '<cmd>lua require("copilot.suggestion").accept_line()<CR>', opts)
