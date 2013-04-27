" Change the leader key from \ to ,
let mapleader=","

set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype off      " Required for Vundle setup

" Vundle plugin manager setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

" Define bundles
Bundle 'jgdavey/tslime.vim'
Bundle 'jgdavey/vim-turbux'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'

" Consider these from thoughtbot dotfiles
" Bundle 'nanki/treetop.vim'
" Bundle 'timcharper/textile.vim'
" Bundle 'tpope/vim-cucumber'
" Bundle 'tpope/vim-endwise'
" Bundle 'tpope/vim-haml'
" Bundle 'tpope/vim-surround'
" Bundle 'tsaleh/vim-matchit'
" Bundle 'vim-scripts/ctags.vim'
" Bundle 'vim-scripts/greplace.vim'
" Bundle 'vim-scripts/tComment'
" Bundle 'xenoterracide/html.vim'

" End Vundle Setup
filetype plugin indent on

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
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
colorscheme molokai
highlight NonText guibg=#060606

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

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

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal spell

" Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" Syntax highlight JSON files by convincing Vim it is JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript

" Adds config for rubytest.vim plugin
let g:rubytest_cmd_test = "ruby -I test %p"
let g:rubytest_cmd_testcase = "ruby -I test %p -n '/%c/'"
let g:rubytest_cmd_spec = "spec -f specdoc %p"
let g:rubytest_cmd_example = "spec -f specdoc %p -e '%c'"
let g:rubytest_cmd_feature = "cucumber %p"
let g:rubytest_cmd_story = "cucumber %p -n '%c'"

" keeps buffers open
set hidden

" For copy/pasting in tmux
set clipboard=unnamed

" Opens new panes to right/bottom, which is more natural
set splitbelow
set splitright

" Open splits faster
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

" Buffer navigation more naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Git
nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gcv :Gcommit -v<CR>
nnoremap <Leader>ga :Git add .<CR>

" Always start on first line of commit message
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Scroll while keeping 10 lines at the file borders
set scrolloff=10

" Save when hitting capital 'W'
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Formatting
" Change Ruby 1.8 > 1.9 hash syntax
nnoremap <Leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>

" Add whitespace inside of braces
nnoremap <Leader>{ :%s/{\([^ ]\)/{ \1/gc<CR>
nnoremap <Leader>} :%s/\([^ ]\)}/\1 }/gc<CR>

" CtrlP for fuzzy finding
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*tags*,*.swp

" Run 'rake' from Vim using Turbux/Tslime methods
nnoremap <Leader>r :call Send_to_Tmux("clear && rake\n")<CR>

" Remove trailing whitespace
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Puts a gray vertical line at 81 chars
set colorcolumn=81
highlight ColorColumn ctermbg=7

" Changes line number colors
highlight LineNr term=underline cterm=bold ctermfg=DarkGray
