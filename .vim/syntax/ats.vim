"
" VIM mode for editing ATS source
" Author: Yuri D'Elia <wavexx AT thregr DOT org>
" Copyright (C) 2010 Yuri D'Elia
"

" ATS syntax plugin for VIM >= 6.x
if exists("b:current_syntax") && b:current_syntax == "ats"
  finish
endif

" Operators
syn match atsOperator "+\|-\|/\|*\|=\|\^\|&\|!\|>\|<\|%\|\~\|@\||\|:\|?"

" Delimiter
syn match atsDelimiter "(\|)\|\[\|\]\|,\|;\|{\|}\|[@'][({(\[]"

" Comments
syn region atsCommentCPP start="//" end="$" keepend
syn region atsCommentOC start="(\*" end="\*)" contains=atsCommentOC
syn region atsCommentC start="/\*" end="\*/" contains=atsCommentC
syn region atsCommentEOF start="\/\/\/\/" end="\%$"

" Strings
syn match atsCharacter "'\\\d\d\d'\|'\\[\'ntbr]'\|'.'"
syn region atsString start=+"+ skip=+\\\\\|\\"+ end=+"+

" Booleans
syn keyword atsBoolean true false

" Constant
syn keyword atsConstant null

" Number
syn match atsNumber "\<[0-9]\+[LlUu]\?\>\|\<0[xX][0-9a-fA-F]\+[LlUu]\?\>\|\<0[oO][0-7]\+[LlUu]\?\>"
syn match atsNumber "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=[fFlL]\>"

" Identifier
syn match atsIdentifier "[A-Za-z_][A-Za-z0-9_$]*"

" Types
syn match atsType "\(view\|v\)\?t[0@]\?ype"
syn keyword atsType view vt0p t0p tkind real types prop
syn keyword atsType sint int lint llint usint uint ulint ullint
syn keyword atsType char uchar schar
syn keyword atsType float double ldouble
syn keyword atsType intptr uintptr size_t ssize_t
syn keyword atsType int8 uint8 int16 uint16 int32 uint32 int64 uint64
syn keyword atsType string strptr stropt
syn keyword atsType addr bool byte ptr void lazy eff
syn keyword atsType nat pos neg agz

" Typedef
syn match atsTypedef "\<\(sta\|sort\|prop\|view\|tkin\)def\>" skipwhite nextgroup=atsTypeName
syn match atsTypedef "\<\(view\|v\)\?typedef\>" skipwhite nextgroup=atsTypeName
syn match atsTypedef "\<abs\(view\|v\)\?t[@0]\?ype\>" skipwhite nextgroup=atsTypeName
syn match atsTypedef "\<abs\(prop\|view\)\>" skipwhite nextgroup=atsTypeName
syn keyword atsTypedef assume stacst skipwhite nextgroup=atsTypeName
syn keyword atsStructure classdec datasort dataprop dataview datatype datavtype dataviewtype skipwhite nextgroup=atsTypeName
syn match atsTypeName "[A-Za-z_][A-Za-z0-9_$]*" contained

" Functions
syn keyword atsStorage extern static
syn keyword atsFun fn fnx fun prfun prfn praxi castfn fn fnx fun prfun prfn praxi castfn implement primplement implmnt primplmnt skipwhite nextgroup=atsTemplArgs,atsFunName
syn region atsTemplArgs matchgroup=atsDelimiter start="{" end="}" contained skipwhite contains=atsArgSep,atsType nextgroup=atsTemplArgs,atsFunName
syn match atsArgSep "," contained
syn match atsFunName "[A-Za-z_][A-Za-z0-9_$]*" contained

" Includes
syn match atsLoadCmd "\<\(sta\|dyn\)load\>" skipwhite nextgroup=atsLoadNS,atsLoadPath
syn match atsLoadNS "[A-Za-z_][A-Za-z0-9_$]*" contained skipwhite nextgroup=atsLoadEq
syn match atsLoadEq "=" contained skipwhite nextgroup=atsLoadPath
syn region atsLoadPath start=+"+ end=+"+ contained
syn match atsModNS "\$[A-Za-z_][A-Za-z0-9_$]*\."he=e-1,me=e-1 nextgroup=atsIdentifier

" C blocks
syn include @atsC syntax/c.vim
unlet b:current_syntax
syn region atsEmbC matchgroup=atsDelimiter start="%{[#$^]" keepend end="%}" contains=@atsC

" Preprocessing
syn match atsInclude "#include\>"
syn match atsDefine "#define\>"
syn match atsPreCondit "#\(elif\|elifdef\|elifndef\|else\|endif\|if\|ifdef\|ifndef\|then\)\>"
syn match atsPreProc "#\(assert\|error\|print\|undef\)\>"

" other keywords
syn keyword atsConditional if then else case of sif scase
syn keyword atsStatement let where in begin end and local
syn keyword atsException try exception
syn keyword atsKeyword prefix infixl infixr infix postfix nonfix
syn keyword atsKeyword val var prval prvar overload symintr macdef with when lam llam
syn match atsKeyword "\$\(arrpsz\|arrptrsize\)\>"
syn match atsKeyword "\$\(delay\|ldelay\)\>"
syn match atsKeyword "\$\(effmask\|effmask_ntm\|effmask_exn\|effmask_ref\|effmask_wrt\|effmask_all\)\>"
syn match atsKeyword "\$\(extern\|extkind\|extype\|extype_struct\|extval\|extfcall\)\>"
syn match atsKeyword "\$\(lst\|lst_t\|lst_vt\|list\|list_t\|list_vt\)\>"
syn match atsKeyword "\$\(rec\|rec_t\|rec_vt\|record\|record_t\|record_vt\)\>"
syn match atsKeyword "\$\(tup\|tup_t\|tup_vt\|tuple\|tuple_t\|tuple_vt\)\>"
syn match atsKeyword "\$\(break\|continue\|raise\)\>"
syn match atsKeyword "\$\(myfilename\|mylocation\|myfunction\)\>"
syn match atsKeyword "\$\(showtype\)\>"
syn match atsKeyword "\$\(vcopyenv_v\|vcopyenv_vt\)\>"
syn match atsKeyword "\<\(fold\|free\|addr\|view\|lam\|llam\)@"

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
hi link atsConstant Constant

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
hi link atsPreCondit PreCondit
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
