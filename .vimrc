"{{{Vim configuration to work
syntax on
filetype plugin indent on
set nocompatible
"}}}

"{{{Plugins 
call plug#begin('~/.vim/plugged')
" Syntax
" Plug 'ycm-core/YouCompleteMe'
"Themes
Plug 'tomasiser/vim-code-dark'
" Plug 'suan/vim-instant-markdown'
Plug 'dhruvasagar/vim-table-mode'
" Git helpers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Syntax highlighting
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'valloric/MatchTagAlways'
" For kotlin files
Plug 'udalov/kotlin-vim'
" Database plugins
"Plug 'vim-scripts/dbext.vim'
"Latex 
Plug 'lervag/vimtex'
" Utils
"Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'gorodinskiy/vim-coloresque'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
" Plug 'vimwiki/vimwiki'
Plug 'turbio/bracey.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
call plug#end()
 "}}}

"{{{Neovim theme settings
" Airline themes
colorscheme codedark
let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1
"}}}

"{{{set vim side numbers and map leader key
    set number relativenumber
    let mapleader = ","
"}}}

"{{{Keyboard shortcuts for programs
"FZF finder
map ; :FZF<CR>
"Nerd tree
nnoremap <leader>a :NERDTreeToggle<cr>
"}}}

"{{{Set folding
    set foldmethod=marker
    nnoremap <Space> za
"}}}

"{{{ Copy and paste from and to global buffer
vnoremap <C-c> "+y
map <C-p> "+P
"}}}

"{{{Exit from neovim built in terminal
" tnoremap <Esc> <C-\><C-n>
"}}}

"{{{Enable autocomplotetion:
	set wildmode=longest,list,full
"}}}    

" {{{Enable dooplete plugin
" let g:deoplete#enable_at_startup = 1
" set complete-=preview
" }}}

"{{{Dissables automatic commenting on new line
	autocmd FileType * setlocal formatoptions-=c   formatoptions-=r formatoptions-=o
"}}}

"{{{Window split options for (vsp) (hsp)
	set splitbelow splitright
"}}}

"{{{to start a server for html projcts
autocmd FileType html nnoremap <buffer> <leader>s :tabnew <bar> term ~/bin/live-server <Enter>
"}}}

"{{{Real programers don't use TABs but use spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set wrap
"}}}

"{{{Compaling and running Python code
autocmd FileType python nnoremap <buffer> <leader>c :update <bar> term python3 %<CR>i
"}}}

"{{{Refactoring for c# code
autocmd FileType cs nnoremap <buffer> <leader>r :normal viw <Enter> :YcmCompleter RefactorRename 
"}}}

"{{{Compiling and runing c# code
"autocmd FileType cs nnoremap <buffer> <leader>c :vsp <bar> update <bar> term mcs -out:%:r.exe ./*.cs && mono ./%:r.exe<CR>i
autocmd FileType cs nnoremap <buffer> <leader>c :update <bar> term dotnet run<CR>i 
"}}}

"{{{Compiling and running java code
autocmd FileType java nnoremap <buffer> <leader>c :update <bar> term javac % && java %:r<CR>i
"}}}

"{{{ Comiling and running c++ code
autocmd FileType cpp nnoremap <buffer> <leader>c :update <bar> term make && make run<CR>i
"}}}

"{{{Compiling and running ruby code
autocmd FileType ruby nnoremap <buffer> <leader>c :update <bar> term ruby2.5 %<CR>i
"}}}

"{{{ Compiling and running kotlin files
autocmd Filetype kotlin nnoremap <buffer> <leader>c :update <bar> term kotlinc ./*.kt -include-runtime -d %:r.jar && java -jar %:r.jar<Enter>i
"}}}

"{{{Disable stupid backup and swap files.
set nobackup
set nowritebackup
set noswapfile
"}}}

"{{{See document word connt 
autocmd Filetype tex map <leader>w :!detex % <bar> wc -w <CR>
"}}}

"{{{Markdown Configuration
" auto compile for rmarkdown
autocmd Filetype rmd map <leader>c :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter><CR>
" auto compile lualatex file
autocmd Filetype tex map <buffer> <leader>c :update <bar> !lualatex %<Enter> 
" spellcheck zg = put words in good word list to undo that zug.
autocmd Filetype tex map <buffer> <F6> :setlocal spell! spelllang=lv<CR>
" let g:instant_markdown_autostart = 0
" autocmd Filetype markdown map <buffer> <leader>c :update <bar> InstantMarkdownPreview<CR>

" Mapping to get to <++>
" inoremap <Space><Space> <Esc>/<++><Enter>"_c4l


" Mappings for keys(html)
" autocmd Filetype html inoremap ;i <em></em><Space><++><Esc>FeT>i
" autocmd Filetype html inoremap ;b <b></b><Space><++><Esc>FbT>i
" autocmd Filetype html inoremap ;p <p></p><Enter><Enter><++><Esc>2ki

" Mappings for latex.
" autocmd Filetype tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i 
let g:table_mode_corner='|'
"}}}

"{{{Git configuration
nnoremap <buffer> <leader>gs :Gstatus<CR>
nnoremap <buffer> <leader>ga :Gwrite<CR>
nnoremap <buffer> <leader>gc :Gcommit<CR>
nnoremap <buffer> <leader>gp :Gpush<CR>
"}}}

" {{{Plugin configuration

" Enable emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Remap emmet key
let g:user_emmet_leader_key='<C-Z>'
" let g:deoplete#enable_at_startup = 1
"
let g:UltiSnipsExpandTrigger="<S-Right>"
let g:UltiSnipsJumpForwardTrigger="<S-Right>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:tex_conceal = ""

"set guifont=MesloLGSDZ\ Nerd\ Font\ Mono\ Regular\ 11 

" adding to vim-airline's tabline
"let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
"let g:webdevicons_enable_airline_statusline = 1

"set guifont=Cousine\ Nerd\ Font\ 14

" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                        \ 'syntax': 'markdown', 'ext': '.md'}]
"let g:syntastic_cs_checkers = ['code_checker']
" let g:airline#extensions#ale#enabled = 1
"g:bracey_server_allow_remote_connections
"let g:OmniSharp_highlight_types = 3
"let g:OmniSharp_server_stdio = 1
let g:omni_sql_no_default_maps = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:vimspector_enable_mappings = 'HUMAN'
"}}}
