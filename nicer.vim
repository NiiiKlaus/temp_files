" Author: @NiiiKlaus
" vim:fdm=marker

" Editor Setup | Tags: #base# #generic#{{{1
" Options | Tags: #NULL#{{{2
" Stable | Tags: #NULL#{{{3
set autoindent                                    " Auto indent.
set clipboard=unnamedplus                         " Share Vim register with system on Windows, macOS and Linux.
set colorcolumn=81                                " Show a line that indicates recommended textwidth.
set completeopt=menuone,noinsert,noselect,preview " Options used in insert mode completion.
set cursorline                                    " Highlight the current line containing the cursor.
set foldenable                                    " Enable text folding
set foldlevel=99                                  " Set maximum level of fold.
set foldmethod=indent                             " Set current window's indent method.
set formatoptions-=tc                             " Set format options. Default: tcq
set ignorecase                                    " Ignore case when searching.
set inccommand=split                              " Incremental substitution (Neovim only).
set indentexpr=                                   " Set indent algorithm. Default: "".
set lazyredraw                                    " The screen will not be redrawn while executing macros, registers and other commands that have not been typed.
set list                                          " Show invisible characters like <Tab>, <Space>, etc.
set listchars=tab:\|\ ,trail:▫                    " Set characters that represent <Tab>, <Space> and invisible characters like those.
set number                                        " Show line number.
"set relativenumber                                " Show relative number.
set scrolloff=4                                   " Display 4 lines after EOF.
set shiftwidth=4                                  " AKA sw, Set indent spaces when using << and >>.
set shortmess+=c                                  " Reduce information that is showed about current file. Default: filnxtTo0s.
set showcmd                                       " Show current command.
set smartcase                                     " Suppress ignorecase option, make it smarter.
set softtabstop=4                                 " Set the number of <Space> indented when pressing <Tab>.
set splitbelow                                    " Split window horizontally will put the new window below the current one.
set splitright                                    " Split window vertically will put the new window to the right.
set tabstop=4                                     " AKA ts, Set 1 <Tab> equals to 4 <Space>.
set textwidth=0                                   " AKA tw, Maximun length of text that is being inserted. If set to 0, wrap according to window split situation dynamically.
set timeout                                       " Key mapping timeout.
set timeoutlen=500                                " Set key mapping timeout (Default: 1000 (ms)).
set ttimeout                                      " Key code timeout.
set ttimeoutlen=0                                 " Set key code timeout length (Default: -1).
set updatetime=1000                               " Crash recovery. If nothing is typed after 1000ms, the swap file will be written to disk.
set viewoptions=cursor,folds,slash,unix           " Remember cursor etc. position.
set virtualedit=block                             " The cursor can be positioned where is no actual character in Visual Block mode.
set visualbell                                    " Use visual bell instead of beeping.
set wildmenu                                      " On pressing 'wildchar' (usually <Tab>) to invoke completion.
"set wrap                                " Text that exceeds textwidth will be shown in the next line.

set noexpandtab                                   " Use softtabstop spaces instead of tab characters for indentation.
set noshowmode                                    " Do not show current mode.
set nowrap                                        " Text that exceeds textwidth will be shown in the next line.

"}}}3
" Experimental | Tags: #NULL#{{{3

set buftype=
set modifiable
set foldmethod=marker
set foldlevel=1

"}}}3
" Legacy | Tags: #NULL#{{{3
"}}}3
"}}}2
" Autocmds | Tags: #NULL#{{{2

" Jump to the place edited recently.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"}}}2
" Mappings | Tags: #NULL#{{{2
" Stable | Tags: #NULL#{{{3
" First of all | Tags: #NULL#{{{4

" Use <Space> as <LEADER>.
let g:mapleader=" "

"}}}4
" Failsafe | Tags: #NULL#{{{4

" Disable the default s key
noremap s <Nop>

" Map <LEADER>*n for <nop> in case the cursor freezes.
noremap <LEADER><LEADER> <Nop>
noremap <LEADER><LEADER><LEADER> <Nop>
noremap <LEADER><LEADER><LEADER><LEADER> <Nop>
noremap <LEADER><LEADER><LEADER><LEADER><LEADER> <Nop>

