" Don't try to be vi compatible
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle') " ----------- Add Plugins From Here ----------

" List of all plugins
Plug 'hari-rangarajan/CCTree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'fedorenchik/qt-support.vim'
Plug 'vim-airline/vim-airline'
Plug 'arc34/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'kergoth/vim-bitbake'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mtdl9/vim-log-highlighting'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-table-mode'
Plug 'posva/vim-vue'

"Org Mode Related Plugins
Plug 'mattn/calendar-vim'
Plug 'chrisbra/NrrwRgn'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/utl.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'inkarkat/vim-SyntaxRange'

call plug#end() " --------------- No Plugins Beyond this point ----------------

" For plugins to load correctly
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
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Rendering
set ttyfast

" disable in favor of vim-airline
"set rtp+=/usr/lib/python3.3/site-packages/powerline/bindings/vim/
"set rtp+=~/.fzf

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
"colorscheme onedark

" set the default split direction
set splitbelow
set splitright

"line 80 column highlight
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"highlight ColorColumn ctermbg=234 guibg=#2c2d27
let &colorcolumn="80"

"gundo configs
let g:gundo_width = 60
let g:gundo_preview_height = 20
let g:gundo_right = 1
let g:gundo_preview_bottom = 1

"vim-airline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"COC configs
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"set tagfunc=CocTagFunc

" fzf configs
let g:fzf_preview_window = 'right:60%'
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" coc fzf configs
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the
" cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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

"Disable auto indentation
nnoremap <F8> :setl noai nocin nosi inde=<CR>:set formatoptions-=cro<CR>

" Hex read
" (Note: Use -b option when opening binary using vim)
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>

" Hex write
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

" search files via fzf
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-l> :Buffers<CR>

" Minimize/Maximize window pane
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

 if &diff
     map gs :call IwhiteToggle()<CR>
     function! IwhiteToggle()
       if &diffopt =~ 'iwhite'
         set diffopt-=iwhite
       else
         set diffopt+=iwhite
       endif
     endfunction
 endif

if &term =~ '^xterm'
    " normal mode
    let &t_EI .= "\<Esc>[0 q"
    " insert mode
    let &t_SI .= "\<Esc>[6 q"
endif
