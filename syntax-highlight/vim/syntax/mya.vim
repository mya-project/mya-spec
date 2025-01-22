" Palavras-chave
syntax keyword MyaDeclaration bitfield register immediate inst set include

" Operadores
syntax match MyaOperator /=|{|}|\[|\]|(|)|;|,|\.|\||&|\^|\~|\+|\-|\*|\/|<<|>>/

" Números
syntax match MyaNumber /\v0x[0-9a-fA-F]+|0o[0-7]+|0b[01]+|\d+/

" Strings
syntax match MyaString /"[^"\r\n]*"/

" Variáveis
syntax match MyaVariable /\<[A-Za-z_][A-Za-z0-9_]*\>/

" Comentários
syntax match MyaComment /#.*$/

" Links para grupos de destaque
hi link MyaDeclaration Keyword
hi link MyaOperator Operator
hi link MyaNumber Number
hi link MyaString String
hi link MyaVariable Identifier
hi link MyaComment Comment
