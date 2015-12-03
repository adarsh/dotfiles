" CtrlP for fuzzy finding
let g:ctrlp_map = '<Tab>'

" Use File mode (Not Buffer or Most Recently Used (MRU))
let g:ctrlp_cmd = 'CtrlP .'

" Set the working directory to the current one
let g:ctrlp_working_path_mode = 'ca'

" Switch to the file if it's already open
let g:ctrlp_switch_buffer = 'E'

" Make CtrlP use ag for listing the files. Much faster and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" Ignore directories by adding them to ~/.agignore
