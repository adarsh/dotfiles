" FORMATTING
" Change Ruby 1.8 > 1.9 hash syntax
nnoremap <Leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>

" Change all double quotes to single
nnoremap <Leader>" :%s/"/'/gc<CR>

" Add whitespace inside of braces
nnoremap <Leader>{ :%s/{\([^ ]\)/{ \1/gc<CR>
nnoremap <Leader>} :%s/\([^ ]\)}/\1 }/gc<CR>

" Remove trailing whitespace
nnoremap <Leader>x :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Surround a word with backticks
map <Leader>` <Esc>ysiw`

" Rename file using RenameFile (leader-n)
source $HOME/.vim/rename_file.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NAVIGATION
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Factories File
map <Leader>f :e spec/factories.rb<CR>

" Rotate open buffers
nnoremap <leader>r <C-W><C-R><C-W><C-W>

" Open splits faster
nmap <leader>V :vs<CR>
nmap <leader>S :sp<CR>

" Open specs faster
nmap <leader>v :AV<CR>
nmap <leader>s :AS<CR>
nmap <leader>a :A<CR>

" Save faster
nmap <leader>w :w<CR>

" Close a pane
nmap <leader>q :q<CR>


" GIT
" Run a quick 'git diff'
nnoremap <Leader>d :call Send_to_Tmux("gd\n")<CR>

nnoremap <Leader>gc :Gcommit -m ""<LEFT>
nnoremap <Leader>gcv :Gcommit -v<CR>
nnoremap <Leader>ga :Git add .<CR>

" TESTING
" Run tests from vim using vimux and vim-test

let test#strategy = 'vimux'
let test#ruby#minitest = 'm'
nmap <silent> <leader>t :w<CR>:TestNearest<CR>
nmap <silent> <leader>T :w<CR>:TestFile<CR>
nmap <silent> <leader>k :w<CR>:TestSuite<CR>
nmap <silent> <leader>l :w<CR>:TestLast<CR>
nmap <silent> <leader>g :w<CR>:TestVisit<CR>


" MISC
" Paste in paste mode
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" " Run commands such as `migrate` or `m` interactively
nnoremap <Leader>i :RunInInteractiveShell<space>
