"
" VIM mode for editing ATS source
" Author: Yuri D'Elia <wavexx AT thregr DOT org>
" Copyright (C) 2010 Yuri D'Elia
"

" ATS syntax plugin for VIM >= 6.x
if exists("b:current_syntax") && b:current_syntax == "ats"
  finish
endif

" Delimiter
syn match atsDelimiter "(\|)\|\[\|\]\|,\|;\|{\|}\||"

" Operators
syn match atsOperator "+\|-\|/\|*\|=\|\^\|&\|!\|>\|<\|%\|\~\|@\|||\|:"

" Comments
syn region atsCommentCPP start="//" end="$" keepend
syn region atsCommentOC start="(\*" end="\*)" contains=atsCommentOC
syn region atsCommentEOF start="\/\/\/\/" end="\%$"

" Strings
syn match atsCharacter "'\\\d\d\d'\|'\\[\'ntbr]'\|'.'"
syn region atsString start=+"+ skip=+\\\\\|\\"+ end=+"+

" Booleans
syn keyword atsBoolean true false

" Number
syn match atsNumber "\<[0-9]\+[LlUu]\?\>\|\<0[xX][0-9a-fA-F]\+[LlUu]\?\>\|\<0[oO][0-7]\+[LlUu]\?\>"
syn match atsNumber "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=[fFlL]\>"

" Identifier
syn match atsIdentifier "[A-Za-z_][A-Za-z0-9_]*"

" Types
syn match atsType "\(view\|v\)\?t[0@]\?ype"
syn keyword atsType view vt0p t0p
syn keyword atsType int lint llint uint ulint ullint
syn keyword atsType short ushort char uchar schar
syn keyword atsType float double ldouble
syn keyword atsType intptr uintptr size_t ssize_t
syn keyword atsType int8 uint8 int16 uint16 int32 uint32 int64 uint64
syn keyword atsType string strptr stropt
syn keyword atsType addr bool byte ptr void lazy

" Typedef
syn match atsTypedef "\<\(sta\|sort\|prop\|view\|tkin\)def\>" skipwhite nextgroup=atsTypeName
syn match atsTypedef "\<\(view\|v\)\?typedef\>" skipwhite nextgroup=atsTypeName
syn match atsTypedef "\<abs\(view\|v\)\?t[@0]\?ype\>" skipwhite nextgroup=atsTypeName
syn match atsTypedef "\<abs\(prop\|view\)\>" skipwhite nextgroup=atsTypeName
syn keyword atsTypedef assume skipwhite nextgroup=atsTypeName
syn keyword atsStructure classdec datasort dataprop dataview datatype datavtype dataviewtype skipwhite nextgroup=atsTypeName
syn match atsTypeName "[[:alnum:]_]\+" contained

" Functions
syn keyword atsStorage extern
syn keyword atsFun fn fnx fun prfun prfn praxi castfn fn fnx fun prfun prfn praxi castfn implement primplement implmnt primplmnt skipwhite nextgroup=atsTemplArgs,atsFunName
syn region atsTemplArgs matchgroup=atsDelimiter start="{" end="}" contained skipwhite contains=atsArgSep,atsType nextgroup=atsFunName
syn match atsArgSep "," contained
syn match atsFunName "[[:alnum:]_]\+" contained

" Includes
syn match atsLoadCmd "\<\(sta\|dyn\)load\>" skipwhite nextgroup=atsLoadNS,atsLoadPath
syn match atsLoadNS "[[:alnum:]_]\+" contained skipwhite nextgroup=atsLoadEq
syn match atsLoadEq "=" contained skipwhite nextgroup=atsLoadPath
syn region atsLoadPath start=+"+ end=+"+ contained
syn match atsModNS "\$[[:alnum:]_]\+\."he=e-1,me=e-1 nextgroup=atsIdentifier

" C blocks
syn include @atsC syntax/c.vim
unlet b:current_syntax
syn region atsEmbC matchgroup=atsDelimiter start="%{[#$^]" keepend end="%}" contains=@atsC

" Preprocessing
syn match atsInclude "#include\>.*"
syn match atsDefine "#define\>.*"
syn match atsPreProc "#\(if\|then\|else\|endif\|print\)\>"

" other keywords
syn keyword atsConditional if then else case of
syn keyword atsStatement let where in begin end and
syn keyword atsRepeat for while
syn keyword atsException exception
syn keyword atsKeyword prefix infixl infixr infix postfix
syn keyword atsKeyword val var prval overload symintr macdef local with when
syn match atsKeyword "\$[[:alnum:]_]\+\s*[("]"he=e-1,me=e-1
syn match atsKeyword "[[:alnum:]_]\+@[^[:alnum:]]"he=e-1,me=e-1

" link
hi link atsCommentCPP Comment
hi link atsCommentOC Comment
hi link atsCommentEOF Comment

hi link atsDelimiter Delimiter

hi link atsOperator Operator

hi link atsCharacter Character
hi link atsString String
hi link atsBoolean Boolean
hi link atsNumber Number

hi link atsStorage StorageClass
hi link atsFun Keyword
hi link atsFunName Function
hi link atsArgSep Delimiter

hi link atsLoadNS Identifier
hi link atsLoadCmd Keyword
hi link atsLoadPath Include
hi link atsModNS Include

hi link atsInclude Include
hi link atsDefine Define
hi link atsPreProc PreProc

hi link atsConditional Conditional
hi link atsStatement Statement
hi link atsRepeat Repeat
hi link atsException Exception
hi link atsKeyword Keyword

hi link atsType Type
hi link atsTypedef Typedef
hi link atsStructure Structure
hi link atsTypeName Identifier

let b:current_syntax = "ats"

" end of [ats.vim]
