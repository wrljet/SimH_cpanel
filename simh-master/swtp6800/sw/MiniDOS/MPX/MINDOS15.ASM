 NAM MINIDOS
* MINIDOS (TM) 6800 REV 1.5?
* COPYRIGHT 1978 PERCOM DATA CO.
* WRITTEN BY H.A. MAUCH
* REVISED 8-20-78 (unknown)
* 
* RECREATED FROM MINIDOS FOR 6809 SOURCE FILE
* AND UPDATED TO MATCH THE MINIDOS PROM ON MY
* PERCOM CONTROLLER WHICH IS SLIGHTLY DIFFERENT
* THAN THE VERSION 1.4 SHOWN IN THE PERCOMD
* LFD-400 MANUAL. MAYBE VERSION 1.5?
*
* MIKE DOUGLAS 3/8/2020
*
* VERSION 1.5 UPDATES:
*    CHANGE TRKLMT TO 40 TRACKS VS 35,
*    CHANGE SETTLE DELAY FROM 30MS TO 15MS,
*    CHANGE STEP DELAY FROM 20MS TO 25MS,
*    LOOK  FOR  WRTBIT FALSE (1) IN RDRV,
*    CHANGE 1MS DELAY ROUTINE (DELAY) TO
*    USE 166 VS 148 TO BE CLOSER TO 1MS.
*
 SPC 1
BASE EQU $C000
* MONITOR LINKS
STACK EQU $A07F STACK LOCATION
XFER EQU $A048 MONITOR TRANSFER ADDRESS
BADDR EQU $E047 BUILD ADDRESS
OUTHR EQU $E06B PRINT RIGHT HEX DIGIT
PDATA1 EQU $E07E PRINT CHARACTER STRING
OUTS EQU $E0CC PRINT SPACE CHARACTER
MONITR EQU $E0E3 MONITOR RE-ENTRY POINT
INEEE EQU $E1AC INPUT A CHARACTER
* INPUT PORTS ASSIGNMENT
STATUS EQU $CC00 CONTROLLER STATUS
RDDTA EQU $CC01 RECEIVED DATA
SECTOR EQU $CC02 SECTOR COUNTER
DVSTAT EQU $CC03 DRIVE STATUS
RRSRT EQU $CC04 RECEIVER RESTART PULSE
MOTON EQU $CC05 MOTOR ON PULSE
MOTOFF EQU $CC06 MOTOR OFF PULSE
* OUTPUT PORTS ASSIGNMENT
SYNC EQU $CC00 SYNC WORD PORT
WRTDTA EQU $CC01 WRITE DATA PORT
FILL EQU $CC02 FILL WORD PORT
DRVSLT EQU $CC03 DRIVE AND TRACK SELECT
WRTPLS EQU $CC04 WRITE PULSE
* DRIVE STATUS BITS (DVSTAT)
WTPBIT EQU $1 WRITE PROTECT BIT
TRKBIT EQU $2 TRACK ZERO BIT
MTRBIT EQU $4 MOTOR TEST BIT
WRTBIT EQU $8 WRITE GATE BIT
SECBIT EQU $10 SECTOR PULSE BIT
IDXBIT EQU $20 INDEX PULSE BIT
* DRIVE LIMITS
TRKLMT EQU 39 USE 76 FOR MICROPOLIS DRIVES
TRKMSK EQU $3F USE $7F FOR     "        "
SECLMT EQU 9 USE 15 IF DOUBLE DENSITY
 SPC 1
 ORG 0
* SECTOR HEADER TEMPORY STORAGE
HEADER EQU *
DRV RMB 1 DESIRED DRIVE (MS 2 BITS)
TRKSEC EQU *
TRK RMB 1 DESIRED TRACK
SCTR RMB 1 DESIRED SECTOR
BAKLNK RMB 2 BACKWARD LINK
FWDLNK RMB 2 FORWARD LINK
BYTCNT RMB 1 SECTOR BYTE COUNT
ADDRES RMB 2 DATA ADDRESS VECTOR
FILTYP RMB 1 FILE TYPE CODE
 SPC 1
CKSUM RMB 2 CHECKSUM
POSTAM RMB 2 POSTAMBLE

