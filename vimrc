vim9script
######################################################################
# VIM .vimrc Configuration File
#
# Ferry Hendrikx
######################################################################

######################################################################
# History
######################################################################
#
# v1.0 - 2006
# v2.0 - 2009
# v3.0 - 2012/10/19
# v4.0 - 2015/10/28 - Switched to bundles
# v4.1 - 2019/03/06 - Added new bundles
# v4.2 - 2019/07/11 - Added YouCompleteMe
# v5.0 - 2019/09/25 - Added Ale, GitGutter, Indent Guides, Paste Easy and Startify
#                   - Added persistent undo
#                   - Added MUcomplete
#                   - Removed YouCompleteMe
#                   - Fixed TagBar to recognise Perl code better
# v5.1 - 2020/02/13 - Added auto command to close local error windows
#                   - Added YML file detection
# v5.2 - 2020/04/21 - Changed Ale PerlCritic level to Stern (from Gentle)
#                   - Fixed plugin load order
# v5.3 - 2020/07/17 - Added GutenTags (for tag support)
#                   - Added a project #.root# file marker (for GutenTags and CtrlP)
#                   - Added MUcomplete completion chains (including tags)
#                   - Changed backups, swaps and undo to use the .cache directory
#                   - Changed CtrlP to utilise an unlimited cache
# v5.4 - 2021/12/17 - Minimal configuration version (stripped all bundles)
# v5.5 - 2021/12/20 - Added listchars and showbreak
#                   - Removed MUcomplete
# v5.6 - 2022/08/22 - Updated Ale to work with 'standard' JS lint
# v5.7 - 2022/11/25 - Added more documentation and VIM powerline comments
# v5.8 - 2023/02/16 - Added Ack and matchit (expanded % matching)
# v6.0 - 2023/12/16 - Added Autoclose (matching brackets inserted)
#                   - Added FZF and RipGrep
#                   - Added GO Language support
#                   - Added Space (use spacebar for repeats)
#                   - Removed Ack
#                   - Removed Commentary
#                   - Removed CtrlP
#                   - Removed Paste Easy
# v7.0 - 2024/12/26 - Switched to Vim9 Script
#                   - Added Quick Scope
# v7.1 - 2025/02/12 - Added Ollama support
#
######################################################################

######################################################################
# Directory Structure
######################################################################
#
# $HOME/.vimrc      - Global settings
#
# $HOME/.vim/
#   autoload/       - Automatically loaded scripts
#   bundle/         - Bundled scripts
#   colors/         - Custom colour schemes
#   doc/            - Documentation
#   ftdetect/       - Filetype detection scripts
#   ftplugin/       - Filetype plugins
#   plugin/         - Plugins
#   runtime/        - Runtime
#       backups     - Backups
#       swaps       - Swaps
#       tags        - Tags
#       undo        - Undo
#   syntax/         - Syntax scripts
#
######################################################################

######################################################################
# Commands
######################################################################
#
# cs<o><n>          - Replace old surrounding char
# ds<o>             - Delete old surrounding char
# ga                - characterize char (dec, oct, hex)
#
# fF                - find first instance
# tT                - till first instance
# ;                 - next character
# ,                 - previous character
#
# [-, [=, [+        - move to previous line of lesser, same or greater
#                     indentation
# [c                - move to previous change
# ]-, ]=, ]+        - move to next line of lesser, same or greater
#                     indentation
# ]c                - move to next change
#
# ctrl-j            - next error
# ctrl-k            - previous error
#
# ctrl-n            - Invoke NerdTree
# ctrl-p            - Invoke CtrlP
# ctrl-t            - Invoke TagBar
# ctrl-u            - Invoke UndoTree
#
# ctrl-]            - Follow tag (push stack)
# ctrl-\            - Unfollow tag (pop stack)
#
# \/                - no highlighting
# \cd               - change directory
# \f                - find in files
# \gc               - GO test coverage
# \gr               - GO run file
# \gt               - GO test file
# \q                - quit
# \w                - write
#
# :Chmod            - change permissions
# :Delete           - delete file on disk and buffer
# :Git              - GIT commands
# :Move             - rename file on disk and buffer
# :Mkdir            - make directory
# :Remove           - delete file on disk
# :SudoWrite        - write file
# :SudoEdit         - edit file
#
######################################################################

######################################################################
# Mode
######################################################################

# VIM
#
set nocompatible


######################################################################
# Plugins
######################################################################

# filetype
#
filetype on

# filetype detection plugin
#
filetype plugin on

# language independent indenting
#
filetype indent on

# load bundles (in $HOME/.vim/bundles)
#
pathogen#infect()
pathogen#helptags()


