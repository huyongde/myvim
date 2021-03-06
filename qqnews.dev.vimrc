let $VIMRUNTIME="/data/yongdehu/vim/runtime"
set runtimepath=/data/yongdehu/vim/runtime/
set nocompatible                    "不兼容vi, 以便使用vim更强大的功能, 默认兼容
                                    "必需是第一个设定的选项, 和set compatible相反
set nonumber                          "显示行号
set statusline=%2*%n%m%r%h%w%*\ %f\ %1*[FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%1*]\ [Type=%2*%Y%1*]\ [Column=%2*%v%1*]\ [Line=%2*%l%1*/%3*%L(%p%%)%1*]

"" vim重新打开文件时定位光标到上次离开文件时，光标所在的位置
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif "" 这种方式会导致每次ctrl + o会跳转到当前文件第一行
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal g'\"" |
    \ endif
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
                                    "以上3个键配合使用
set encoding=utf-8             "使用utf-8打开文件
set fileencodings=utf-8             "使用utf-8打开文件
set modeline                        "可以针对每个文件进行文件级别的设置, 这些设置覆盖.vimrc
set cursorline                      "高亮显示光标所在行

set incsearch                       " 设置增量搜索
set ignorecase "" 不区分大小写
set hlsearch                        "高亮度搜索, 默认也是开启的

set showmatch                       "高亮显示匹配的括号
set foldmethod=marker               "代码折叠
set completeopt-=preview            "自动补全, 按ctrl+p显示候选项, 再ctrl+p进行选择
set backspace=indent,eol,start      "允许退格键的3个功能正常运行
set laststatus=2                    "总是显示状态行
set autoread                        "文件在Vim之外修改过，自动重新读入
"set scrolloff=999                  "光标总是在屏幕的中间
syntax on                           "显示语法高亮
filetype on                         "打开文件类型检测功能
"filetype plugin on                  "打开文件类型检测功能
filetype indent on                  "允许VIM为不同类型的文件定义不同的缩进
                                    "以上三个合一: filetype plugin indent on
colorscheme molokai2              "配色方案

set scrolloff=20
let mapleader = ","
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F8> :mksession!<CR>
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>

"启用pathogen进行目录管理
execute pathogen#infect()  

"let g:neocomplete#enable_at_startup = 1 "启用neocomplete

"golang config
let g:airline#extensions#tabline#enabled = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:nerdtree_tabs_autoclose = 0
let g:EclimCompletionMethod = 'omnifunc'

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
"au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)

nmap ,dt a<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
imap ,dt <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'
" 语法检查插件
"Plugin 'scrooloose/syntastic'
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_auto_loc_list = 0 " 解决E926: Current location list was changed

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting=1
let g:syntastic_c_checker=0
" 设置错误符号
let g:syntastic_error_symbol='E'
" " 设置警告符号
let g:syntastic_warning_symbol='W'
" location list always updated  
let g:syntastic_always_populate_loc_list = 1  
" collect errors when use multple checkers  
let g:syntastic_aggregate_errors = 1  


"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
Plugin 'Valloric/YouCompleteMe'

" golang start
Plugin 'nsf/gocode', {'rtp': 'vim/'} " 代码补全, 配合YouCompleteMe来实现golang代码补全

Plugin 'dgryski/vim-godef'
Plugin 'fatih/vim-go'
Bundle 'majutsushi/tagbar'
let g:tagbar_autofocus = 1
let g:tagbar_type_php  = {
     \ 'ctagstype' : 'php',
     \ 'kinds'     : [
         \ 'i:interfaces',
         \ 'c:classes',
         \ 'd:constant definitions:1',
         \ 'f:functions:1',
         \ 'j:javascript functions:1'
     \ ]
   \ }
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables:1',
        \ 't:types:1',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods:1',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"""set for godef
let g:godef_split=0 "打开新窗口的时候左右split
let g:godef_same_file_in_same_window=1 "函数在同一个文件中时不需要打开新窗口

" YCM
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Tab>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<s-Tab>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'go' : ['.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
    

" golang end

filetype plugin on
"autocmd! BufWritePost *.php :!/usr/local/qqwebsrv/php/bin/php -l % 
"autocmd BufWritePre *.go :!gofmt -w %
"
"" 设置代码默认不折叠
set foldlevelstart=99

