" Based on Learn Vimscript the Hardway
if exists("b:current_syntax")
    finish
endif

syntax keyword tranqKeyword fun return var until loop else if

syntax keyword tranqFunction alloc button free html i2s iprint iread makeing makelabel
syntax keyword tranqFunction nl random setimg setlabel sprint sread stoptimer timer

syntax match tranqOperator "\v\*"
syntax match tranqOperator "\v\:"
syntax match tranqOperator "\v\."
syntax match tranqOperator "\v\,"
syntax match tranqOperator "\v\<"
syntax match tranqOperator "\v\>"
syntax match tranqOperator "\v/"
syntax match tranqOperator "\v\+"
syntax match tranqOperator "\v-"
syntax match tranqOperator "\v\?"
syntax match tranqOperator "\v\*\="
syntax match tranqOperator "\v/\="
syntax match tranqOperator "\v\+\="
syntax match tranqOperator "\v-\="

syntax match tranqComment "\v#.*$"
highlight link tranqComment Comment

syntax region tranqString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight link tranqKeyword Keyword
highlight link tranqFunction Function
highlight link tranqOperator Statement
highlight link tranqComment Comment
highlight link tranqString String

let b:current_syntax = "tranquility"