######################################################################
# Terminal
######################################################################

# set background
set background=dark

# set builtin termcaps
set ttybuiltin

# set scrolling limit
set ttyscroll=120

# set faster tty handling
set ttyfast

# set bell
set belloff=all

# set terminal title
set title


######################################################################
# Mouse
######################################################################

if has("mouse")
    # set mouse
    set mouse=a

    # set mouse model
    set mousem=extend

    # hide mouse cursor when typing
    set mousehide

    if has("mouse_sgr")
        # use sgr mouse for terminal width support
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif


######################################################################
# Interface
######################################################################

# command line
if has("cmdline_info")
# show current command
    set showcmd
# command line
    set cmdheight=1

    set ruler
    set showcmd
endif

# status line
if has("statusline")
    set laststatus=2

    set statusline=%<%f\                        # Filename
    set statusline+=%w%h%m%r                    # Options
    set statusline+=%{fugitive#statusline()}    # Git
    set statusline+=\ [%{&ff}/%Y]               # Filetype
    set statusline+=\ [%{getcwd()}]             # Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%     # Right aligned file nav info
endif

# set short messages
set shortmess=aoOtTc

# show hidden buffers
set hidden

# command history
set history=100

# turn on magic for REs
set magic

# no sounds
set noerrorbells
set novisualbell

# enable wildmenu
set wildmenu

# wildmenu ignore
set wildignore+=*/.git/*,*.o,*.obj,*.so,*/.svn/*,*.swp,*.zip

# wildmenu
set wildmode=longest:full,full

# sign column
set signcolumn=yes


######################################################################
# Editing
######################################################################

# keep cursor where it is when moving
set nostartofline

# show cursor line
set cursorline

# keep cursor within x lines of top or bottom of screen
set scrolloff=4

# bracket matching
set showmatch

# bracket matching for HTML
set matchpairs+=<:>

# blink for x/10s of a second when bracket matching
set matchtime=5

# cpoptions (show listchars)
set cpoptions=L

# show hidden characters
set listchars=tab:»·,extends:›,precedes:‹,nbsp:·,trail:·

# show hidden characters
set list

# show line break
set showbreak=››

# splitting
set splitright
set splitbelow

# folding
set foldenable


############################################################
# Tabs and Indenting
############################################################

# autoindent and smartident
set autoindent
set smartindent

# number of spaces for each autoindent step
set shiftwidth=4

# tab size
set tabstop=4

# soft tab size
set softtabstop=4

# expand tabs (insert spaces instead of tabs)
set expandtab

# disable wrapping
set textwidth=0
set linebreak

# backspace spaces like tabs
set smarttab

# control behaviour of backspace key
set backspace=indent,eol,start

# control behaviour of wrapping on last character in line
set whichwrap=b,s,[,]


######################################################################
# Searching
######################################################################

# highlight search results
set hlsearch

# case insensitive search
set ignorecase

# incremental search (cursor moves as you type)
set incsearch

# case insensitive search (unless search contains UPPER-CASE)
set smartcase

# maximum redraw time (affects search and syntax highlighting)
set rdt=5000


######################################################################
# Files
######################################################################

# auto re-read file when it has changed
set autoread

# set UTF-8
set encoding=utf8
set fileencoding=utf8

# set preferred file format
set fileformats=unix,mac,dos

# backups
set backup
set backupdir=$HOME/.vim/runtime/backups

# swaps
set swapfile
set updatetime=2000
set directory=$HOME/.vim/runtime/swaps

# persistent undo
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undodir=$HOME/.vim/runtime/undo
endif

# grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow


######################################################################
# Completion
######################################################################

set complete=.,w,b,u,t,i,k

set completeopt=menu,menuone,preview,noinsert,noselect


######################################################################
# Syntax Highlighting
######################################################################

# syntax highlighting
syntax on

# colourscheme
colorscheme night


######################################################################
# Custom Highlighting
######################################################################

# CursorLine
highlight CursorLine            guibg=#262626 gui=NONE ctermbg=235 cterm=NONE

# Hidden characters
highlight NonText               guifg=#ff2222 ctermfg=1
highlight SpecialKey            guifg=#ff2222 ctermfg=1

# SignColumn
highlight SignColumn            guibg=#202020 ctermbg=8

# GitGutter
highlight GitGutterAdd          guifg=#009900 guibg=#005f00 ctermfg=2 ctermbg=22
highlight GitGutterChange       guifg=#bbbb00 guibg=#af8700 ctermfg=3 ctermbg=136
highlight GitGutterDelete       guifg=#ff2222 guibg=#5f0000 ctermfg=1 ctermbg=52

# HighlightedYank
highlight HighlightedyankRegion gui=reverse cterm=reverse

# IndentGuides
highlight IndentGuidesOdd       guibg=#1c1c1c ctermbg=234
highlight IndentGuidesEven      guibg=#262626 ctermbg=235

# QuickScope
highlight QuickScopePrimary     gui=underline cterm=underline


######################################################################
# Commands
######################################################################

# ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

# gitgutter
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

# pop tag
map <C-\> :pop<CR>

# Nerdtree
map <C-n> :NERDTreeToggle<CR>

# Find (FZF)
map <C-p> :Files ~/<CR>

# TagBar
map <C-t> :TagbarToggle<CR>

# UndoTree
map <C-u> :UndotreeToggle<CR>

# no highlighting
noremap <Leader>/ :noh<CR>

# cwd
noremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

# quick save
noremap <Leader>w :w!<CR>

# quick exit
noremap <silent> <Leader>q :q!<CR>

# no ex-mode
noremap Q <Nop>

# centered search
nnoremap n nzz
nnoremap N Nzz


######################################################################
# Auto Commands
######################################################################

if has("autocmd")
    augroup Defaults
        autocmd!

        # automatically jump to last-known-position
        autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \     exe "normal! g'\"" |
            \ endif

        # automatically resize screens to be the same
        autocmd VimResized *
            \ wincmd =

        # automatically close location list window
        autocmd QuitPre *
            \ if empty(&buftype) |
            \     lclose |
            \ endif
    augroup END

    augroup Tabs
        autocmd!

        # track last tab
        autocmd TabLeave *
            \ g:tabprev = tabpagenr()
    augroup END

    augroup Languages
        autocmd!

        # go
        autocmd FileType go setlocal noexpandtab nolist
        autocmd FileType go nmap <silent> <Leader>gc <Plug>(go-coverage-toggle)
        autocmd FileType go nmap <silent> <Leader>gr <Plug>(go-run)
        autocmd FileType go nmap <silent> <Leader>gt <Plug>(go-test)

        # make
        autocmd FileType make setlocal noexpandtab nolist
    augroup END
endif


######################################################################
# Files and Directories
######################################################################

# backups
#
var bdir = expand('~/.vim/runtime/backups')
if !isdirectory(bdir)
    mkdir(bdir, 'p')
endif

# swaps
#
var sdir = expand('~/.vim/runtime/swaps')
if !isdirectory(sdir)
    mkdir(sdir, 'p')
endif

# undo
#
var udir = expand('~/.vim/runtime.undo')
if !isdirectory(udir)
    mkdir(udir, 'p')
endif


######################################################################
# Bundle Configurations
######################################################################

# Airline
#
g:airline_theme = 'dark'
g:airline_detect_modified = 1
g:airline_detect_paste = 1
g:airline_powerline_fonts = 1
g:airline_skip_empty_sections = 1

g:airline#extensions#ale#enabled = 1
g:airline#extensions#branch#enabled = 1
g:airline#extensions#gutentags#enabled = 1
g:airline#extensions#hunks#enabled = 1
g:airline#extensions#tabline#enabled = 1
g:airline#extensions#tabline#buffer_nr_show = 1
g:airline#extensions#tabline#formatter = 'unique_tail_improved'
g:airline#extensions#tagbar#enabled = 1


# Ale
#
g:ale_enabled = 1
g:ale_lint_delay = 250
g:ale_lint_on_text_changed = 'normal'
g:ale_lint_on_insert_leave = 1
g:ale_set_loclist = 1
g:ale_set_quickfix = 0
g:ale_open_list = 'on_save'
g:ale_list_window_size = 4
g:ale_sign_error = '>>'
g:ale_sign_warning = '--'
g:ale_echo_msg_error_str = 'E'
g:ale_echo_msg_warning_str = 'W'
g:ale_echo_msg_format = '[%severity%] %s'
g:ale_linters = {
    javascript: ['standard'],
    perl: ['perl', 'perlcritic'],
    php: ['php'],
    twig: ['twig-lint'],
}
g:ale_fixers = {
    javascript: ['standard']
}
g:ale_type_map = {
    perlcritic: {ES: 'WS', E: 'W'},
}
g:ale_perl_options = '-c -Mwarnings'
g:ale_perl_perlcritic_showrules = 1
g:ale_perl_perlcritic_options = '--stern --exclude ArgUnpacking'

if filereadable('/usr/local/bin/twig-lint')
    g:ale_twig_twiglint_executable = '/usr/local/bin/twig-lint'
endif


# Ctrl-P
#
g:ctrlp_root_markers = ['.root']
g:ctrlp_match_window = 'bottom,order:btt,min:32,max:32'
g:ctrlp_regexp = 1


# Dadbod
#
g:db = 'postgres://settle:test@localhost/settle'


# GitGutter
#
g:gitgutter_override_sign_column_highlight = 0
g:gitgutter_async = 1


# GutenTags
#
g:gutentags_enabled = 1
g:gutentags_modules = ['ctags']
g:gutentags_add_default_project_roots = 0
g:gutentags_add_ctrlp_root_markers = 1
g:gutentags_cache_dir = expand('~/.vim/runtime/tags')
g:gutentags_generate_on_new = 1
g:gutentags_generate_on_missing = 1
g:gutentags_generate_on_write = 1
g:gutentags_generate_on_empty_buffer = 0
g:gutentags_ctags_extra_args = [
    '--tag-relative=yes',
    '--fields=+ailmnS',
    '--extra=+q',
]
g:gutentags_ctags_exclude = [
    'build',
    'bundle',
    'cache',
    'composer',
    'cpanm',
    'dist',
    'docs',
    'node_modules',
    'vendor',
    'yarn',
    '*.bak',
    '*.bmp',
    '*.css',
    '*.cache',
    '*.class',
    '*.doc',
    '*.docx',
    '*.gif',
    '*.git',
    '*.gz',
    '*.hg',
    '*.ico',
    '*.jpg',
    '*.jpeg',
    '*.js',
    '*.json',
    '*.lock',
    '*.map',
    '*.md',
    '*.min.*',
    '*.pdf',
    '*.png',
    '*.ppt',
    '*.pptx',
    '*.sql',
    '*.svg',
    '*.tar',
    '*.tar.bz2',
    '*.tar.gz',
    '*.tar.xz',
    '*.tmp',
    '*.xls',
    '*.xlsx',
    '*.zip',
]


# GO Lang
#
g:go_autodetect_gopath = 1
g:go_gopls_complete_unimported = 1
g:go_gopls_gofumpt = 1
# 2 is for errors and warnings
g:go_diagnostics_level = 2
g:go_def_mapping_enabled = 0
g:go_doc_popup_window = 1
g:go_doc_balloon = 1
g:go_imports_mode = "gopls"
g:go_imports_autosave = 1
g:go_list_type = "quickfix"
g:go_fmt_fail_silently = 1
g:go_highlight_build_constraints = 1
g:go_highlight_functions = 1
g:go_highlight_methods = 1
g:go_highlight_structs = 1
g:go_highlight_operators = 1
g:go_test_show_name = 1


# Highlightedyank
#
g:highlightedyank_highlight_duration = 700


# Indent Guides
#
g:indent_guides_enable_on_vim_startup = 1
g:indent_guides_auto_colors = 0
g:indent_guides_guide_size = 1
g:indent_guides_start_level = 2
g:indent_guides_exclude_buftype = 1


# NerdTree
#
g:NERDTreeIgnore = ['\.git$']
g:NERDTreeShowHidden = 1
g:NERDTreeQuitOnOpen = 1
g:NERDTreeWinPos = 'bottom'


# Quick Scope
#
g:qs_delay = 500
g:qs_enable = 1
g:qs_filetype_blacklist = ['nofile', 'startify']
g:qs_max_chars = 80
g:qs_second_highlight = 0


# Tagbar
#
g:tagbar_autofocus = 1
g:tagbar_autoclose = 1
g:tagbar_position = 'below'
g:tagbar_height = 32
g:tagbar_compact = 1
g:tagbar_type_go = {
    ctagstype: 'go',
    kinds: [
        'p:package',
        'i:imports',
        'c:constants',
        'v:variables',
        't:types',
        'n:interfaces',
        'w:fields',
        'e:embedded',
        'm:methods',
        'r:constructor',
        'f:functions',
    ],
    sro: '.',
    kind2scope: {
        t: 'ctype',
        n: 'ntype',
    },
    scope2kind: {
        ctype: 't',
        ntype: 'n',
    },
    ctagsbin: '~/go/bin/gotags',
    ctagsargs: '-sort -silent'
}
g:tagbar_type_perl = {
    ctagstype: 'perl',
    kinds: [
        'p:package',
        'w:roles',
        'e:extends',
        'u:uses',
        'r:requires',
        'o:ours',
        'a:properties',
        'b:aliases',
        'h:helpers',
        's:subroutines',
        'm:private_subroutines',
        'd:POD',
    ],
}


# Wildfire
#
g:wildfire_objects = {
    "*": ["i'", 'i"', "i)", "i]", "i}", "ip"],
    "html,xml": ["at"],
}


# UndoTree
#
g:undotree_SetFocusWhenToggle = 1


######################################################################
# EOF
######################################################################

# vim:set ft=vim et sw=2:
