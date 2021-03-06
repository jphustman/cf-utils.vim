" Language:       CF
" Maintainer:     Dave Long <http://davejlong.com>
" URL:            http://github.com/davejlong/coldfusion.vim
" License:        WTFPL

au BufNewFile,BufRead *.cfm,*.cfml set filetype=cfml

"call Decho("cfml")
function! s:DetectCF()
    if getline(1) =~ '^component'
        set filetype=cfscript
    elseif getline(1) =~ '^\/\*'
        set filetype=cfscript " handles comments on first line of CFC
    else
        set filetype=cfml
    endif
endfunction

setlocal dictionary+=$HOME/.vim/bundle/cf-utils.vim/syntax/cfml.dict

" For CFCs there needs to be a check somewhere if it is script or tag
autocmd BufNewFile,BufRead,BufEnter *.cfc call s:DetectCF()
