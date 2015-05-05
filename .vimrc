if has('win32')
  set rtp+=~/vimfiles/bundle/neobundle.vim/
else
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

runtime! custom_preconfig/*.vim
runtime! common_config/*.vim
runtime! custom_config/*.vim

" for git, add spell checking and automatic wrapping at 72 columns
autocmd Filetype gitcommit setlocal spell textwidth=72

if !has('gui_running')
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'

  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
endif
