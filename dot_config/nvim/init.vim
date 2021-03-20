" ALL OPTIONS
set number
set relativenumber
set ignorecase
set nowrap
set mouse=a
set clipboard=unnamedplus
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

" MAINLY FOR COC
" set hidden
" set nobackup
" set nowritebackup
" " set cmdheight=2
" set updatetime=300
" set shortmess+=c
" if has("patch-8.1.1564")
"     " Recently vim can merge signcolumn and number column into one
"     set signcolumn=number
" else
"     set signcolumn=yes
" endif

" INDENTATION
set autoindent
set smartindent
" set smarttab
set tabstop=8
set shiftwidth=2
set softtabstop=2
" set shiftround
" set expandtab

" SCROLLING
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" PACKAGES
call plug#begin()

" ESSENTIALS
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'tpope/vim-sensible'
" Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
" Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'
"Plug 'scrooloose/nerdtree'

" AESTHETICS
Plug 'sainnhe/sonokai'
" Plug 'ajmwagar/vim-deus'
" Plug 'joshdick/onedark.vim'
" Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" LANGUAGE
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

" For the sexy looks :p
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif
syntax on
colorscheme sonokai

" Airline Stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" My prefferred mappings
noremap <Up> <nop>
noremap <Left> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
noremap <leader>y "+y
noremap <leader>p "+p
" nmap <leader>gd <Plug>(coc-definition)
" nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>gg :Grepper<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

" KEYMAPS
" C-p for files
map <C-p> :Files<CR>

" Buffer switching and closing
map <M-h> :bp<CR>
map <M-l> :bn<CR>
map <M-w> :bd<CR>

" let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint']}
" let g:ale_fixers = {'python': ['black'], 'javascript': ['prettier', 'eslint'], 'json': ['prettier']}
" let g:ale_fix_on_save = 1

" Random Stuff for COC (Mostly yanked them from the official repo's readme :p)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" if has('nvim')
"     inoremap <silent><expr> <c-space> coc#refresh()
" else
"     inoremap <silent><expr> <c-@> coc#refresh()
" endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"     \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     else
"         call CocActionAsync('doHover')
"     endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"     autocmd!
"     " Setup formatexpr specified filetype(s).
"     autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"     " Update signature help on jump placeholder.
"     autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Integrate airline
" let g:airline#extensions#coc#enabled = 0
" let airline#extensions#coc#error_symbol = 'Error:'
" let airline#extensions#coc#warning_symbol = 'Warning:'
" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

