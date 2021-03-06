local cmd = vim.api.nvim_command
local map = vim.api.nvim_set_keymap
map('n', '<m-a>', '<c-w>', {})

-- tabs movements
cmd([[
  nmap tn :tabnew<CR>
  nmap tj :tabn<CR>
  nmap tl :+tabm<CR>
  nmap tk :tabp<CR>
  nmap th :-tabm<CR>
]])

-- visual shifting
cmd([[
  vmap < <gv
  vmap > >gv
]])

-- clipboard
cmd([[
  au! TextYankPost * call setreg("+", getreg('"'))
  nmap <Leader>pp "+p
  vmap <Leader>pp "+p
  nmap <Leader>pP "+P
  vmap <Leader>pP "+P
]])


-- foldmethod
cmd([[
  nmap <Leader>fs :set foldmethod=syntax<CR>
  nmap <Leader>fi :set foldmethod=indent<CR>
]])

-- terminal
cmd([[
  nmap <C-w>N :vnew<Cr>
  nmap <leader>S :sp term://
  nmap <leader>v :vsp term://
  inoremap <C-b> <LEFT>
  inoremap <C-f> <RIGHT>
]])

-- vim fugitive
cmd([[
  nmap <leader>gs :G<CR>
  nmap <leader>gf :diffget //2<CR>
  nmap <leader>gh :diffget //3<CR>
]])


-- easy align
cmd([[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
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
  nmap <Leader>iF :IPythonCellRunTime<CR>
  nmap <Leader>ii :IPythonCellExecuteCell<CR>
  nmap <Leader>ic :IPythonCellExecuteCellJump<CR>
  nmap <Leader>id :SlimeSend1 %debug<CR>
  nmap <Leader>iq :SlimeSend1 exit()<CR>

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
  nmap <leader>lc :call jobstart("pdflatex -halt-on-error " .. expand('%')  .. "  >/dev/null")<CR>
  nmap <leader>ls :!pdflatex -halt-on-error %<CR>
  nmap <leader>ll :silent LLPStartPreview<CR>
]])


cmd([[
  nmap <leader>cl :lua lspconfig()<CR>
  nmap <leader>yf :let @+=expand('%')<CR>
  nmap <leader>yF :let @+=expand('%:p')<CR>
]])


require('maps.telescope')

vim.api.nvim_create_augroup("removenumbers", { clear = false})

vim.api.nvim_create_autocmd({"TermOpen", "CmdWinEnter"}, {
  group = "removenumbers",
  pattern = {"*"},
  command = "redraw!"
})


vim.api.nvim_create_autocmd({"TermOpen", "CmdWinEnter"}, {
  group = "removenumbers",
  pattern = {"*"},
  command = "setlocal norelativenumber nonumber"
})
