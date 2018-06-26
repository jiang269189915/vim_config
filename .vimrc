"vim configuration
"set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


"colorscheme default
"colorscheme darkblue
colorscheme desert
"colorscheme molokai
set guifont=Monaco:h20 



"自动加载修改后的文件
set autoread

"针对不同文件类型采用不同缩进格式
filetype indent on

"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

"粘贴保留格式
set paste

"显示行列号
set number
set ruler
"括号配对
set showmatch

"搜索高亮
set hlsearch

"忽略大小写
set ignorecase
"有一个或以上大写字母敏感
set smartcase


set tabstop=4
set shiftwidth=4
set softtabstop=4

"自动转化tab为空格
set expandtab

"启动折叠
set foldenable
" 折叠方法  
" manual    手工折叠  
" indent    使用缩进表示折叠  
" expr      使用表达式定义折叠  
" syntax    使用语法定义折叠  
" diff      对没有更改的文本进行折叠  
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}} 
"set foldmethod=indent
" 在左侧显示折叠的层次  
"set foldcolumn=4 

"突出当前行
"set cursorline

"上下滚动，始终在中间
set so=5

"语法高亮
syntax enable
syntax on


"==========================================  
" file encode  
"==========================================  
" 设置新文件的编码为 UTF-8  
"set fileencoding=utf8  
"set enc=2byte-gb18030  
" 自动判断编码时，依次尝试以下编码：  
"set fileencodings=utf-8,gb18030,default  
" gb18030 最好在 UTF-8 前面，否则其它编码的文件极可能被误识为 UTF-8  

" Use Unix as the standard file type  
set ffs=unix,dos,mac  

" 如遇Unicode值大于255的文本，不必等到空格再折行。  
set formatoptions+=m  
" 合并两行中文时，不在中间加空格：  
set formatoptions+=B  

"ctags config
"set tags=tags;
"set autochdir

"cscope config
if filereadable("cscope.out") 
    cs add cscope.out 
endif 

"附常用的命令：
"    ：cs find s ---- 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
"　　：cs find g ---- 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
"　　：cs find d ---- 查找本函数调用的函数：cs find c ---- 查找调用本函数的函数
"　　：cs find t: ---- 查找指定的字符串
"　　：cs find e ---- 查找egrep模式，相当于egrep功能，但查找速度快多了
"　　：cs find f ---- 查找并打开文件，类似vim的find功能
"　　：cs find i ---- 查找包含本文件的文
"Ctrl+]将跳到光标所在变量或函数的定义处 Ctrl+T返回
if has("cscope")
    set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
    " check cscope for definition of a symbol before checking ctags:
    " set to 1 if you want the reverse search order.
    set csto=1

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add the database pointed to by environment variable
    elseif $CSCOPE_DB !=""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


"taglist config
" 按F8按钮，在窗口的左侧出现taglist的窗口,像vc的左侧的workpace
nnoremap <silent> <F8> :TlistToggle<CR><CR>
" :Tlist              调用TagList
let Tlist_Show_One_File=0                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=0                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠

"YouCompleteM _conf=0confmg
Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloost/syntastic'
set completeopt=longest,menu "让vim的补全菜单行为与一般IDE一致
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_indentifiers_from_tag_files = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<C-z>'
let g:ycm_confirm_extra_conf = 0
"set completeopt=menu,menuone
"let g:ycm_key_list_select_completion = ['<k>']
"let g:ycm_key_list_select_completion = ['<j>']
noremap <c-z> <NOP>

" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>gj :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gi :YcmCompleter GoToDefinitionElaseDeclaretin<CR>
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
"whitelist
let g:ycm_filetype_whitelist = {
            \"c":1,
            \"cpp":1,
            \"py":1,
            \"hpp":1
            \}

"将键盘上的F4功能键映射为添加作者信息的快捷键  
map <F4> ms:call TitleDet()<cr>'s  
function AddTitle()  
    call append(0,"/*******************************************************************************")  
    call append(1," * Author: wwjiang")  
    call append(2," * Email: jww5310@163.com")  
    call append(3," * Last modified: ".strftime("%Y-%m-%d %H:%M"))  
    call append(4," * Filename: ".expand("%:t"))  
    call append(5," * Description: ")  
    call append(6," * *****************************************************************************/")  
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None  
endf 
"更新最近修改时间和文件名  
function UpdateTitle()  
    normal m'  
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'  
    normal "  
    normal mk  
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'  
    execute "noh"  
    normal 'k  
    echohl WarningMsg | echo "Successful in updating the copy right."| echohl None  
endfunction  

"判断前10行代码里面，是否有Last modified这个单词，  
"如果没有的话，代表没有添加过作者信息，需要新添加；  
"如果有的话，那么只需要更新即可  
function TitleDet()  
    let n=1  
    while n < 10  
        let line = getline(n)  
        if line =~'^\#\s*\S*Last\smodified:\S*.*$'  
            call UpdateTitle()  
            return  
        endif  
        let n = n + 1  
    endwhile  
    call AddTitle()  
endfunction  

"选中复制
vmap <C-c> "+y

set enc=utf-8
set autoindent
set smartindent
set cindent
set cindent

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
