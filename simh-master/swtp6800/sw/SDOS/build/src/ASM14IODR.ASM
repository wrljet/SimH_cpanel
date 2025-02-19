*	Edit history:
*
*	23-Aug-83	WAM	Edited in minor corrections for 1.4:
*				Added ignore of ACTIVATIONNOTINBUFFER &
*				Changed include of sdos definitions.
*
*
	PCC	1
	INCLUDE	SDOSUSERDEFS.ASM	THIS IS DEF'NING
	PSR	1
	TABS 10,19,37,44
	WITH	WI=105,DE=51
	PCC	0
	NAME	ASMIODRIVER
	IFUND	SDOSBINARY
SDOSBINARY EQU	1
	FIN
DEBUG	EQU	1	SET DEBUG MODE FLAG
	TITLE	- - - I/O Package for MAL/6800-6809   1.4 - - -
	PAGE	;
*
*	BY RICK GROS, SOFTWARE DYNAMICS
*	AND A CAST OF THOUSANDS!
*
EDITDATE	EQU	$1212	/79 MMDD IN HEX FORMAT
*
	PAGE
*
*	USEFUL ASCII CHARS
*
NULL	EQU	0
CONTROLB	EQU	2
CONTROLC	EQU	3
CONTROLD	EQU	4	DEBUG REQUEST
CONTROLG	EQU	7
BELL	EQU	CONTROLG
CONTROLH	EQU	8	BACKSPACE
TAB	EQU	9
LF	EQU	$A
CR	EQU	$D
CONTROLP	EQU	$10	PAGING FOR THE TTY
XON	EQU	$11	^Q
CONTROLR	EQU	$12
XOFF	EQU	$13	^S
CONTROLT	EQU	$14
CONTROLV	EQU	$16
CONTROLX	EQU	$18	DELETE LINE
CONTROLZ	EQU	$1A	TTY EOF CODE
ESCAPE	EQU	$1B	ABORT OPERATION
EOF	EQU	$1C	END OF FILE
EOR	EQU	$1E	END OF RECORD
BLANK	EQU	$20
UPARROW	EQU	'^
RUBOUT	EQU	$7F	DELETE CHAR
SINGLESTEP	EQU	CONTROLV
	PAGE
*
*     EXTRA SYMBOL DEFINITIONS FOR BUFFERING THE ASSEMBLER'S WRITES.
*

	ORG	0	; START AT THE BEGINNING....
CCB:BBP	RMB	2	;W/ BUFFER BASE ADDRESS (LESS ONE).
CCB:MBL	RMB	1	;B/ MAX BUFFER LENGTH.
CCB:CBP	RMB	2	;W/ CURRENT BUFFER POINTER.
CCB:CBL	RMB	1	;B/ CURRENT BUFFER LENGTH.

CCB.LENGTH	EQU	*	;LENGTH OF A CCB.

CH2$BUF.LEN	EQU	128	;LENGTH OF LISTING CHANNEL'S BUFFER.
	IF SDOSBINARY=0
CH3$BUF.LEN	EQU	64	;LENGTH OF BINARY CHANNEL'S BUFFER.
	FIN
READA$BUF.LEN	EQU	120
NIOCHANNELS	EQU	4	;# OF I/O CHANNELS.

CLOCK$CHANNEL	EQU	7	;#/ FOR READING CLOCK.
ASME.NOTFILE	EQU	105	ERROR WHEN GETSIZE CHANNEL NOT A FILE.
	PAGE
*
*
*	SDOS-TO-IOPACKAGE COMMUNICATION REGION
*

*
	ORG	0
*TEMPX	EQU	*
POINTER1	RMB	2
BUFFERPOINTER	EQU	*
POINTER2	RMB	2
COUNT	RMB	2
	PAGE	I/O JUMP TABLE
	ORG	$100
