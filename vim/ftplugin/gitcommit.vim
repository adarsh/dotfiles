" Vim filetype plugin
" Language: git commit file

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1 " Don't load twice in one buffer

" Don't break lines with a newline and comment character
setlocal formatoptions=roq formatoptions-=t wrap linebreak nolist
