" Plugins are managed by Plug. Once VIM is open run :BundleInstall to
" install plugins.
call plug#begin('~/.vim/plugged')

  " For comment
" Plugins requiring no additional configuration or keymaps
  Plug 'scrooloose/nerdcommenter'

  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'vim-ruby/vim-ruby'
  Plug 'vim-scripts/ruby-matchit'
  Plug 'tpope/vim-abolish'
  Plug 'mattn/emmet-vim'

 " Vim airline configs
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='minimalist'

" Easy motion config
  Plug 'easymotion/vim-easymotion'

" Code completion
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" CtrlP
  Plug 'ctrlpvim/ctrlp.vim'
    nmap <Leader>b :<C-U>CtrlPBuffer<CR>
    nmap <Leader>t :<C-U>CtrlP<CR>
    nmap <C-b> :<C-U>CtrlPBuffer<CR>
    nmap <C-p> :<C-U>CtrlP<CR>
    nmap <Leader>T :<C-U>CtrlPTag<CR>

    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0
    if executable('ag')
      let g:ctrlp_use_caching = 0
      let g:ctrlp_user_command = 'ag %s -l -i --nocolor --nogroup -g ""'
    else
      " respect the .gitignore
      let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
    endif

" Slim
  Plug 'slim-template/vim-slim'
    au BufNewFile,BufRead *.slim set filetype=slim

" Less
  Plug 'groenewege/vim-less'
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars, Mustache, and Friends
  Plug 'mustache/vim-mustache-handlebars'
  au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" AG aka The Silver Searcher
  Plug 'rking/ag.vim'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>


" Tagbar for navigation by tags using CTags
  Plug 'majutsushi/tagbar'
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>

" Markdown syntax highlighting
  Plug 'tpope/vim-markdown'
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  Plug 'scrooloose/nerdtree'
    let NERDTreeHijackNetrw = 0
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>

" Unimpaired for keymaps for quicky manipulating lines and files
  Plug 'tpope/vim-unimpaired'
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv


" Syntastic for catching syntax errors on save
  Plug 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    " let g:syntastic_quiet_messages = {'level': 'warning'}
    " syntastic is too slow for haml and sass
    let g:syntastic_check_on_open = 1
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'passive_filetypes': ['haml','scss','sass'] }


" gundo for awesome undo tree visualization
  Plug 'sjl/gundo.vim'
    map <Leader>h :GundoToggle<CR>


" surround for adding surround 'physics'
  Plug 'tpope/vim-surround'
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"

" MultipleCursor
  Plug 'terryma/vim-multiple-cursors'

" php-cs-fixer (for indentation)
  Plug 'stephpy/vim-php-cs-fixer'

" Rust for vim
  Plug 'rust-lang/rust.vim'

" Go for vim
  Plug 'fatih/vim-go'

" Fix indentation
  autocmd FileType javascript set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.js set ai sw=2 ts=2 sta et fo=croql

  autocmd FileType less set tabstop=2|set softtabstop=2|set shiftwidth=2
  au BufEnter *.less set ai sw=2 ts=2 sta et fo=croql
  au BufEnter *.css set ai sw=2 ts=2 sta et fo=croql

call plug#end()

filetype plugin indent on
