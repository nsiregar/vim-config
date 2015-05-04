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