IOERR	EQU	$103	I/O ERROR ROUTINE IN ASM SECTION
	ORG	$106
	RMB	2	USED TO BE DRIVERBASE.
	JMP	OPEN
	JMP	CLOSE
	JMP	CREATE
	JMP	GETPOS	COPY CURRENT POSITION OF CH (B) TO (X). (WAS DELETE).
	JMP	GETWD	A := WIDTH; B:= DEPTH OF CHANNEL (B).
	JMP	ISCONSOLE	TEST FOR CONSOLE - CARRY=0 IF CONSOLE
	JMP	READA
	JMP	NOPRTS	READB
	JMP	WRITEA
	JMP	WRITEB
	JMP	POSITION
	JMP	EXIT
	JMP	EOF$
	JMP	GETSIZE
	JMP	RESET
	JMP	DATE
	JMP	TIME
	FDB	STACK
	FDB	STACKM:	STACK MAX
	JMP	ERROR::	DISPLAY ERROR MESSAGE & RETURN.
	JMP	CRAPOUT	ERROR EXIT WITH ERROR # IN X
	PAGE	STACKS & STUFF
*
*	BASE OF I/O PACKAGE
*
*	ORG	DRIVERBASE
	IFUND	DEBUG
SYSCALLIO	EQU	SYSCALL$
	ELSE
SYSCALLIO	EQU	DEBUGSYSCALL
	FIN
*
*	THIS IS THE MACHINE'S STACK
*
	RPT	25
	FCB	0	SLOP FOR DEBUGGER AND INTERRUPTS
STACKM:	RPT	$B4
	FCB	0
STACK	FCB	0	FOR PEOPLE WHO USE 'LDS STACK'
	PAGE	OLD I/O PACKAGE CALL SIMULATION

*
*   USEFUL DATA TEMP CELLS
*

CH2$BUF	RMB	CH2$BUF.LEN
	IF	SDOSBINARY=0
CH3$BUF	RMB	CH3$BUF.LEN
	FIN
READA$BUF	RMB	READA$BUF.LEN
DATE$BUF	RMB	17	PUT DATE HERE.

CH2$CCB	#CH2$BUF-1	BASE BUFFER POINTER,
	+CH2$BUF.LEN	  MAX LENGTH OF BUFFER.
	#CH2$BUF-1	CURRENT BUFFER POINTER,
	+0		  LENGTH=EMPTY.

	IF	SDOSBINARY=0
CH3$CCB	#CH3$BUF-1	BASE BUFFER POINTER,
	+CH3$BUF.LEN	  MAX LENGTH.
	#CH3$BUF-1	CURRENT BUFFER POINTER,
	+0		  LENGTH=EMPTY.
	FIN

OPENBLOCK	FCB	SYSCALL:OPEN	FUNCTION
	FCB	OPEN:SCLEN
	FCB	CHANGED,IGNORED
	FDB	CHANGED	WRBUF
	FCB	0,CHANGED	WRLEN
	FDB	CHANGED	REPLY LENGTH
	FDB	BUFFER
	FDB	2
*
OPENCLK	+SYSCALL:OPEN,+OPEN:SCLEN	FUNCTION
	+CLOCK$CHANNEL,+IGNORED	CHANNEL #, <TRASH>
	#CLOCKNAME	"CLOCK:"
	#6		LENGTH OF ABOVE.
	#CHANGED		(REPLY LENGTH)
	#BUFFER		(GETS CHARACTERS SCANNED)
	#2		(MAX SIZE.)
*
READCLK	+SYSCALL:READA,+READA:SCLEN	FUNCTION
	+CLOCK$CHANNEL,+0	CHANNEL #, NOT LINE MODE.
	#IGNORED,#0	WRITE BUF, SIZE.
	#CHANGED		ACTUAL COUNT.
	#DATE$BUF	BUFFER
	#17		BUFFER SIZE.
*
CLOSECLK	+SYSCALL:CLOSE,+CLOSE:SCLEN,+CLOCK$CHANNEL	FUNCTION, SIZE, CHANNEL.
*
CREATEBLOCK	FCB	SYSCALL:CREATE	FUNCTION
	FCB	CREATE:SCLEN
	FCB	CHANGED,IGNORED
	FDB	CHANGED	WRBUF
	FCB	0,CHANGED
	FDB	CHANGED	REPLY LENGTH
	FDB	BUFFER
	FDB	2
*
CLOSEBLOCK	FCB	SYSCALL:CLOSE	FUNCTION
	FCB	CLOSE:SCLEN
	FCB	CHANGED	CHANNEL
