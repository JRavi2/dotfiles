" ALL OPTIONS
set number
set relativenumber
set ignorecase
set nowrap
set mouse=a
filetype plugin on
filetype indent on
set background=dark
set noshowmode
autocmd BufWritePre * :%s/\s\+$//e
set showtabline=2
let mapleader = "\<Space>"
set foldmethod=indent
set nofoldenable
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set splitbelow " Make all splits happen below the current window

" MAINLY FOR COC
set hidden
set nobackup
set nowritebackup
" set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" INDENTATION
set autoindent
set smartindent
" set smarttab
set tabstop=2
set shiftwidth=2
" set shiftround
set expandtab

" SCROLLING
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" PACKAGES
" Install Vim-Plug if Absent
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" ESSENTIALS
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'chaoren/vim-wordmotion'
" Plug 'turbio/bracey.vim' (Live server - plan to do something interesting with this)
Plug 'godlygeek/tabular' " Rearely use this but handy
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" AESTHETICS
Plug 'folke/tokyonight.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LANGUAGE SERVERS
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'plasticboy/vim-markdown'

call plug#end()

" For the sexy looks :p
syntax on
colorscheme tokyonight-moon

" Airline Stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Ranger
let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" Wordmotion
let g:wordmotion_spaces = ['\w\@<=-\w\@=', '\.']
let g:wordmotion_uppercase_spaces = ['-']

" My prefferred mappings
"
" Arrow keys eww
noremap <Up> <nop>
noremap <Left> <nop>
noremap <Down> <nop>
noremap <Right> <nop>

" Copy to the peasant clip
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>w :update<CR>
noremap <leader>q :q<CR>
noremap <leader>Q :q!<CR>
noremap <leader><space> :nohlsearch<CR>
nnoremap <leader>tr :split <bar> :resize 10 <bar> :term <CR>
noremap <leader>pv :tabnew <bar> :Ex <CR>
nnoremap <silent> <Leader>+ :resize +10<CR>
nnoremap <silent> <Leader>- :resize -10<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Pugin mappings
noremap <leader>F :Format<CR>
noremap <leader>E :RangerCurrentFile<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>G :GoRun %<CR>
nnoremap <leader>gg :Grepper<CR>
nnoremap <leader>u :UndotreeShow<CR>

" KEYMAPS
" C-p for files
map <C-p> :Files<CR>

" Buffer switching and closing
map <M-h> :bp<CR>
map <M-l> :bn<CR>
map <M-w> :bd<CR>

" Random Stuff for COC (Mostly yanked them from the official repo's readme :p)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
    else
	call CocActionAsync('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Integrate airline
let g:airline#extensions#coc#enabled = 0
let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"go", "lua", "java", "rust", "json", "c", "cpp", "bash", "javascript", "typescript"},
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	}
}
EOF
