setlocal foldmethod=syntax

syntax region mdCitation start=/\v\(/ skip=/\v\\./ end=/\v\)/
syntax region mdQuote    start=/\v"/  skip=/\v\\./ end=/\v"/ 
syntax keyword mdTodo TODO	 

highlight mdString cterm=italic
highlight link mdTodo	  Todo
highlight link mdQuote	  String
highlight link mdCitation Keyword
