" General: Notes
"
" Author: Samuel Roeca
" Date: August 15, 2017
" TLDR: vimrc minimum viable product for Python programming
"
" i've noticed that many vim/neovim beginners have trouble creating a useful
" vimrc. this file is intended to get a python programmer who is new to vim
" set up with a vimrc that will enable the following:
"   1. sane editing of python files
"   2. sane defaults for vim itself
"   3. an organizational skeleton that can be easily extended
"
" notes:
"   * when in normal mode, scroll over a folded section and type 'za'
"       this toggles the folded section
"
" initialization:
"   1. follow instructions at https://github.com/junegunn/vim-plug to install
"      vim-plug for either vim or neovim
"   2. open vim (hint: type vim at command line and press enter :p)
"   3. :pluginstall
"   4. :plugupdate
"   5. you should be ready for mvp editing
"
" updating:
"   if you want to upgrade your vim plugins to latest version
"     :PlugUpdate
"   If you want to upgrade vim-plug itself
"     :PlugUpgrade
" General: Leader mappings -------------------- {{{
" https://vi.stackexchange.com/questions/281/how-can-i-find-out-what-leader-is-set-to-and-is-it-possible-to-remap-leader
" A note on leaders: THe value of mapleader is used at the moment the mapping
" is defined. This means that the current value of mapleader is not
" necessarily the value that was used to define your mappings.
"
set encoding=utf-8

nnoremap <SPACE> <Nop>

let mapleader = " "
let maplocalleader = ","


" }}}
" General: global config ------------ {{{

"A comma separated list of options for Insert mode completion
"   menuone  Use the popup menu also when there is only one match.
"            Useful when there is additional information about the
"            match, e.g., what file it comes from.

"   longest  Only insert the longest common text of the matches.  If
"            the menu is displayed you can use CTRL-L to add more
"            characters.  Whether case is ignored depends on the kind
"            of completion.  For buffer text the 'ignorecase' option is
"            used.

"   preview  Show extra information about the currently selected
"            completion in the preview window.  Only works in
"            combination with 'menu' or 'menuone'.
set completeopt=menuone,longest,preview

" Enable buffer deletion instead of having to write each buffer
set hidden

"Automatically interfaces with the system's clipboard
" set clipboard to unnamed to use * (PRIMARY, on select)
"           set to unnamedplus to use +(CLIPBOARD, ^C)
" see: https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
set clipboard=unnamedplus

" Mouse: enable GUI mouse support in all modes
set mouse=a

" Set column to light grey at 80 characters
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

" Remove query for terminal version
" This prevents un-editable garbage characters from being printed
" after the 80 character highlight line
set t_RV=

filetype plugin indent on

set spelllang=en_us

set showtabline=2

set splitbelow
set splitright
set scrolloff=5
set autoread

" When you type the first tab hit will complete as much as possible,
" the second tab hit will provide a list, the third and subsequent tabs
" will cycle through completion options so you can complete the file
" without further keys
set wildmode=longest,list,full
set wildmenu

" Turn off complete vi compatibility
set nocompatible

" Enable using local vimrc
set exrc

" Make sure numbering is set
set number

" Redraw window whenever I've regained focus
augroup redraw_on_refocus
  au FocusGained * :redraw!
augroup END

" }}}
" General: Plugin Install --------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
"File Navigation"
Plug 'scrooloose/nerdtree'

"Code completion engine for Vim, also does some syntax checking
Plug 'Valloric/YouCompleteMe'

" Commands run in vim's virtual screen and don't pollute main shell
Plug 'fcpg/vim-altscreen'

" Basic coloring
Plug 'NLKNguyen/papercolor-theme'

" Utils
Plug 'tpope/vim-commentary'

" Language-specific syntax
Plug 'hdima/python-syntax'

" Indentation
Plug 'hynek/vim-python-pep8-indent'

"Javascript and JSX beautifier"
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'ckarnell/Antonys-macro-repeater'

"Jedi-Vim awesome autocompletion for Python"
Plug 'davidhalter/jedi-vim'

