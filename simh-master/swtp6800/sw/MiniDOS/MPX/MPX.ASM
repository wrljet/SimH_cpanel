 NAM MINIDOS-PLUS   VER 3.0
* COPYRIGHT (C) 1978
* PERCOM DATA CO. INC.
* ALL RIGHTS RESERVED
*******************************************
* THIS PROGRAM IS AN EXTENSION OF THE PERCOM
* MINIDOS OPERATING SYSTEM.  IT PERMITS DISK
* FILES TO BE MANIPULATED BY FILES NAMES OF
* 6 CHARACTERS OR LESS.  UP TO 31 FILES ARE
* SUPPORTED.  THE RESIDENT COMMANDS ARE:
*
*  S(AVE) <NAME> <BEGIN> <END> [EXEC]
*  L(OAD) <NAME>      LOAD FILE INTO MEMORY
*  D(ELETE) <NAME>    DELETE FILE FROM DIRECTORY
*  F(ILES)            LISTS FILES ON TERMINAL
*  I(NIT)             INITIALIZES DISK DIRECTORY
*  R(ENAME) <THIS> <THAT>
*  A(LLOCATE)         RESERVES 10 BLOCKS (SECTORS) FOL-
*                     LOWING LAST FILE IN DIRECTORY
*  J(UMP) <ADDRESS>   JUMP TO SPECIFIED ADDRESS
*  X(IT)              EXIT TO MONITOR
*  M(INIDOS)          ESCAPE TO MINIDOS
*
* COMMANDS CONSIST OF SINGLE LETTERS.  IF MORE THAN ONE
* CHARACTER IS ENTERED, THE DIRECTORY WILL BE SEARCHED 
* FOR A FILE WITH THE NAME OF THE GIVEN COMMAND.  IF SUCH
* A FILE IS FOUND, IT WILL BE LOADED AND EXECUTED.
*
* SPACES (BLANKS) ARE DELIMITERS BETWEEN ENTRIES.
*
* DISK SPACE OCCUPIED BY A DELETED FILE IS MADE AVAIL-
* ABLE TO THE FILE PRECEDING IT IN THE DIRECTORY.
*
* TO `PROTECT` A FILE, MAKE THE FIRST CHARACTER IN THE
* FILE NAME `@`.  FOR EXAMPLE:  @NAME
* TO `UNPROTECT` THE FILE, RENAME THE FILE WITHOUT THE `@`.
*
* THE ALLOCATE COMMAND RESERVES 10 SECTORS FOLLOWING THE
* LAST FILE FOR USE BY THE LAST FILE.
*
* DRIVES OTHER THAN DRIVE #1 MAY BE SELECTED BY
* PRECEDING THE COMMAND WITH THE DRIVE NUMBER AND A
* SLASH (/).  FOR EXAMPLE, TO LOAD A FILE FROM
* DRIVE #2, TYPE:   2/L <NAME>
*
* CONTROL-X IS USED TO CANCEL A COMMAND LINE
* CONTROL-H IS USED TO BACKSPACE IN COMMAND LINE
* RETURN TERMINATES COMMAND LINE
*
* THIS VERSION REQUIRES MINIDOS REV 1.4
* AND RAM MEMORY AT EITHER $A000 OR $7000 (DEPENDS ON 
* VERSION).  ALTHOUGH THIS LISTING WAS ASSEMBLED FOR
* ROM AT $C400, THE LISTING IS APPLICABLE FOR VERSIONS
* ASSEMBLED AT $A400 AND $7400.
**********************************************
* ERROR CODES:
*
*  0  DISK MISSING
*  1  FILE PROTECTED
*  6  NAME NOT FOUND
*  7  DIRECTORY FULL
*  8  WHAT? COMMAND NOT UNDERSTOOD
*  9  ALLOCATION ERROR
*  A  BAD ADDRESS
*
* ERROR CODES 2 THRU 5 ARE THE SAME AS MINIDOS
**********************************************
 SPC 1
 OPT O,S,NOG
 SPC 1
