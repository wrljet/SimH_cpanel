//HLOANSCB  JOB CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1)
//HELOWRLD EXEC COBUCLG,PARM.COB='MAP,LIST,LET'
//COB.SYSIN DD *
  001  IDENTIFICATION DIVISION.
  002  PROGRAM-ID.  'HELLO'.
  003  ENVIRONMENT DIVISION.
  004  CONFIGURATION SECTION.
  005  SOURCE-COMPUTER.  IBM-360.
  006  OBJECT-COMPUTER.  IBM-360.
  0065 SPECIAL-NAMES.
  0066     CONSOLE IS CNSL.
  007  DATA DIVISION.
  008  WORKING-STORAGE SECTION.
  009  77  HELLO-CONST   PIC X(21) VALUE 'Hello World ANS COBOL'.
  075  PROCEDURE DIVISION.
  090  000-DISPLAY.
  100      DISPLAY HELLO-CONST UPON CNSL.
  110      STOP RUN.
//LKED.SYSLIB DD DSNAME=SYS1.COBLIB,DISP=SHR
//            DD DSNAME=SYS1.LINKLIB,DISP=SHR
//SYSUT1    DD UNIT=SYSDA
//GO.SYSPRINT DD SYSOUT=A
//
