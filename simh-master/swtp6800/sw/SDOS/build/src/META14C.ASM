	TABS	20,28,44,45
	WITH	WI=107,DE=51
* METAPLUS COMPILED BY METAPLUS VERSION 1.4c
	ORG	0
ATTRIBUTE	RMB	1
TOKEN	RMB	1
SUBR	RMB	1
REFERENCED	RMB	1
DEFINED	RMB	1
STATEVARIABLE	RMB	1
KEYWORD	RMB	1
TYPENAME	RMB	1
STATEVALUE	RMB	1
	ORG	$104	METAMACHINE ENTRY POINTS
STARTTOKEN	RMB	3
GETTOKENCHAR	RMB	3
BACKUP	RMB	3
EATTOKEN	RMB	3
FINDSTAR	RMB	3
FINDSTARN	RMB	3
PUTCHAR	RMB	3
ENTERMETA	RMB	3
	ORG	$C80
	JMP	DEBLANKTOKEN
	JMP	ERRORTOKEN
	JMP	KEYWORDTOKEN
	#:21
	#.KEYWORDLIST
	#:31
.TA	EQU	*-6
.TC	SET	3
	RPT	29
	#0
.SA	EQU	*-$C0*2
.SC	SET	$C0
	RPT	576
	#0
:31	EQU	*
	+:11-*-1
	FCC	'METAPLUS Version 1.4c Copyright (c) 1979 Software Dynamics'
	+$D
:11	EQU	*
METAPLUS	EQU	.SC
.SC	SET	.SC+1
	METAPLUS
	$2C
	0
.PK	SET	0
.KEYWORDLIST	EQU	.PK
.VC	SET	0
ERROR	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	ERROR*2+.TA
	#.
	ORG	.
