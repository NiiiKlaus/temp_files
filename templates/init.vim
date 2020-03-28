" 
"                               _                    
"  _ __ ___  _   _   _ ____   _(_)_ __ ___  _ __ ___ 
" | '_ ` _ \| | | | | '_ \ \ / / | '_ ` _ \| '__/ __|
" | | | | | | |_| | | | | \ V /| | | | | | | | | (__ 
" |_| |_| |_|\__, | |_| |_|\_/ |_|_| |_| |_|_|  \___|
"            |___/                                   

" Author: @NiiiKlaus



" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===

let &t_ut=''
set autochdir

" ===
" === Editor Behaviour
" ===

set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
set colorcolumn=80
set updatetime=1000
set virtualedit=block
" jump to the place edited lately
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" =========================== 
" === Terminal Behaviours ===
" =========================== 

let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

augroup TermHandling
	autocmd!
  	" Turn off line numbers, listchars, auto enter insert mode and map esc to
  	" exit insert mode
  	autocmd TermOpen * setlocal listchars= nonumber norelativenumber
		\ | startinsert
  	autocmd FileType fzf call LayoutTerm(0.6, 'horizontal')
augroup END

function! LayoutTerm(size, orientation) abort
	let timeout = 16.0
  	let animation_total = 120.0
  	let timer = {
		\ 'size': a:size,
  	  	\ 'step': 1,
  	  	\ 'steps': animation_total / timeout
  	\}

  	if a:orientation == 'horizontal'
  	  resize 1
  	  function! timer.f(timer)
  	    execute 'resize ' . string(&lines * self.size * (self.step / self.steps))
  	    let self.step += 1
  	  endfunction
  	else
  	  vertical resize 1
  	  function! timer.f(timer)
  	    execute 'vertical resize ' . string(&columns * self.size * (self.step / self.steps))
  	    let self.step += 1
  	  endfunction
  	endif
  	call timer_start(float2nr(timeout), timer.f, {'repeat': float2nr(timer.steps)})
endfunction

" Open autoclosing terminal, with optional size and orientation
function! OpenTerm(cmd, ...) abort
	let orientation = get(a:, 2, 'horizontal')
  	if orientation == 'horizontal'
		new | wincmd J
  	else
		vnew | wincmd L
  	endif
  	call LayoutTerm(get(a:, 1, 0.5), orientation)
  	call termopen(a:cmd, {'on_exit': {j,c,e -> execute('if c == 0 | close | endif')}})
endfunction



" ================ 
" === Mappings ===
" ================ 

" === 
" === Basic Mappings
" === 

let g:mapleader=" "
" disable the default s key
noremap s <nop>

" save and quit
noremap Q     :q<CR>
noremap <C-q> :q!<CR>
noremap S     :w<CR>

" adjust and source the nvimrc file anytime
noremap <LEADER>rc    :e /home/niklaus/.config/nvim/init.vim<CR>
noremap <LEADER>src   :source /home/niklaus/.config/nvim/init.vim<CR>
" noremap <LEADER>rc    :e $MYVIMRC<CR>
" noremap <LEADER>src   :source $MYVIMRC<CR>

" Y in normal mode to copy till the end of the line
noremap Y y$

" indentation
nnoremap < <<
nnoremap > >>

" disable hlsearch
noremap <LEADER><CR> :nohlsearch<CR>

" folding
noremap <silent> <LEADER>o za


" ===
" === Cursor Movement
" ===

" faster horizontal navigation
noremap <silent> L 5l
noremap <silent> H 5h

" faster vertical navigation
noremap <silent> K 5k
noremap <silent> J 5j

" start and end jumps
noremap <silent> <C-h> 0
noremap <silent> <C-l> $

" word jump
noremap <silent> W 5w
noremap <silent> B 5b

" move up and down the view point
noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>


" ===
" === Insert Mode Cursor Movement
" ===

inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>


" ===
" === Window Management
" ===

" use <LEADER> + arrow keys to move the cursor from window to window
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k

" split screens
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>

" resize splits with arrow keys
noremap <up>    :res -5<CR>
noremap <down>  :res +5<CR>
noremap <left>  :vertical resize -5<CR>
noremap <right> :vertical resize +5<CR>


" ===
" === Tab Management
" ===

" create a new tab
noremap te :tabe<CR>

" move around tabs
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" move the tabs
noremap tmh :-tabmove<CR>
noremap tmi :+tabmove<CR>

" use tab in insert mode to auto complete code
function! CleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
        else
                return "\<C-N>"
        endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


" ===
" === Other Useful Stuff
" ===

" spell check
noremap <LEADER>sc :set spell!<CR>

" compile functions
noremap fj :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!./%<"
" 		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc



" =====================================
" === Install Plugins with Vim-Plug ===
" =====================================

call plug#begin('~/.config/nvim/plugged')

" written by @theniceboy

" elegant statusline
Plug 'theniceboy/eleline.vim'


" editor enhancement

" auto pair quotes etc.
Plug 'jiangmiao/auto-pairs'
" use <space>cn to comment a line
Plug 'scrooloose/nerdcommenter'
" align the = in paragraph using gaip=
Plug 'junegunn/vim-easy-align'


call plug#end()



" ====================
" === Experimental ===
" ====================




" ===========================
" === Vim Plugin Settings ===
" ===========================

" eleline.vim

let g:airline_powerline_fonts = 0


" vim-easy-align

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" auto-pairs

let g:AutoPairsMapCh = 0
" =====================================
" === Necessary Commands to Execute ===
" =====================================

