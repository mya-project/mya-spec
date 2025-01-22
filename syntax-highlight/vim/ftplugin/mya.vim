" Prevent duplicate execution
if exists("b:current_syntax")
    finish
endif

autocmd BufRead,BufNewFile *.mya set filetype=mya