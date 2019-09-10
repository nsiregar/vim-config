" easy wrap toggling
  nmap <Leader>w :set wrap!<cr>
  nmap <Leader>W :set nowrap<cr>

" map leader to space
  map <Space> <Leader>

" close all other windows (in the current tab)
  nmap gW :only<cr>

" shortcuts for frequenly used files
  nmap gs :e db/schema.rb<cr>
  nmap gr :e config/routes.rb<cr>
  nmap gm :e Gemfile<cr>

" nerdcommenter
  nmap gcc :call NERDComment(0,"toggle")<cr>
  vmap gc :call NERDComment(0,"toggle")<cr>

" insert blank lines without going into insert mode
  nmap go o<esc>
  nmap gO O<esc>

" mapping the jumping between splits. Hold control while using vim nav.
  nmap <C-J> <C-W>j
  nmap <C-K> <C-W>k
  nmap <C-H> <C-W>h
  nmap <C-L> <C-W>l

" Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

" select the lines which were just pasted
  nnoremap vv `[V`]

" clean up trailing whitespace
  map <Leader>c :StripTrailingWhitespaces<cr>

" compress excess whitespace on current line
  map <Leader>e :s/\v(\S+)\s+/\1 /<cr>:nohl<cr>

" delete all buffers
  map <Leader>d :bufdo bd<cr>

" map spacebar to clear search highlight
  nnoremap <Leader><space> :noh<cr>

" buffer resizing mappings (shift + arrow key)
  nnoremap <S-Up> <c-w>+
  nnoremap <S-Down> <c-w>-
  nnoremap <S-Left> <c-w><<c-w><<c-w><
  nnoremap <S-Right> <c-w>><c-w>><c-w>>

" reindent the entire file
  map <Leader>I gg=G``<cr>

" insert the path of currently edited file into a command
" Command mode: Ctrl-P
  cmap <C-S-P> <C-R>=expand("%:p:h") . "/" <cr>



" Tricks
  map n nzz
  map N Nzz
  map <C-o> <C-o>zz
  map <C-i> <C-i>zz

" PHP
  imap <C-l> ->
  imap <C-k> =>

" CTRL-X and SHIFT-Del are Cut
  vnoremap <C-X> "+x
  vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
  vnoremap <C-C> "+y
  vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
  map <S-Insert> "+gP
  cmap <S-Insert> <C-R>+


" Navigation for tab
  noremap <Leader>1 1gt
  noremap <Leader>2 2gt
  noremap <Leader>3 3gt
  noremap <Leader>4 4gt
  noremap <Leader>5 5gt
  noremap <Leader>6 6gt
  noremap <Leader>7 7gt
  noremap <Leader>8 8gt
  noremap <Leader>9 9gt
  noremap <Leader>0 :tablast<cr>

" ipdb debugger
  nnoremap <Leader>pd oimport ipdb;ipdb.set_trace()<Esc>

" lsp keybinding
  function SetLSPShortcuts()
    nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
    nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
    nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
    nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
    nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
    nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
    nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
    nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
    nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
  endfunction()

  augroup LSP
    autocmd!
    autocmd FileType * call SetLSPShortcuts()
  augroup END