"LaTeX support"
Plug 'vim-latex/vim-latex'
" Plug 'lervag/vimtex'

" Emmet plugin
Plug 'mattn/emmet-vim'

"Markdown live preview
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }

"Additional Vim C++ syntax highlighting
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'NLKNguyen/c-syntax.vim'
" Dockerfile syntax highlighting
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim'}

" Surroundings -- parentheses, brackets, quotes, XML tags, etc...
Plug 'tpope/vim-surround'

"A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" Enables the . to repeat a plugin map
Plug 'tpope/vim-repeat'

" Atom-like multiple cursors
"Plug 'terryma/vim-multiple-cursors'

" Fuzzy finder, fzf is similar to Go To Anything
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Snippets for Vim
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'nginx/nginx', { 'rtp': 'contrib/vim' }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}


"=============+++++++++++++TO TRYYYY++++++++++++===============
" Plug 'airblade/vim-gitgutter'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'itchyny/lightline.vim'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'mattn/emmet-vim'
" Plug 'scrooloose/nerdtree'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-surround'
" Plug 'w0rp/ale'
"=============+++++++++++++TO TRYYYY++++++++++++===============
call plug#end()

" }}}
" General: Indentation (tabs, spaces, width, etc)------------- {{{

augroup indentation_sr
  autocmd!
  autocmd Filetype * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
  autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype yaml setlocal indentkeys-=<:>
  autocmd Filetype make setlocal noexpandtab softtabstop=0
augroup END

" }}}
" General: Folding Settings --------------- {{{

augroup fold_settings
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
  autocmd FileType * setlocal foldnestmax=1
  autocmd BufNewFile,BufRead .bashrc,.tmux.conf setlocal foldmethod=marker
  autocmd BufNewFile,BufRead .bashrc,.tmux.conf setlocal foldlevelstart=0
augroup END

" }}}
" General: Trailing whitespace ------------- {{{

" This section should go before syntax highlighting
" because autocommands must be declared before syntax library is loaded
function! TrimWhitespace()
  if &ft == 'markdown'
    return
  endif
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

highlight EOLWS ctermbg=red guibg=red
match EOLWS /\s\+$/
augroup whitespace_color
  autocmd!
  autocmd ColorScheme * highlight EOLWS ctermbg=red guibg=red
  autocmd InsertEnter * highlight EOLWS NONE
  autocmd InsertLeave * highlight EOLWS ctermbg=red guibg=red
augroup END

" augroup fix_whitespace_save
"   autocmd!
"   autocmd BufWritePre * call TrimWhitespace()
" augroup END

" }}}
" General: Syntax highlighting ---------------- {{{

" Papercolor: options
let g:PaperColor_Theme_Options = {}
let g:PaperColor_Theme_Options['theme'] = {
      \     'default': {
      \       'transparent_background': 1
      \     }
      \ }
let g:PaperColor_Theme_Options['language'] = {
      \     'python': {
      \       'highlight_builtins' : 1
      \     },
      \     'cpp': {
      \       'highlight_standard_library': 1
      \     },
      \     'c': {
      \       'highlight_builtins' : 1
      \     }
      \ }

" Python: Highlight self and cls keyword in class definitions
augroup python_syntax
  autocmd!
  autocmd FileType python syn keyword pythonBuiltinObj self
  autocmd FileType python syn keyword pythonBuiltinObj cls
augroup end

" Syntax: select global syntax scheme
" Make sure this is at end of section
try
  set t_Co=256 " says terminal has 256 colors
  set background=dark
  colorscheme PaperColor
catch
endtry

" }}}
"  Plugin: Configure ------------ {{{

" Python highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger ="<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/vim-snippets/UltiSnips"

" vertically split ultisnips edit window
let g:UltiSnipsEditSplit="vertical"

" let g:UltiSnipsSnippetDirectories=["my_snippets"]

" Markdown-preview
let g:mkdp_auto_start = 1
let g:mkdp_browser = 'chrome'
let g:mkdp_echo_preview_url = 1
let g:mkdp_port = '4321'
"YouCompleteMe
"let g:ycm_extra_conf_globlist = ['~/tfg/oxylus_github/*']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ }

