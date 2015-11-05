" vim vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" manage vundle with vundle
Bundle 'gmarik/vundle'

" plugins managed by vundle
" 
" values represent: [ FG, BG, ATTR ]
"   FG ang BG are color codes
"   ATTR (optional) is a comme-delimited string of one or more of bold, dim, underscore, etc. For details refer to 'message-attr attributes' in tmux man page
Bundle 'itchyny/landscape.vim'

" navigate and open files
Bundle 'scrooloose/nerdtree.git'
Bundle 'jistr/vim-nerdtree-tabs'

map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1


" Python things
Bundle 'davidhalter/jedi-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'klen/python-mode'
Bundle 'jmcantrell/vim-virtualenv'


" buffer and tabs 
" Bundle 'fholgado/minibufexpl.vim'
" Bundle 'buftabs'
Bundle 'jlanzarotta/bufexplorer'


" ctag related bar: http://majutsushi.github.io/tagbar/
Bundle 'majutsushi/tagbar'
" Bundle 'taglist.vim'
" Bundle 'vim-scripts/taglist.vim'


" colorschemes and airline
Bundle 'flazz/vim-colorschemes'
Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'tpope/vim-sensible'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
Bundle 'paranoida/vim-airlineish'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='molokai'
" let g:airline_theme='luna'
" let g:airline_theme='powerlineish'
let g:airline_theme = 'airlineish'

" set guifont=Anonymous\ Pro\ for\ Powerline 
" set guifont=Ubuntu\ Mono\ derivative\ Powerline
let g:Powerline_symbols = 'fancy'

" git
Bundle 'airblade/vim-gitgutter'

" comment code  key short:  [count]<leader>cc  
Bundle 'scrooloose/nerdcommenter'

" markdown
Bundle 'JamshedVesuna/vim-markdown-preview'

let vim_markdown_preview_toggle=1
let vim_markdown_preview_browser='Google Chrome'

"""""""""""""""""""""""""
" Pathogen load
" call pathogen#infect()
" call pathogen#helptags()
"""""""""""""""""""""""""
syntax on

filetype plugin indent on

let mapleader = "\\"
set timeoutlen=2000


" theme主题
set background=light
" set background=dark
set t_Co=256
"set background=dark
"colorscheme elflord
"colorscheme c
"colorscheme C64 
"colorscheme win9xblueback

" or, for the light background mode:
" set background=light

" or any of the other schemes:
"colorscheme darkZ
"colorscheme gor
"colorscheme less 
"colorscheme osx_like
"colorscheme newspaper
"colorscheme django 
"colorscheme colorful256
colorscheme google
"colorscheme jellybeans

" 文件修改后自动重载
set autoread

" 取消备份
set nobackup
" 关闭交换文件
set noswapfile

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
" 突出显示当前行等, 因为主题问题暂时不用
"set cursorcolumn
set cursorline          " 突出显示当前行

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" set helplang=cn

"Insert下按F5开始复制黏贴操作
"设置成n可以用鼠标选择光标
set mouse=n

" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500
" set viminfo^=%
" set magic

" 显示行号： 默认关闭，按F12打开
"set number
" 取消换行。
set nowrap

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 缩进配置
"set smartindent   " Smart indent
"set autoindent    " 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting

" convert tab to spaces
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空>
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

" more subtle popup colors 
"if has ('gui_running')
"    highlight Pmenu guibg=#cccccc gui=bold    
"endif

" minibufexpl config
"map <Leader>e :MBEOpen<cr>
"map <Leader>c :MBEClose<cr>
"map <Leader>t :MBEToggle<cr> :MBEFocus<cr>
"map <F2> :MBEToggle<cr> :MBEFocus<cr>
"let g:miniBufExplMapCTabSwitchBufs = 1
"map <F2> :MBEFocus<CR>
"noremap <C-n> :MBEbn<CR>
"noremap <C-b> :MBEbp<CR>
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplAutoStart=0
"map <Leader>t :MBEToggle<cr>

" gitgutter config
map <F11> :GitGutterToggle<cr>
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" Search related
" remove highlights for search
" * for search current word
" map <F10> :nohls<cr>

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap <F12> :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" TagBar toggle
nmap <F4> :TagbarToggle<CR>

" F9 for PymodeLint
nmap <F9> :PymodeLint<CR>

"F12 show or hide line number
nmap <F10> :set invnumber<CR>

