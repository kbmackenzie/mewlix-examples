" Mewlix syntax file.
" Language: Mewlix 
" Maintainer: Kelly Bethany <kelly.a.betty@gmail.com>

if exists("b:current_syntax")
    finish
endif

syntax case match

" Constants
syntax keyword mewlixBoolean true false
syntax keyword mewlixConstants nothing home super

" Statement Keywords
syntax keyword mewlixStatement meow mew meowmeow clowder home outside wake listen otherwise takes as yarnball catnap assert throw escape
syntax match mewlixStatement /\%(^\|\s\)peek\s*if\%(\s\|$\)/
syntax match mewlixStatement /\%(^\|\s\)or\s*if\%(\s\|$\)/
syntax match mewlixStatement /\%(^\|\s\)stare\s*while\%(\s\|$\)/
syntax match mewlixStatement /\%(^\|\s\)it\'s\s*raining\%(\s\|$\)/
syntax match mewlixStatement /\%(^\|\s\)catch\s*a\%(\s\|$\)/
syntax match mewlixStatement /\%(^\|\s\)yarn\s*ball\%(\s\|$\)/
syntax match mewlixStatement /\%(^\|\s\)pounce\s*on\%(\s\|$\)/
syntax match mewlixStatement /\%(^\|\s\)watch\s*attentively\%(\s\|$\)/

" Literals
syntax match mewlixInt /\d\+/
syntax match mewlixFloat /\d\+\.\d\+/
syntax match mewlixEscape /\\[a-z\/\\"]/
syntax region mewlixString start=/"/ skip=/\\"/ end=/"/ contains=mewlixEscape
syntax region mewlixStringLn start=/"""/ skip=/\\"/ end=/"""/ contains=mewlixEscape

" Operators
syntax keyword mewlixOperator and not push paw claw at is new
syntax match mewlixOperator /\%(^\|\s\)knock over\%(\s\|$\)/
syntax match mewlixOperator /\%(^\|\s\)peek\%(\s*if\)\@\!\%(\s\|$\)/
syntax match mewlixOperator /\%(^\|\s\)or\%(\s*if\)\@\!\%(\s\|$\)/
syntax match mewlixOperator /[+-*/^.=<>?:%!]/
syntax match mewlixOperator /\[/
syntax match mewlixOperator /\]/
syntax match mewlixOperator /(/
syntax match mewlixOperator /)/
syntax match mewlixOperator /\\\n/

" Symbols:
syntax match mewlixFunc /=\^\.[xX]\.\^=/
syntax match mewlixBox /=\^-[xX]-\^=/
syntax match mewlixLambda /=\^\*[xX]\*\^=/

" Comments:
syntax match mewlixLineComment /--.*$/
syntax region mewlixBlockComment start=/\~( \^\.[xX]\.\^)>/ end=/<(\^\.[xX]\.\^ )\~/

" Adding highlighting:
" --------------------------------
let b:current_syntax = "mewlix"

hi def link mewlixInt           Number
hi def link mewlixFloat         Float
hi def link mewlixString        String
hi def link mewlixStringLn      String
hi def link mewlixBoolean       Boolean
hi def link mewlixConstants     Constant
hi def link mewlixEscape        SpecialChar
hi def link mewlixOperator      Operator
hi def link mewlixStatement     Statement
hi def link mewlixFunc          Statement
hi def link mewlixBox           Statement
hi def link mewlixLambda        Statement
hi def link mewlixLineComment   Comment
hi def link mewlixBlockComment  Comment