"}}}4

" Save and quit.
noremap Q     :q<CR>
noremap <C-Q> :q!<CR>
noremap S     :w<CR>

" Adjust and source $MYVIMRC anytime.
noremap <LEADER>rc  :e $MYVIMRC<CR>
noremap <LEADER>src :source $MYVIMRC<CR>

" Y in normal mode to copy till the end of the line.
noremap Y y$
" D in normal mode to delete till the end of the line.
noremap D d$

" Indentation.
nnoremap < <<
nnoremap > >>

" Disable hlsearch.
noremap <LEADER><CR> :nohlsearch<CR>

" Folding.
noremap <silent> <LEADER>z za

" Cursor Movement | Tags: #NULL#{{{4
" Normal Mode | Tags: #NULL#{{{5

" Faster horizontal navigation.
noremap <silent> L 5l
noremap <silent> H 5h

" Faster vertical navigation.
noremap <silent> K 5k
noremap <silent> J 5j

" Start and end jumps.
noremap <silent> <C-H> 0
noremap <silent> <C-L> $

" Word jump.
noremap <silent> W 5w
noremap <silent> B 5b

" Move up and down the view point.
noremap <C-K> 5<C-Y>
noremap <C-J> 5<C-E>

"}}}5
" Insert Mode | Tags: #NULL#{{{5

inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-K> <Up>
inoremap <C-J> <Down>

"}}}5
" Command Mode | Tags: #NULL#{{{5

cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>

"}}}5
"}}}4
" Window Management | Tags: #NULL#{{{4

" Use <LEADER> + arrow keys to move the cursor from window to window.
noremap <LEADER>h <C-W>h
noremap <LEADER>l <C-W>l
noremap <LEADER>j <C-W>j
noremap <LEADER>k <C-W>k

" Split screens.
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>

" Resize splits with arrow keys.
noremap <Up>    :res -5<CR>
noremap <Down>  :res +5<CR>
noremap <Left>  :vertical resize -5<CR>
noremap <Right> :vertical resize +5<CR>

"}}}4
" Tab Management | Tags: #NULL#{{{4

" Create a new tab.
noremap te :tabe<CR>

" Move around tabs.
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" Move the tabs.
noremap tmh :-tabmove<CR>
noremap tmi :+tabmove<CR>

" Use tab in insert mode to auto complete code.
function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"}}}4
" Other Useful Stuff | Tags: #NULL#{{{4

" Spell check.
noremap <LEADER>sc :set spell!<CR>

" Install plugins.
noremap <LEADER>pi :source $MYVIMRC<CR>:PlugInstall<CR>
" Update plugins.
noremap <LEADER>pu :source $MYVIMRC<CR>:PlugUpdate<CR>
" Clean plugins.
noremap <LEADER>pc :source $MYVIMRC<CR>:PlugClean<CR>

"}}}4
"}}}3
" Tmp | Tags: #NULL#{{{3

nmap rf :e ~/scratchpad/init.vim<CR>
			\sl
			\rc
			\sj
			\h
			\sj

nmap gt o<Esc>cc"  \|  Tags: #NULL#<Esc>o<Esc>k:setlocal foldmethod=marker<CR>zfj0ll
nmap gt1 o<Esc>cc"  \|  Tags: #NULL#<Esc>o<Esc>k:setlocal foldmethod=marker<CR>zfjA1<Esc>jA1<Esc>k0lli
nmap gt2 o<Esc>cc"  \|  Tags: #NULL#<Esc>o<Esc>k:setlocal foldmethod=marker<CR>zfjA2<Esc>jA2<Esc>k0lli
nmap gt3 o<Esc>cc"  \|  Tags: #NULL#<Esc>o<Esc>k:setlocal foldmethod=marker<CR>zfjA3<Esc>jA3<Esc>k0lli
nmap gt4 o<Esc>cc"  \|  Tags: #NULL#<Esc>o<Esc>k:setlocal foldmethod=marker<CR>zfjA4<Esc>jA4<Esc>k0lli

