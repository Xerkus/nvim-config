" Environment {
    let $VIMHOME = split(&rtp, ',')[0] " Find the Vim path

    " Force true color. Sets 'gui_running' feature to 1. Caution: True color
    " support is not universal, @see https://gist.github.com/XVilka/8346728
    set termguicolors
    set mouse=a

    " Local Configuration {
        if filereadable(expand("$VIMHOME/config.local.vim"))
            source $VIMHOME/config.local.vim
        endif
    " }
" }

call plug#begin(expand("$VIMHOME/plugins"))
" Bundles {
  "  Plug 'EvanDotPro/php_getset.vim'
  "  Plug 'EvanDotPro/vim-zoom'
    Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
    Plug 'StanAngeloff/php.vim'
    Plug 'othree/html5.vim'
    Plug 'HerringtonDarkholme/yats.vim'
"   Plug 'fatih/vim-go'
"   Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'airblade/vim-gitgutter'
    Plug 'chrisbra/vim-diff-enhanced'
    Plug 'vim-airline/vim-airline'
    Plug 'godlygeek/tabular'
    Plug 'joonty/vdebug'
  "  Plug 'mattn/emmet-vim'
  "  Plug 'mattn/gist-vim'
  "  Plug 'mattn/webapi-vim'
    Plug 'mikehaertl/pdv-standalone'
    Plug 'scrooloose/nerdtree'
    Plug 'EvanDotPro/nerdtree-symlink'
    Plug 'scrooloose/syntastic'
  "  Plug 'shawncplus/phpcomplete.vim' " patched ctags completion
  "  Plug 'mkusher/padawan.vim' " php completion implemented in php, @see mkusher/padawan.php
    Plug 'phpvim/phpcd.vim', {'do': 'composer update'}
    Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
    Plug 'Shougo/vimproc.vim', {'do' : 'make'} " required for tsuquyomi
    Plug 'Quramy/tsuquyomi'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-fugitive'
    Plug 'shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'whatyouhide/vim-gotham'
    Plug 'flazz/vim-colorschemes' " temp collection of colorschemes
" }
call plug#end()
delc PlugUpgrade " vim-plug is installed as git submodule, this command
                 " will replace plug.vim inplace so I disable it

" General {
    filetype plugin indent on " Automatically detect file types.
    syntax on                 " syntax highlighting
    set virtualedit=all       " allow for cursor beyond last character
    set hidden                " allow buffer switching without saving
    scriptencoding utf-8
    set encoding=utf-8
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    autocmd vimenter * silent! lcd %:p:h
    " autocmd VimEnter * execute "cd" fnameescape(g:startDir)

" }

" Vim UI {

    set shortmess+=I                       " Disable splash text
    set guifont=Anonymous\ Pro\ 11         " Way better than monospace
  "  colorscheme gotham                     " Vim colorscheme
  "  colorscheme Tomorrow-Night
    colorscheme jellybeans
    let g:airline_theme='gotham'           " Airline colorscheme
    au VimEnter * colorscheme jellybeans
    set background=dark
    set laststatus=2                       " Always show status bar
    set mousemodel=popup                   " Enable context menu

    set backspace=indent,eol,start " backspace for dummies
    set linespace=0                " no extra spaces between rows
    set number                     " line numbers on
    set cpoptions+=$               " cool trick to show what you're replacing
    set showmatch                  " show matching brackets/parenthesis
    set showcmd                    " show multi-key commands as you type
    set incsearch                  " find as you type search
    set hlsearch                   " highlight search terms
    set winminheight=0             " windows can be 0 line high
    set ignorecase                 " case insensitive search
    set smartcase                  " case sensitive when uc present
    set wildmenu                   " show list instead of just completing
    set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
    set scrolljump=5               " lines to scroll when cursor leaves screen
    set scrolloff=3                " minimum lines to keep above and below cursor
    set list                       " use the listchars settings
    set listchars=tab:▸\ ,eol:¶    " show tabs and lineend
    set colorcolumn=81
    :set keymap=russian-jcukenwin  " i don't remember what : means there
    :set iminsert=0
    "set completeopt -=preview
    "autocmd CompleteDone * pclose!
" }

" Formatting {

    "set nowrap        " wrap long lines
    set autoindent    " indent at the same level of the previous line
    set shiftwidth=4  " use indents of 4 spaces
    set expandtab     " tabs are spaces, not tabs
    set tabstop=4     " an indentation every four columns
    set softtabstop=4 " let backspace delete indent
    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
    autocmd Filetype phtml setlocal ts=2 sts=2 sw=2
    autocmd Filetype json setlocal ts=2 sts=2 sw=2
    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
    autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,phtml,vimrc autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    autocmd FileType php LanguageClientStart

" }