CRNTRK RMB 5 CRNT TRK AND TRK HISTORY
TA RMB 2 CONTINUATION ADDRESS
TW RMB 2 ALTERNATE TARGET ADDRESS
XTEMP RMB 2 INDEX REGISTER STORAGE
RETRY EQU * RETRY COUNTER
EXEC RMB 2 PROG STRT ADDRESS
TEMP RMB 2 TEMP STORAGE
ENDA RMB 2 END ADDRESS
 SPC 1
 ORG BASE
*INTERNAL FUNCTION JUMP TABLE
 JMP MINDOS MINIDOS CMD PROCESSOR
 JMP CVTDTS CONVERT DSSS TO PHYSICAL SECTOR
RESTORE JMP GTK0X GO TO TRACK ZERO
SEEK JMP SEEKX SEEK TRACK
RDSEC JMP RDSECX READ SECTOR
WTSEC JMP WTSECX WRITE SECTOR
SLTDRV JMP DCHECK SLT DRV, START MTR, CK DISK, SEEK TRK
STMTR JMP START START MOTOR (DELAY IF NECESSARY)
SAVE JMP SAVEX SAVE A MEMORY IMAGE FILE
LOAD JMP LOADX LOAD A MEMORY IMAGE FILE
TYPERR JMP TYPERX TYPE ERROR MESSAGES
FWDCAL JMP FWDCLX CALCULATE FORWARD LINK
LENGTH JMP LNTH CALCULATE BLOCK LENGTH
INITRK LDAA #$FF INITIALIZE TRACK REGISTERS
 STAA CRNTRK
 STAA CRNTRK+1 DRIVE 0 TRACK
 STAA CRNTRK+2 DRIVE 1 TRACK
 STAA CRNTRK+3 DRIVE 2 TRACK
 STAA CRNTRK+4 DRIVE 3 TRACK
RDRTN RTS
 SPC 1
*READ SECTOR-3X3 RETRIES WITH JOGS
RDSECX JSR DCHECK CHECK PARAMETERS
 BCS RDRTN RETURN IF ERROR
 BSR RD3
 BCC RDRTN RETURN IF OK
 BEQ RDRTN RETURN IF DISK MISSING
 JSR TKIN JOG HEAD
 JSR TKOT
 JSR SETTLE
 BSR RD3
 BCC RDRTN RETURN IF OK
 BEQ RDRTN RETURN IF DISK MISSING
 JSR GTK0X HOME HEAD
 JSR SEEKX SEEK TRACK
 SPC 1
*READ THREE TIMES
RD3 LDAA #3
 STAA RETRY SETUP RETRY CNTR
 LDAA #$FB SET SYNC CODE
 STAA SYNC
READ JSR GTSEC GET SCTR
 BCS RDRTN BRANCH IF DISK MISSING (A=0)
 PSHA SAVE CCR
 LDAA #30 SHORT DELAY (180-200 USEC)
R1 DECA
 BNE R1
 LDAA RRSRT START RCVR
 BSR IN GET SYNC CHAR
 BCC RDERR BRANCH IF EMPTY SCTR
 BSR IN GET DRV & TRK
 TAB SAVE A COPY
 EORA TRK CK FOR PROPER TRK
 ANDA #TRKMSK
 BNE RDERR BR IF SEEK ERR (C IS SET)
 STAB TRK
 BSR IN
 CMPA SCTR CK FOR PROPER SCTR
 SEC SET ERROR FLAG
 BNE RDERR BR IF SEEK ERR
 LDX #BAKLNK GET REST OF HDR
 LDAB #8
 BSR INPUT
 LDX TW CHK FOR ALT TRGT
 CPX #$FFFF
 BNE R2
 LDX ADDRES
R2 LDAB BYTCNT
 BSR INPUT INPUT DATA
 STX TA SAVE LAST ADDRESS
 LDX #CKSUM INPUT CKSUM & POSTAMBLE
 LDAB #4
 BSR INPUT
 PULA RESTORE CCR (TURN ON INT)
 TAP
 LDX TW CHK FOR ALT TRGT
 CPX #$FFFF
 BNE R3
 LDX ADDRES
