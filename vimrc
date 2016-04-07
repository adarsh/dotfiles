" Don't show the splash screen on startup
set shortmess=I

" Change the leader key from \ to space
let mapleader=" "

set backspace=2   " Backspace deletes like most programs in insert mode
set history=50
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set nobackup
set noswapfile
set nowritebackup
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Use vim-plug for plugin management
" https://github.com/junegunn/vim-plug
call plug#begin()

" Define packages in a separate file
source ~/.vim/plugins.vim

" End vim-plug
call plug#end()

" Correct bad indentation automatically when pasting
" http://vim.wikia.com/wiki/Format_pasted_text_automatically
nnoremap p p=`]

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2

" Tabs are spaces
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when
" available
if executable("ag")
  set grepprg=ag\ --noheading\ --nogroup\ --nocolor
endif

" Color scheme
colorscheme zellner
highlight NonText guibg=#060606

" Numbers
set number
set numberwidth=5

" Tab completion. Will insert tab at beginning of line, will complete if not
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Markdown files end in .md (and occasionally .markdown)
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.markdown set filetype=markdown

" Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" Open all folds at start
au BufRead * normal zR

" Syntax highlight JSON files by convincing Vim it is JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript

" Adds config for rubytest.vim plugin
let g:rubytest_cmd_test = "ruby -I test %p"
let g:rubytest_cmd_testcase = "ruby -I test %p -n '/%c/'"
let g:rubytest_cmd_spec = "spec -f specdoc %p"
let g:rubytest_cmd_example = "spec -f specdoc %p -e '%c'"

" keeps buffers open
set hidden

" For copy/pasting in tmux
set clipboard=unnamed

" Opens new panes to right/bottom, which is more natural
set splitbelow
set splitright

" Use separate leader keys file
source $HOME/.vim/leader_keys.vim

" Use separate airline config file
source $HOME/.vim/vim-airline.vim

" Buffer navigation more naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Scroll while keeping 5 lines at the file borders
set scrolloff=5

" Use separate CtrlP file
source $HOME/.vim/ctrlp.vim

" Syntastic configuration
let g:syntastic_scss_checkers = ['scss_lint']

" Puts a gray vertical line at 81 chars
set colorcolumn=81
highlight ColorColumn ctermbg=7

" Changes line number colors
highlight LineNr term=underline cterm=bold ctermfg=DarkGray

" Use 'Rolodex' mode with vsplits, making them all expand
set winheight=999

"" Config for SplitJoin
" Don't remove curly braces when splitting a hash.
let g:splitjoin_ruby_curly_braces = 1
let g:splitjoin_ruby_hanging_args = 0