"}}}3
" Experimental | Tags: #NULL#{{{3
noremap <C-S-Q> :qa<CR>
noremap mk :setlocal foldmethod=marker<CR>zM
"}}}3
" Legacy | Tags: #NULL#{{{3
" No.1 | Tags: #NULL#{{{4

"" Compile functions.
"noremap fj :call CompileRunGcc()<CR>

"func! CompileRunGcc()
"exec "w"
"if &filetype == 'c'
""exec "!g++ % -o %<"
""exec "!./%<"
""exec "!time ./%<"
"exec "!g++ % -o %<"
"set splitbelow
":sp
":term ./%<
"elseif &filetype == 'cpp'
"set splitbelow
"exec "!g++ -std=c++11 % -Wall -o %<"
":sp
":res -15
":term ./%<
"elseif &filetype == 'java'
"exec "!javac %"
"exec "!time java %<"
"elseif &filetype == 'sh'
"":!time bash %
":sp
":term source %
"elseif &filetype == 'python'
"set splitbelow
":sp
":term python %
"elseif &filetype == 'html'
"silent! exec "!".g:mkdp_browser." % &"
"elseif &filetype == 'markdown'
"exec "MarkdownPreview"
"elseif &filetype == 'tex'
"silent! exec "VimtexStop"
"silent! exec "VimtexCompile"
"elseif &filetype == 'dart'
"CocCommand flutter.run
"elseif &filetype == 'go'
"set splitbelow
":sp
":term go run %
"endif
"endfunc

"}}}4
"}}}3
"}}}2
"}}}1

" Terminal Setup | Tags: #NULL#{{{1
" Mappings | Tags: #NULL#{{{2

" Make <Esc> in terminal mode the same effect as <Esc> in insert mode.
tnoremap <Esc> <C-\><C-N>

"" Use <Alt> + allow keys to switch between splited windows.
"tnoremap <A-H> <C-\><C-N><C-W>h
"tnoremap <A-J> <C-\><C-N><C-W>j
"tnoremap <A-K> <C-\><C-N><C-W>k
"tnoremap <A-L> <C-\><C-N><C-W>l

"}}}2
" Autocmds | Tags: #NULL#{{{2

" Automatically enter insert mode once open up a terminal buffer.
autocmd TermOpen term://* startinsert

"}}}2

" Neovim only. Set terminal colors.
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

"}}}1

" Install Plugins with Vim-plug | Tags: #NULL#{{{1

call plug#begin('~/.config/nvim/plugged')
" Dress Up | Tags: #NULL#{{{2

"Plug 'liuchengxu/eleline.vim' " Elegant statusline.
Plug 'bling/vim-bufferline'    " Show the list of buffers.
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline for vim.
Plug 'chrisbra/Colorizer'      " Color colornames and codes.
Plug 'mg979/vim-xtabline'      " Colorful tabline.
Plug 'ryanoasis/vim-devicons'  " prettify vim with little unicode icons, support several plugins

" Color Schemes | Tags: #NULL#{{{3

Plug 'ajmwagar/vim-deus'     " A better color scheme for late night coders.
Plug 'crusoexia/vim-dracula' " Love Dracula :) .

"}}}3

"}}}2
" File Navigation | Tags: #NULL#{{{2

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File system explorer.
Plug 'Xuyuanp/nerdtree-git-plugin'                     " Show git status flag. Work with latest NERDTree.

"}}}2
" Visual Enhancement | Tags: #NULL#{{{2

Plug 'RRethy/vim-illuminate'         " Automatically highlighting other uses of the current word under the cursor. IDE-like feature.
Plug 'luochen1990/rainbow'           " Show different levels of parentheses in different colors.
Plug 'jaxbot/semantic-highlight.vim' " Every variable is a different color.

"}}}2
" Language Specified |  Tags: #NULL#{{{2

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

"}}}2
" Editor Enhancement | Tags: #NULL#{{{2