R3 BSR CRC CHECK CRC
 CPX CKSUM
 SEC
 BNE RDERRX BRANCH IF ERROR
 BSR TWTA
 CLC
 RTS
RDERR PULA RESTORE CCR
 TAP
RDERRX DEC RETRY
 BNE READ
 BSR TWTA
 LDAA #5 READ ERROR (A=5)
 BCS RDERTN
 LDAA #3 EMPTY SECTOR (A=3)
 SEC
RDERTN RTS
 SPC 1
TWTA LDX TW
 CPX #$FFFF
 BEQ R5
 LDX TA
R5 RTS
 SPC 1
IN LDAA STATUS
 RORA
 BCS IN1
 LDAA SECTOR STILL IN THIS SCTR?
 ANDA #$0F
 CMPA SCTR
 BEQ IN BR IF YES
 CLC
 RTS
IN1 LDAA RDDTA (CARRY IS SET)
 RTS
INPUT LDAA STATUS
 RORA
 BCC INPUT
 LDAA RDDTA
 STAA 0,X
 INX
 DECB
 BNE INPUT
 RTS
 SPC 1
*CALCULATE CRC CODE - TAKES 8 MSEC (1MHZ CLOCK)
CRC LDAB BYTCNT
 CLRA
 STAA XTEMP+1
 BSR CX
 LDX #TRK
 LDAB #$A
 BSR CX
 STAA XTEMP
 LDX XTEMP
 RTS
CX EORA 0,X
 ASLA
 ROL XTEMP+1
 BCC C1
 INCA
C1 INX
 DECB
 BNE CX
 RTS
 SPC 1
*WRITE A SECTOR
WTSECX JSR DCHECK SELECT AND CHECK DRIVE
 BCS WTERR
 LDAA #1
 BITA DVSTAT TEST WRITE PROTECT
 BNE WT1 BRANCH IF NOT PROTECTED
 SEC WRITE PROTECTED (A=1)
 RTS RETURN IF DISK PROTECTED
WT1 LDX TA
 BSR CRC
 STX CKSUM
 LDAA #$FF
 STAA FILL SET FILL WORD
 JSR GTSEC GET SCTR
 BCS WTERR BRANCH IF DISK MISSING (A=0)
 PSHA SAVE CONDITION CODE REGISTER
 STAA WRTPLS TURN ON WRITE
*WRITE THE LEADER
 LDAB #16 WRITE 16 NULL CODES
 CLRA
WS3 BSR OUT
 DECB
 BNE WS3
*WRITE THE SECTOR HEADER
 LDAA #$FB SYNC BYTE
 LDX #HEADER
 LDAB #$B
 BSR OUTPUT+2
*WRITE THE DATA
 LDX TA
 LDAB BYTCNT BYTE COUNT
 BSR OUTPUT
 STX TA
*WRITE THE POSTAMBLE
 LDX #CKSUM
 LDAB #4
 BSR OUTPUT
 PULA RESTORE CCR
 TAP
 CLC
WTERR RTS
 SPC 1
OUTPUT LDAA 0,X
 BSR OUT
 INX
 DECB
 BNE OUTPUT
 RTS
OUT PSHA
OUT1 LDAA STATUS
 BPL OUT1
 PULA
 STAA WRTDTA
 RTS
 SPC 1
*CHECK DISK PARAMETERS
DCHECK LDAA #2
 LDAB SCTR SECTOR = [0,S]
 CMPB #9
 BHI DCKER2 BRANCH IF ERROR
 LDAB TRK TRACK = [0,T]
 ANDB #TRKMSK MASK OFF DRIVE BITS
 CMPB #TRKLMT
 BLS DRIVE BRANCH IF OK
DCKER1 INCA DISK OVERRUN (A=4)
 INCA
DCKER2 SEC INVALID PARAMETER (A=2)
 RTS
 SPC 1
POS CLC
 ROLB
 ROLB
 ROLB
P1 INX
 DECB
 BPL P1
 RTS
 SPC 1
