set guifont=Monaco\ Nerd\ Font\ Complete:h13 " font settings
"set guifont=Hack\ Regular\ Nerd\ Font\ Complete:h14  " font settings
set guioptions=-t       " hide toolbar

" return to normal mode after saving
iunmenu File.Save 
imenu <silent> File.Save <Esc>:if expand("%") == ""<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR> 
