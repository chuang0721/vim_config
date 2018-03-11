"""""""""""""""""""""""""""""""""""""""""
" ReadMe   : README.md
" Version  : 1.0 - Jan. 16,2014
" Contents : -> 基础配置设置
"            -> 自定义快捷键
"            -> 主题颜色显示
"            -> 其它杂项配置
"            -> 插件管理配置
"            -> 自定义的函数
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
" 基础配置设置
"""""""""""""""""""""""""""""""""""""""""
filetype on                      "检测文件类型
filetype indent on               "针对不同的文件类型采用不同的缩进格式
filetype plugin on               "允许插件
filetype plugin indent on        "启动自动补全

set nobackup                     "不自动保存
"set relativenumber number      "相对行号，可用Ctrl+n在相对/绝对行号间切换
set norelativenumber number
set history=2000                 "history存储长度
set nocompatible                 "非兼容vi模式,避免以前版本的一些bug和局限
set autoread                     "文件修改之后自动载入
set shortmess=atI                "启动的时候不显示那个援助索马里儿童的提示
"set t_ti= t_te=                  "退出vim后，内容显示在终端屏幕
set title                        "change the terminal's title
set novisualbell                 "don't beep
set noerrorbells                 "don't beep
set showmatch                    "括号配对情况
set hidden                       "A buffer becomes hidden when it is abandoned
set wildmode=list:longest
set ttyfast
set wildignore=*.swp,*.,*.pyc,*.class
set scrolloff=7                  "至少有7行在光标所在行上下
"set mouse=a                      "为所有模式启用鼠标
set selection=old
set selectmode=mouse,key
set viminfo^=%                   "Remember info about open buffers on close
set magic                        "正则表达式匹配形式
set backspace=eol,start,indent   "Configure backspace so it acts as it should act
"set whichwrap+=<,>,h,l
set completeopt-=preview

" 搜索
"""""""""""""""""""""""""""""""""""""""""
set hlsearch                     "高亮search命中的文本。
set ignorecase                   "搜索时忽略大小写
set incsearch                    "随着键入即时搜索
set smartcase                    "有一个或以上大写字母时仍大小写敏感

" 折叠
"""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=indent
set foldlevel=99

" 缩进
"""""""""""""""""""""""""""""""""""""""""
set smartindent                  "智能缩进
set autoindent                   "总是自动缩进
set tabstop=4                    "设置Tab键的宽度(等同的空格个数)
set shiftwidth=4                 "自动对齐的空格数
set softtabstop=4                "按退格键时可以一次删掉4个空格
set smarttab                     "insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab                    "将Tab自动转化成空格(需要输入真正的Tab键时,使用Ctrl+V+Tab)
set shiftround                   "Use multiple of shiftwidth when indenting with '<' and '>'
set list listchars=tab:>-,trail:-
set cc=80

" 编码
"""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,chinese,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set helplang=cn
set termencoding=utf-8           "这句只影响普通模式 (非图形界面) 下的Vim
set ffs=unix,dos,mac             "Use Unix as the standard file type
set formatoptions+=m             "如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=B             "合并两行中文时，不在中间加空格：

" 语法
"""""""""""""""""""""""""""""""""""""""""
syntax enable                    "打开语法高亮
syntax on

" 撤销
"""""""""""""""""""""""""""""""""""""""""
set undolevels=1000              "How many undos
set undoreload=10000             "number of lines to save for undo
if v:version >= 730
    set undofile                 "keep a persistent backup file
    set undodir=~/bak/vimundo/
endif

" 状态栏
"""""""""""""""""""""""""""""""""""""""""
set ruler                        "显示当前的行号列号
set showcmd                      "在状态栏显示正在输入的命令
set showmode
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2                 "命令行（在状态行下）的高度，默认为1，这里是2

" 相对绝对行号
"""""""""""""""""""""""""""""""""""""""""
"autocmd FocusLost * :set norelativenumber number
"autocmd FocusGained * :set relativenumber
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber

set cursorline                  "突出显示当前行，可用Ctrl+k切换是否显示
set cursorcolumn                "突出显示当前列，可用Ctrl+k切换是否显示

"""""""""""""""""""""""""""""""""""""""""
" 自定义快捷键
"""""""""""""""""""""""""""""""""""""""""
" 前导符号
"""""""""""""""""""""""""""""""""""""""""
let mapleader = ','
let g:mapleader = ','
let g:netrw_silent = 1

" 常用快捷键
"""""""""""""""""""""""""""""""""""""""""
" 到光标所在行第一个非空字符
map ( ^
map ) $

" 从光标处复制到行尾，不包括行尾结束符
map Y y$

" 选中状态下 Ctrl+c 复制
vmap cc "+y

" 保存
map <leader>w :w!<cr>

" 保存并退出当前窗口
map <leader>q :wq!<CR>

" 全选
map <C-a> ggVG

" 相对/绝对行号转换
noremap <leader>rt :call NumberToggle()<cr>
cnoremap <leader>rt :call NumberToggle()<cr>:

" 按;直接进入命令行模式
nnoremap ; :

" 去掉查找后的高亮显示
noremap <silent><leader>/ :nohls<CR>