nnoremap <silent> <F2> :BufExplorer<CR>
nnoremap <silent> <F8> :bn<CR>
nnoremap <silent> <F7> :bp<CR>

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeMouseMode=3         "  single click to open folder or file
map <F3> :NERDTreeToggle<CR>

" Syntax for multiple tag files are
" set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.vim/tags/
 
" " TagList Plugin Configuration
" let Tlist_Ctags_Cmd='/usr/bin/ctags'
" let Tlist_Show_One_File=1
" let Tlist_WinWidt=28
" let Tlist_Exit_OnlyWindow=1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Close_On_Select = 1
" let Tlist_Use_Right_Window = 1
" "let Tlist_File_Fold_Auto_Close = 1
" map <F7> :TlistToggle<CR>

"set paste mode shorcat
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
au InsertLeave * set nopaste    " disbale paste mode when leaving insert mode
" nnoremap <F6> :call HideNumber()<CR>

" pymode config
let g:pymode = 1
let g:pymode_warning = 1
let g:pymode_folding = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"let g:pymode_doc = 1
"let g:pymode_doc_bind = '<leader>k'
"let g:pymode_run_bind = '<leader>ru'
"let g:pymode_rope = 1 
"let g:pymode_rope_lookup_project = 1
"let g:pymode_rope_project_root = ""
"let g:pymode_rope_goto_definition_bind = "<leader>g"
let g:pymode_rope_goto_definition_cmd = 'new'
"let g:pymode_rope_rename_bind = '<leader>rr'
"let g:pymode_rope_rename_module_bind = '<leader>r1r'
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_lint = 1
"let g:pymode_lint_on_write = 1 
"let g:pymode_lint_unmodified = 0
let g:pymode_lint_cwindow = 0 
let g:pymode_lint_on_fly = 1 
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"let g:pymode_lint_cwindow = 1
"let g:pymode_lint_signs = 1
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
let g:pymode_paths = ['/usr/lib/python2.7']


" ================  ============================
" Key               Command
" ================  ============================
" [[                Jump to previous class or function (normal, visual, operator modes)
" ]]                Jump to next class or function  (normal, visual, operator modes)
" [M                Jump to previous class or method (normal, visual, operator modes)
" ]M                Jump to next class or method (normal, visual, operator modes)
" aC                Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC                Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM                Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM                Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
" ================  ============================


"Jedi-Vim settings
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#use_splits_not_buffers = "bottom"  "open in split not buffer
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "<leader>k"
let g:jedi#max_doc_height = 35
let g:jedi#auto_close_doc = 1
let g:jedi#popup_on_dot = 1 
let g:jedi#popup_select_first = 1 
let g:jedi#completions_enabled = 1
let g:jedi#completions_command = "<C-n>"
let g:jedi#usages_command = "<leader>u"
let g:jedi#rename_command = "<leader>r"

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"快速的放大缩小Split窗口的快捷键 + -
"map <C-W>- <C-W>-
"map <C-W>+ <C-W>+
"map <C-W>< <C-W><
"map <C-W>> <C-W>>
"map <leader>- <C-W>-
"map <C-m> <C-W>+
"map <leader>, <C-W><
"map <C-o> <C-W>>

" 自动调整split窗口大小
" Resize the current split to at least (90,25) but no more than (140,60)
" or 2/3 of the available space otherwise.

"function Splitresize()
"    let hmax = max([winwidth(0), float2nr(&columns*0.66), 80])
"    let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
"    exe "vertical resize" . (min([hmax, 140]))
"    exe "resize" . (min([vmax, 60]))
"endfunction

" move between splits without the ctrl-w prefix

"nnoremap <silent><C-J> <C-W><C-J>:call Splitresize()<CR>
"nnoremap <silent><C-K> <C-W><C-K>:call Splitresize()<CR>
"nnoremap <silent><C-L> <C-W><C-L>:call Splitresize()<CR>
"nnoremap <silent><C-H> <C-W><C-H>:call Splitresize()<CR>


"map <C-i> :tabnew<cr>
"map <leader>e :tabedit 
"map <leader>c :tabclose<cr>
"map <leader>m :tabmove 
"map <leader>h :tabprevious<cr>
"map <leader>l :tabnext<cr>


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>t :tabedit <c-r>=expand("%:p:h")<cr>/

" select all
map <leader>sa ggVG"

" integrate with Powerline
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/


" always show status line
set laststatus=2
