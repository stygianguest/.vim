" Vim syntax file
" Language:	STELLAR
" Maintainer:
" Last Change:

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" STELLAR keywords
syn keyword	cType           unit unit2 unit3 unit4
syn keyword	cType           bool bool2 bool3 bool4
syn keyword	cType           int int2 int3 int4 
syn keyword	cType           float float2 float3 float4
syn keyword	cType           real point vector unitvector
syn keyword	cStatement	return assert precondition
syn keyword	cLabel		case default entry testcase function functor interface module
syn keyword	cConditional	if else switch
syn keyword	cRepeat		while for do foreach
syn keyword     cConstant       true false inf
syn keyword     cInclude        include open
syn keyword	cStructure	type enum newtype struct
syn keyword	cStorageClass	static uniform dynamic unique varying
syn keyword	cTodo		contained TODO FIXME XXX

"wrong categorie?!?
syn keyword     cLabel          _ in
syn keyword     cLabel          operator
syn keyword     cLabel          with

""catch errors caused by wrong parenthesis and brackets
"" also accept <% for {, %> for }, <: for [ and :> for ] (C99)
"" But avoid matching <::.
"syn cluster	cParenGroup	contains=cParenError,cIncluded,cSpecial,cCommentSkip,cCommentString,cComment2String,@cCommentGroup,cCommentStartError,cUserCont,cUserLabel,cBitField,cCommentSkip,cOctalZero,cCppOut,cCppOut2,cCppSkip,cFormat,cNumber,cFloat,cOctal,cOctalError,cNumbersCom
"if exists("c_no_bracket_error")
"  syn region	cParen		transparent start='(' end=')' contains=ALLBUT,@cParenGroup,cCppParen,cCppString,@Spell
"  " cCppParen: same as cParen but ends at end-of-line; used in cDefine
"  syn region	cCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cParen,cString,@Spell
"  syn match	cParenError	display ")"
"  "syn match	cErrInParen	display contained "[{}]\|<%\|%>"
"else
"  syn region	cParen		transparent start='(' end=')' contains=ALLBUT,@cParenGroup,cCppParen,cErrInBracket,cCppBracket,cCppString,@Spell
"  " cCppParen: same as cParen but ends at end-of-line; used in cDefine
"  syn region	cCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cErrInBracket,cParen,cBracket,cString,@Spell
"  syn match	cParenError	display "[\])]"
"  "syn match	cErrInParen	display contained "[\]{}]\|<%\|%>"
"  syn region	cBracket	transparent start='\[\|<::\@!' end=']\|:>' contains=ALLBUT,@cParenGroup,cErrInParen,cCppParen,cCppBracket,cCppString,@Spell
"  " cCppBracket: same as cParen but ends at end-of-line; used in cDefine
"  syn region	cCppBracket	transparent start='\[\|<::\@!' skip='\\$' excludenl end=']\|:>' end='$' contained contains=ALLBUT,@cParenGroup,cErrInParen,cParen,cBracket,cString,@Spell
"  syn match	cErrInBracket	display contained "[);{}]\|<%\|%>"
"endif

if exists("c_comment_strings")
  " A comment can contain cString, cCharacter and cNumber.
  " But a "*/" inside a cString in a cComment DOES end the comment!  So we
  " need to use a special type of cString: cCommentString, which also ends on
  " "*/", and sees a "*" at the start of the line as comment again.
  " Unfortunately this doesn't very well work for // type of comments :-(
  syntax match	cCommentSkip	contained "^\s*\*\($\|\s\+\)"
  syntax region cCommentString	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=cSpecial,cCommentSkip
  syntax region cComment2String	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=cSpecial
  syntax region  cCommentL	start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cComment2String,cCharacter,cNumbersCom,cSpaceError,@Spell
  syntax region cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell
else
  syn region	cCommentL	start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cSpaceError,@Spell
  syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell
endif
" keep a // comment separately, it terminates a preproc. conditional
syntax match	cCommentError	display "\*/"
syntax match	cCommentStartError display "/\*"me=e-1 contained

if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cFormat		cSpecial
  HiLink cCppString		cString
  HiLink cCommentL		cComment
  HiLink cCommentStart		cComment
  HiLink cLabel			Label
  HiLink cUserLabel		Label
  HiLink cConditional		Conditional
  HiLink cRepeat		Repeat
  HiLink cCharacter		Character
  HiLink cSpecialCharacter	cSpecial
  HiLink cNumber		Number
  HiLink cOctal			Number
  HiLink cOctalZero		PreProc	 " link this to Error if you want
  HiLink cFloat			Float
  HiLink cOctalError		cError
  HiLink cParenError		cError
  "HiLink cErrInParen		cError
  HiLink cErrInBracket		cError
  HiLink cCommentError		cError
  HiLink cCommentStartError	cError
  HiLink cSpaceError		cError
  HiLink cSpecialError		cError
  HiLink cOperator		Operator
  HiLink cStructure		Structure
  HiLink cStorageClass		StorageClass
  HiLink cInclude		Include
  HiLink cPreProc		PreProc
  HiLink cDefine		Macro
  HiLink cIncluded		cString
  HiLink cError			Error
  HiLink cStatement		Statement
  HiLink cPreCondit		PreCondit
  HiLink cType			Type
  HiLink cConstant		Constant
  HiLink cCommentString		cString
  HiLink cComment2String	cString
  HiLink cCommentSkip		cComment
  HiLink cString		String
  HiLink cComment		Comment
  HiLink cSpecial		SpecialChar
  HiLink cTodo			Todo
  HiLink cCppSkip		cCppOut
  HiLink cCppOut2		cCppOut
  HiLink cCppOut		Comment

  delcommand HiLink
endif

let b:current_syntax = "c"

" vim: ts=8