*SELECT DRIVE, START MOTOR, CHECK DISK, SEEK TRACK
DRIVE LDAA #$C0 DRIVE BITS MASK
 TAB
 ANDA DVSTAT GET CURRENT DRIVE #
 ANDB DRV GET DESIRED DRIVE #
 CBA COMPARE
 BNE D0 BRANCH IF NOT SAME
 LDAA CRNTRK CHECK IF DRIVE IS INITIALIZED
 COMA
 BEQ D1 BRANCH IF NOT
 BRA D2
D0 PSHB
 PSHB
 PSHA
 LDX #CRNTRK
 LDAA 0,X GET CURRENT TRK
 PULB FIND PROPER PIDGEON HOLE
 BSR POS
 STAA 0,X STORE CURRENT TRK
 LDX #CRNTRK RETRIEVE TRK FOR NEW DRV
 PULB
 BSR POS
 LDAA 0,X
 STAA CRNTRK
DA LDAA DVSTAT
 BITA #WRTBIT CHECK WRITE GATE
 BEQ DA WAIT UNTIL GATE TURNS OFF
 PULA SELECT NEW DRIVE
 STAA DRVSLT
D1 BSR DRVTST DISK MISSING TEST
 BCS D3 BRANCH IF DISK MISSING
 LDAA CRNTRK CHECK IF DRIVE IS ON LINE
 COMA
 BNE D2 BRANCH IF ON LINE
 JSR GTK0X RESTORE DRIVE
D2 BSR START START MOTOR
 BSR SEEKX SEEK TRACK
 CLC
D3 RTS
 SPC 1
* START MOTOR (DELAY IF NECESSARY)
START LDAA DVSTAT TEST MOTOR BIT
 BITA #MTRBIT
 BEQ START1 BRANCH IF ALREADY ON
 TST MOTON TRIGGER MOTOR ONE-SHOT
 LDX #1000 SET UP ONE SEC DELAY
 JSR DELAY
START1 TST MOTON RETRIGGER MOTOR
 RTS
 SPC 1
* CHECK IF DISK MISSING
DRVTST BSR START START MOTOR
 LDX #0 SET TIME LIMIT (1 SEC)
 LDAB #11 SECTORS TO SYNC COUNTER
 LDAA #SECBIT SECTOR BIT MASK
DVTST1 BITA DVSTAT SECTOR PULSE=0?
 BEQ DVTST2
 DEX CHECK TIME LIMIT
 BNE DVTST1
 BRA DVTST3 BRANCH IF TIME LIMIT
DVTST2 BITA DVSTAT SECTOR PULSE=1?
 BNE DVTST4 BRANCH IF YES
 DEX CHECK TIME LIMIT
 BNE DVTST2
DVTST3 LDAA #$FF DISK MISSING
 STAA CRNTRK FLAG DRIVE OFF LINE
 COMA THIS CLEARS A AND SETS CARRY
 RTS
DVTST4 DECB END OF TEST?
 BNE DVTST1 BRANCH IF NOT
 CLC DRIVE IS READY
 RTS
 SPC 1
* LOCATE DESIRED SECTOR AND MASK INTERRUPT
GTSEC LDX #$6FFF SET TIME LIMIT (1 SEC)
 BRA GT2
GT1 PULA RESTORE CCR
 TAP
 DEX DISK MISSING TIME OUT
 BEQ DVTST3 DISK MISSING
GT2 TPA SET INTERRUPT MASK
 PSHA
 NOP
 SEI
 LDAA #SECBIT IS ONE-SHOT OFF?
 BITA DVSTAT
 BEQ GT1 BRANCH IF NOT
 LDAA SCTR GET DESIRED SECTOR
 DECA SET TO N-1
 BPL GT3
 LDAA #9 FORCE SECTOR 9
GT3 LDAB SECTOR ARE WE IN SECTOR N-1?
 ANDB #$0F
 CBA
 BNE GT1 BRANCH IF NOT
 LDAA #SECBIT IS ONE-SHOT STILL ON?
 BITA DVSTAT
 BEQ GT1 BRANCH IF NOT
GT4 BITA DVSTAT ARE WE IN SECTOR N?
 BNE GT4 LOOP UNTIL WE ARE
 PULA
 CLC
 RTS
 SPC 1