Plug 'jiangmiao/auto-pairs'      " Insert or delete brackets, parens, quotes in pairs.
Plug 'Konfekt/FastFold'          " Automatic fold, currently cannot see any functions.
Plug 'scrooloose/nerdcommenter'  " Comment code, with multiple languages support.
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/vim-easy-align'   " Easily align =, +, #, etc. and even regex phrases.
Plug 'easymotion/vim-easymotion' " Provides a simple way to move between characters, words and lines.
Plug 'junegunn/vim-peekaboo'     " Extend \" and @ in normal mode, and <C-R> in command mode, show the contents of the registers on the sidebar.
Plug 'svermeulen/vim-subversive' " Provides two new operator motions to make it very easy to perform quick substitutions.
Plug 'tpope/vim-surround'        " Provides mappings to easily change, create, delete surroundings in pairs.
Plug 'mg979/vim-visual-multi'    " In analogy with visual-block mode, but this plugin works mostly from normal mode.

"}}}2
" Productivity | Tags: #NULL#{{{2
"}}}2
call plug#end()

"}}}1

" Switches | Tags: #NULL#{{{1
" Color Schemes | Tags: #NULL#{{{2

"color deus
color dracula

"}}}2
" Always on | Tags: #NULL#{{{2

" Transparency.
hi Normal ctermbg=none
hi NonText ctermbg=none
hi Normal guibg=none
hi NonText guibg=none

"}}}2
"}}}1

" Plugin Settings | Tags: #NULL#{{{1
" auto-pairs | Tags: #NULL#{{{2

" Do not use <C-H> to delete brackets, cause <C-H> has already been mapped to <Left> key.
let g:AutoPairsMapCh = 0

"}}}2
" Colorizer | Tags: #NULL#{{{2

" Highlight according to syntax.
let g:colorizer_syntax = 1

"}}}2
" eleline.vim | Tags: #NULL#{{{2

let g:airline_powerline_fonts = 0

"}}}2
" Fastfold | Tags: #NULL#{{{2

nmap ffu <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

"}}}2
" markdown-preview.nvim |  Tags: #NULL#{{{2

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 1
let g:mkdp_browserfunc = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = 12345
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

"}}}2
" nerdtree | Tags: #NULL#{{{2

map tt :NERDTreeToggle<CR>
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = ""
"let NERDTreeMapUpdirKeepOpen = "l"
"let NERDTreeMapOpenSplit = ""
"let NERDTreeOpenVSplit = ""
"let NERDTreeMapActivateNode = "i"
"let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = "n"
"let NERDTreeMapChangeRoot = "y"
"let NERDTreeShowHidden = 1

"}}}2
" nerdtree-git-plugin | Tags: #NULL#{{{2

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"}}}2
" semantic-highlight.vim | Tags: #NULL#{{{2

nnoremap <LEADER>st :SemanticHighlightToggle<CR>

"}}}2
" vim-easy-align | Tags: #NULL#{{{2

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"}}}2
" vim-easy-motion | Tags: #NULL#{{{2

" Disable the default mappings.
let g:EasyMotion_do_mapping = 0
" Turn on case-insensitive feature.
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 0

" Go to character.
map  f <Plug>(easymotion-bd-f2)
nmap f <Plug>(easymotion-overwin-f2)
" Go to word.
map  <LEADER>/ <Plug>(easymotion-bd-w)
nmap <LEADER>/ <Plug>(easymotion-overwin-w)

" Replace the default search method with easy-motion's search. (better jump, but only in current file)
map F <Plug>(easymotion-sn)

"}}}2
" vim-peekaboo | Tags: #NULL#{{{2

noremap rr @2

"}}}2
" vim-subversive | Tags: #NULL#{{{2

nmap <LEADER>s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)

"}}}2
" vim-visual-multi |  Tags: #NULL#{{{2

"let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
"let g:VM_maps = {}
"let g:VM_maps['Find Under']         = '<C-j>'
"let g:VM_maps['Find Subword Under'] = '<C-j>'
"let g:VM_maps['Find Next']         = ''
"let g:VM_maps['Find Prev']         = ''
"let g:VM_maps['Remove Region'] = 'q'
"let g:VM_maps['Skip Region'] = ''
"let g:VM_maps["Undo"]      = 'u'
"let g:VM_maps["Redo"]      = '<C-R>'

"}}}2
" vim-xtabline | Tags: #NULL#{{{2

let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
"noremap xcm :XTabCycleMode<CR>
"noremap xti :XTabInfo<CR>

"}}}2
"}}}1