" Key (re)Mappings {

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " no arrows for you
    noremap <Up> <NOP>
    noremap <Down> <NOP>
    noremap <Left> <NOP>
    noremap <Right> <NOP>

    " Map F1 to Esc to prevent accidental opening of the help window
    map  <F1> <Esc>
    imap <F1> <Esc>

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " One less key-stroke for save
    nmap <silent> <leader>w :w<CR>

    " Easier copy/paste
    map <leader>v "+gP
    map <leader>c "+y

    " Ctrl-a for select all
    map <C-A> ggVG

    " Ctrl-b for fuzzy-buffer match, replaced with unite
    " map <C-B> :FufBuffer<CR>
    map <C-B> :Denite -auto-resize -prompt=Buffer>\  -mode=normal
        \ -buffer-name=buffers buffer<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Toggle numbers.vim
    nnoremap <F3> :NumbersToggle<CR>

    " pdv-standalone
    nnoremap <C-\>p :call PhpDocSingle()<CR>
    vnoremap <C-\>p :call PhpDocRange()<CR>
" }

" Plugins {
    " airline {
        let g:airline_powerline_fonts = 1
    " }

    " {
        let g:LanguageClient_serverCommands = get(g:, 'LanguageClient_serverCommands', {})
    " }
    
    " {
        let g:tsuquyomi_completion_preview = 1
    " }

    " {
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#enable_refresh_always = 0
        let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})
       " let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
        let g:deoplete#omni_patterns.javascript = '[^. \t0-9]\.([a-zA-Z_]\w*)?'
        let g:deoplete#omni_patterns.typescript = '[^. \t0-9]\.([a-zA-Z_]\w*)?'
        let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
        let g:deoplete#ignore_sources.php = ['omni']
    " }

    " phpcd.vim {
       " autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
    " }

    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=0
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let NERDTreeMinimalUI=1
    " }

    " vim-gist {
        let g:gist_show_privates = 0
    " }

    " pdv-standalone {
        " use "" as parameter to turn tag off
        let g:pdv_cfg_php4guess=0
        let g:pdv_cfg_Package=" "
        let g:pdv_cfg_Author="Aleksey Khudyakov <aleksey@xerkus.pro>"
        let g:pdv_cfg_Version=" "
        "let g:pdv_cfg_Copyright=""
        "let g:pdv_cfg_License=""
    " }

    " vdebug {
     "   let g:vdebug_options= {"marker_default": '◇'}
     "   let g:vdebug_options= {"port": '9006'}
     "   let g:vdebug_features= {'max_data': 50000, 'max_depth':  2, 'max_children': 128}
    " }

" }

" Functions {

    " Source: http://vim.wikia.com/wiki/VimTip165
    " Cleanly deletes a buffer without messing up the window layout.
    " Modified by Evan to prompt for unsaved changes.
    function s:Kwbd(kwbdStage)
      if(a:kwbdStage == 1)
        if(!buflisted(winbufnr(0)))
          bd!
          return
        endif
        let s:kwbdBufNum = bufnr("%")
        let s:kwbdWinNum = winnr()
        windo call s:Kwbd(2)
        execute s:kwbdWinNum . 'wincmd w'
        let s:buflistedLeft = 0
        let s:bufFinalJump = 0
        let l:nBufs = bufnr("$")
        let l:i = 1
        while(l:i <= l:nBufs)
          if(l:i != s:kwbdBufNum)
            if(buflisted(l:i))
              let s:buflistedLeft = s:buflistedLeft + 1
            else
              if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
                let s:bufFinalJump = l:i
              endif
            endif
          endif
          let l:i = l:i + 1
        endwhile
        if(!s:buflistedLeft)
          if(s:bufFinalJump)
            windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
          else
            enew
            let l:newBuf = bufnr("%")
            windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
          endif
          execute s:kwbdWinNum . 'wincmd w'
        endif
        if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
          execute ":confirm :bd " . s:kwbdBufNum
        endif
        if(!s:buflistedLeft)
          set buflisted
          set bufhidden=delete
          set buftype=
          setlocal noswapfile
        endif
      else
        if(bufnr("%") == s:kwbdBufNum)
          let prevbufvar = bufnr("#")
          if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
            b #
          else
            bn
          endif
        endif
      endif
    endfunction

    command! Kwbd call s:Kwbd(1)
    nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>
    nmap <silent> <leader>q :Kwbd<CR>

    " Put all swap, backup, and view files in a central location
    " Source: spf-13-vim (https://github.com/spf13/spf13-vim/blob/4f01f8f7a35736fc106a1735e076a83ac548e104/.vimrc#L552)
    " Modified by Evan to better handle swap file paths for editing multiple
    " files with the same filename.
    function! InitializeDirectories()
        let parent = $VIMHOME
        let prefix = '.'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = parent . '/' . prefix . dirname . '/'
            if exists('*mkdir')
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo 'Warning: Unable to create backup directory: ' . directory
                echo 'Try: mkdir -p ' . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", 'g')
                " add trailing slashes to name swap files with full path
                exec 'set ' . settingname . '^=' . directory . '//'
            endif
        endfor
    endfunction
    call InitializeDirectories()

    " Highlight trailing whitespace in red
    " Source: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

" }

" Local Override {
    if filereadable(expand("$VIMHOME/override.local.vim"))
        source $VIMHOME/override.local.vim
    endif
" }
