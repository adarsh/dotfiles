" CtrlP for fuzzy finding
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Switch to the file if it's already open
let g:ctrlp_switch_buffer = 'E'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" Make CtrlP use ag for listing the files. Much faster and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
