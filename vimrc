" Autoloading plugins
call pathogen#infect()
call pathogen#helptags()

colorscheme Tomorrow-Night-Eighties
"colorscheme codedark

filetype plugin on
filetype indent on
filetype on
syntax on

" Reloading
map <leader>s :source ~/.vimrc<CR>:echo "Reloaded!"<CR>

" Things in memory
set hidden
set history=100

" Better layout
set guifont=Liberation\ Mono\ for\ Powerline:h11
set colorcolumn=81
set number
set relativenumber
set cursorline
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nocompatible
set splitbelow
set splitright
set showmatch
set backspace=indent,eol,start

if !has('gui_running')
  set t_Co=256
endif


" Search
set hlsearch
"nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Open last file
nnoremap <Leader><Leader> :e#<CR>


" Plugins
"
" Command-t: reindex
noremap <Leader>r :CommandTFlush<CR>

" Lightline
set laststatus=2
set noshowmode

" NERDTree
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>

" YouCompleteME
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-go
let g:go_fmt_command = "goimports"
:autocmd BufWritePre *.go :GoBuild
let g:godef_split=3
let g:godef_same_file_in_same_window=1
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" tabgar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

