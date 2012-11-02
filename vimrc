set nocompatible  " Use Vim settings, rather then Vi settings
filetype off      " Required for Vundle setup

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'jgdavey/vim-turbux'
Bundle 'jgdavey/tslime.vim'
Bundle 'tpope/vim-markdown'
Bundle 'mileszs/ack.vim'

" End Vundle Setup
filetype plugin indent on

set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

" Switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Local config
" if filereadable(".vimrc.local")
"   source .vimrc.local
" endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Page through Ack results with Ctrl-N/P
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Color scheme
colorscheme vividchalk
highlight NonText guibg=#060606

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\\\\|p'

" Puts a gray vertical line at 81 chars
set colorcolumn=81
highlight ColorColumn ctermbg=7

" Highlights current line
highlight CursorLine guibg=#181818

" Changes line number colors
highlight LineNr term=underline cterm=bold ctermfg=DarkGray

" Adds config for rubytest.vim plugin
let g:rubytest_cmd_test = "ruby -I test %p"
let g:rubytest_cmd_testcase = "ruby -I test %p -n '/%c/'"
let g:rubytest_cmd_spec = "spec -f specdoc %p"
let g:rubytest_cmd_example = "spec -f specdoc %p -e '%c'"
let g:rubytest_cmd_feature = "cucumber %p"
let g:rubytest_cmd_story = "cucumber %p -n '%c'"

" keeps buffers open
set hidden

" change the mapleader from \\\\ to ,
let mapleader=","

" For copy/pasting in tmux
set clipboard=unnamed

" Opens new panes to right/bottom, which is more natural
set splitbelow
set splitright

" Buffer navigation more naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Git
nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gcv :Gcommit -v<CR>
nnoremap <Leader>ga :Git add .<CR>

" Open Mou for Markdown files
map <leader>md :silent !open -a Mou %<cr>:redraw!<cr>

" Tab completion
set wildmode=list:longest,list:full
set complete=.,w,t
imap <Tab> <C-P>
