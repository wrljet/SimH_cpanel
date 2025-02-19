* NAM SWTPDK
*
* DISK DRIVERS FOR SOUTHWEST TECHNICAL PRODUCTOS
*
* MODIFIED BY ROBERTO SANCHO TO SUPPORT MF68 DISKS ON SWTPC SIMH EMULATION
* APR/2022
*
* DISK GEOMETRY: 35 TRACKS X 18 SECTORS X 128 BYTES
* TRACK 0 HAS SECTORS NUMBERED 0,2..18 (NO SECTOR ONE, FIRST SECTOR IS ZERO).
* TRACK 1..34 HAS SECTORS NUMBERED 1,2..18
* THIS IS THE SAME LAYOUT AS FLEX 1.0 ON MF68 
*
* TRACK 0: SECTOR 0,2,3: HOLDS BOOT PROGRAM
* TRACK 0: SECTOR 4..18: DIRECTORY
* TRACK 1..34: DATA SECTORS FOR FILES
*
* FC1771 COMMANDS
*
FDRSC  EQU $0B    RESTORE
FDSKI  EQU $1B    SEEK
FDRDC  EQU $8C    READ A SECTOR
FDWRC  EQU $AC    WRITE A SECTOR

DRVREG EQU $8014  DRIVE REGISTER
CMDREG EQU $8018  COMMAND REGISTER  
TRKREG EQU $8019  TRACK REGISTER
SECREG EQU $801A  SECTOR REGISTER
DATREG EQU $801B  DATA REGISTER
*
* FCB DEFINITIONS:
*
FCBSTA EQU 5  STATUS 
FCBDBA EQU 7  DATA BUFFER ADDRESS
FCBDRV EQU 9  DRIVE#
FCBTRK EQU 10 TRACK# 
FCBSCT EQU 11 SECTOR# 
*
* USER REGISTERS
*
UA     EQU 6  RETURN "A"
UXH    EQU 7  X-REG (FCBADR)
*
*
CTRK0  EQU 0        
CTRK1  EQU 1        
CTRK2  EQU 2        
CTRK3  EQU 3        
CDRIV  EQU 4        
RCNT   EQU 5        
*
* START ADDRESS OF DISK DRIVER FOR MF68
*
       ORG $1D5A
*
* ENTRY POINTS
*
INTDK  JMP INTDK0     INIT DISK
COLD   JMP COLD0      COLD START
RDSEC  JMP RDSEC0     READ SECTOR
WTSEC  JMP WTSEC0     WRITE SECTOR
*
* COLD START. INIT SWTBUG SYSTEM
*
COLD0  LDX #$0103     SET SWI JMP VECTOR FOR SWTBUG
       STX $A012      
       LDX #$8004     SET SWTBUG ACIA ADDRESS
       STX $04C4       
       JMP $07C1      CP68 COLD START      
*
* INIT THE DISK SYSTEM
*
INTDK0 LDA A #$FF
       STA A CTRK0       
       STA A CTRK1
       STA A CTRK2       
       STA A CTRK3
       CLR CDRIV
       RTS       
*
* READ A SECTOR
*
RDSEC0 SWI TABX       GET FCBADR
        FCB 3       
       LDA A FCBDRV,X GET DRIVE#
       LDX #CTRK0     POINT TO TRACK TABLE
       SWI ADDAX      ADD OFFSET
        FCB 9
       LDA B 0,X      GET ENTRY
       CMP B #$FF     INITIALIZED?
       BNE RDSEC1     YES
*
       JSR RESTOR     SEEK TRACK0
       BCS QUIT10     ERROR
*
RDSEC1 JSR DRIVE
       BCS QUIT10     ERROR
*
       LDA A #5
       STA A RCNT
*
RDSEC2 TSX
       LDX UXH,X      GET FCBADR
       LDA A FCBTRK,X GET TRACK#        
       LDA B FCBSCT,X GET SECTOR
       LDX FCBDBA,X   GET BUFFER ADRESS
*
       JSR READ       GET A SECTOR
       BEQ QUIT10     OK
*
       DEC RCNT       RETRY AGAIN?
       BNE RDSEC2     YES
       BRA QUIT
*
* WRITE A SECTOR
*
WTSEC0 SWI TABX          X=FCBADR
        FCB 3
       LDA A FCBDRV,X GET DRIVE#
       LDX #CTRK0     POINT TO TABLE
       SWI ADDAX         ADD OFFSET
        FCB 9
       LDA B 0,X      GET ENTRY
       CMP B #$FF     INITIALIZED?
       BNE WTSEC1     YES      
* 
       JSR RESTOR     
       BCS QUIT10     
*
WTSEC1 JSR DRIVE
       BCS QUIT10     
*
       LDA A #5
       STA A RCNT
*
WTSEC2 TSX
       LDX UXH,X      GET FCBADR
       LDA A FCBTRK,X GET TRACK#        
       LDA B FCBSCT,X GET SECTOR
       LDX FCBDBA,X   GET BUFFER ADRESS