STACK EQU $A07F TOP OF STACK
RAM EQU $A080 RAM MEMORY REQUIRED HERE
ROM EQU $C400 ROM OR RAM REQUIRED HERE
*
* MIKBUG(TM), SWTBUG(TM), RT-68MX LINKAGES
XFER EQU $A048 TRANSFER VECTOR LOCATION
PDATA EQU $E07E PRINTS CHARACTER STRING
OUTS EQU $E0CC PRINTS ONE SPACE
OUT4HS EQU $E0C8 PRINTS 4 HEX + SPACE
MONTR EQU $E0E3 MONITOR RE-ENTRY POINT
INEEE EQU $E1AC CHARACTER INPUT ROUTINE
OUTEEE EQU $E1D1 CHARACTER OUTPUT ROUTINE
*
* MINIDOS LINKAGES
MINDOS EQU $C3AC MINIDOS BYPASS RE-ENTRY POINT
CVTDTS EQU $C003
SAVFIL EQU $C018
LODFIL EQU $C01B
ERROR EQU $C01E
FWDCAL EQU $C021
LNTH EQU $C024
INITRK EQU $C027
CRLF EQU $C363
*
* DISK SECTOR HEADER
DRV EQU $0000
TRKSEC EQU $0001
TRK EQU $0001
SCTR EQU $0002
BAKLNK EQU $0003
FWDLNK EQU $0005
TARGET EQU $0008
FILTYP EQU $000A
 SPC 1
POSTAM EQU $000D
BEGIN EQU $0014
ALTADD EQU $0016
EXEADD EQU $001A
ENDA EQU $001E
 SPC 1
LINLMT EQU 32 CHARACTERS MAX IN CMD LINE
*
 ORG RAM
LINBUF RMB LINLMT INPUT LINE BUFFER
LINPTR RMB 2 INPUT LINE POINTER
SEATEM RMB 2
BUFTEM RMB 2
DIRTEM RMB 2
NXTFIL RMB 2
ADDTEM RMB 2
DRVNUM RMB 1
BEGADD RMB 2
ENDADD RMB 2
XFRADD RMB 2
DIR RMB 512 DIRECTORY BUFFER
*
 ORG ROM
 JMP COMMND JUMP TO SATISFY MINIDOS LOOKAHEAD
COMMND JSR INITRK INITIALIZE TRACK REGISTERS
COMNDX BSR CMD1
 BRA COMNDX
CMD1 BSR INLINE
 JSR CRLF
 LDX #LINBUF
 JSR SKIPSP
 BEQ EOL
 BSR GETDRV GET DRIVE NUMBER, IDENTIFY COMMAND
 BCS CMDERR BR IF NOT FOUND
 BEQ EOL BR IF NOT EXECUTABLE
 JSR 0,X JUMP TO IT
 BCS CMDERR
EOL RTS
CMDERR JMP ERROR
* INPUT COMMAND LINE
INLINE JSR CRLF
 LDAA #'>
 JSR OUTEEE
 LDX #LINBUF
 CLRB
INPUT JSR INEEE
 CMPA #$0D CHECK FOR CR
 BEQ ENDLIN
 CMPA #$18 CHECK FOR CANCEL
 BEQ INLINE
 CMPA #$08 CHECK FOR BKSPC
 BNE INP1
 DECB
 BMI INLINE
 DEX
 BRA INPUT
INP1 STAA 0,X
 INX
 INCB
 CMPB #LINLMT CHECK CHARACTER LIMIT
 BNE INPUT
ENDLIN CLRA
 STAA 0,X
 RTS
* SELECT PROPER DRIVE
GETDRV CMPA #'0
 BLS GTD1
 CMPA #'3
 BHI GTD1
 LDAB 1,X
 CMPB #'/
 BNE GTD1
 INX
 INX
 BRA GTD2
GTD1 LDAA #1
GTD2 ANDA #$03
 LSRA
 RORA
 RORA
 STAA DRVNUM
 STX LINPTR
* IDENTIFY COMMAND
 LDAA 1,X CHECK FOR END OF LINE
 BEQ MCH0 BR IF END OF LINE
 CMPA #'  CHECK FOR DELIMITER
 BNE NOMCH BR IF DELIMITER
MCH0 LDAA 0,X
 LDX #CMDTBL
MCH1 CMPA 0,X
 BEQ MATCH BR IF RESIDENT COMMAND FOUND
MCH2 INX
 INX
 INX
 TST 0,X END OF COMMAND TABLE?
 BNE MCH1 BR IF NOT
* RESIDENT COMMAND NOT FOUND,
* CHECK DIRECTORY FOR COMMAND
NOMCH LDX LINPTR
LODS1 CMPA #'0
 BCS LODS2
 CMPA #'3
 BHI LODS2
 JSR GETADD
 JSR CVTDTS
 BRA LODS3
LODS2 BSR SEARCH
 BCS LODS4
 LDX 0,X
 STX TRKSEC