" 多窗口标签快捷键
"""""""""""""""""""""""""""""""""""""""""
" 在多个窗口间切换
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""
" 主题颜色显示
"""""""""""""""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" 修改主题和颜色展示
set background=dark
colorscheme solarized
set t_Co=256

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange


"""""""""""""""""""""""""""""""""""""""""
" 插件管理配置开始
"""""""""""""""""""""""""""""""""""""""""
" package dependent:  ctags
" python dependent:  pep8, pyflake

set tags=tags;

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" vim plugin bundle control, command model
" :BundleInstall     install
" :BundleInstall!    update
" :BundleClean       remove plugin not in list

" 插件：目录导航等
"""""""""""""""""""""""""""""""""""""""""
Bundle 'scrooloose/nerdtree'
nnoremap<leader>n :exe'NERDTreeToggle'<CR>
let NERDTreeHighlightCursorline=1
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" for minibufferexpl
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1

" 默认方向键左右可以切换buffer
nnoremap <TAB> :MBEbn<CR>
noremap <leader>bn :MBEbn<CR>
noremap <leader>bp :MBEbp<CR>
noremap <leader>bd :MBEbd<CR>

" 插件：标签导航等
"""""""""""""""""""""""""""""""""""""""""
Bundle 'majutsushi/tagbar'
nnoremap<leader>t :exe'TagbarToggle'<CR>
let g:tagbar_left = 1
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

Bundle 'talek/obvious-resize'
" 移动中间栏
noremap <silent> K :<C-U>ObviousResizeUp<CR>
noremap <silent> J :<C-U>ObviousResizeDown<CR>
noremap <silent> H :<C-U>ObviousResizeLeft<CR>
noremap <silent> L :<C-U>ObviousResizeRight<CR>

" 插件：文件搜索
"""""""""""""""""""""""""""""""""""""""""
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0

" 插件：状态栏美观
"""""""""""""""""""""""""""""""""""""""""
Bundle 'Lokaltog/vim-powerline'

" 插件：括号显示增强
"""""""""""""""""""""""""""""""""""""""""
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
" settings for kien/rainbow_parentheses.vim
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" 插件：将每行无效的空格标红（,空格按键去掉末尾空格）
"""""""""""""""""""""""""""""""""""""""""
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

" 插件：快速移动
"""""""""""""""""""""""""""""""""""""""""
" 更高效的移动 ,, + w/fx
Bundle 'Lokaltog/vim-easymotion'

" 插件:search
"""""""""""""""""""""""""""""""""""""""""
Bundle 'dkprice/vim-easygrep'
let EasyGrepRecursive = 1
let EasyGrepWindow = 1

" 插件：快速加/减注释(选中后,按,cc加上注释,按,cu解开注释)
"""""""""""""""""""""""""""""""""""""""""
Bundle 'scrooloose/nerdcommenter'

" 插件：自动补全单引号，双引号等
"""""""""""""""""""""""""""""""""""""""""
Bundle 'Raimondi/delimitMate'
" for python docstring " ,优化输入
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']

" 自动补全html/xml标签
Bundle 'docunext/closetag.vim'
let g:closetag_html_style=1

" 插件：代码格式化
"""""""""""""""""""""""""""""""""""""""""
Bundle 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" for visual selection
Bundle 'terryma/vim-expand-region'
"map J <Plug>(expand_region_expand)
"map K <Plug>(expand_region_shrink)

" 插件：语法检查
"""""""""""""""""""""""""""""""""""""""""
Plugin 'vim-syntastic/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_lua_checkers = ['luac', 'luacheck']
let g:syntastic_lua_luacheck_args = "--no-redefined --std ngx_lua+lua51c+luajit --codes --module"
highlight SyntasticStyleErrorSign guifg=white
highlight SyntasticStyleWarningSign guifg=white

Plugin 'nvie/vim-flake8'
map <leader>ch :call Flake8()<CR>

" 插件：具体语言语法高亮
"""""""""""""""""""""""""""""""""""""""""
" for python.vim syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

" for markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

Bundle 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

Plugin 'mzlogin/vim-markdown-toc'
let g:vmt_dont_insert_fence = 1

Plugin 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/bin/python'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=1
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings=1
"离开插入模式后自动关闭预览窗口"
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_auto_trigger = 1
let g:ycm_semantic_triggers = {
        \     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
        \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
        \     'perl' : ['->', '::', ' '],
        \     'php' : ['->', '::', '.'],
        \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
        \     'ruby' : ['.', '::'],
        \     'python' : ['.'],
        \     'lua' : ['.', ':']
        \ }

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'terryma/vim-multiple-cursors'

Plugin 'tbastos/vim-lua'

" end turn on
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""
" 插件管理配置结束
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
" 自定义的函数
"""""""""""""""""""""""""""""""""""""""""
" 相对绝对行号转换
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc

fun! DeleteAllBuffersInWindow()
    let s:curWinNr = winnr()
    if winbufnr(s:curWinNr) == 1
        ret
    endif
    let s:curBufNr = bufnr("%")
    exe "bn"
    let s:nextBufNr = bufnr("%")
    while s:nextBufNr != s:curBufNr
        exe "bn"
        exe "bdel ".s:nextBufNr
        let s:nextBufNr = bufnr("%")
    endwhile
endfun
map <leader>bda :call DeleteAllBuffersInWindow()<CR>

