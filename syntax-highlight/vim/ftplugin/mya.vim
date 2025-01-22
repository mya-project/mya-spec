" Prevenir execução duplicada
if exists("b:current_syntax")
    finish
endif

autocmd BufRead,BufNewFile *.mya set filetype=mya