LODS3 LDX #$FFFF
 STX ALTADD
 JSR LODFIL
 BCS LODS4
 LDX POSTAM
 CPX #$FFFF
LODS4 RTS
 SPC 1
MATCH LDX 1,X
 CLC
 RTS
 SPC 1
LOCATE JSR NXTOKN
 BEQ WHAT
* THIS ROUTINE SEARCHES THE DIRECTORY FOR A FILE.
* ON ENTRY `LINPTR` POINTS TO NAME TO BE MATCHED.
* ON EXIT, `DIRTEM` POINTS TO FILE NAME, X POINTS
* TO TRK-SEC NUMBER. CARRY IS SET IF NOT FOUND.
SEARCH JSR RDDIR READ DIRECTORY
 BCS SEACER+2
 LDX #DIR
NEXTA STX SEATEM
 STX DIRTEM
 LDX LINPTR
 LDAB #6
NEXT LDAA 0,X
 BEQ NEXTB BR IF END OF LINE
 CMPA #'  CK FOR DELIMITER
 BNE NEXTB BR IF NOT SPACE
 CLRA
NEXTB INX
 STX BUFTEM
 LDX SEATEM
 CMPA 0,X
 BNE NEXTD
 TST 0,X
 BEQ FOUND
 INX
 STX SEATEM
 LDX BUFTEM
 DECB
 BNE NEXT
 LDX SEATEM
 CLC
 RTS
NEXTD ADDB #10
 BSR ADDBTX
 CPX #DIR+$200
 BNE NEXTA
SEACER LDAA #6 NAME NOT FOUND
 SEC
 RTS
FOUND BSR ADDBTX
 CLC
 RTS
* ADD ACCB TO X
ADDBTX PSHB
ABTX INX
 DECB
 BNE ABTX
 PULB
 RTS
* THIS ROUTINE LOCATES VACANCY IN DIRECTORY
* ON EXIT, X POINTS TO VACANCY
SEANXT JSR RDDIR READ DIRECTORY
 BCS SNXERR
SEANX0 LDX #DIR
SNEXT TST 0,X
 BEQ FOUND1 VACANCY FOUND
 LDAB #16
 BSR ADDBTX
 CPX #DIR+512-16
 BNE SNEXT
 LDAA #7 DIRECTORY FULL
SNXERR SEC
 RTS
FOUND1 CLC
 RTS
WHAT LDAA #8 COMMAND NOT UNDERSTOOD
 SEC
 RTS
ADDERR LDAA #$A BAD ADDRESS
 SEC
 RTS
PROTCT LDAA #$1 FILE PROTECTED
 SEC
 RTS
 SPC 1
* LOAD FILE ROUTINE
LOAD JSR NXTOKN
 BEQ WHAT
 JSR LODS1
 BLS LOD1 BLS=BCS+BEQ
 STX XFER
LOD1 RTS ERROR IF CARRY SET
 SPC 1
* SAVE ROUTINE
SAVE LDX #0 INIT NEXT FILE TEMP
 STX NXTFIL
 JSR NXTOKN
 BEQ WHAT
 JSR GETPAR GET PARAMETERS FROM LINE
 BCS ADDERR
* ENTER HERE WHEN LINKING `SAVE` TO EXISTING PROGRAMS
* PARAMETERS MUST BE SET IN `BEGADD`, `ENDADD`, `XFRADD`.
* `LINPTR` POINTS TO NAME OF FILE.
 JSR SEARCH FIND NAME IN DIR
 BCS NOTHER BR IF NOT HERE
 LDX 0,X PICK UP DTS
 STX FWDLNK SET UP LENGTH CHECK
 LDX DIRTEM
 LDAA 0,X
 CMPA #'@ CHECK PROTECTION
 BEQ PROTCT
 CPX #DIR+512-32 IS THIS LAST FILE?
 BEQ SAV3
 TST 16,X IS NEXT FILE EMPTY
 BEQ SAV3
 LDX 22,X GET NEXT FILE START
 STX NXTFIL
 JSR BEGEND
 JSR LNTH CALCULATE FILE LENGTH
LNTHCK TSTB B CONTAINS NUMBER OF BLOCKS
 BEQ SAV1
 JSR FWDCAL
 LDX FWDLNK
 CPX NXTFIL CHECK ALLOCATION LIMITS
 BEQ ALLERR
 DECB
 BRA LNTHCK
 SPC 1
