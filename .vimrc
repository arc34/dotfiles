" Helps force plugins to load correctly when it is turned back on below
filetype off

" keep pathogen for plugins from vim.org
execute pathogen#infect()

" Don't try to be vi compatible
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " --------------- Add Plugins From Here -------------------

" let Vundle manage Vundle, required, don't remove
Plugin 'VundleVim/Vundle.vim'

" List of all plugins
Plugin 'mattn/calendar-vim'
Plugin 'hari-rangarajan/CCTree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'chrisbra/NrrwRgn'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/utl.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'arc34/vim-code-dark'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript.git'
Plugin 'tpope/vim-obsession'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'inkarkat/vim-SyntaxRange'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'posva/vim-vue'

call vundle#end() " -------------- No Plugins Beyond this point ---------------

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on
filetype plugin on

" Enable and Update to change leader key (default is '\')
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

set notagrelative

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
"set rtp+=/usr/lib/python3.3/site-packages/powerline/bindings/vim/
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

" Show trailing whitepace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme (terminal)
set t_Co=256
set t_ut=
set background=dark

" soloarize color setting
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

" gruvbox color setting
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox

" codedark color setting
colorscheme codedark

" set the default split direction
set splitbelow
set splitright

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

"vim-airline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"for using ag in ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

"set custom ctags location
let &tags=$CTAGS_FILE

" run make command in vim
nnoremap <F2> :NERDTreeToggle<CR>

" update cscope database and reset tags
nnoremap <F5> :!mkdb<CR>:cs reset<CR>

"highlight current line and column
:hi CursorLine   cterm=NONE ctermbg=233 ctermfg=NONE guibg=#1E1E1E guifg=NONE
:hi CursorColumn cterm=NONE ctermbg=233 ctermfg=NONE guibg=#1E1E1E guifg=NONE
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"Enable and Update to customize make command while inside vim
"For example,
" let &makeprg = "make cppf OAM_STUB=1"

" execute make in the current working directory and
" dispaly the output on a separate vim pane
nnoremap <F7> :make<bar>copen<CR>

" Hex read
" (Note: Use -b option when opening binary using vim)
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>

" Hex write
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

" search files via fzf
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-l> :Buffers<CR>