* LOCATE DESIRED TRACK
SEEKX LDAB TRK
 ANDB #TRKMSK
 CMPB CRNTRK
 BEQ S2
 BLS STPOUT
STPIN BSR TKIN
 INC CRNTRK
 CMPB CRNTRK
 BNE STPIN
 BRA SETTLE
STPOUT BSR TKOT
 DEC CRNTRK
 CMPB CRNTRK
 BNE STPOUT
SETTLE STX XTEMP
 LDX #15 15 MSEC DLY
 BSR DELAY
 LDX XTEMP
S2 RTS
 SPC 1
*GO TO TRK 0 (HOME-RESTORE HEAD)
GTK0X BSR TKIN
 BSR TKIN
 BSR TKIN
G0 BSR TKOT
 LDAA DVSTAT
 RORA
 RORA
 BCS G0
 CLR CRNTRK
 BRA SETTLE
TKOT BSR RDRV
 BRA T1
TKIN BSR RDRV
 ORAA #$10 SET DIR BIT
T1 ORAA #$20 SET STEP BIT
 STAA DVSTAT
 ANDA #$DF RESET STP BIT
 STAA DVSTAT
 STX XTEMP
 BSR DEL
 LDX XTEMP
 RTS
RDRV TST MOTON RETRIGGER MOTOR
RDRVWT LDAA DVSTAT
 BITA #WRTBIT CHECK WRITE GATE
 BEQ RDRVWT WAIT UNTIL GATE TURNS OFF
 ANDA #$CF GET DRV
 RTS
 FCB $FF,$FF,$FF,$FF UNUSED BYTES
 SPC 1
DEL LDX #25 25 MSEC DELAY
*DELAY ONE MSEC PER INC OF X REG
DELAY PSHA
DLY1 LDAA #166 ADJUST FOR CPU CLOCK
DLY2 DECA
 BNE DLY2
 DEX
 BNE DLY1
 PULA
 RTS
 SPC 1
*CALCULATE FWD LNK
FWDCLX LDAA FWDLNK+1 GET SCTR
 CMPA #8
 BEQ F2 BRANCH IF SCTR 8
 BHI F1 BR IF SCTR 9
 ADDA #2
 BRA F3
F1 INC FWDLNK INC FWD TRK
 CLRA
 BRA F3
F2 LDAA #1
F3 STAA FWDLNK+1 UPDATE FWD SCTR
F4 CLC
F5 RTS
 SPC 1
*LOAD A MEMORY IMAGE FILE
LOADX JSR RDSECX LOAD A FILE
 STX TW
 BCS F5
 LDX FWDLNK CK FOR LST BLK
 BEQ F5 (CARRY IS CLEAR)
 STX TRKSEC SETUP NEXT TRACK AND SECTOR
 LDX TW POTENTIAL DINOSAUR
 BRA LOADX
 SPC 1
*SAVE A MEMORY IMAGE FILE
SAVEX LDX #0 CLEAR BACK LINK
 STX BAKLNK BK LNK
 STX POSTAM CLEAR POSTAMBLE
 LDX TRKSEC
 STX FWDLNK
W3 BSR FWDCLX CALC FWD LNK
 LDX TA
 STX ADDRES TARGET ADDRESS
 JSR LNTH CALCULATE BLK LNTH
W4 JSR WTSECX WRITE SECTOR
 BCS F5 BRANCH IF ERROR
 LDX TA
 DEX
 CPX ENDA
 BEQ F4 BRANCH IF YES
 LDX TRKSEC SETUP BACK LINK
 STX BAKLNK
 LDX FWDLNK SETUP NXT TRK/SEC
 STX TRKSEC
 BRA W3
 SPC 1
SAV BSR IN4HS GET BEG ADD
 STX TA INIT CONT ADD
 BSR IN4HS GET END ADD
 STX ENDA
 BSR IN4HS GET EXEC ADD
 STX EXEC
 BSR INDTS GET DRIVE & SECTOR
 BCS TYPERX
 CLR FILTYP INIT HEADER
 BSR CRLF
 BSR SAVEX
* REPORT LAST SECTOR USED
 BCS TYPERX