*
       JSR WRITE
       BEQ QUIT10     OK
*
       DEC RCNT       TRY AGAIN?
       BNE WTSEC2     YES
*
QUIT   TST A          OK?
       BEQ QUIT10     YES
*
       LDA A #5       ERROR
*
QUIT10 TSX
       STA A UA,X     STORE RC IN USER A-REG
       LDX UXH,X      GET FCBADR
       ORA A FCBSTA,X
       STA A FCBSTA,X
       RTS
*
*
* READ A SECTOR (A=TRK, B=SECTOR)
*
READ   JSR SEEK
       LDA A #FDRDC   READ
       STA A CMDREG
       JSR DEL30U     DELAY
       LDA B #128     128 BYTES/SECTOR     
*
READ1  LDA A CMDREG
       BIT A #$02     DATA REG FULL?
       BNE READ2      YES
*
       BIT A #1       BUSY?
       BNE READ1      YES
*
       BRA READ3      ERROR
*
READ2  LDA A DATREG   GET A BYTE
       STA A 0,X      STORE IN BUFFER
       INX
       DEC B
       BNE READ1      DO AGAIN
*
       BSR WBUSY      WAIT TILL DONE
*
READ3  AND A #$1C     MASK OF STATUS BITS
       RTS
*
WBUSY  LDA A CMDREG
       BIT A #1       BUSY?
       BNE WBUSY      YES
*
       RTS
*
* WRITE A SECTOR (A=TRK, B=SECTOR, X=DATA BUFFER)
*
WRITE  JSR SEEK
       LDA A #FDWRC   WRITE COMMAND
       STA A CMDREG
       JSR DEL30U
       LDA B #128     128 BYTES/SECTOR
*
WRITE1 LDA A CMDREG
       BIT A #2       REG EMPTY?
       BNE WRITE2     YES
*
       BIT A #1       BUSY?
       BNE WRITE1     YES
*
       BRA WRITE2     ERROR
*
WRITE2 LDA A 0,X      GET A BYTE
       STA A DATREG
       INX
       DEC B
       BNE WRITE1     DO AGAIN
*
       JSR WBUSY      WAIT FOR BUSY
*
WRITE3 AND A #$5C     MASK OFF STATUS BITS
       RTS
*
* SEEK TRACK IN A-REG
*
SEEK   CMP A TRKREG   ON TRACK?
       BEQ SEEK2      YES
*
       STA A DATREG   NO, STORE TRACK#
       JSR DEL30U
       LDA A #FDSKI   SEEK COMMAND
       STA A CMDREG
       JSR DEL30U
       JSR WBUSY      WAIT FOR BUSY
*
SEEK2  STA B SECREG   SET SECTOR
       JSR DEL30U
       RTS
*
* DELAY 30 USECS
*
DEL30U INX
       DEX
       INX
       DEX
       INX
       DEX
       INX
       DEX
       RTS
*
* DELAY ONE SECOND
*
DEL1S  SWI PSHX
        FCB 5
       PSH A
       LDA A #2
       LDX #0000
*
DEL1SA INX
       BNE DEL1SA
*
       DEC A
       BNE DEL1SA
*
       PUL A 
       SWI PULX
        FCB 6
       RTS
*
* TURN ON MOTORS (A=UNIT#)
*
MOTOR  LDA B CMDREG
       AND B #$80     READY?
       BEQ MOTOR1     YES
*
       JSR DEL1S      DELAY A SECOND
*
       LDA B CMDREG
       AND B #$80     READY?
       BEQ MOTOR1     YES
*
       LDA A #10      ERROR CODE
       SEC
       RTS
*
MOTOR1 CLC
       RTS
*
* DRIVE SELECT (A=DRIVE#)
*
DRIVE  AND A #3
       PSH A
       BSR DSEL1
       BSR MOTOR
       BCS DRIV1
*
       LDA B TRKREG   GET CURRENT TRACK
       STA B 0,X      SAVE IN TABLE
       STA A DRVREG   INIT REGISTER
       STA A CDRIV    NEW CURRENT DRIVE
       BSR DSEL1
       LDA A 0,X      GET CURRENT TRK
       STA A TRKREG
       JSR DEL30U
DRIV1  PUL A
       RTS
*
DSEL1  LDX #CTRK0     POINT TO TABLE
       LDA B CDRIV
       BEQ DSEL3
*
DSEL2  INX
       DEC B
       BNE DSEL2
*
DSEL3  RTS
*
* RESTORE SEEK TRACK0 (X=CTRLx)
*
RESTOR PSH A
       JSR DRIVE
       BCS RESTR1     ERROR  
*
       LDA A #FDRSC   RESTORE COMMAND
       STA A CMDREG
       JSR DEL30U
*
       JSR WBUSY
       CLR 0,X        CTRKx:=00
       CLC
*
RESTR1 PUL A
       RTS
*
       END
*