*
	IF	0
DELETEBLOCK	FCB	SYSCALL:DELETE	FUNCTION
	FCB	DELETE:SCLEN
	FCB	IGNORED,IGNORED
	FDB	CHANGED
	FCB	0,CHANGED
	FDB	CHANGED
	FDB	BUFFER
	FDB	2
	FIN
*
	IF	0
RENAMEBLOCK	FCB	SYSCALL:RENAME	FUNCTION
	FCB	RENAME:SCLEN
	FCB	CHANGED,IGNORED	CHANNEL #
	FDB	CHANGED	WRBUF
	FCB	0,CHANGED	WRLEN
	FDB	CHANGED	RPLEN
	FDB	BUFFER
	FDB	2
	FIN	0

*
	IF	0
CHAINBLOCK	FCB	SYSCALL:CHAIN	FUNCTION
	FCB	CHAIN:SCLEN
	FCB	IGNORED,IGNORED
	FDB	CHANGED	WRBUF
	FCB	0,CHANGED	WRLEN
	FDB	CHANGED	RPLEN
	FDB	BUFFER
	FDB	4
	FIN	0
*
READABLOCK	FCB	SYSCALL:READA	FUNCTION
	FCB	READA:SCLEN
	FCB	CHANGED	CHANNEL #
	FCB	1	LINE MODE FLAG
	FDB	IGNORED	WRBUF
	FDB	0	WRLEN (0 MINIMIZES SYSCALL XFER TIME)
	FDB	CHANGED	ACTUALCOUNT (SHOULD BE 1 AFTER READING)
	FDB	BUFFER	BUFFERPOINTER
	FDB	1	REQUESTED COUNT
*
READA$BLOCK	+SYSCALL:READA	FUNCTION.
	+READA:SCLEN
	+1,+1		CHANNEL, LINE MODE
	#IGNORED		WRITE BUFFER,
	#0		  LENGTH = 0 FOR SPEED,
	#0		REPLY LENGTH:  M/B INITIALLY ZERO.
	#READA$BUF	READ BUFFER
	#READA$BUF.LEN	  & LENGTH.

WRITEA$BLK	+SYSCALL:WRITEA
	+WRITEA:SCLEN
	+CHANGED		CHANNEL
	+IGNORED		TRASH.
	#CHANGED		BUFFER POINTER.
	#CHANGED		SIZE.

	IF	0
READBBLOCK	FCB	SYSCALL:READB	FUNCTION
	FCB	READB:SCLEN
	FCB	CHANGED	CHANNEL #
	FCB	IGNORED
	FDB	IGNORED	WRBUF
	FDB	0	WRLEN
	FDB	CHANGED	RPLEN
	FDB	BUFFER	BUFFERPOINTER
	FDB	1	REQUESTED COUNT
	FIN	0
*
WRITEABLOCK	FCB	SYSCALL:WRITEA	FUNCTION
	FCB	WRITEA:SCLEN
	FCB	CHANGED	CHANNEL #
	FCB	IGNORED
	FDB	BUFFER	BUFFERPOINTER
	FDB	1	REQUESTED COUNT
*
	IF	SDOSBINARY=1
WRITEBBLOCK	FCB	SYSCALL:WRITEB	FUNCTION
	FCB	WRITEB:SCLEN
	FCB	CHANGED	CHANNEL #
	FCB	IGNORED
	FDB	BUFFER	BUFFERPOINTER
	FDB	CHANGED	REQUESTED COUNT
	FIN	SDOSBINARY=1
*
POSITIONBLOCK	FCB	SYSCALL:CONTROL	FUNCTION
	FCB	SCBLK:WRLEN+2
	FCB	CHANGED	CHANNEL
	FCB	CC:POSITION	CONTROL SUB-CODE
	FDB	CHANGED	WRBUF
	FDB	4	# BYTES OF POSITIONING DATA
*
EXITBLOCK	FCB	SYSCALL:EXIT	FUNCTION
	FCB	EXIT:SCLEN
*
	IF	SDOSBINARY=1
