set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set history=50
" set ruler         " show the cursor position all the time
" set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
 
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

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

" Initiates pathogen
call pathogen#infect()

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

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
