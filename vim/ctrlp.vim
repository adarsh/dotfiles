" CtrlP for fuzzy finding
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Switch to the file if it's already open
let g:ctrlp_switch_buffer = 'E'

" Don't clear the cache on Vim exit
let g:ctrlp_clear_cache_on_exit = 1

" Store the cache in the /tmp/ctrlp dir
let g:ctrlp_cache_dir = '/tmp/ctrlp'

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Ignore these files (not necessary as ag respects .gitignore)
set wildignore+=*/tmp/*,*tags*,*.swp,*/.git/*,*/vendor/cache/*

