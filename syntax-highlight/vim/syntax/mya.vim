" Key words
syntax keyword MyaDeclaration bitfield register immediate inst set include

" Operators
syntax match MyaOperator /=|{|}|\[|\]|(|)|;|,|\.|\||&|\^|\~|\+|\-|\*|\/|<<|>>/

" Numbers
syntax match MyaNumber /\v0x[0-9a-fA-F]+|0o[0-7]+|0b[01]+|\d+/

" Strings
syntax match MyaString /"[^"\r\n]*"/

" Variables
syntax match MyaVariable /\<[A-Za-z_][A-Za-z0-9_]*\>/

" Comments
syntax match MyaComment /#.*$/

" Links to prominent groups
hi link MyaDeclaration Keyword
hi link MyaOperator Operator
hi link MyaNumber Number
hi link MyaString String
hi link MyaVariable Identifier
hi link MyaComment Comment
