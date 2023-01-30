let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Software
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +0 Binaries/Vim/Modes.md
badd +0 Binaries/Vim/Normal\ Mode.md
badd +0 Binaries/Vim/Visual\ Mode.md
badd +0 Software\ Engineering/Ruby/Language\ Details/Arrays.md
badd +0 Software\ Engineering/Ruby/Rails/Creating\ A\ Rails\ App.md
badd +0 Software\ Engineering/React/Experiments/Debugging\ Experiment.md
badd +0 Software\ Engineering/Ruby/Rails/Generators.md
badd +0 Software\ Engineering/Ruby/Language\ Details/Hashes.md
badd +0 Software\ Engineering/Ruby/Rails/Installation.md
badd +0 Binaries/Vim/Terminal\ Mode.md
badd +0 Software\ Engineering/Ruby/Language\ Details/Libraries.md
badd +0 Software\ Engineering/Ruby/Development/Ruby\ Interactive\ Shell.md
badd +0 Software\ Engineering/Ruby/Language\ Details/Structs.md
badd +0 Software\ Engineering/Ruby/Development/rbenv.md
argglobal
%argdel
$argadd Binaries/Vim/Modes.md
$argadd Binaries/Vim/Normal\ Mode.md
$argadd Binaries/Vim/Visual\ Mode.md
$argadd Software\ Engineering/Ruby/Language\ Details/Arrays.md
$argadd Software\ Engineering/Ruby/Rails/Creating\ A\ Rails\ App.md
$argadd Software\ Engineering/React/Experiments/Debugging\ Experiment.md
$argadd Software\ Engineering/Ruby/Rails/Generators.md
$argadd Software\ Engineering/Ruby/Language\ Details/Hashes.md
$argadd Software\ Engineering/Ruby/Rails/Installation.md
$argadd Binaries/Vim/Terminal\ Mode.md
$argadd Software\ Engineering/Ruby/Language\ Details/Libraries.md
$argadd Software\ Engineering/Ruby/Development/Ruby\ Interactive\ Shell.md
$argadd Software\ Engineering/Ruby/Language\ Details/Structs.md
$argadd Software\ Engineering/Ruby/Development/rbenv.md
edit Binaries/Vim/Modes.md
argglobal
let s:l = 2 - ((1 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