"  }}}
"  Plugin: Configure Jedi-Vim------------ {{{
" Python:
" Open module, e.g. :Pyimport os (opens the os module)
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#auto_close_doc = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#force_py_version = 3

" mappings
" auto_vim_configuration creates space between where vim is opened and
" closed in my bash terminal. This is annoying, so I disable and manually
" configure. See 'set completeopt' in my global config for my settings
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = "<C-]>"
let g:jedi#documentation_command = "<leader>sd"
let g:jedi#usages_command = "<leader>su"
let g:jedi#rename_command = "<leader>r"
"  }}}
"  Plugin: Configure NERDtree ------------ {{{
" Will add config later

"  }}}
" General: Key remappings ----------------------- {{{

" Put your key remappings here
" Prefer nnoremap to nmap, inoremap to imap, and vnoremap to vmap
nnoremap <Leader>xs <C-w>j:q<CR>

"" ------- Leaders -------------
nnoremap <Leader>pf :echo @%<CR>

inoremap <LocalLeader>txit \textit{

nnoremap <leader>d dd
nnoremap <leader>a ggVG
nnoremap <leader>vv :vsp ~/.vimrc<cr>
nnoremap <leader>xv :sp ~/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" au BufWritePost .vimrc so ~/.vimrc


nnoremap <leader>l 10l
nnoremap <leader>h 10h
nnoremap <leader>j 5j
nnoremap <leader>k 5k
vnoremap <leader>j 5j
vnoremap <leader>k 5k

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <Leader>= <C-w>=
nnoremap <Leader>> <C-w>10>
nnoremap <Leader>< <C-w>10<

nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>


""NERDTree: command for opening NERDTree file navigation
nnoremap <Leader>nt :NERDTreeToggle<CR>
inoremap <LocalLeader>nt <ESC>:NERDTreeToggle<CR>
nnoremap <Leader>pp :GFiles<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>L :BLines<CR>
nnoremap <Leader>ag :Ag<CR>
inoremap <LocalLeader>p <ESC>:GFiles<CR>

"" " Saving shortcuts with all it's variants
inoremap <LocalLeader>s <ESC>:w<CR>
inoremap <LocalLeader>g <ESC>:w<CR>a
" inoremap <LocalLeader>S <ESC>:wq<CR>
" inoremap <LocalLeader>g <ESC>:w<CR>
" inoremap <LocalLeader>G <ESC>:w<CR>:

nnoremap <Leader>ss :w<CR>
nnoremap <Leader>si :w<CR>i
inoremap <LocalLeader>ss <C-o>:w<CR>
inoremap <LocalLeader>se <C-o>:w

" nnoremap <Leader>g :w<CR>a
" nnoremap <Leader> :w<CR>:

nnoremap <LocalLeader>s :w<CR>
nnoremap <LocalLeader>S :wq<CR>
nnoremap <LocalLeader>g :w<CR>a
nnoremap <LocalLeader>G :w<CR>:

"inoremap <LocalLeader>
"inoremap <C-g> <esc>:w<CR>a

" Map : to ; and vice-versa in order to save LOTS of keypresses "
nnoremap : ;
nnoremap ; :

" Map jk to <Esc> in order to reach normal mode faster "
inoremap jk <Esc>
inoremap kj <Esc>:w<CR>


"This brings your cursor back to the EOL of the line above
inoremap <LocalLeader>u <esc>ka

" Changes the word under cursor.
" You can press . to apply the command to the next match.
" x forward matching
" X backward matching
nnoremap <Leader>c *``cgn
nnoremap <Leader>C *``cgN

" Deletes de word under cursor.
" Same pattern as above.
nnoremap <Leader>d *``dgn
nnoremap <Leader>D *``dgN

nnoremap <Leader><Space> zz

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" hola <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

" Maintain cursor on middle screen
"nnoremap k kzz
"nnoremap j jzz
nnoremap <ENTER> O<ESC>j
nnoremap <DEL> i<DEL><ESC>l
nnoremap <BS> a<BS><ESC>
"nnoremap <SPACE> i<SPACE><ESC>l
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
" Hit qq to record, q to stop recording and Q to apply.
" Taken from:
" https://hashrocket.com/blog/posts/8-great-vim-mappings#number-6-toggle-paste-mode
" This mapping also allows you to play with macros
" nnoremap Q @q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Quit files with leader q
nnoremap <leader>q :q<cr>


nnoremap <S-k> gt
nnoremap <S-j> gT
nnoremap <Leader>1 1gt;
nnoremap <Leader>2 2gt;
nnoremap <Leader>3 3gt;
nnoremap <Leader>4 4gt;
nnoremap <Leader>5 5gt;
nnoremap <Leader>6 6gt;
nnoremap <Leader>7 7gt;
nnoremap <Leader>8 8gt;
nnoremap <Leader>9 9gt;
nnoremap <Leader>00 10gt;
nnoremap <Leader>01 11gt;
nnoremap <Leader>02 12gt;

nnoremap <Leader>P :bprev<CR>
nnoremap <Leader>N :bnext<CR>


" Ctrl + R visual mode: You will be prompted to enter text to replace with.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" This will copy the paragraph your cursor is on, then paste a copy of
" it just below.

nnoremap cp yap<S-}>p