*
*	ERROR HANDLER
*	LOOK FOR $(#';' :0-:7F) ';'
*
SUCCESS	EQU	$0D39
FAILURE	EQU	$0C39
LASTTIME	FCB	0	1 --> DON'T ACCEPT TOKEN THIS TIME
ERRORTOKEN	LDAA	LASTTIME	DID WE SEE ';' LAST TIME THRU ?
	BNE	ERRORTOKENDONE	B/ YES
	JSR	GETTOKENCHAR	GO GET ONE
	CMPA	#';	IS IT A SEMICOLON?
	BNE	SAYWEGOTIT	B/ NOPE, EAT IT UP
	INC	LASTTIME	THIS IS IT!
	JSR	REMBLANKS	EAT UP ALL THE BLANKS, TOO
SAYWEGOTIT	SEC
	RTS		SAY THAT WE ARE HAPPY
ERRORTOKENDONE	CLR	LASTTIME	SET UP FOR NEXT ERROR
	CLC
	RTS
ID	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	ID*2+.TA
	#.
	ORG	.
*
*	ID TEST
*	LOOK FOR 'A'-'Z' $('A'-'Z' / '0'-'9')
*
KEYWORDTOKEN	EQU	*
	JSR	GETTOKENCHAR	GET ME AN INPUT CHAR
	BSR	ISLETTER
	BCC	ID3	B/ NO
ID1	JSR	GETTOKENCHAR
	BSR	ISLETTER
	BCS	ID1	B/ YES, KEEP GOING
	BSR	ISDIGIT
	BCS	ID1	B/ YES, KEEP GOING
	CMPA	#'$	TRAILING '$' ?
	BEQ	ID2	B/ YES, ACCEPT IT
	JSR	BACKUP	DON'T COUNT THE LAST CHAR
ID2	SUCCESS		ALL IS WELL
ID3	FAILURE		NOT AN ID
NUM	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	NUM*2+.TA
	#.
	ORG	.
*
*	NUM
*	LOOK FOR '0'-'9' $('0'-'9')
*
	JSR	GETTOKENCHAR	GET ME A CHAR
	BSR	ISDIGIT IS IT A DIGIT?
	BCC	NUM2	B/ NO
NUM1	JSR	GETTOKENCHAR	GET ME ANOTHER CHAR
	BSR	ISDIGIT IS THIS A DIGIT?
	BCS	NUM1	B/ YES, KEEP GOING
	JSR	BACKUP	DON'T COUNT THE LAST CHAR
	SUCCESS		ALL IS WELL
NUM2	FAILURE	
STARQUERY	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	STARQUERY*2+.TA
	#.
	ORG	.
*
*	STARQUERY
*	LOOK FOR '*' '0'-'9' $('0'-'9') '?'
*
	JSR	GETTOKENCHAR
	CMPA	#'*
	BNE	STARQUERY2	B/ NO GOOD
	JSR	GETTOKENCHAR
	BSR	ISDIGIT IS IT A DIGIT?
	BCC	STARQUERY2	B/ NO
STARQUERY1	JSR	GETTOKENCHAR
	BSR	ISDIGIT IS IT A DIGIT?
	BCS	STARQUERY1	B/ YES, KEEP GOING
	CMPA	#'?
	BNE	STARQUERY2	B/NOT A TOKEN
	SUCCESS		ALL IS WELL
STARQUERY2	FAILURE	
*
*	CHARACTER CHECK ROUTINES
*
ISLETTER	CMPA	#'A	IS IT A LETTER?
	BCS	ISLETTER1	B/ NO
	CMPA	#'Z+1
	RTS		C BIT ON IF YES, OFF IF NO
ISLETTER1	CLC		NOT A LETTER
	RTS
*
ISHEXDIGIT	CMPA	#'A	IS IT A HEX DIGIT?
	BCS	ISDIGIT	B/ NO
	CMPA	#'F+1
	BCS	ISDIGIT1	B/ YES
ISDIGIT	CMPA	#'0	IS IT A DIGIT?
	BCS	ISLETTER1	B/ NO
	CMPA	#'9+1
ISDIGIT1	RTS		C BIT ON IF YES, OFF IF NO
HEXNUM	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	HEXNUM*2+.TA
	#.
	ORG	.
*
*	HEXNUM
*	LOOK FOR ('0'-'9' / 'A'-'F') $('0'-'9' / 'A'-'F')
*
	JSR	GETTOKENCHAR
	BSR	ISHEXDIGIT	IS IT A HEX DIGIT?
	BCC	HEXNUM2 B/ NO
HEXNUM1	JSR	GETTOKENCHAR
	BSR	ISHEXDIGIT	IS IT A HEX DIGIT?
	BCS	HEXNUM1	B/ YES, KEEP GOING
	JSR	BACKUP	DON'T COUNT THE LAST CHAR
	SUCCESS		ALL IS WELL
HEXNUM2	FAILURE		TOO BAD
NONBLANK	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	NONBLANK*2+.TA
	#.
	ORG	.
*
*	NONBLANK
*	LOOK FOR ANYTHING WHICH REMBLANK WON'T SWALLOW....

	JSR	GETTOKENCHAR	GET FIRST CHARACTER OF "NONBLANK"
	CMPA	#$20	A BLANK?
	BEQ	NONBLANKFAIL
	CMPA	#$9	TAB?
	BEQ	NONBLANKFAIL
	CMPA	#$D	CR?
	BEQ	NONBLANKFAIL
	CMPA	#$C	FORM?
	BEQ	NONBLANKFAIL
	CMPA	#';	END RULE ?
	BEQ	NONBLANKFAIL
	CMPA	#'/	BEGIN COMMENT ?
	BNE	NONBLANKL	B/ NO, MUST BE WHAT WE WANT!
	JSR	GETTOKENCHAR	LOOKS LIKE BEGIN COMMENT
	CMPA	#'*	...?
	BNE	NONBLANKL	B/ NOT BEGIN COMMENT!
	JSR	BACKUP	IS BEGIN COMMENT, REJECT IT
	JSR	BACKUP
NONBLANKFAIL	FAILURE	
NONBLANKL	JSR	GETTOKENCHAR	GET NEXT CHARACTER OF "NONBLANK"
	CMPA	#$20	A BLANK?
	BEQ	NONBLANKACCEPT
	CMPA	#$9	TAB?
	BEQ	NONBLANKACCEPT
	CMPA	#$D	CR?
	BEQ	NONBLANKACCEPT
	CMPA	#$C	FORM?
	BEQ	NONBLANKACCEPT
	CMPA	#';	END RULE ?
	BEQ	NONBLANKACCEPT
	CMPA	#'/	BEGIN COMMENT ?
	BNE	NONBLANKL	B/ NO, MUST BE WHAT WE WANT!
	JSR	GETTOKENCHAR	LOOKS LIKE BEGIN COMMENT
	CMPA	#'*	...?
	BNE	NONBLANKL	B/ NOT BEGIN COMMENT!
	JSR	BACKUP	IS BEGIN COMMENT, REJECT IT
NONBLANKACCEPT	JSR	BACKUP
	SUCCESS	
STRING	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	STRING*2+.TA
	#.
	ORG	.
*
*	STRING
*	LOOK FOR	"'" $(#"'" ;0-:7F) "'" /
*		'"' $(#'"' :0-:7F) '"'
*
	JSR	GETTOKENCHAR
	CMPA	#''	SINGLE QUOTE?
	BNE	STRING2	B/ NO
STRING1	JSR	GETTOKENCHAR
	CMPA	#''	SINGLE QUOTE?
	BNE	STRING1	B/ NO, KEEP GOING
	SUCCESS	
STRING2	CMPA	#'"	DOUBLE QUOTE?
	BNE	STRING5	B/ NO, IT'S NOT A STRING
STRING3	JSR	GETTOKENCHAR
	CMPA	#'"	DOUBLE QUOTE?
	BNE	STRING3	B/ NO, KEEP GOING
	SUCCESS		ALL IS WELL
STRING5	FAILURE	
DEBLANK	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	DEBLANK*2+.TA
	#.
	ORG	.
DEBLANKTOKEN	CLC
	RTS		WE HAVE EXPLICIT BLANK SURPRESSOR IN METAPLUS
EATBLANKS	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	EATBLANKS*2+.TA
	#.
	ORG	.
*
*	REMOVE BLANKS
*	LOOK FOR $(' ' / :9 / :D / '/' '*' $(#:D :0-:7F) :D / :C)
*
	BSR	REMBLANKS
	FAILURE		IN SPITE OF THE FACE THAT WE ATE A LOT OF STUFF
*
REMBLANKS	JSR	GETTOKENCHAR
	CMPA	#$20	IS IT A BLANK?
	BEQ	REMBLANK3	B/ YES, TRY FOR ANOTHER
	CMPA	#$9	IS IT A TAB?
	BEQ	REMBLANK3	B/ YES, TRY FOR ANOTHER
	CMPA	#$D	IS IT A CR?
	BEQ	REMBLANK3	B/ YES, TRY FOR ANOTHER
	CMPA	#$C	FORM FEED ?
	BEQ	REMBLANK3
	CMPA	#'/	IS IT A COMMENT?
	BNE	REMBLANK1	B/ NO
	JSR	GETTOKENCHAR
	CMPA	#'*
	BEQ	REMBLANK2	B/ YES
	JSR	BACKUP
REMBLANK1	JSR	BACKUP
	RTS
REMBLANK2	JSR	GETTOKENCHAR
	PSHA
	JSR	EATTOKEN
	PULA
	CMPA	#$D	IS IT A CR?
	BNE	REMBLANK2	B/ NO, KEEP GOING
	BRA	REMBLANKS	B/ YES, TRY FOR ANOTHER
REMBLANK3	JSR	EATTOKEN
	BRA	REMBLANKS
NOTENDOFLINECHARACTER	EQU	.TC
.TC	SET	.TC+1
.	SET	*
	ORG	NOTENDOFLINECHARACTER*2+.TA
	#.
	ORG	.
*	RECOGNIZES ANYTHING EXCEPT END OF LINE
	JSR	GETTOKENCHAR
	CMPA	#$D
	BNE	NOTENDOFLINES
	FAILURE	
NOTENDOFLINES	SUCCESS	
BLANKS	EQU	.SC
.SC	SET	.SC+1
.	SET	*
	ORG	BLANKS*2+.SA
	#.
	ORG	.
	+EATBLANKS
	$2A
	$34
	$29
.	SET	*
	ORG	METAPLUS*2+.SA
	#.
	ORG	.
	BLANKS
	((:12-*)&$3FFF)+$8000
	$21
	FCC	'.SYNTA'
	'X+$80
	$2C
	BLANKS
	$2C
	+ID
	$2C
	BLANKS
	$2C
	+STRING
	$2C
	BLANKS
	$2C
	$30
	FCC	'	TABS	20,28,44,4'
	'5+$80
	$2F
	$30
	FCC	'	WITH	WI=107,DE=5'
	'1+$80
	$2F
	$30
	FCC	'*'
	' +$80
	$32,1
	$30
	FCC	' COMPILED BY METAPLUS VERSION 1.4'
	'c+$80
	$2F
	$21
	FCC	'ATTRIBUTE'
	'S+$80
	((:13-*)&$3FFF)+$8000
	BLANKS
	$2C
	$21
	FCC	''
	'=+$80
	$2C
SETLOADADDRESS	EQU	.SC
.SC	SET	.SC+1
	SETLOADADDRESS
	$30
	FCC	''
	'0+$80
	$2F
ATTRIBUTEDEFINITION	EQU	.SC
.SC	SET	.SC+1
	ATTRIBUTEDEFINITION
	$2C
:14	EQU	*
	$21
	FCC	''
	',+$80
	((:15-*)&$3FFF)+$8000
	ATTRIBUTEDEFINITION
	$2C
:15	EQU	*
	((:14-*)&$3FFF)+$4000
	$34
	$21
	FCC	''
	';+$80
	$2C
:13	EQU	*
	((:16-*)&$3FFF)+$4000
	$34
:16	EQU	*
	$2C
	BLANKS
	$2C
	$21
	FCC	'TYPE'
	'S+$80
	((:17-*)&$3FFF)+$8000
	BLANKS
	$2C
	$21
	FCC	''
	'=+$80
	$2C
	SETLOADADDRESS
	$30
	FCC	''
	'1+$80
	$2F
TYPEDEFINITION	EQU	.SC
.SC	SET	.SC+1
	TYPEDEFINITION
	$2C
:18	EQU	*
	$21
	FCC	''
	',+$80
	((:19-*)&$3FFF)+$8000
	TYPEDEFINITION
	$2C
:19	EQU	*
	((:18-*)&$3FFF)+$4000
	$34
	$21
	FCC	''
	';+$80
	$2C
:17	EQU	*
	((:1A-*)&$3FFF)+$4000
	$34
:1A	EQU	*
	$2C
	SETLOADADDRESS
	$30
	FCC	'$104	METAMACHINE ENTRY POINT'
	'S+$80
	$2F
	$30
	FCC	'STARTTOKEN	RMB	'
	'3+$80
	$2F
	$30
	FCC	'GETTOKENCHAR	RMB	'
	'3+$80
	$2F
	$30
	FCC	'BACKUP	RMB	'
	'3+$80
	$2F
	$30
	FCC	'EATTOKEN	RMB	'
	'3+$80
	$2F
	$30
	FCC	'FINDSTAR	RMB	'
	'3+$80
	$2F
	$30
	FCC	'FINDSTARN	RMB	'
	'3+$80
	$2F
	$30
	FCC	'PUTCHAR	RMB	'
	'3+$80
	$2F
	$30
	FCC	'ENTERMETA	RMB	'
	'3+$80
	$2F
	SETLOADADDRESS
	$30
	FCC	'$C8'
	'0+$80
	$2F
	$30
	FCC	'	JMP	DEBLANKTOKE'
	'N+$80
	$2F
	$30
	FCC	'	JMP	ERRORTOKE'
	'N+$80
	$2F
	$30
	FCC	'	JMP	KEYWORDTOKE'
	'N+$80
	$2F
ADDRESS	EQU	.SC
.SC	SET	.SC+1
	ADDRESS
LABEL	EQU	.SC
.SC	SET	.SC+1
	LABEL
	$33,2
	$2F
	ADDRESS
	$30
	FCC	'.KEYWORDLIS'
	'T+$80
	$2F
	ADDRESS
	LABEL
	$33,3
	$2F
	$30
	FCC	'.T'
	'A+$80
EQUHERE	EQU	.SC
.SC	SET	.SC+1
	EQUHERE
	$30
	FCC	'-'
	'6+$80
	$2F
	$30
	FCC	'.TC	SET	'
	'3+$80
	$2F
	$30
	FCC	'	RPT	2'
	'9+$80
	$2F
	ADDRESS
	$30
	FCC	''
	'0+$80
	$2F
	$30
	FCC	'.S'
	'A+$80
	EQUHERE
	$30
	FCC	'-$C0*'
	'2+$80
	$2F
	$30
	FCC	'.SC	SET	$C'
	'0+$80
	$2F
	$30
	FCC	'	RPT	57'
	'6+$80
	$2F
	ADDRESS
	$30
	FCC	''
	'0+$80
	$2F
	LABEL
	$33,3
	EQUHERE
	$2F
BYTE	EQU	.SC
.SC	SET	.SC+1
	BYTE
	LABEL
	$33,1
	$30
	FCC	'-*-'
	'1+$80
	$2F
TEXT	EQU	.SC
.SC	SET	.SC+1
	TEXT
	$32,2
	$2F
	BYTE
	$30
	FCC	'$'
	'D+$80
	$2F
	LABEL
	$33,1
	EQUHERE
	$2F
SREF	EQU	.SC
.SC	SET	.SC+1
	SREF
	$38
	+:1B-*-1
	+1
:1B	EQU	*
	$2C
MBE	EQU	.SC
.SC	SET	.SC+1
	MBE
	$2F
MFIN	EQU	.SC
.SC	SET	.SC+1
	MFIN
	$2F
PREVIOUSKEYWORD	EQU	.SC
.SC	SET	.SC+1
	PREVIOUSKEYWORD
SETEQU	EQU	.SC
.SC	SET	.SC+1
	SETEQU
	$30
	FCC	''
	'0+$80
	$2F
	BLANKS
	$2C
	$21
	FCC	'KEYWORD'
	'S+$80
	((:1C-*)&$3FFF)+$8000
	BLANKS
	$2C
	$21
	FCC	''
	'=+$80
	$2C
	BLANKS
	$2C
:1D	EQU	*
KEYWORDNAME	EQU	.SC
.SC	SET	.SC+1
	KEYWORDNAME
	((:1D-*)&$3FFF)+$4000
	$34
	$21
	FCC	''
	';+$80
	$2C
:1C	EQU	*
	((:1E-*)&$3FFF)+$4000
	$34
:1E	EQU	*
	$2C
	$30
	FCC	'.KEYWORDLIS'
	'T+$80
EQUATE	EQU	.SC
.SC	SET	.SC+1
	EQUATE
	PREVIOUSKEYWORD
	$2F
	BLANKS
	$2C
	$30
	FCC	'.V'
	'C+$80
	SETEQU
	$30
	FCC	''
	'0+$80
	$2F
	$21
	FCC	'STATEVARIABLE'
	'S+$80
	((:1F-*)&$3FFF)+$8000
	BLANKS
	$2C
	$21
	FCC	''
	'=+$80
	$2C
	BLANKS
	$2C
:110	EQU	*
STATEVARDEFINITION	EQU	.SC
.SC	SET	.SC+1
	STATEVARDEFINITION
	((:110-*)&$3FFF)+$4000
	$34
	$21
	FCC	''
	';+$80
	$2C
:1F	EQU	*
	((:111-*)&$3FFF)+$4000
	$34
:111	EQU	*
	$2C
	BLANKS
	$2C
	$35
:112	EQU	*
STMT	EQU	.SC
.SC	SET	.SC+1
	STMT
	((:112-*)&$3FFF)+$4000
	$34
	$21
	FCC	'.EN'
	'D+$80
	$2C
	LABEL
	$33,2
	EQUHERE
	$2F
	$30
	FCC	'	EN'
	'D+$80
	$2F
:12	EQU	*
	$29
.	SET	*
	ORG	ATTRIBUTEDEFINITION*2+.SA
	#.
	ORG	.
	BLANKS
	((:113-*)&$3FFF)+$8000
	+ID
	$2C
	$23,ATTRIBUTE
	$31
RESERVE	EQU	.SC
.SC	SET	.SC+1
	RESERVE
	$30
	FCC	''
	'1+$80
	$2F
	BLANKS
	$2C
:113	EQU	*
	$29
.	SET	*
	ORG	TYPEDEFINITION*2+.SA
	#.
	ORG	.
	BLANKS
	((:114-*)&$3FFF)+$8000
	+ID
	$2C
	$23,TYPENAME
	$31
	RESERVE
	$30
	FCC	''
	'1+$80
	$2F
	BLANKS
	$2C
:114	EQU	*
	$29
.	SET	*
	ORG	KEYWORDNAME*2+.SA
	#.
	ORG	.
	+ID
	((:115-*)&$3FFF)+$8000
	$23,KEYWORD
	BLANKS
	$2C
	$32,1
	EQUHERE
	$2F
	LABEL
	$33,2
	BYTE
	$30
	FCC	''
	'0+$80
	$2F
	BYTE
	$30
	FCC	''
	'0+$80
	$2F
	BYTE
	$30
	FCC	''
	'0+$80
	$2F
	ADDRESS
	PREVIOUSKEYWORD
	$2F
	BYTE
	$30
	FCC	'$80'
	'++$80
	LABEL
	$33,1
	$30
	FCC	'-*-'
	'1+$80
	$2F
	TEXT
	$30
	FCC	''
	'"+$80
	$32,1
	$30
	FCC	''
	'"+$80
	$2F
	LABEL
	$33,1
	EQUHERE
	$2F
	PREVIOUSKEYWORD
	SETEQU
	LABEL
	$33,2
	$2F
:115	EQU	*
	$29
.	SET	*
	ORG	STATEVARDEFINITION*2+.SA
	#.
	ORG	.
	+ID
	((:116-*)&$3FFF)+$8000
	$23,STATEVARIABLE
	BLANKS
	$2C
	$32,1
	EQUATE
	$30
	FCC	'.V'
	'C+$80
	$2F
	$30
	FCC	'.V'
	'C+$80
	SETEQU
	$30
	FCC	'.VC+'
	'1+$80
	$2F
	$30
	FCC	'.V'
	'V+$80
	SETEQU
	$30
	FCC	''
	'0+$80
	$2F
	$21
	FCC	''
	'(+$80
	$2C
	BLANKS
	$2C
:117	EQU	*
STATENAMEDEFINITION	EQU	.SC
.SC	SET	.SC+1
	STATENAMEDEFINITION
	((:117-*)&$3FFF)+$4000
	$34
	$21
	FCC	''
	')+$80
	$2C
	BLANKS
	$2C
:116	EQU	*
	$29
.	SET	*
	ORG	STATENAMEDEFINITION*2+.SA
	#.
	ORG	.
	+ID
	((:118-*)&$3FFF)+$8000
	$23,STATEVALUE
	$32,1
	EQUATE
	$30
	FCC	'.V'
	'V+$80
	$2F
	$30
	FCC	'.V'
	'V+$80
	SETEQU
	$30
	FCC	'.VV+'
	'1+$80
	$2F
	BLANKS
	$2C
:118	EQU	*
	$29
.	SET	*
	ORG	STMT*2+.SA
	#.
	ORG	.
	+ID
	((:119-*)&$3FFF)+$8000
	BLANKS
	$2C
	$21
	FCC	''
	'=+$80
	((:11A-*)&$3FFF)+$8000
	BLANKS
	$2C
SDEF	EQU	.SC
.SC	SET	.SC+1
	SDEF
	$38
	+:11B-*-1
	+1
:11B	EQU	*
	$2C
PHRASE	EQU	.SC
.SC	SET	.SC+1
	PHRASE
	$2C
:11C	EQU	*
	$21
	FCC	''
	'/+$80
	((:11D-*)&$3FFF)+$8000
	BLANKS
	$2C
MRT	EQU	.SC
.SC	SET	.SC+1
	MRT
	$2F
	PHRASE
	$2C
:11D	EQU	*
	((:11C-*)&$3FFF)+$4000
	$34
MR	EQU	.SC
.SC	SET	.SC+1
	MR
	$2F
:11A	EQU	*
	((:11E-*)&$3FFF)+$4000
	$21
	FCC	''
	':+$80
	((:11F-*)&$3FFF)+$8000
TDEF	EQU	.SC
.SC	SET	.SC+1
	TDEF
	$38
	+:120-*-1
	+1
:120	EQU	*
	$2C
	BLANKS
	$2C
ASSEMBLY	EQU	.SC
.SC	SET	.SC+1
	ASSEMBLY
	$2C
:121	EQU	*
	ASSEMBLY
	((:121-*)&$3FFF)+$4000
	$34
:11F	EQU	*
:11E	EQU	*
	$2C
	$21
	FCC	''
	';+$80
	$2C
	BLANKS
	$2C
:119	EQU	*
	$29
.	SET	*
	ORG	ASSEMBLY*2+.SA
	#.
	ORG	.
	$21
	FCC	''
	'!+$80
	((:122-*)&$3FFF)+$8000
:123	EQU	*
ASSEMBLYCHARACTER	EQU	.SC
.SC	SET	.SC+1
	ASSEMBLYCHARACTER
	((:123-*)&$3FFF)+$4000
	$34
	$21
	+$80+$D
	$2C
	$2F
:122	EQU	*
	$29
.	SET	*
	ORG	ASSEMBLYCHARACTER*2+.SA
	#.
	ORG	.
	+NOTENDOFLINECHARACTER
	((:124-*)&$3FFF)+$8000
	$31
:124	EQU	*
	$29
CHOICE	EQU	.SC
.SC	SET	.SC+1
.	SET	*
	ORG	CHOICE*2+.SA
	#.
	ORG	.
	PHRASE
	((:125-*)&$3FFF)+$8000
	$21
	FCC	''
	'/+$80
	((:126-*)&$3FFF)+$8000
	BLANKS
	$2C
BRANCHTRUE	EQU	.SC
.SC	SET	.SC+1
	BRANCHTRUE
	$33,1
BTTAIL	EQU	.SC
.SC	SET	.SC+1
	BTTAIL
	$2F
	PHRASE
	$2C
:127	EQU	*
	$21
	FCC	''
	'/+$80
	((:128-*)&$3FFF)+$8000
	BLANKS
	$2C
	BRANCHTRUE
	$33,1
	BTTAIL
	$2F
	PHRASE
	$2C
:128	EQU	*
	((:127-*)&$3FFF)+$4000
	$34
	LABEL
	$33,1
	EQUHERE
	$2F
:126	EQU	*
	((:129-*)&$3FFF)+$4000
	$34
:129	EQU	*
	$2C
:125	EQU	*
	$29
.	SET	*
	ORG	PHRASE*2+.SA
	#.
	ORG	.
ACTION	EQU	.SC
.SC	SET	.SC+1
	ACTION
	((:12A-*)&$3FFF)+$8000
PHTAIL	EQU	.SC
.SC	SET	.SC+1
	PHTAIL
	$2C
:12A	EQU	*
	((:12B-*)&$3FFF)+$4000
NOTTST	EQU	.SC
.SC	SET	.SC+1
	NOTTST
	((:12C-*)&$3FFF)+$8000
BRANCHFALSE	EQU	.SC
.SC	SET	.SC+1
	BRANCHFALSE
	$33,1
BFTAIL	EQU	.SC
.SC	SET	.SC+1
	BFTAIL
	$2F
:12D	EQU	*
	NOTTST
	((:12E-*)&$3FFF)+$8000
	BRANCHFALSE
	$33,1
	BFTAIL
	$2F
:12E	EQU	*
	((:12D-*)&$3FFF)+$4000
	$34
TEST	EQU	.SC
.SC	SET	.SC+1
	TEST
	((:12F-*)&$3FFF)+$8000
	BRANCHFALSE
	$33,1
	BFTAIL
	$2F
:12F	EQU	*
	((:130-*)&$3FFF)+$4000
	ACTION
:130	EQU	*
	$2C
	PHTAIL
	$2C
	LABEL
	$33,1
	EQUHERE
	$2F
:12C	EQU	*
	((:12B-*)&$3FFF)+$4000
	TEST
	((:131-*)&$3FFF)+$8000
	$21
	FCC	''
	'/+$80
	$22
	((:132-*)&$3FFF)+$8000
	$21
	FCC	''
	')+$80
	$22
	((:132-*)&$3FFF)+$8000
	$21
	FCC	''
	';+$80
	$22
	((:132-*)&$3FFF)+$8000
	BRANCHFALSE
	$33,1
	BFTAIL
	$2F
	PHTAIL
	$2C
	LABEL
	$33,1
	EQUHERE
	$2F
:132	EQU	*
	((:133-*)&$3FFF)+$4000
	$34
:133	EQU	*
	$2C
:131	EQU	*
:12B	EQU	*
	((:134-*)&$3FFF)+$8000
	BLANKS
	$2C
:134	EQU	*
	$29
.	SET	*
	ORG	PHTAIL*2+.SA
	#.
	ORG	.
:135	EQU	*
	ACTION
	((:136-*)&$3FFF)+$4000
	TEST
	((:137-*)&$3FFF)+$8000
	MBE
	$2F
:137	EQU	*
:136	EQU	*
	((:135-*)&$3FFF)+$4000
	$34
	$29
.	SET	*
	ORG	TEST*2+.SA
	#.
	ORG	.
	+ID
	((:138-*)&$3FFF)+$8000
	$27,TOKEN
	((:139-*)&$3FFF)+$8000
TREF	EQU	.SC
.SC	SET	.SC+1
	TREF
	$38
	+:13A-*-1
	+1
:13A	EQU	*
	$2C
:139	EQU	*
	((:13B-*)&$3FFF)+$4000
	$27,STATEVARIABLE
	((:13C-*)&$3FFF)+$8000
	$21
	FCC	''
	'?+$80
	$2C
	+ID
	$2C
	$27,STATEVALUE
	((:13D-*)&$3FFF)+$8000
MQUERYSTATE	EQU	.SC
.SC	SET	.SC+1
	MQUERYSTATE
	$32,1
	$30
	FCC	''
	',+$80
	$32,2
	$2F
:13D	EQU	*
	((:13E-*)&$3FFF)+$4000
	$2D
	FCC	'Need State value name her'
	'e+$80
:13E	EQU	*
	$2C
:13C	EQU	*
	((:13B-*)&$3FFF)+$4000
	$27,KEYWORD
	((:13F-*)&$3FFF)+$8000
MKEYWORDTEST	EQU	.SC
.SC	SET	.SC+1
	MKEYWORDTEST
	$32,1
	$2F
:13F	EQU	*
	((:13B-*)&$3FFF)+$4000
	$34
	SREF
	$38
	+:140-*-1
	+1
:140	EQU	*
	$2C
	$21
	FCC	''
	'[+$80
	((:141-*)&$3FFF)+$8000
	BLANKS
	$2C
ARGS	EQU	.SC
.SC	SET	.SC+1
	ARGS
	$2C
	$21
	FCC	''
	']+$80
	$2C
:141	EQU	*
	((:142-*)&$3FFF)+$4000
	$34
:142	EQU	*
	$2C
:13B	EQU	*
	$2C
:138	EQU	*
	((:143-*)&$3FFF)+$4000
	+STRING
	((:144-*)&$3FFF)+$8000
MTEST	EQU	.SC
.SC	SET	.SC+1
	MTEST
	$2F
OUTSTRING	EQU	.SC
.SC	SET	.SC+1
	OUTSTRING
	$38
	+:145-*-1
	+1
:145	EQU	*
	$2C
:144	EQU	*
	((:143-*)&$3FFF)+$4000
	$21
	FCC	''
	':+$80
	((:146-*)&$3FFF)+$8000
	+HEXNUM
	$2C
	MTEST
	$2F
	BYTE
	$30
	FCC	'$80+'
	'$+$80
	$32,1
	$2F
:146	EQU	*
	((:143-*)&$3FFF)+$4000
	$21
	FCC	''
	'(+$80
	((:147-*)&$3FFF)+$8000
	BLANKS
	$2C
	CHOICE
	$2C
	$21
	FCC	''
	')+$80
	$2C
:147	EQU	*
	((:143-*)&$3FFF)+$4000
	$21
	FCC	''
	'?+$80
	((:148-*)&$3FFF)+$8000
	+ID
	((:149-*)&$3FFF)+$8000
	$27,ATTRIBUTE
	$2C
:149	EQU	*
	((:14A-*)&$3FFF)+$4000
	+NUM
:14A	EQU	*
	$2C
MQUERY	EQU	.SC
.SC	SET	.SC+1
	MQUERY
	$31
	$2F
:148	EQU	*
	((:143-*)&$3FFF)+$4000
	NOTTST
	((:143-*)&$3FFF)+$4000
	$21
	FCC	''
	'*+$80
	((:14B-*)&$3FFF)+$8000
	+NUM
	$2C
	$21
	FCC	''
	'?+$80
	$2C
	$21
	FCC	'UNDEFINE'
	'D+$80
	((:14C-*)&$3FFF)+$8000
MQUERYTYPEN	EQU	.SC
.SC	SET	.SC+1
	MQUERYTYPEN
	$32,1
	$30
	FCC	','
	'0+$80
	$2F
:14C	EQU	*
	((:14D-*)&$3FFF)+$4000
	+ID
	((:14E-*)&$3FFF)+$8000
	$27,ATTRIBUTE
	((:14F-*)&$3FFF)+$8000
MQUERYN	EQU	.SC
.SC	SET	.SC+1
	MQUERYN
	$32,1
	$30
	FCC	''
	',+$80
	$32,2
	$2F
:14F	EQU	*
	((:150-*)&$3FFF)+$4000
	$27,TYPENAME
	((:151-*)&$3FFF)+$8000
	MQUERYTYPEN
	$32,1
	$30
	FCC	''
	',+$80
	$32,2
	$2F
:151	EQU	*
:150	EQU	*
	$2C
:14E	EQU	*
:14D	EQU	*
	$2C
:14B	EQU	*
:143	EQU	*
	((:152-*)&$3FFF)+$8000
	BLANKS
	$2C
:152	EQU	*
	$29
.	SET	*
	ORG	ARGS*2+.SA
	#.
	ORG	.
MPARAMS	EQU	.SC
.SC	SET	.SC+1
	MPARAMS
	$2F
	$21
	FCC	''
	'#+$80
	((:153-*)&$3FFF)+$8000
	BYTE
	LABEL
	$33,1
	$30
	FCC	'-*-1+$8'
	'0+$80
	$2F
:153	EQU	*
	((:154-*)&$3FFF)+$4000
	$34
	BYTE
	LABEL
	$33,1
	$30
	FCC	'-*-'
	'1+$80
	$2F
:154	EQU	*
	$2C
:155	EQU	*
ARG1	EQU	.SC
.SC	SET	.SC+1
	ARG1
	((:155-*)&$3FFF)+$4000
	$34
	LABEL
	$33,1
	EQUHERE
	$2F
	$29
.	SET	*
	ORG	ARG1*2+.SA
	#.
	ORG	.
	$21
	FCC	''
	'*+$80
	((:156-*)&$3FFF)+$8000
	+NUM
	((:157-*)&$3FFF)+$8000
	BYTE
	$31
	$2F
:157	EQU	*
	((:158-*)&$3FFF)+$4000
	$34
	BYTE
	$30
	FCC	''
	'1+$80
	$2F
:158	EQU	*
	$2C
	BLANKS
	$2C
:156	EQU	*
	$29
.	SET	*
	ORG	OUTSTRING*2+.SA
	#.
	ORG	.
	$34
	TEXT
	$39
	LDAB	#1	GO FIND THE FIRST STRIN
	JSR	FINDSTARN	RETURNS (X) POINTING TO STRING, (B) = STRING LENGTH
	SUBB	#2	OUTPUT N-1 BYTES
STRINGOUT1	LDAA	0,X	GET A CHARACTER
	JSR	PUTCHAR	AND PUT IT OUT
	INX
	DECB		ARE WE ALMOST DONE ?
	BNE	STRINGOUT1	B/ NO, MORE TO DO
	LDAA	1,X	GET THE CLOSING QUOTE
	JSR	PUTCHAR
	LDAA	#$D
	JSR	PUTCHAR	END THE LINE
	LDAA	#$9
	JSR	PUTCHAR
	LDAA	#''
	JSR	PUTCHAR
	LDAA	0,X	GRAB THE LAST CHARACTER
	JSR	PUTCHAR	AND PUT IT OUT
	JSR	ENTERMETA
	$30
	FCC	'+$8'
	'0+$80
	$2F
	$29
.	SET	*
	ORG	NOTTST*2+.SA
	#.
	ORG	.
	$21
	FCC	''
	'-+$80
	((:159-*)&$3FFF)+$8000
	+STRING
	((:15A-*)&$3FFF)+$8000
	MTEST
	$2F
	OUTSTRING
	$38
	+:15B-*-1
	+1
:15B	EQU	*
	$2C
MNOTTEST	EQU	.SC
.SC	SET	.SC+1
	MNOTTEST
	$2F
:15A	EQU	*
	((:15C-*)&$3FFF)+$4000
	$21
	FCC	''
	':+$80
	((:15D-*)&$3FFF)+$8000
	+HEXNUM
	$2C
	MTEST
	$2F
	BYTE
	$30
	FCC	'$80+'
	'$+$80
	$31
	$2F
	MNOTTEST
	$2F
:15D	EQU	*
	((:15C-*)&$3FFF)+$4000
	+ID
	((:15E-*)&$3FFF)+$8000
	$27,TOKEN
	((:15F-*)&$3FFF)+$8000
	TREF
	$38
	+:160-*-1
	+1
:160	EQU	*
	$2C
	MNOTTEST
	$2F
:15F	EQU	*
	((:161-*)&$3FFF)+$4000
	$27,KEYWORD
	((:162-*)&$3FFF)+$8000
	MKEYWORDTEST
	$32,1
	$2F
	MNOTTEST
	$2F
:162	EQU	*
	((:161-*)&$3FFF)+$4000
	$27,ATTRIBUTE
	((:163-*)&$3FFF)+$8000
MUNTAG	EQU	.SC
.SC	SET	.SC+1
	MUNTAG
	$31
	$2F
:163	EQU	*
:161	EQU	*
	$2C
:15E	EQU	*
:15C	EQU	*
	$2C
:159	EQU	*
	((:164-*)&$3FFF)+$8000
	BLANKS
	$2C
:164	EQU	*
	$29
.	SET	*
	ORG	ACTION*2+.SA
	#.
	ORG	.
	$21
	FCC	'.OU'
	'T+$80
	((:165-*)&$3FFF)+$8000
	BLANKS
	$2C
	$21
	FCC	''
	'(+$80
	$2C
	BLANKS
	$2C
:166	EQU	*
OUTOBJ	EQU	.SC
.SC	SET	.SC+1
	OUTOBJ
	((:166-*)&$3FFF)+$4000
	$34
	$21
	FCC	''
	';+$80
	((:167-*)&$3FFF)+$8000
	BLANKS
	$2C
:167	EQU	*
	((:168-*)&$3FFF)+$4000
	$34
MCR	EQU	.SC
.SC	SET	.SC+1
	MCR
	$2F
:168	EQU	*
	$2C
	$21
	FCC	''
	')+$80
	$2C
:165	EQU	*
	((:169-*)&$3FFF)+$4000
	$21
	FCC	'.AS'
	'M+$80
	((:16A-*)&$3FFF)+$8000
	BLANKS
	$2C
	$21
	FCC	''
	'(+$80
	$2C
	BLANKS
	$2C
MASM	EQU	.SC
.SC	SET	.SC+1
	MASM
	$2F
	ASSEMBLY
	$2C
:16B	EQU	*
	ASSEMBLY
	((:16B-*)&$3FFF)+$4000
	$34
	$21
	FCC	''
	')+$80
	$2C
	$30
	FCC	'	JSR	ENTERMET'
	'A+$80
	$2F
:16A	EQU	*
	((:169-*)&$3FFF)+$4000
	$21
	FCC	'.EMPT'
	'Y+$80
	((:16C-*)&$3FFF)+$8000
MSET	EQU	.SC
.SC	SET	.SC+1
	MSET
	$2F
:16C	EQU	*
	((:169-*)&$3FFF)+$4000
	$21
	FCC	'$'
	'$+$80
	((:16D-*)&$3FFF)+$8000
MDRULE	EQU	.SC
.SC	SET	.SC+1
	MDRULE
	$2F
DOLLARLOOP	EQU	.SC
.SC	SET	.SC+1
	DOLLARLOOP
	$2C
:16D	EQU	*
	((:169-*)&$3FFF)+$4000
	$21
	FCC	''
	'$+$80
	((:16E-*)&$3FFF)+$8000
	DOLLARLOOP
	$2C
:16E	EQU	*
	((:169-*)&$3FFF)+$4000
	$21
	FCC	''
	'++$80
	((:16F-*)&$3FFF)+$8000
	+ID
	((:170-*)&$3FFF)+$8000
	$27,ATTRIBUTE
	$2C
:170	EQU	*
	((:171-*)&$3FFF)+$4000
	+NUM
:171	EQU	*
	$2C
MTAG	EQU	.SC
.SC	SET	.SC+1
	MTAG
	$31
	$2F
:16F	EQU	*
	((:169-*)&$3FFF)+$4000
	$21
	FCC	'?'
	'?+$80
	((:172-*)&$3FFF)+$8000
	+STRING
	$2C
MERR	EQU	.SC
.SC	SET	.SC+1
	MERR
	$2F
	OUTSTRING
	$38
	+:173-*-1
	+1
:173	EQU	*
	$2C
:172	EQU	*
	((:169-*)&$3FFF)+$4000
	$21
	FCC	'.SE'
	'T+$80
	((:174-*)&$3FFF)+$8000
	BLANKS
	$2C
	+ID
	$2C
	$27,STATEVARIABLE
	((:175-*)&$3FFF)+$8000
	$21
	FCC	''
	'=+$80
	$2C
	+ID
	$2C
	$27,STATEVALUE
	((:176-*)&$3FFF)+$8000
MSETSTATE	EQU	.SC
.SC	SET	.SC+1
	MSETSTATE
	$32,1
	$30
	FCC	''
	',+$80
	$32,2
	$2F
:176	EQU	*
	((:177-*)&$3FFF)+$4000
	$2D
	FCC	'Need State value name her'
	'e+$80
:177	EQU	*
	$2C
:175	EQU	*
	((:178-*)&$3FFF)+$4000
	$2D
	FCC	'Need State variable name her'
	'e+$80
:178	EQU	*
	$2C
:174	EQU	*
	((:169-*)&$3FFF)+$4000
	+STARQUERY
	$22
	((:179-*)&$3FFF)+$8000
	$21
	FCC	''
	'*+$80
	((:179-*)&$3FFF)+$8000
	+NUM
	$2C
	$21
	FCC	''
	'++$80
	((:17A-*)&$3FFF)+$8000
	+ID
	$2C
	$27,ATTRIBUTE
	$2C
MTAGN	EQU	.SC
.SC	SET	.SC+1
	MTAGN
	$32,1
	$30
	FCC	''
	',+$80
	$32,2
	$2F
:17A	EQU	*
	((:17B-*)&$3FFF)+$4000
	$21
	FCC	''
	'=+$80
	((:17C-*)&$3FFF)+$8000
	$21
	FCC	'UNDEFINE'
	'D+$80
	((:17D-*)&$3FFF)+$8000
MSETTYPEN	EQU	.SC
.SC	SET	.SC+1
	MSETTYPEN
	$32,1
	$30
	FCC	','
	'0+$80
	$2F
:17D	EQU	*
	((:17E-*)&$3FFF)+$4000
	+ID
	((:17F-*)&$3FFF)+$8000
	$27,TYPENAME
	$2C
	MSETTYPEN
	$32,1
	$30
	FCC	''
	',+$80
	$32,2
	$2F
:17F	EQU	*
:17E	EQU	*
	$2C
:17C	EQU	*
	((:17B-*)&$3FFF)+$4000
	$21
	FCC	''
	'-+$80
	((:180-*)&$3FFF)+$8000
	+ID
	$2C
	$27,ATTRIBUTE
	$2C
MUNTAGN	EQU	.SC
.SC	SET	.SC+1
	MUNTAGN
	$32,1
	$30
	FCC	''
	',+$80
	$32,2
	$2F
:180	EQU	*
	((:17B-*)&$3FFF)+$4000
	$21
	FCC	''
	'^+$80
	((:181-*)&$3FFF)+$8000
MOVESTRINGUP	EQU	.SC
.SC	SET	.SC+1
	MOVESTRINGUP
	$31
	$2F
:181	EQU	*
:17B	EQU	*
	$2C
:179	EQU	*
	((:169-*)&$3FFF)+$4000
	$21
	FCC	'.INCLUD'
	'E+$80
	((:182-*)&$3FFF)+$8000
MINCLUDE	EQU	.SC
.SC	SET	.SC+1
	MINCLUDE
	$2F
:182	EQU	*
:169	EQU	*
	((:183-*)&$3FFF)+$8000
	BLANKS
	$2C
:183	EQU	*
	$29
.	SET	*
	ORG	DOLLARLOOP*2+.SA
	#.
	ORG	.
	LABEL
	$33,1
	EQUHERE
	$2F
	BLANKS
	$2C
	TEST
	$2C
	BRANCHTRUE
	$33,1
	BTTAIL
	$2F
	MSET
	$2F
	$29
.	SET	*
	ORG	OUTOBJ*2+.SA
	#.
	ORG	.
	+STRING
	((:184-*)&$3FFF)+$8000
MCL	EQU	.SC
.SC	SET	.SC+1
	MCL
	$2F
	OUTSTRING
	$38
	+:185-*-1
	+1
:185	EQU	*
	$2C
:184	EQU	*
	((:186-*)&$3FFF)+$4000
	+ID
	((:187-*)&$3FFF)+$8000
	$27,TOKEN
	((:188-*)&$3FFF)+$8000
TKNNOTLEGAL	EQU	.SC
.SC	SET	.SC+1
	TKNNOTLEGAL
	$2C
:188	EQU	*
	((:189-*)&$3FFF)+$4000
	$34
	SREF
	$38
	+:18A-*-1
	+1
:18A	EQU	*
	$2C
	$21
	FCC	''
	'[+$80
	((:18B-*)&$3FFF)+$8000
	BLANKS
	$2C
	ARGS
	$2C
	$21
	FCC	''
	']+$80
	$2C
:18B	EQU	*
	((:18C-*)&$3FFF)+$4000
	$34
:18C	EQU	*
	$2C
:189	EQU	*
	$2C
:187	EQU	*
	((:186-*)&$3FFF)+$4000
	$21
	FCC	''
	'#+$80
	((:18D-*)&$3FFF)+$8000
	+NUM
	$2C
MGENL	EQU	.SC
.SC	SET	.SC+1
	MGENL
	$31
	$2F
:18D	EQU	*
	((:186-*)&$3FFF)+$4000
	$21
	FCC	''
	'*+$80
	((:18E-*)&$3FFF)+$8000
	+NUM
	((:18F-*)&$3FFF)+$8000
MOUTN	EQU	.SC
.SC	SET	.SC+1
	MOUTN
	$31
	$2F
:18F	EQU	*
	((:190-*)&$3FFF)+$4000
	$34
MOUT	EQU	.SC
.SC	SET	.SC+1
	MOUT
	$2F
:190	EQU	*
	$2C
:18E	EQU	*
	((:186-*)&$3FFF)+$4000
	$21
	FCC	''
	',+$80
	((:191-*)&$3FFF)+$8000
MTAB	EQU	.SC
.SC	SET	.SC+1
	MTAB
	$2F
:191	EQU	*
	((:186-*)&$3FFF)+$4000
	$21
	FCC	''
	'/+$80
	((:192-*)&$3FFF)+$8000
	MCR
	$2F
:192	EQU	*
:186	EQU	*
	((:193-*)&$3FFF)+$8000
	BLANKS
	$2C
:193	EQU	*
	$29
.	SET	*
	ORG	TKNNOTLEGAL*2+.SA
	#.
	ORG	.
	$2D
	FCC	'You cannot look for a token in the middle of a .OU'
	'T+$80
	$29
.	SET	*
	ORG	SDEF*2+.SA
	#.
	ORG	.
	$28,1,TOKEN
	((:194-*)&$3FFF)+$8000
ERRISTOKENALREADY	EQU	.SC
.SC	SET	.SC+1
	ERRISTOKENALREADY
	$2C
:194	EQU	*
	((:195-*)&$3FFF)+$4000
	$34
	$24,1,SUBR
:195	EQU	*
	((:196-*)&$3FFF)+$8000
	$28,1,DEFINED
	((:197-*)&$3FFF)+$8000
ERRISALREADYDEFD	EQU	.SC
.SC	SET	.SC+1
	ERRISALREADYDEFD
	$2C
:197	EQU	*
	((:198-*)&$3FFF)+$4000
	$34
	$24,1,DEFINED
:198	EQU	*
	$2C
	$28,1,REFERENCED
	((:199-*)&$3FFF)+$4000
	$34
	$32,1
ASSIGNSUBRNUMBER	EQU	.SC
.SC	SET	.SC+1
	ASSIGNSUBRNUMBER
	$2F
:199	EQU	*
	$2C
	$30
	FCC	''
	'.+$80
	SETEQU
	$30
	FCC	''
	'*+$80
	$2F
	SETLOADADDRESS
	$32,1
	$30
	FCC	'*2+.S'
	'A+$80
	$2F
	ADDRESS
	$30
	FCC	''
	'.+$80
	$2F
	SETLOADADDRESS
	$30
	FCC	''
	'.+$80
	$2F
:196	EQU	*
	$29
.	SET	*
	ORG	ASSIGNSUBRNUMBER*2+.SA
	#.
	ORG	.
	EQUATE
	$30
	FCC	'.S'
	'C+$80
	$2F
	$30
	FCC	'.S'
	'C+$80
	SETEQU
	$30
	FCC	'.SC+'
	'1+$80
	$29
.	SET	*
	ORG	ERRISTOKENALREADY*2+.SA
	#.
	ORG	.
	$2D
	FCC	'Already defined as a toke'
	'n+$80
	$29
.	SET	*
	ORG	ERRISALREADYDEFD*2+.SA
	#.
	ORG	.
	$2D
	FCC	'Subroutine already define'
	'd+$80
	$29
.	SET	*
	ORG	SREF*2+.SA
	#.
	ORG	.
	$28,1,TOKEN
	((:19A-*)&$3FFF)+$8000
	ERRISTOKENALREADY
	$2C
:19A	EQU	*
	((:19B-*)&$3FFF)+$4000
	$34
	$24,1,SUBR
:19B	EQU	*
	((:19C-*)&$3FFF)+$8000
	$28,1,REFERENCED
	((:19D-*)&$3FFF)+$4000
	$28,1,DEFINED
	((:19E-*)&$3FFF)+$4000
	$34
	$32,1
	ASSIGNSUBRNUMBER
	$2F
:19E	EQU	*
:19D	EQU	*
	$2C
	$24,1,REFERENCED
	$2E
	$32,1
	$2F
:19C	EQU	*
	$29
.	SET	*
	ORG	TDEF*2+.SA
	#.
	ORG	.
	$28,1,SUBR
	((:19F-*)&$3FFF)+$8000
ERRALREADYISSUBR	EQU	.SC
.SC	SET	.SC+1
	ERRALREADYISSUBR
	$2C
:19F	EQU	*
	((:1A0-*)&$3FFF)+$4000
	$34
	$24,1,TOKEN
:1A0	EQU	*
	((:1A1-*)&$3FFF)+$8000
	$28,1,DEFINED
	((:1A2-*)&$3FFF)+$8000
ERRTOKENALREADYDEFD	EQU	.SC
.SC	SET	.SC+1
	ERRTOKENALREADYDEFD
	$2C
:1A2	EQU	*
	((:1A3-*)&$3FFF)+$4000
	$34
	$24,1,DEFINED
:1A3	EQU	*
	$2C
	$28,1,REFERENCED
	((:1A4-*)&$3FFF)+$4000
	$34
	$32,1
ASSIGNTOKENNUMBER	EQU	.SC
.SC	SET	.SC+1
	ASSIGNTOKENNUMBER
	$2F
:1A4	EQU	*
	$2C
	$30
	FCC	''
	'.+$80
	SETEQU
	$30
	FCC	''
	'*+$80
	$2F
	SETLOADADDRESS
	$32,1
	$30
	FCC	'*2+.T'
	'A+$80
	$2F
	ADDRESS
	$30
	FCC	''
	'.+$80
	$2F
	SETLOADADDRESS
	$30
	FCC	''
	'.+$80
	$2F
:1A1	EQU	*
	$29
.	SET	*
	ORG	ASSIGNTOKENNUMBER*2+.SA
	#.
	ORG	.
	EQUATE
	$30
	FCC	'.T'
	'C+$80
	$2F
	$30
	FCC	'.T'
	'C+$80
	SETEQU
	$30
	FCC	'.TC+'
	'1+$80
	$29
.	SET	*
	ORG	ERRALREADYISSUBR*2+.SA
	#.
	ORG	.
	$2D
	FCC	'Already defined as a subroutin'
	'e+$80
	$29
.	SET	*
	ORG	ERRTOKENALREADYDEFD*2+.SA
	#.
	ORG	.
	$2D
	FCC	'Token is already define'
	'd+$80
	$29
.	SET	*
	ORG	TREF*2+.SA
	#.
	ORG	.
	$28,1,SUBR
	((:1A5-*)&$3FFF)+$8000
	ERRALREADYISSUBR
	$2C
:1A5	EQU	*
	((:1A6-*)&$3FFF)+$4000
	$34
	$24,1,TOKEN
:1A6	EQU	*
	((:1A7-*)&$3FFF)+$8000
	$28,1,REFERENCED
	((:1A8-*)&$3FFF)+$4000
	$28,1,DEFINED
	((:1A9-*)&$3FFF)+$4000
	$34
	$32,1
	ASSIGNTOKENNUMBER
	$2F
:1A9	EQU	*
:1A8	EQU	*
	$2C
	$24,1,REFERENCED
	BYTE
	$32,1
	$2F
:1A7	EQU	*
	$29
.	SET	*
	ORG	EQUHERE*2+.SA
	#.
	ORG	.
	EQUATE
	$30
	FCC	''
	'*+$80
	$29
.	SET	*
	ORG	EQUATE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	EQU'
	'	+$80
	$29
.	SET	*
	ORG	SETEQU*2+.SA
	#.
	ORG	.
	$30
	FCC	'	SET'
	'	+$80
	$29
.	SET	*
	ORG	SETLOADADDRESS*2+.SA
	#.
	ORG	.
	$30
	FCC	'	ORG'
	'	+$80
	$29
.	SET	*
	ORG	BYTE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	'
	'++$80
	$29
.	SET	*
	ORG	ADDRESS*2+.SA
	#.
	ORG	.
	$30
	FCC	'	'
	'#+$80
	$29
.	SET	*
	ORG	TEXT*2+.SA
	#.
	ORG	.
	$30
	FCC	'	FCC'
	'	+$80
	$29
.	SET	*
	ORG	LABEL*2+.SA
	#.
	ORG	.
	$30
	FCC	''
	':+$80
	$29
.	SET	*
	ORG	RESERVE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	RMB'
	'	+$80
	$29
.	SET	*
	ORG	PREVIOUSKEYWORD*2+.SA
	#.
	ORG	.
	$30
	FCC	'.P'
	'K+$80
	$29
.	SET	*
	ORG	BRANCHTRUE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	(('
	':+$80
	$29
.	SET	*
	ORG	BTTAIL*2+.SA
	#.
	ORG	.
	$30
	FCC	'-*)&$3FFF)+$400'
	'0+$80
	$29
.	SET	*
	ORG	BRANCHFALSE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	(('
	':+$80
	$29
.	SET	*
	ORG	BFTAIL*2+.SA
	#.
	ORG	.
	$30
	FCC	'-*)&$3FFF)+$800'
	'0+$80
	$29
.	SET	*
	ORG	MFIN*2+.SA
	#.
	ORG	.
	$30
	FCC	'	'
	'0+$80
	$29
.	SET	*
	ORG	MTEST*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'1+$80
	$29
.	SET	*
	ORG	MNOTTEST*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'2+$80
	$29
.	SET	*
	ORG	MTAG*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$23'
	',+$80
	$29
.	SET	*
	ORG	MTAGN*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$24'
	',+$80
	$29
.	SET	*
	ORG	MUNTAG*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$25'
	',+$80
	$29
.	SET	*
	ORG	MUNTAGN*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$26'
	',+$80
	$29
.	SET	*
	ORG	MQUERY*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$27'
	',+$80
	$29
.	SET	*
	ORG	MQUERYN*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$28'
	',+$80
	$29
.	SET	*
	ORG	MR*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'9+$80
	$29
.	SET	*
	ORG	MRT*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'A+$80
	$29
MRF	EQU	.SC
.SC	SET	.SC+1
.	SET	*
	ORG	MRF*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'B+$80
	$29
.	SET	*
	ORG	MBE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'C+$80
	$29
.	SET	*
	ORG	MERR*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'D+$80
	$29
.	SET	*
	ORG	MTAB*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'E+$80
	$29
.	SET	*
	ORG	MCR*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$2'
	'F+$80
	$29
.	SET	*
	ORG	MCL*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3'
	'0+$80
	$29
.	SET	*
	ORG	MOUT*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3'
	'1+$80
	$29
.	SET	*
	ORG	MOUTN*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$32'
	',+$80
	$29
.	SET	*
	ORG	MGENL*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$33'
	',+$80
	$29
.	SET	*
	ORG	MSET*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3'
	'4+$80
	$29
.	SET	*
	ORG	MDRULE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3'
	'5+$80
	$29
.	SET	*
	ORG	MINCLUDE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3'
	'6+$80
	$29
.	SET	*
	ORG	MOVESTRINGUP*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$37'
	',+$80
	$29
.	SET	*
	ORG	MPARAMS*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3'
	'8+$80
	$29
.	SET	*
	ORG	MASM*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3'
	'9+$80
	$29
.	SET	*
	ORG	MSETSTATE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3A'
	',+$80
	$29
.	SET	*
	ORG	MQUERYSTATE*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3B'
	',+$80
	$29
.	SET	*
	ORG	MSETTYPEN*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3C'
	',+$80
	$29
.	SET	*
	ORG	MQUERYTYPEN*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3D'
	',+$80
	$29
.	SET	*
	ORG	MKEYWORDTEST*2+.SA
	#.
	ORG	.
	$30
	FCC	'	$3E,'
	'#+$80
	$29
:21	EQU	*
	END
