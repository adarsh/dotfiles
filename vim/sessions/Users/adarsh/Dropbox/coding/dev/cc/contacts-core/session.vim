let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <S-Tab> =BackwardsSnippet()
nnoremap  
snoremap <silent> 	 i<Right>=TriggerSnippet()
nnoremap <NL> <NL>
nnoremap  
nnoremap  
xnoremap <silent>  :call multiple_cursors#new("v")
nnoremap <silent>  :call multiple_cursors#new("n")
nnoremap <silent>  :CtrlP
snoremap  b<BS>
nnoremap <silent>  :TComment
nnoremap <silent> r :TCommentRight
noremap s :TCommentAs =&ft_
noremap n :TCommentAs =&ft 
noremap a :TCommentAs 
noremap b :TCommentBlock
vnoremap <silent> r :TCommentRight
vnoremap <silent> i :TCommentInline
onoremap <silent> r :TCommentRight
noremap   :TComment 
noremap <silent> p m`vip:TComment``
vnoremap <silent>  :TCommentMaybeInline
onoremap <silent>  :TComment
snoremap % b<BS>%
snoremap ' b<BS>'
nnoremap <silent> ,__ :TComment
nnoremap <silent> ,_r :TCommentRight
noremap ,_s :TCommentAs =&ft_
noremap ,_n :TCommentAs =&ft 
noremap ,_a :TCommentAs 
noremap ,_b :TCommentBlock
vnoremap <silent> ,_r :TCommentRight
onoremap <silent> ,_r :TCommentRight
vnoremap <silent> ,_i :TCommentInline
noremap ,_  :TComment 
noremap <silent> ,_p vip:TComment
vnoremap <silent> ,__ :TCommentMaybeInline
onoremap <silent> ,__ :TComment
nmap ,l <Plug>SendFocusedTestToTmux
nmap ,t <Plug>SendTestToTmux
nnoremap ,} :%s/\([^ ]\)}/\1 }/gc
nnoremap ,{ :%s/{\([^ ]\)/{ \1/gc
nnoremap ,: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc
nnoremap ,ga :Git add .
nnoremap ,gcv :Gcommit -v
nnoremap ,gc :Gcommit -m ""<Left>
nmap ,- _
nmap ,c :noh
nmap ,w :w
nmap ,a :A
nmap ,s :AS
nmap ,v :AV
nmap ,S :sp
nmap ,V :vs
nnoremap ,r 
nnoremap ,, 
nnoremap ,k :call Send_to_Tmux("clear && rake && notify 'rake complete'\n")
inoremap ï o
xmap S <Plug>VSurround
snoremap U b<BS>U
vmap [% [%m'gv``
snoremap \ b<BS>\
vmap ]% ]%m'gv``
snoremap ^ b<BS>^
snoremap ` b<BS>`
vmap a% [%v]%
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
noremap <silent> gCc :let w:tcommentPos = getpos(".") | set opfunc=TCommentOperatorLineAnywayg@$
noremap <silent> gC :let w:tcommentPos = getpos(".") | set opfunc=TCommentOperatorAnywayg@
noremap <silent> gcc :let w:tcommentPos = getpos(".") | set opfunc=TCommentOperatorLineg@$
noremap <silent> gc :let w:tcommentPos = getpos(".") | set opfunc=TCommentOperatorg@
xmap gS <Plug>VgSurround
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> b<BS>
snoremap <silent> <S-Tab> i<Right>=BackwardsSnippet()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <Plug>SendFocusedTestToTmux :w | call SendFocusedTestToTmux(expand('%'), line('.'))
nnoremap <silent> <Plug>SendTestToTmux :w | call SendTestToTmux(expand('%'))
nmap <Plug>NormalModeSendToTmux vip <Plug>SendSelectionToTmux
vmap <Plug>SendSelectionToTmux "ry :call Send_to_Tmux(@r)
nnoremap <silent> <F4> :let _s=@/|:%s/\s\+$//e|:let @/=_s|:nohl:retab
nnoremap <Down> :echoe "Use j"
nnoremap <Up> :echoe "Use k"
nnoremap <Right> :echoe "Use l"
nnoremap <Left> :echoe "Use h"
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =TriggerSnippet()
imap  <Plug>DiscretionaryEnd
inoremap <silent> 	 =ShowAvailableSnips()
imap  <Plug>Isurround
imap  <Plug>AlwaysEnd
inoremap s :TCommentAs =&ft_
inoremap n :TCommentAs =&ft 
inoremap a :TCommentAs 
inoremap b :TCommentBlock
inoremap <silent> r :TCommentRight
inoremap   :TComment 
inoremap <silent> p :norm! m`vip:TComment``
inoremap <silent>  :TComment
cnoreabbr <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set complete=.,w,t
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set grepprg=ag\ --noheading\ --nogroup\ --nocolor
set helplang=en
set hidden
set history=50
set hlsearch
set incsearch
set isident=@,48-57,_,192-255,$
set laststatus=2
set listchars=tab:»·,trail:·
set modelines=0
set ruler
set runtimepath=~/.vim/bundle/vundle,~/.vim/bundle/tslime.vim,~/.vim/bundle/vim-turbux,~/.vim/bundle/vim-coffee-script,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/ag.vim,~/.vim/bundle/vim-fugitive,~/.vim/bundle/vim-markdown,~/.vim/bundle/vim-rails,~/.vim/bundle/vim-surround,~/.vim/bundle/vim-ruby,~/.vim/bundle/vim-multiple-cursors,~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,~/.vim/after,~/.vim/bundle/vundle/,~/.vim/bundle/vundle/after,~/.vim/bundle/tslime.vim/after,~/.vim/bundle/vim-turbux/after,~/.vim/bundle/vim-coffee-script/after,~/.vim/bundle/ctrlp.vim/after,~/.vim/bundle/ag.vim/after,~/.vim/bundle/vim-fugitive/after,~/.vim/bundle/vim-markdown/after,~/.vim/bundle/vim-rails/after,~/.vim/bundle/vim-surround/after,~/.vim/bundle/vim-ruby/after,~/.vim/bundle/vim-multiple-cursors/after
set scrolloff=10
set shiftwidth=2
set showcmd
set splitbelow
set splitright
set noswapfile
set tabstop=2
set wildignore=*/tmp/*,*tags*,*.swp
set wildmode=list:longest,list:full
set window=0
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Dropbox/coding/dev/cc/contacts-core
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +236 ~/.vimrc
badd +242 app/models/file_import.rb
badd +30 app/models/row_previewer.rb
args ~/Dropbox/coding/dev/cc/contacts-core
edit app/models/file_import.rb
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=81
setlocal colorcolumn=81
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,t
setlocal completefunc=syntaxcomplete#Complete
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
set numberwidth=5
setlocal numberwidth=5
setlocal omnifunc=rubycomplete#Complete
setlocal path=lib,vendor,app/models/concerns,app/controllers/concerns,app/controllers,app/helpers,app/mailers,app/models,app/*,app/views,spec,spec/controllers,spec/helpers,spec/mailers,spec/models,spec/views,spec/lib,spec/features,spec/requests,spec/integration,vendor/plugins/*/lib,vendor/plugins/*/test,vendor/rails/*/lib,vendor/rails/*/test,~/Dropbox/coding/dev/cc/contacts-core,~/.rbenv/versions/1.9.3-p392/lib/ruby/site_ruby/1.9.1,~/.rbenv/versions/1.9.3-p392/lib/ruby/site_ruby/1.9.1/x86_64-darwin12.2.1,~/.rbenv/versions/1.9.3-p392/lib/ruby/site_ruby,~/.rbenv/versions/1.9.3-p392/lib/ruby/vendor_ruby/1.9.1,~/.rbenv/versions/1.9.3-p392/lib/ruby/vendor_ruby/1.9.1/x86_64-darwin12.2.1,~/.rbenv/versions/1.9.3-p392/lib/ruby/vendor_ruby,~/.rbenv/versions/1.9.3-p392/lib/ruby/1.9.1,~/.rbenv/versions/1.9.3-p392/lib/ruby/1.9.1/x86_64-darwin12.2.1
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=~/Dropbox/coding/dev/cc/contacts-core/tags,~/Dropbox/coding/dev/cc/contacts-core/tmp/tags,~/Dropbox/coding/dev/cc/contacts-core/.git/ruby.tags,~/Dropbox/coding/dev/cc/contacts-core/.git/tags,./tags,tags,~/.rbenv/versions/1.9.3-p392/lib/ruby/site_ruby/1.9.1/tags,~/.rbenv/versions/1.9.3-p392/lib/ruby/site_ruby/1.9.1/x86_64-darwin12.2.1/tags,~/.rbenv/versions/1.9.3-p392/lib/ruby/site_ruby/tags,~/.rbenv/versions/1.9.3-p392/lib/ruby/vendor_ruby/1.9.1/tags,~/.rbenv/versions/1.9.3-p392/lib/ruby/vendor_ruby/1.9.1/x86_64-darwin12.2.1/tags,~/.rbenv/versions/1.9.3-p392/lib/ruby/vendor_ruby/tags,~/.rbenv/versions/1.9.3-p392/lib/ruby/1.9.1/tags,~/.rbenv/versions/1.9.3-p392/lib/ruby/1.9.1/x86_64-darwin12.2.1/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 242 - ((26 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
242
normal! 04l
lcd ~/Dropbox/coding/dev/cc/contacts-core
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