RPTSEX LDX #LSTSEC
 BSR PD
 LDAB TRK GET TRK
 ANDB #TRKMSK MASK OFF DRV
 CLRA
 BRA LS1 CONVERT BINARY TO DEC
LS2 INCA
LS1 SUBB #10
 BPL LS2
 ADDB #10
 JSR OUTHR
 TBA
 JSR OUTHR
 LDAA SCTR
 LSRA CONVERT ALT SCT TO SEQ SEC
 BCC LS3
 ADDA #5
LS3 JSR OUTHR
LS4 RTS
 SPC 1
ER FCC /***ERROR /
 FCB 4
MCRLF FCB $0D,$0A,0,0,4
 SPC 1
*TYPE OUT ERROR MESSAGES
TYPERX PSHA
 LDX #ER
 BSR PD
 PULA
 JMP OUTHR
 SPC 1
IN4HS JSR OUTS
 JMP BADDR
 SPC 1
* OUTPUT CR-LF
CRLF LDX #MCRLF POINT TO CRLF MSSG
PD JMP PDATA1
 SPC 1
*INPUT & CONVERT DTS
INDTS BSR IN4HS
CVTDTS STX TRKSEC SAVE DSSS IN TRK-SEC TEMPORARILY
 LDAA SCTR GET LS SEC DIG
 TAB SAVE COPY
 ANDB #$F ISOLATE REAL SECTOR
 CMPB #9 CK FOR INVALID SECTOR
 BHI INVSEC
*CONVERT SEQ SCTR TO ALT SCTR
 CMPB #4 LESS THAN 4?
 BLS W1 DO IT DIFFERENTLY
 SUBB #5
 ASLB MULT BY 2
 INCB ADD 1
 BRA W2
W1 ASLB MULT BY 2
W2 STAB SCTR STORE SECTOR
 LSRA GET NEXT DIGIT
 LSRA INTO POSITION
 LSRA
 LSRA
 CMPA #9 CK FOR INVALID NUMBER
 BHI INVSEC
 LDAB TRK GET DRV & MS SCTR DIG
 ASLB DEC TO BIN CONVERT
 ASLB 4B+A+4B+2B=10B+A
 STAB DRV STORE DRIVE NUMBER
 ANDB #$3C
 ABA
 ABA
 LSRB
 ABA
 STAA TRK
 CLC
 RTS
INVSEC LDAA #2 INVALID SCTR MSG
 SEC
 RTS
 SPC 1
* MINIDOS COMMAND PROCESSOR
MINDOS LDS #STACK
 LDAA $C400 CHK FOR ROM EXTENSION
 CMPA #$7E
 BNE MIN0
 JSR $C400 JUMP TO IT
MIN0 JSR INITRK INITIALIZE TRACK REGISTERS
 BSR MIN2
MIN1 JMP MONITR
MIN2 JSR INEEE INPUT COMMAND
 CMPA #'L
 BEQ LOD
 CMPA #'S
 BNE MIN1
 JMP SAV
LOD BSR INDTS GET DISK LOCATION
 BCS TYPERX
 BSR IN4HS GET TARGET ADDRESS
 STX TW
 BSR CRLF
 JSR LOADX LOAD BINARY FILE
 BCS TYPERX
 LDX POSTAM
 CPX #$FFFF
 BEQ MIN3
 STX XFER
MIN3 RTS
 SPC 1
*CALCULATE BLOCK LENGTH
LNTH LDAA ENDA+1
 SUBA ADDRES+1 TARGET ADDRESS LSB
 LDAB ENDA
 SBCB ADDRES TARGET ADDRESS MSB
 BEQ L1 LAST BLK IF B=0
 CLRA
 STAA BYTCNT BYTE COUNT
 RTS
L1 INCA
 STAA BYTCNT
 CLRA CLEAR FWD LNK
 STAA FWDLNK
 STAA FWDLNK+1
 LDX EXEC GET EXECTION ADDRESS
 STX POSTAM SINCE THIS IS LAST BLK
 RTS
 SPC 1
LSTSEC FCC /LST SEC=/ LAST SECTOR MESSAGE
 FCB 4
 END
