" Author: @NiiiKlaus

" <Editor Setup>

"" <Options>

""" <Stable>

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

""" </Stable>

""" <Experimental>
""" </Experimental>

""" <Legacy>
""" </Legacy>

"" </Options>

"" <Autocmds>

" Jump to the place edited recently.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"" </Autocmds>

"" <Mappings>

""" <Stable>

"""" <First of all>

" Use <Space> as <LEADER>.
let g:mapleader=" "

"""" </First of all>

"""" <Failsafe>

" Disable the default s key
noremap s <Nop>

" Map <LEADER>*n for <nop> in case the cursor freezes.
noremap <LEADER><LEADER> <Nop>
noremap <LEADER><LEADER><LEADER> <Nop>
noremap <LEADER><LEADER><LEADER><LEADER> <Nop>
noremap <LEADER><LEADER><LEADER><LEADER><LEADER> <Nop>

"""" </Failsafe>

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
noremap <silent> <LEADER>o za

"""" <Cursor Movement>

""""" <Normal Mode>

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

""""" </Normal Mode>

""""" <Insert Mode>

inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-K> <Up>
inoremap <C-J> <Down>

""""" </Insert Mode>

""""" <Command Mode>

cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-K> <Up>
cnoremap <C-J> <Down>

""""" </Command Mode>

"""" </Cursor Movement>

"""" <Window Management>

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

"""" </Window Management>

"""" <Tab Management>

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

"""" </Tab Management>

"""" <Other Useful Stuff>

" Spell check.
noremap <LEADER>sc :set spell!<CR>

" Install plugins.
noremap <LEADER>pi :source $MYVIMRC<CR>:PlugInstall<CR>
" Update plugins.
noremap <LEADER>pu :source $MYVIMRC<CR>:PlugUpdate<CR>
" Clean plugins.
noremap <LEADER>pc :source $MYVIMRC<CR>:PlugClean<CR>

"""" </Other Useful Stuff>

""" </Stable>

""" <Legacy>

"""" <No.1>

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

"""" </No.1>

""" </Legacy>

"" </Mappings>

" </Editor Setup>

" <Terminal Setup>

"" <Mappings>

" Make <Esc> in terminal mode the same effect as <Esc> in insert mode.
tnoremap <Esc> <C-\><C-N>

" Use <Alt> + allow keys to switch between splited windows.
"tnoremap <A-H> <C-\><C-N><C-W>h
"tnoremap <A-J> <C-\><C-N><C-W>j
"tnoremap <A-K> <C-\><C-N><C-W>k
"tnoremap <A-L> <C-\><C-N><C-W>l

"" </Mappings>

"" <Autocmds>

" Automatically enter insert mode once open up a terminal buffer.
autocmd TermOpen term://* startinsert

"" </Autocmds>

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

" </Terminal Setup>

" <Install Plugins with vim-plug>

call plug#begin('~/.config/nvim/plugged')

"" <Dress Up>

"Plug 'liuchengxu/eleline.vim' " Elegant statusline.
Plug 'bling/vim-bufferline'    " Show the list of buffers.
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline for vim.
Plug 'chrisbra/Colorizer'      " Color colornames and codes.
Plug 'mg979/vim-xtabline'      " Colorful tabline.
Plug 'ryanoasis/vim-devicons'  " prettify vim with little unicode icons, support several plugins


""" <Color Schemes>

Plug 'ajmwagar/vim-deus'     " A better color scheme for late night coders.
Plug 'crusoexia/vim-dracula' " Love Dracula :) .

""" </Color Schemes>

"" </Dress Up>

"" <File Navigation>

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File system explorer.
Plug 'Xuyuanp/nerdtree-git-plugin'                     " Show git status flag. Work with latest NERDTree.

"" </File Navigation>

"" <Visual Enhancement>

Plug 'RRethy/vim-illuminate'         " Automatically highlighting other uses of the current word under the cursor. IDE-like feature.
Plug 'luochen1990/rainbow'           " Show different levels of parentheses in different colors.
Plug 'jaxbot/semantic-highlight.vim' " Every variable is a different color.

"" </Visual Enhancement>

"" <Editor Enhancement>

Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'

"" </Editor Enhancement>

"" <Productivity>
"" </Productivity>

call plug#end()

" </Install Plugins with vim-plug>

" <Switches>


"" <Color Schemes>

"color deus
color dracula

"" </Color Schemes>

"" <Always On>

" Transparency.
hi Normal ctermbg=none
hi NonText ctermbg=none
hi Normal guibg=none
hi NonText guibg=none

"" </Always On>

" </Switches>

" <Plugin Settings>

" Do not use <C-H> to delete brackets, cause <C-H> has already been mapped to <Left> key.
let g:AutoPairsMapCh = 0

"" <auto-pairs>"

"" </auto-pairs>"

"" <Colorizer>

" Highlight according to syntax.
let g:colorizer_syntax = 1

"" </Colorizer>

"" <eleline.vim>

let g:airline_powerline_fonts = 0

"" </eleline.vim>

"" <nerdtree>

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

"" </nerdtree>

"" <nerdtree-git-plugin>

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

"" </nerdtree-git-plugin>

"" <semantic-highlighting>

nnoremap <LEADER>s :SemanticHighlightToggle<CR>

"" </semantic-highlighting>

"" <vim-easy-align>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" </vim-easy-align>

"" <xtabline>

let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
"noremap xcm :XTabCycleMode<CR>
"noremap xti :XTabInfo<CR>

"" </xtabline>

" </Plugin Settings>