STATUSBLOCK	FCB	SYSCALL:STATUS	FUNCTION
	FCB	STATUS:SCLEN
	FCB	CHANGED	CHANNEL
	FCB	CHANGED	STATUS SUB-CODE
	FDB	IGNORED	WRBUF
	FDB	0
	FDB	CHANGED	TO 1
	FDB	BUFFER	READ-BACK BUFFER
	FDB	4	# BYTES TO READ BACK
	FIN	SDOSBINARY=1
*
	IF	0
DEBUGBLOCK	FCB	SYSCALL:DEBUG	FUNCTION
	FCB	DEBUG:SCLEN
	FIN	0

ICONBLK	FCB	SYSCALL:ISCONSOLE
	FCB	2

ERREXIT	FCB	SYSCALL:ERROREXIT
	FCB	4
	FDB	0
*
SETERRBLOCK	FCB	SYSCALL:SETERROR	FUNCTION
	FCB	SETERROR:SCLEN
	FDB	CHANGED	TO ERROR CODE
*
DISPERRBLOCK	FCB	SYSCALL:DISPERROR	FUNCTION
	FCB	DISPERROR:SCLEN
*
EOFTABLE	RPT	NIOCHANNELS	USED TO RECORD END-OF-FILE STATUSES
	FCB	0
EOFADDRESS	FCB	EOFTABLE/256,0
BUFFER	FDB	0,0
WRITEA$XSV	RMB	2	TEMP SAVE LOC FOR X DURING WRITEA$FLUSH.
	PAGE
OPEN	STX	OPENBLOCK+OPEN:NAMEP
	JSR	CLEAREOFFLAG
	LDX	#OPENBLOCK
OPEN1	STAA	OPEN:LENGTH+1,X	OPEN:LENGTH IS ZEROED AT ASSEMBLY TIME
	STAB	OPEN:CHANNEL,X	SINCE WE KNOW THAT FILENAMES PASSED BY BASIC ARE LIMITED TO 255 BYTES
	STX	WRITEA$XSV	SAVE @/ SCBLK FOR A SECOND.
	JSR	SYSCALL$	TRY OPENING THE CHANNEL.
	BCC	NOPRTS	  B/ IT WORKED.  GO AWAY.
	CPX	#ERR:CHBUSY	WAS CHANNEL ALREADY OPEN?
	BEQ	OPEN2	  B/ YES: WE CAN TAKE CARE OF THAT.
	JMP	IOERROR::	  B/ NO:  SEND ERROR MESSAGE TO TURKEY.

OPEN2	LDX	WRITEA$XSV	LOAD @/ SCBLK,
	LDAB	SCBLK:PARAMS,X	  AND RECOVER CHANNEL NUMBER.
	LDAA	WRITEA$XSV+1	PUSH SCBLK POINTER ONTO STACK.
	PSHA			....
	LDAA	WRITEA$XSV		....
	PSHA			....
	BSR	CLOSE	CLOSE THE CHANNEL, FLAKE OUT IF ERRORS.
	TSX		POP THE ORIGINAL SCBLK POINTER,
	LDX	0,X		....
	INS			....
	INS			....
	BRA	CALLSYSCALLIOJ	  AND GIVE IT ONE MORE SHOT.
	BRA	CALLSYSCALLIOJ
*
CREATE	STX	CREATEBLOCK+CREATE:NAMEP
	JSR	CLEAREOFFLAG
	LDX	#CREATEBLOCK
	BRA	OPEN1
*
CLOSE	BSR	CKBUFWRITE	IS THIS A BUFFERED CHANNEL?
	BNE	CLOSE$1	  B/ NO, NO HASSLES.
	JSR	WRITEA$FLUSH	ELSE FLUSH THE BUFFER,
	BCS	CLOSE$FAIL	  AND TAKE FAIL PATH IF COULDN'T FLUSH.

CLOSE$1	LDX	#CLOSEBLOCK
	STAB	CLOSE:CHANNEL,X
	JSR	SYSCALL$
	BCS	CLOSE$2
CLOSE$2	RTS

CLOSE$FAIL	JMP	WRITEA$FAIL
*
	IF	0
DELETE	STX	DELETEBLOCK+DELETE:NAMEP
	LDX	#DELETEBLOCK
	BRA	OPEN1
	FIN	0