NOTHER CMPA #6
 BNE SAVERR
 JSR SEANX0 LOOK FOR VACANCY
 BCS SAVERR BR IF DIRECTORY FULL
 STX DIRTEM SAVE VACANCY
 STX SEATEM
 LDX LINPTR
 LDAA 0,X
 CMPA #'@
 BCS WHAT
 JSR CMOVE1 MOVE NAME INTO DIRECTORY
SAV3 BSR BEGEND
SAV1 LDX XFRADD
 STX EXEADD
 CLR FILTYP
 LDX DIRTEM
 LDAA BEGIN
 STAA 10,X
 LDAA BEGIN+1
 STAA 11,X
 LDAA ENDA
 STAA 12,X
 LDAA ENDA+1
 STAA 13,X
 LDAA EXEADD
 STAA 14,X
 LDAA EXEADD+1
 STAA 15,X
 LDX 6,X
 STX TRKSEC
 JSR SAVFIL
 BCS SAVERR BRANCH IF SAVE ERROR
 LDX DIRTEM STORE LAST SEC IN DIR
 LDAA TRK
 STAA 8,X
 LDAA SCTR
 STAA 9,X
 LDX NXTFIL
 BNE WTDIR
 LDX TRKSEC
 STX FWDLNK
 JSR FWDCAL
 LDX DIRTEM
 LDAA FWDLNK
 STAA 22,X
 LDAA FWDLNK+1
 STAA 23,X
 SPC 1
* WRITE DIRECTORY TO DISK
WTDIR JSR DIRSET
 JSR SAVFIL
 RTS ERROR IF CARRY SET
 SPC 1
ALLERR LDAA #9 ALLOCATION ERROR
SAVERR SEC
 RTS
* ALLOCATE 10 BLOCKS (SECTORS)
ALOCAT JSR SEANXT
 BCS ALLERR+2
 LDAA 6,X
 CMPA #34
 BCC ALLERR
 INC 6,X
 JMP WTDIR
 SPC 1
BEGEND LDX BEGADD
 STX BEGIN
 STX TARGET
 LDX ENDADD
 STX ENDA
 RTS
 SPC 1
* GET PARAMETERS FROM LINE BUFFER
GETPAR BSR PARM2
 BCS PARERR
 STX BEGADD
 BSR PARM1
 BCS PARERR
 STX ENDADD
 BSR PARM1
 BCS PARERR
 BNE PAR1
 DEX MAKE X = $FFFF
PAR1 STX XFRADD
 CLC
PARERR RTS
PARM1 LDX BUFTEM
PARM2 JSR NXT2 MOVE POINTER TO NEXT TOKEN
 STX BUFTEM
* GET ADDRESS-CONVERT TO BINARY
* ON ENTRY, X POINTS TO FIRST CHARACTER
* ON EXIT, X CONTAINS ADDRESS
GETADD CLRA
 STAA ADDTEM
 STAA ADDTEM+1
 BRA GETAD3
GETAD1 BSR CONVRT
 BCS GETRTS
 LDAB #4
GETAD2 ASL ADDTEM+1
 ROL ADDTEM
 DECB
 BNE GETAD2
 ADDA ADDTEM+1
 STAA ADDTEM+1
 INX
GETAD3 LDAA 0,X
 BEQ GETDON
 CMPA #'  CK FOR DELIMITER
 BNE GETAD1
GETDON CLC
GETRTS LDX ADDTEM
 RTS
* CONVERT ASCII TO BINARY, CARRY SET IF ERROR
* OVERFLOW FLAG IS CLEAR IF DECIMAL NUMBER
CONVRT SUBA #$30
 BLT CVTERR
 CMPA #9
 CLV
 BLS CVTQWT
 SUBA #7
 CMPA #$A
 BCS CVTERR BR IF LOWER
 CMPA #$F
 BHI CVTERR
 SEV
CVTQWT CLC
 RTS
CVTERR SEC
 RTS
* ROUTINE TO GO TO SPECIFIED ADDRESS
GOTO JSR NXTOKN
 BEQ WHATER
 BSR GETADD
 BCS CVTERR
 JMP 0,X
* READ DIRECTORY FROM DISK
RDDIR BSR DIRST
 JMP LODFIL
 SPC 1
DIRSET LDX #DIR
 STX BEGIN
 LDX #DIR+$1FF
 STX ENDA
 LDAA #$D0  MINI-PLUS DIRECTORY
 STAA FILTYP