" Aligns a whole paragraph.
"nnoremap <leader>= =ip

" nnoremap p pzz
" nnoremap P Pzz
" nnoremap G Gzz
" nnoremap x xzz
" inoremap <ESC> <ESC>zz
" inoremap <ENTER> <ENTER><ESC>zzi
" nnoremap o o.<ESC>zzxa
" nnoremap O O<ESC>zza
" nnoremap a a<ESC>zza
" nnoremap w wzz
" nnoremap b bzz
" nnoremap e ezz
inoremap "" ""<ESC>i
inoremap '' ''<ESC>i
inoremap [[ []<ESC>i
inoremap (( ()<ESC>i
inoremap {{ {}<ESC>i
inoremap [<CR> [<CR>]<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap {<CR> {<CR>}<C-o>O
inoremap ;; <END>;
inoremap ;<CR> <END>;<CR>
inoremap ,, <END>,
" inoremap :: <END>: /* doesn't work when using C++ */
inoremap :<CR> <END>:<CR>
nnoremap <Leader>mk :MarkdownPreview<CR>

"Auto expanding
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" Tab and pane navigation from INSERT mode
inoremap <LocalLeader><S-k> <Esc>gt
inoremap <LocalLeader><S-j> <Esc>gT
inoremap <LocalLeader><C-l> <Esc><C-w>l
inoremap <LocalLeader><C-k> <Esc><C-w>k
inoremap <LocalLeader><C-j> <Esc><C-w>j
inoremap <LocalLeader><C-h> <Esc><C-w>h


nnoremap <Leader>cl :nohl<CR>

"Open UltiSnips edit function
nnoremap <leader>ue :UltiSnipsEdit<cr>


imap <LocalLeader>. <C-R>=Semicolonfun()<CR>
fun! Semicolonfun() "{{{
  call setline(line('.'), substitute(getline('.'), '\s*$', ';', ''))
  return "\<End>"
endfunction "}}}

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" -------------
" }}}
" General: Cleanup ------------------ {{{
" commands that need to run at the end of my vimrc

" disable unsafe commands in your project-specific .vimrc files
" This will prevent :autocmd, shell and write commands from being
" run inside project-specific .vimrc files unless they’re owned by you.
set secure

" ShowCommand: turn off character printing to vim status line
set noshowcmd

set noswapfile

set noshowmode

"au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

au BufRead,BufNewFile *.md setlocal textwidth=80

set shortmess=a


" }}}
"
" Functions
" Go to last active tab

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <Leader>b :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <Leader>b :exe "tabn ".g:lasttab<cr>


autocmd FileType json syntax match Comment +\/\/.\+$+