*
*
CALLSYSCALLIOJ	EQU	*
	JMP	CALLSYSCALLIO
*
	IF	0
CHAIN	STX	CHAINBLOCK+CHAIN:NAMEP
	LDX	#CHAINBLOCK
	BRA	OPEN1
	FIN	0
*
READA	CMPB	#1	READING THE SOURCE CHANNEL?
	BEQ	READA$	  B/ YES -- FETCH FROM BUFFER.
	LDX	#READABLOCK
	STAB	READA:CHANNEL,X
	JSR	SYSCALLIO
	BCC	READRTS	B/ NO ERROR
	CPX	#ERR:ACTIVATIONNOTINBUFFER	;Check for MT foolishness
	BEQ	READRTS				;B/Ignore this error
	LDAA	#CR
	LDAB	READABLOCK+READA:CHANNEL
	BRA	SETEOFFLAG1
*
READRTS	EQU	*
	LDAA	BUFFER
	RTS

CKBUFWRITE	EQU	*
	LDX	#CH2$CCB	THIS ROUTINE CHECKS WHETHER THE CHANNEL # IN B
	CMPB	#2	  INDICATES CHANNELS 2 OR 3.  IF SO, X IS SET
	IF	SDOSBINARY=0
	BEQ	CKBUFWRITEX	  TO POINT TO THE CCB FOR THIS CHANNEL, AND
	LDX	#CH3$CCB	  CCZ IS SET.  OTHERWISE X IS CLOBBERED, AND
	CMPB	#3	  CCZ IS CLEARED.
	FIN	SDOSBINARY=0
NOPRTS	EQU	*
CKBUFWRITEX	EQU *
	RTS

READA$	EQU	*
	LDX	READA$BLOCK+SCBLK:RPLEN	FETCH REMAINING BYTE COUNT,
	BEQ	READA$1	  B/ NEED MORE.
READA$0	DEX		ELSE REDUCE COUNT,
	STX	READA$BLOCK+SCBLK:RPLEN	  AND STORE IT BACK.
	LDX	READA$BLOCK+SCBLK:RDBUF	GET CHARACTER POINTER,
	LDAA	0,X	  GET CHARACTER IN A.
	INX		BUMP POINTER,
	STX	READA$BLOCK+SCBLK:RDBUF	  AND STORE IT BACK.
	RTS

READA$1	EQU	*	READ A BLOCK, LINE MODE.
	LDX	#READA$BUF	GET ADDRESS OF BUFFER.
	STX	READA$BLOCK+SCBLK:RDBUF	AND PLACE INTO SCBLK.
	LDX	#READA$BLOCK	LOAD @ OF REQUEST BLOCK,
	JSR	SYSCALL$	  AND GO READ SOME STUFF.
	BCC	READA$	  B/ NO ERROR, GET SOME STUFF.

	CPX	#ERR:EOFHIT	SOME KINDA ERROR:  IS IT EOF?
	BNE	READA$2	  B/ NO, ARRGH.
	LDX	READA$BLOCK+SCBLK:RPLEN	<EOF> DETECTED; WERE ANY CH
				; XMITTED?
	BNE	READA$0		B/ IF SO, THEN EMPTY THIS BUFFER FULL.
	LDX	#ERR:EOFHIT	OTHERWISE RECOVER FROM ERROR.
READA$2	LDAA	#CR	RETURN ALL THIS DEFAULT CRUD.
	LDAB	#1	WE KNOW THIS IS CHANNEL 1.
	IF	0
	BRA	SETEOFFLAG1	  HO HUM....

READB	LDX	#READBBLOCK
	STAB	READB:CHANNEL,X
	JSR	SYSCALLIO
	BCC	READRTS	B/ NO ERROR
	CLRA		RETURN NULL ON EOF
	LDAB	READBBLOCK+READB:CHANNEL
	FIN	0
SETEOFFLAG1	JMP	SETEOFFLAG
*
WRITEA	BSR	CKBUFWRITE	IS THIS A BUFFERED CHANNEL?
	BEQ	WRITEA$	  B/ YEAH: HANDLE FUNNY.
	LDX	#WRITEABLOCK
	STAB	WRITEA:CHANNEL,X
	STAA	BUFFER
	JSR	SYSCALLIO
	BCC	WRITEA1	B/ NO ERROR
	LDAB	WRITEABLOCK+WRITEA:CHANNEL