DIRST LDAA DRVNUM
 STAA DRV
 CLRA
 STAA TRK
 STAA SCTR
 LDX #$FFFF
 STX EXEADD
 LDX #DIR
 STX ALTADD
 RTS
 SPC 1
* INITIALIZE DISK DIRECTORY
INIT LDX #DIR
CLEAR CLR 0,X
 INX
 CPX #DIR+$200
 BNE CLEAR
 LDAA #1
 STAA DIR+6
 JMP WTDIR
 SPC 1
WHATER LDAA #8
LISTER SEC
 RTS
 SPC 1
* LIST DIRECTORY ON TERMINAL
DIRECT BSR RDDIR READ DIRECTORY
 BCS LISTER
 LDX #DIRHDR
 JSR PDATA
 JSR CRLF
 LDX #DIR
LIST1 TST 6,X CHECK FOR LAST FILE
 BEQ DONE
LIST LDAB #6
LSTA LDAA 0,X
 BNE LSTB
 LDAA #'  INJECT SPACE
LSTB JSR OUTEEE
 INX
 DECB
 BNE LSTA
 BSR PRTSEC
 JSR OUTS
 BSR PRTADD
 STX DIRTEM
 JSR CRLF
 LDX DIRTEM
 CPX #DIR+$200
 BNE LIST1
DONE RTS
PRTSEC BSR PS1 PRINT FIRST AND LAST SECTORS
PS1 STX SEATEM
 JSR OUTS
 LDX 0,X
 STX TRKSEC
 JSR $C324
 LDX SEATEM
 INX
 INX
 RTS
PRTADD BSR PA1 PRINT BEGIN AND END ADDRESSES
 BSR PA1
PA1 JSR OUT4HS
 RTS
* ROUTINE TO RENAME A FILE
RENAME JSR LOCATE
 BCS LISTER
 LDX DIRTEM
 STX SEATEM
 JSR NXTOKN
 BEQ WHATER
 CMPA #'@
 BCS WHATER
 BSR CMOVE1
 JMP WTDIR
 SPC 1
CMOVE1 LDAB #6
CMOVE LDAA 0,X
 BEQ ENDMOV
 CMPA #'  CK FOR DELIMITER
 BNE CMOVE2
 CLRA
 BRA ENDMOV
CMOVE2 INX
ENDMOV STX BUFTEM
 LDX SEATEM
 STAA 0,X
 INX
 STX SEATEM
 LDX BUFTEM
 DECB
 BNE CMOVE
 RTS
* DELETE FILE FROM DIRECTORY
DELETE JSR LOCATE
 BCS NXT
 LDX DIRTEM
 LDAA 0,X CHECK IF FILE PROTECTED
 CMPA #'@
 BNE DEL1
 JMP PROTCT
DEL1 LDAA 16,X CHECK IF LAST FILE
 BNE DEL3
 LDAA 6,X
 STAA 22,X
 LDAA 7,X
 STAA 23,X
DEL3 CPX #DIR+512-16
 BEQ DEL2
 LDAA 16,X
 STAA 0,X
 INX
 BRA DEL3
DEL2 CLR 0,X
 INX
 CPX #DIR+$200
 BNE DEL2
 JMP WTDIR
* ROUTINE TO GET NEXT TOKEN
NXTOKN LDX LINPTR
 BSR NXT2
 BEQ NXT
 STX LINPTR
NXT RTS
NXT1 INX
NXT2 LDAA 0,X
 BEQ SKIP2
 CMPA #'  CK FOR DELIMITER
 BNE NXT1
* ROUTINE TO SKIP SPACES
SKIP1 INX
SKIPSP LDAA 0,X
 BEQ SKIP2
 CMPA #'  CK FOR DELIMITER
 BEQ SKIP1
SKIP2 RTS
DIRHDR FCC /FILE:  FST LST BEGA ENDA STRT/
 FCB 4
CMDTBL FCC /L/ LOAD FILE
 FDB LOAD
 FCC /S/ SAVE
 FDB SAVE
 FCC /I/ INITIALIZE DIRECTORY
 FDB INIT
 FCC /F/ LIST FILES
 FDB DIRECT
 FCC /D/ DELETE FILE
 FDB DELETE
 FCC /X/ EXIT TO MONITOR
 FDB MONTR
 FCC /A/ ALLOCATE
 FDB ALOCAT
 FCC /J/ GOTO
 FDB GOTO
 FCC /R/ RENAME
 FDB RENAME
 FCC /M/ MINIDOS
 FDB MINDOS
ENDTBL FCB 0
 END

