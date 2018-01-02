" Autoloading plugins
call pathogen#infect()
call pathogen#helptags()

colorscheme Tomorrow-Night-Eighties
"colorscheme codedark

"set background=dark
"colorscheme solarized

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
set guifont=Liberation\ Mono\ for\ Powerline:h13
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
set ignorecase
set smartcase

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
" Lightline
set laststatus=2
set noshowmode

" gitbranch
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_list_type = "quickfix"
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go', 'golint']

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

" Snippets
" let g:UltiSnipsExpandTrigger='<Enter>'
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
if !exists('*ExpandSnippetOrCarriageReturn')
    function ExpandSnippetOrCarriageReturn()
        let snippet = UltiSnips#ExpandSnippetOrJump()
        if g:ulti_expand_or_jump_res > 0
            return snippet
        else
            return "\<CR>"
        endif
    endfunction
endif
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
