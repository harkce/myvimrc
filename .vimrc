set nocompatible		" be iMproved, required
set autowrite			" auto save when call :write

so ~/.vim/plugins.vim
so ~/.vim/gotags.vim
so ~/.vim/tabnums.vim

"brainfuck
so ~/.vim/brainfuck.vim

syntax enable

set backspace=indent,eol,start	"make backspace like other text editor
let mapleader = ','		"make default maleader to comma

filetype plugin on		"filetype plugin

"----- Visual -----
colorscheme onedark		"vim color scheme
set number			"activate line numbers
set t_CO=<t_CO>			"force terminal to use <t_CO> colors
set cursorline			"highlight on current column

"Hide scoll for GUI
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set showtabline=2		"always show tabs

"active tab text color
hi TabLineSel ctermfg=white

"vertical split separator
hi VertSplit ctermfg=bg ctermbg=grey

"----- Searching -----
"Highlight search result
set hlsearch
set incsearch

"Clipboard
set clipboard=unnamedplus

"----- Split management -----
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>		"down
nmap <C-K> <C-W><C-K>		"up
nmap <C-H> <C-W><C-H>		"left
nmap <C-L> <C-W><C-L>		"right

"----- Mappings -----

"Edit vimrc shortcut
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Tab movement
nmap <Tab>h :tabp<cr>
nmap <Tab>l :tabn<cr>

"New tab
nmap <C-N> :tabnew<cr>

"Resize window
nmap <C-Up> :res +5<cr>
nmap <C-Down> :res -5<cr>
nmap <C-Right> :vertical resize +5<cr>
nmap <C-Left> :vertical resize -5<cr>

"----- Plugins -----
"NerdTree
"NerdTree Toggle
nmap <Leader><Leader> :NERDTreeToggle<cr>

"Disable NerdTree Hijack
let NERDTreeHijackNetrw = 0

"Show hidden files in NerdTree
let NERDTreeShowHidden = 1

"CtrlP
"Recent Finles
nmap <C-E> :CtrlPMRUFiles<cr>


"NERDCommenter
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

"Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'


"vim airline
"integrate vim airline with powerline fonts
let g:airline_powerline_fonts = 1

"themes
let g:airline_theme='minimalist'

"git for vim airline
let g:airline#extensions#branch#enabled = 1


"go vim
"change gofmt to goimports
let g:go_fmt_command = "goimports"

"timeout for go test
let g:go_test_timeout = '10s'

"beautify
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"----- Auto-Commands -----

"Auto source vimrc on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
	autocmd InsertEnter * silent execute "!echo -ne '\e[5 q'"
	autocmd InsertLeave * silent execute "!echo -ne '\e[2 q'"
	autocmd VimLeave * silent execute "!echo -ne '\e[2 q'"
augroup END
