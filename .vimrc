" Helps force plugins to load correctly when it is turned back on below
filetype off

execute pathogen#infect()

" Don't try to be vi compatible
set nocompatible

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
"filetype plugin indent on
filetype plugin on

" TODO: Pick a leader key
" let mapleader = ","
"

" open file on the last working line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" set to pass shell command inside vim
"if &diff == 'nodiff'
"    set shellcmdflag=-ic
"endif

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
"set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" disable auto line break
set tw=0

" Cursor motion
"set scrolloff=3
"set backspace=indent,eol,start
"set matchpairs+=<:> " use % to jump between pairs
"runtime! macros/matchit.vim

" Move up/down editor lines
"nnoremap j gj
"nnoremap k gk

" Allow hidden buffers
"set hidden

" Rendering
set ttyfast

" disable in favor of vim-airline
"set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
set rtp+=~/.fzf

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
"inoremap <F1> <ESC>:set invfullscreen<CR>a
"nnoremap <F1> :set invfullscreen<CR>
"vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
"map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme solarized

" syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {
     \ "mode": "passive",
     \ "active_filetypes": ["c"],
     \ "passive_filetypes": [] }
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers=['clang_tidy']
let g:syntastic_c_config_file = '.syntastic_config'

"line 80 column highlight
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80"

"gundo configs
let g:gundo_width = 60
let g:gundo_preview_height = 20
let g:gundo_right = 1
let g:gundo_preview_bottom = 1

"for using ag in ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" DCM make configuration
"  NOTE: 'linkdcm' and 'mkoampf' are alias in ~/.bashrc
let &makeprg = "make cppf OAM_STUB=1"

" vim-airline configurations
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" run make command in vim
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F5> :!mkdb<CR>:cs reset<CR>
nnoremap <F6> :GundoToggle<CR>
nnoremap <F7> :make<bar>copen<CR>
nnoremap <silent> <C-p> :FZF<CR> 