WSETEOFFLAG	EQU	*
	CPX	#ERR:EOFHIT
	BNE	IOERROR::J
	JSR	GETEOFADDRESS
	SEC
	ROL	EOFTABLE&$FF,X
IOERROR::J	JMP	IOERROR::
*
WRITEA1	EQU	*
	LDAB	WRITEABLOCK+WRITEA:CHANNEL
	JMP	CLEAREOFFLAG

WRITEA$	EQU	*
	PSHB		SAVE THE CHANNEL #,
	LDAB	CCB:CBL,X	FETCH # OF CHARACTERS CURRENTLY STORED.
	CMPB	CCB:MBL,X	IS THERE ROOM FOR ANOTHER?
	PULB		  (RESTORE THE CHANNEL #.)
	BCS	WRITEA$OK	  B/ YES, PUT IT IN.
	BSR	WRITEA$FLUSH	ELSE, HOSE OUT THE BUFFER.
	BCC	WRITEA$OK	  B/ NO ERROR.
WRITEA$FAIL	LDX	TEMPX	LOAD SAVED ERROR CODE,
	BRA	WSETEOFFLAG	  AND REPORT THE ERROR.

WRITEA$OK	EQU	*
	INC	CCB:CBL,X	BUMP THE CURRENT BUFFER LENGTH.
	INC	CCB:CBP+1,X	BUMP THE CURRENT BUFFER POINER,
	BNE	WRITEA$OK1	  B/ NO CARRY.
	INC	CCB:CBP,X	PROPAGATE CARRY.
WRITEA$OK1	EQU	*
	LDX	CCB:CBP,X	GRAB THE CURRENT POINER,
	STAA	0,X	  SHOVE IN A CHARACTER.
	RTS		  SPLIT.

WRITEA$FLUSH	EQU *
	PSHA		SAVE ACCA,
	PSHB		  AND CHANNEL #.
	LDAA	CCB:CBL,X	GET LENGTH OF BUFFER,
	CLC		  CLEAR CARRY IN CASE OF EARLY EXIT.
	BEQ	WRITEA$FLX	  B/ NOTHING TO DO, SPLIT NOW.
	STX	WRITEA$XSV	GOING TO WRITE:  SAVE X,
	LDX	CCB:BBP,X	  AND FETCH BASE ADDRESS OF BUFFER.
	INX		COMPUTE REAL START OF THE BUFFER.
	STX	WRITEA$BLK+SCBLK:WRBUF	  STORE POINTER INTO SCB.
	LDX	#WRITEA$BLK	LOAD POINTER TO THE BLOCK,
	STAB	SCBLK:PARAMS,X	  STUFF CHANNEL #,
	STAA	SCBLK:WRLEN+1,X	  WRITE-RECORD-LENGTH,
	JSR	SYSCALLIO	  AND GO TO IT.
	BCC	WRITEA$FLUSH1	  B/ NO ERROR.  NOTE THAT THIS KEEPS SDOS HAPPY.
WRITEA$FLUSH1	EQU *
	TPA		SAVE CARRY STATUS.
	STX	TEMPX	  AND ERROR CODE (IF ANY).
	LDX	WRITEA$XSV	RESTORE CCB POINTER,
	LDAB	CCB:BBP,X	  AND INITIALIZE CURRENT BUFFER POINTER
	STAB	CCB:CBP,X
	LDAB	CCB:BBP+1,X
	STAB	CCB:CBP+1,X
	CLR	CCB:CBL,X	  ...AND CURRENT BUFFER LENGTH.
	TAP		RESTORE CARRY FLAG,
WRITEA$FLX	EQU *
	PULB		RESTORE REGISTERS.
	PULA
	RTS		  SO LONG.

	IF	SDOSBINARY=1
WRITEB1	EQU	*
	LDAB	WRITEBBLOCK+WRITEB:CHANNEL
	BRA	WSETEOFFLAG

WRITEB	STX	WRITEBBLOCK+SCBLK:WRBUF	SET BUFFER POINTER.
	LDX	#WRITEBBLOCK
	STAB	WRITEB:CHANNEL,X
	STAA	SCBLK:WRLEN+1,X	SET LOW BYTE OF COUNT.
	CLR	SCBLK:WRLEN,X	CLEAR HIGH BYTE.
	JSR	SYSCALLIO
	BCS	WRITEB1
	LDAB	WRITEBBLOCK+WRITEB:CHANNEL
	RTS
	FIN	0
*
GETPOS	EQU	*
	STX	WRITEA$XSV	SAVE POINTER,
	JSR	GETTYPE	GET TYPE OF DEVICE,
	CMPA	#DVTYP.FILE
	BNE	GETPOS1	  B/ NOT FILE --> NO POSITION.
	LDAA	#SC:GETPOS	ELSE READ POSITION.
	JSR	GETSTS
	BRA	GETPOS2

GETPOS1	LDX	#0
	STX	BUFFER
	STX	BUFFER+2

GETPOS2	LDX	WRITEA$XSV
	LDAA	BUFFER
	LDAB	BUFFER+1
	STAA	0,X
	STAB	1,X
	LDAA	BUFFER+2
	LDAB	BUFFER+3
	STAA	2,X
	STAB	3,X
	RTS

GETWD	JSR	GETTYPE	GET TYPE OF DEVICE
	CMPA	#DVTYP.CONSOLE
	BEQ	GETWD1	B/IS CONSOLE
	CMPA	#DVTYP.PRINTER
	BEQ	GETWD1	B/IS PRINTER
	CLRA
	CLRB
	RTS

GETWD1	LDX	#0	CLEAR BUFFER
	STX	BUFFER
	JSR	GETPARAMS	GET DEVICE PARAMS
	RTS

ISCONSOLE	LDX	#ICONBLK
	JSR	SYSCALL$
	BCS	ISCONSOLEORNOT
ISCONSOLEORNOT	RTS

*
CLEAREOFFLAG	BSR	GETEOFADDRESS	CLEAR EOF FLAG
	CLR	EOFTABLE&$FF,X
	RTS
*
GETEOFADDRESS	STAB	EOFADDRESS+1
	LDX	EOFADDRESS
	RTS
*
POSITION	STX	POSITIONBLOCK+SCBLK:WRBUF
	BSR	CLEAREOFFLAG
	CMPB	#3
	BEQ	POSITION1	B/ IF ITS CHANNEL 3 WE KNOW ITS A FILE.
	BSR	GETTYPE	OTHERWISE, CHECK FILE TYPE,
	CMPA	#DVTYP.FILE	  AND IF IT'S NOT A FILE,
	BNE	POSITIONRTS	  B/ NOTHING TO DO.
POSITION1	EQU	*
	LDX	#POSITIONBLOCK
	STAB	CONTROL:CHANNEL,X
	JSR	SYSCALLIO
	BCC	POSITIONRTS
	LDAB	POSITIONBLOCK+CONTROL:CHANNEL
SETEOFFLAG	CPX	#ERR:EOFHIT
	BNE	IOERROR::	B/ I CAN'T HANDLE THIS
	BSR	GETEOFADDRESS
	SEC
	ROL	EOFTABLE&$FF,X
POSITIONRTS	RTS
*
EXIT	LDX	#EXITBLOCK
	JMP	SYSCALLIO	(CAN'T COME BACK)
*
EOF$	BSR	GETEOFADDRESS
	LDAA	EOFTABLE&$FF,X
	IF	SDOSBINARY=1
	RTS
*
GETTYPE	LDAA	#SC:GETTYPE	LOAD COMMAND.
GETSTS	LDX	#STATUSBLOCK
	STAB	STATUS:CHANNEL,X
	PSHB		SAVE CHANNEL #.
	STAA	SCBLK:PARAMS+1,X
	BSR	CALLSYSCALLIO	SEND ALL ERRORS ELSEWHERE.
	LDAA	BUFFER	LOAD DEVICE TYPE,
	PULB		  RESTORE CHANNEL #,
	RTS		  AND SPLIT.


**** GETSIZE -- RETURNS NBPS FOR SPECIFIED CHANNEL, IN AB ****
GETSIZE	EQU	*
	BSR	GETTYPE	GET DEVICE TYPE IN A.
	LDX	#ASME.NOTFILE	PRESET ERROR CODE.
	CMPA	#DVTYP.FILE	  ...DISK FILE?
	BNE	IOERROR::	  B/ NO:  REPORT ERROR.

**** DO GETPARAMS, RETURN FIRST TWO BYTES OF BUFFER IN AB ****
GETPARAMS EQU	*
	LDAA	#SC:GETPARAMS	LOAD FUNCTION CODE,
	BSR	GETSTS	  READ STATUS.
	LDX	#BUFFER	RETURN POINTER TO BUFFER,
	LDAA	DVDAT:NBPS,X	  FIRST TWO BYTES.
	LDAB	DVDAT:NBPS+1,X	  ....
	FIN	SDOSBINARY=1
RESET	RTS
*
ERROR::	LDX	#ERREXIT	SAVE FOR POSSIBLE ABORT
	STAA	SCBLK:PARAMS,X
	STAB	SCBLK:PARAMS+1,X
	LDX	#SETERRBLOCK
	STAA	SETERROR:CODE,X
	STAB	SETERROR:CODE+1,X
	JSR	ISCONSOLE	ARE WE IN A DO FILE??
	BCS	CRAPOUT1	B/YES - ERROR EXIT
	LDX	#SETERRBLOCK
	JSR	SYSCALLIO
	BCS	IOERROR::	B/ ERROR
	LDX	#DISPERRBLOCK
CALLSYSCALLIO	JSR	SYSCALLIO
	BCS	IOERROR::
	RTS

IOERROR::	EQU	*
	STX	TEMPX	LOAD ERROR
	LDAA	TEMPX	 CODE IN
	LDAB	TEMPX+1	  A & B REGS
	JMP	IOERR	GO TO FLAMOUT ROUTINE

CRAPOUT	STX	ERREXIT+SCBLK:PARAMS	SAVE ERROR CODE
CRAPOUT1	LDX	#ERREXIT
	JSR	SYSCALL$
	PAGE
*
*  READ CLOCK INTO DATE$BUF.  SET CARRY & EXIT IF PROBLEMS.
*
CLOCKGET	LDX	#OPENCLK	START ISSUING SYSCALLS
	BSR	SYSCALL$1	  LIKE CRAZY, USING SDOS'S
	LDX	#READCLK	  WONDER RETURN CONVENTION TO GET US
	BSR	SYSCALL$1	  OUT OF HERE IF WE HAVE PROBLEMS.
	LDX	#CLOSECLK
SYSCALL$1	JMP	SYSCALL$


**** READ THE DATE *****
DATE	BSR	CLOCKGET	READ THE CLOCK; THE BCS **MUST** FOLLOW;
	BCS	DATERR	  B/ COULDN'T DO IT.
	LDX	#DATE$BUF+9	POINT TO THE DATE PORTION OF THE MESSAGE,
	BRA	DATETIME	  AND JOIN THE COMMON FLOW.

DATERR	LDX	#DUMDATE	LOAD DUMMY DATE FOR ERRORS,

DATETIME	LDAA	#8	LOAD USUAL COUNT
	RTS		  AND GO AWAY.

**** DUMMY DATE/TIME BUFFERS *****
CLOCKNAME	FCC	"CLOCK:"
DUMDATE	FCC	"**DATE**"
DUMTIME	FCC	"**TIME**"



**** READ THE TIME *****
TIME	BSR	CLOCKGET	READ THE CLOCK.
	BCS	TIMERR	  B/ NOPE.
	LDX	#DATE$BUF	POINT TO THE TIME PORTION OF THE NONSENSE,
	BRA	DATETIME	  AND GO ALONG HOME.

TIMERR	LDX	#DUMTIME	LOAD DUMMY TIME IF ERRORS,
	BRA	DATETIME	  AND RETURN.
	PAGE
	IFUND	DEBUG
	ELSE
DEBUGSYSCALL	EQU	*
	JSR	SYSCALL$
	BCS	DEBUGTRAP
DEBUGRTS	RTS
DEBUGTRAP	JMP	DEBUGRTS
	FIN
	END
