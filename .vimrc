" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible " Use Vim defaults instead of 100% vi compatibility
set backspace=2  " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup




let skip_defaults_vim=1
set tabstop=4
set shiftwidth=4
set number
set history=50
set smartindent
set autoindent
set mouse=a


" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'morhetz/gruvbox' "配色方案
"Plugin 'altercation/vim-color-solarized'
Plugin 'ashfinal/vim-colors-violet'
Plugin 'ayu-theme/ayu-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'Yggdroot/indentLine' "缩进标线
Plugin 'godlygeek/tabular'  "代码对齐
Plugin 'scrooloose/nerdtree' " 文件管理器
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tomtom/tcomment_vim' "注释
Plugin 'kien/rainbow_parentheses.vim' "彩虹括号
Plugin 'majutsushi/tagbar' "代码提纲
Plugin 'justinmk/vim-syntax-extra'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'hdima/python-syntax'
Plugin 'Raimondi/delimitMate' "补全括号
Plugin 'w0rp/ale' "代码检测
Plugin 'kien/ctrlp.vim' "文件查询
Plugin 'hrp/EnhancedCommentify' "注释
"Plugin 'plasticboy/vim-markdown' "markdown
"Plugin 'suan/vim-instant-markdown' "markdown
"Plugin 'VimIM'
Plugin 'Valloric/YouCompleteMe'
" 插件列表结束
call vundle#end()
filetype plugin indent on

set encoding=utf-8
" Plugin YCM settings.
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1

"缩进标线
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

"彩虹括号
let g:rbpt_colorpairs = [
    \ ['brown', 'RoyalBlue3'],
    \ ['Darkblue', 'SeaGreen3'],
    \ ['darkgray', 'DarkOrchid3'],
    \ ['darkgreen', 'firebrick3'],
    \ ['darkcyan', 'RoyalBlue3'],
    \ ['darkred', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown', 'firebrick3'],
    \ ['gray', 'RoyalBlue3'],
    \ ['black', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue', 'firebrick3'],
    \ ['darkgreen', 'RoyalBlue3'],
    \ ['darkcyan', 'SeaGreen3'],
    \ ['darkred', 'DarkOrchid3'],
    \ ['red', 'firebrick3'],
    \ ]
let g:rbpt_max = 8
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

"补全括号
au FileType python let b:delimitMate_nesting_quotes = ['"']

" F2 快速切换
nmap <F2> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$','\.png$','\.jpg$','\.gif$','\.mp3$','\.flac$', '\.ogg$', '\.mp4$','\.avi$','.webm$','.mkv$','\.pdf$', '\.zip$', '\.tar.gz$', '\.rar$']
"tag 快速切换
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_right=1
autocmd VimEnter * wincmd l


"python代码高亮
let python_highlight_all = 1

"注释

let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'


" Other Setting
"=====================================================================
" 首先设置 mapleader，后面键盘映射随时要用,leader键默认是\
" 基本上所有自定义的快捷键都以这个字符打头，比如映射`,w`为`:w`
"let mapleader = ","
"let g:mapleader = ","

" 不兼容 Vi，最大限度使用新特性
set nocompatible

" 写入文件时，不做备份
set nobackup
set nowritebackup

" 不用交换文件
set noswapfile

" 保存文件的快捷键
nmap <leader>w :w!<CR>

" 移除 Windows 文件结尾的 `^M`
noremap <leader>m :%s/<C-V><C-M>//ge<CR>

" 重新打开文件时，恢复上一次游标位置
" 通过View可以记住很多设置，比如高亮当前行、折行等等，但是往往比较让人费解
set viewoptions=cursor  " 只记住游标
au BufWinLeave ?* mkview
au VimEnter ?* silent loadview

" 检测文件编码时，优先考虑 UTF-8
set fileencodings=utf-8,ucs-bom,gbk,gb2312,big5,latin1

" 不同平台，设置不同的行尾符，即 EOL
" 注意：在 Mac 平台，也是 unix 优先；自 OS X 始，行尾符与 Unix 一致，
"      都是 `\n` 而不是 `\r`
if has("win32")
    set fileformats=dos,unix,mac
else
    set fileformats=unix,mac,dos
endif

" 在断行、合并(join)行时，针对多字节字符（比如中文）的优化处理
set formatoptions+=mM

"配色方案
syntax enable
"colorscheme violet 
set background=dark
"set background=light
"set t_Co=256
"colorscheme solarized
"colorscheme evening 
"colorscheme onedark 
"colorscheme desert
colorscheme gruvbox
"colorscheme molokai
"colorscheme palenight
set guifont=Source_Code_Pro:h12

au BufEnter * :syntax sync fromstart

au FileType text,markdown,html,xml set wrap

" 折行时，以单词为界，以免切断单词
set linebreak
" 折行后的后续行，使用与第一行相同的缩进
set breakindent

set nu
set tabstop=4
set smartindent
set autoindent
set nobackup
set nowritebackup
set noundofile
set fdm=marker "fdm = foldmethod
"=============================================================================
"key map



"启动窗口大小

if has('win32')
  au GUIEnter * simalt ~x
else
  au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"NERDTree 初始目录
autocmd BufEnter * lcd %:p:h

"中文输入法切换问题 
"仅在gvim情况下有效,在mac环境下可能需要其他插件配合，但是看了一下都觉得不好用
"if has("gui_running")
" set imactivatekey=C-space
" inoremap <ESC> <ESC>:set iminsert=2<CR>
"endif

"去掉错误的提示音
set belloff=all

set clipboard=unnamed

"set noimd
"set imi=2
"set ims=2

"中文輸入法
"ctrl+shift+_ 用来切换中英文
"ctrl+shift+6 用来切换輸入法
"

"屏蔽YCM诊断信息
let g:ycm_show_diagnostics_ui = 0
"诊断的等级是info
let g:ycm_server_log_level = 'info'
"=======================================================
"ale 配置

"保持侧边栏可见
let g:ale_sign_column_always = 1

"改变错误和警告标识符：
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'

"添加状态栏信息：
"%{ALEGetStatusLine()}

"改变状态栏信息格式：
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

"改变命令行消息：
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"添加检测完成后回调：
"augroup YourGroup
""    autocmd!
""    autocmd User ALELint call YourFunction()
"augroup END


"自定义跳转错误行快捷键：
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'

"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}


"设置状态栏显示的内容
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\
"%{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
"
" F5编译和运行C程序，C++程序,Python程序，shell程序，F9 gdb调试
 
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'python'
        exec '!python3 %'
    elseif &filetype == 'sh'
        :! bash %
    endif                                                                              
endfunc

map <F6> :call Rungdb()<CR>  
func! Rungdb()  
    exec "w"  
    exec "!g++ % -g -o %<"  
    exec "!gdb ./%<"  
endfunc
