//G09GEN1 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC ASMS,OBJ=OBJPDS1,MOD=IEAPGSPP,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAPGPP SCHDB7=1,PAGXB13=(0,0,1,1,1,1),CPRNA=16
 END
/*
//SG2 EXEC ASMS,OBJ=OBJPDS1,MOD=IEAPGSDR,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAPGDR CPRNA=16
 END
/*
//SG3 EXEC ASMS,OBJ=OBJPDS1,MOD=IEAPGSRC,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAPGRC SCHDB7=1
 END
/*
//SG4 EXEC ASMS,OBJ=OBJPDS1,MOD=IEATSAR,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAPGTS VM=1
 END
/*
//SG5 EXEC ASMS,OBJ=OBJPDS1,MOD=IEAPGSDD,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAPGDD ASSIST=NO
 END
/*
//SG6 EXEC ASMS,OBJ=OBJPDS1,MOD=IEAPGSFF,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAPGFF ASSIST=NO
 END
/*
//SG7 EXEC ASMS,OBJ=OBJPDS1,MOD=IEAPGSPM,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAPGPM ASSIST=NO
 END
/*
//SG8 EXEC ASMS,OBJ=OBJPDS1,MOD=IGC018,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 SGIEC0DT YES,NO,1,1,TYPE=(0,0,0,0,0,0,0,1,1,1,1,0,1)
         END
/*
//SG9 EXEC ASMS,OBJ=OBJPDS1,MOD=IFGDEBCK,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 SGDEBCHK DEBTSIZ=80,DEBTINC=80
 END
/*
//SG10 EXEC ASMS,OBJ=OBJPDS1,MOD=IEACVTPC,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEACVTPC 1,EXT,C
         END
/*
//SG11 EXEC ASMS,OBJ=OBJPDS1,MOD=IEA0TI00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEAQTI SMF,EXT,NODYD
         END
/*
//SG12 EXEC ASMS,OBJ=OBJPDS1,MOD=IEA0ST01,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEA0ST SMF,EXT
         END
/*
//SG13 EXEC ASMS,OBJ=OBJPDS1,MOD=IEA0RT01,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEA0RT SMF,EXT
         END
/*
//SG14 EXEC ASMS,OBJ=OBJPDS1,MOD=IEFAB403,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         SGIEF043 0,1
         END
/*
//SG15 EXEC ASMS,OBJ=OBJPDS1,MOD=IEE3203D,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         SGIEE0VR 0,1,0,1
         END
/*
//SG16 EXEC ASMS,OBJ=OBJPDS1,MOD=IEECUCB,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IEEUCMC CSECT
 IEECUCM (01F,                                                         X
               010),                                                   X
               (01,                                                    X
               51),                                              XXXXXXXXXXXXX
               (WAXA,                                                  R
               WAXN),F,                                           XXXXXXXXXXXXXX
               (0,                                                     X
               E),                          X02007                    XXX
               (F,                          X02007                    XXX
               F),REPLY=40,BUFFERS=200, 02022                       XXXXXXXXX
               EXIT=USEREXIT,                                          D
               MCS=MCS,                          X02893                I
               MASTCON=01F,                                            C
               ROUTCDE=(FFDF,                                          E
               FFFF),                                                  A
               HARDCDE=FFFF,                                           D
               OLDWCDE=4000,                                           I
               ALTCON=(010,                                            C
               01F),                                                   X
               HARDCPY=(SYSLOG,CMDS,HCPY),                        XXXXXXXXX
               AUTH=(E0,                                               X
               E0),                                                    X
               COMPCON=(FFF,                                           X
               FFF),                                                   O
               ALTCOMP=(FFF,                                           H
               FFF)
         END
/*
//SG17 EXEC ASMS,OBJ=OBJPDS1,MOD=IFBCTA00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 SGIFB000  0000000000000000
 END
/*
//SG18 EXEC ASMS,OBJ=OBJPDS1,MOD=IEASVC00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IHASVC00 CSECT
         ENTRY SVPRFX,SVCTBL,SVLMT,SVCTYP2
         SPACE 3
         USING *,6
ISVCEXIT DS    0H
         LH    1,IHSVCC+2              LOAD INVALID SVC NUMBER
         SLL   1,12                    AND USE IT TO BUILD
         O     1,KABEND                ABEND CODE
         SPACE 1
         L     8,ATYPE1SW              RESET TYPE ONE SVC
         MVI   1(8),0                  INDICATOR
         SPACE 1
         L     8,ASVCSAV               RELOAD WORK REGS AND
         LM    8,11,32(8)              ISSUE ABEND
         SVC   13                      *
         SPACE 1
ASVCSAV  DC    V(SVCSAV)               ADDRESS OF SVC SAVE AREA
ATYPE1SW DC    V(SVF)                  ADDRESS OF TYPE 1 SVC FLAG
KABEND   DC    X'80F00000'             USED TO GEN ABEND CODE
IHSVCC   EQU   136                     ADDRESS OF SVC CODE AREA
         EJECT
SVPRFX   DS    0F
         DC    AL1(1,2,3,4,5,6,25,26,27,28,7,8)
         DC    AL1(29,49,30,9,50,51,31,52,53,54,55,56)
         DC    AL1(57,58,59,60,61,62,63,64,65,66,67,68)
         DC    AL1(69,32,0,70,33,34,35,71,72,36,10,37)
         DC    AL1(38,0,0,73,74,75,39,76,40,77,41,78)
         DC    AL1(79,0,80,81,82,0,83,42,84,85,0,0)
         DC    AL1(86,0,0,0,87,88,89,11,0,90,91,92)
         DC    AL1(0,93,94,95,96,97,98,99,0,0,0,0)
         DC    AL1(0,0,100,0,0,0,12,101,102,103,0,13)
         DC    AL1(104,43,0,44,14,15,16,17,18,45,0,19)
         DC    AL1(0,0,46,0,105,20,0,0,0,0,0,0)
         DC    AL1(0,0,0,0,0,0,0,0,0,0,0,0)
         DC    AL1(0,0,0,0,0,0,0,0,0,0,0,0)
         DC    AL1(0,0,0,0,0,0,0,0,0,0,0,0)
         DC    AL1(0,0,0,0,0,0,0,0,0,0,0,0)
         DC    AL1(0,0,0,0,0,0,0,0,0,0,0,0)
         DC    AL1(0,0,0,0,0,0,0,0,0,0,0,0)
         DC    AL1(0,0,0,0,0,0,0,0,0,21,22,0)
         DC    AL1(47,48,0,0,0,0,0,0,0,0,0,106)
         DC    AL1(107,0,0,108,0,0,109,0,0,0,0,0)
         DC    AL1(0,0,110,0,0,0,0,0,111,112,0,23)
         DC    AL1(0,0,0,24)
SVCTBL   DS    0F
         DC    AL1(0)
         DC    AL3(ISVCEXIT)
         EXTRN IGC000
         DC    AL1(0)
         DC    AL3(IGC000+0)
         EXTRN IGC001
         DC    AL1(64+128+0)
         DC    AL3(IGC001)
         EXTRN IGC002
         DC    AL1(64+128+0)
         DC    AL3(IGC002)
         EXTRN IGC003
         DC    AL1(64+128+0)
         DC    AL3(IGC003)
         EXTRN IGC004
         DC    AL1(64+128+0)
         DC    AL3(IGC004)
         EXTRN IGC005
         DC    AL1(64+128+0)
         DC    AL3(IGC005)
         EXTRN IGC010
         DC    AL1(64+128+0)
         DC    AL3(IGC010)
         EXTRN IGC011
         DC    AL1(64+128+0)
         DC    AL3(IGC011)
         EXTRN IGC015
         DC    AL1(0+0+0)
         DC    AL3(IGC015)
         EXTRN IGC046
         DC    AL1(64+128+0)
         DC    AL3(IGC046)
         EXTRN IGC079
         DC    AL1(64+128+0)
         DC    AL3(IGC079)
         EXTRN IGC102
         DC    AL1(64+128+0)
         DC    AL3(IGC102)
         EXTRN IGC107
         DC    AL1(0+0+0)
         DC    AL3(IGC107)
         EXTRN IGC112
         DC    AL1(64+128+0)
         DC    AL3(IGC112)
         EXTRN IGC113
         DC    AL1(64+128+0)
         DC    AL3(IGC113)
         EXTRN IGC114
         DC    AL1(64+128+0)
         DC    AL3(IGC114)
         EXTRN IGC115
         DC    AL1(64+128+0)
         DC    AL3(IGC115)
         EXTRN IGC116
         DC    AL1(64+128+0)
         DC    AL3(IGC116)
         EXTRN IGC119
         DC    AL1(64+128+0)
         DC    AL3(IGC119)
         EXTRN IGC125
         DC    AL1(64+128+0)
         DC    AL3(IGC125)
         EXTRN IGC213
         DC    AL1(64+0+1)
         DC    AL3(IGC213)
         EXTRN IGC214
         DC    AL1(64+0+0)
         DC    AL3(IGC214)
         EXTRN IGC251
         DC    AL1(64+0+0)
         DC    AL3(IGC251)
         EXTRN IGC255
         DC    AL1(64+0+0)
         DC    AL3(IGC255)
SVCTYP2  EQU   *
         EXTRN IGC006
         DC    AL1(64+0+1)
         DC    AL3(IGC006)
         EXTRN IGC007
         DC    AL1(64+0+1)
         DC    AL3(IGC007)
         EXTRN IGC008
         DC    AL1(64+0+1)
         DC    AL3(IGC008)
         EXTRN IGC009
         DC    AL1(64+128+0)
         DC    AL3(IGC009)
         EXTRN IGC012
         DC    AL1(64+128+0)
         DC    AL3(IGC012)
         EXTRN IGC014
         DC    AL1(64+128+0)
         DC    AL3(IGC014)
         EXTRN IGC018
         DC    AL1(64+0+1)
         DC    AL3(IGC018)
         EXTRN IGC037
         DC    AL1(64+0+1)
         DC    AL3(IGC037)
         EXTRN IGC040
         DC    AL1(64+128+0)
         DC    AL3(IGC040)
         EXTRN IGC041
         DC    AL1(64+128+0)
         DC    AL3(IGC041)
         EXTRN IGC042
         DC    AL1(64+128+0)
         DC    AL3(IGC042)
         EXTRN IGC045
         DC    AL1(64+0+1)
         DC    AL3(IGC045)
         EXTRN IGC047
         DC    AL1(64+128+0)
         DC    AL3(IGC047)
         EXTRN IGC048
         DC    AL1(64+128+1)
         DC    AL3(IGC048)
         EXTRN IGC054
         DC    AL1(64+128+0)
         DC    AL3(IGC054)
         EXTRN IGC056
         DC    AL1(64+128+1)
         DC    AL3(IGC056)
         EXTRN IGC058
         DC    AL1(64+0+0)
         DC    AL3(IGC058)
         EXTRN IGC067
         DC    AL1(64+128+0)
         DC    AL3(IGC067)
         EXTRN IGC109
         DC    AL1(64+0+0)
         DC    AL3(IGC109)
         EXTRN IGC111
         DC    AL1(64+0+1)
         DC    AL3(IGC111)
         EXTRN IGC117
         DC    AL1(64+0+0)
         DC    AL3(IGC117)
         EXTRN IGC122
         DC    AL1(64+0+0)
         DC    AL3(IGC122)
         EXTRN IGC216
         DC    AL1(64+0+0)
         DC    AL3(IGC216)
         EXTRN IGC217
         DC    AL1(64+0+1)
         DC    AL3(IGC217)
SVLMT    DS    0H
         DC    AL2(0,3,0,0,3,0,0,3,0,0,1,8,0,1,8)
         DC    AL2(0,1,8,0,1,8,0,1,8,0,1,0,0,1,8)
         DC    AL2(0,1,8,0,1,8,0,1,8,0,1,8,0,1,8)
         DC    AL2(0,1,8,0,1,8,0,3,0,0,3,0,0,1,8)
         DC    AL2(0,3,0,0,1,8,0,3,0,0,3,0,0,3,0)
         DC    AL2(0,1,8,0,1,8,0,1,8,0,1,8,0,1,8)
         DC    AL2(0,3,0,0,3,0,0,1,8,0,1,8,0,1,8)
         DC    AL2(0,1,8,0,1,8,0,1,8,0,3,0,0,3,0)
         DC    AL2(0,1,8,0,1,8,0,3,0,0,1,8,0,1,0)
         DC    AL2(0,3,0,0,1,8,0,3,0,0,3,0,0,3,0)
         DC    AL2(0,1,8,0,3,0,0,1,8,0,1,8,0,3,0)
         DC    AL2(0,3,0,0,1,8,0,1,8,0,1,8,0,1,8)
         DC    AL2(0,1,0,0,1,0,0,1,8,0,1,8)
         END
/*
//SG19 EXEC ASMS,OBJ=OBJPDS1,MOD=IEECVH1,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IEECVH1   CSECT
      IEECRDCM DEV=D,                                            CCCCCCCCCCC
               A=(14,                                               CATCHALL
               )
 END
/*
//SG20 EXEC ASMS,OBJ=OBJPDS1,MOD=DCM010,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
DCM010 CSECT
         IEECDCM DEVICE=D,USE=FC
         END
/*
//SG21 EXEC ASMS,OBJ=OBJPDS1,MOD=IEECVSUB,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IEECVSUB CSECT
 IEECSUB N,N,Y,N,N
 END
/*
//SG22 EXEC ASMS,OBJ=OBJPDS1,MOD=IEAANIP0,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IEAANIP0  START
 IEAANIP 1,1,1,65536,                                       *******************
               0,0,1,0,                                            **********
               1,0,0,SLOG,1,1,0,0,                                 *********
               0,00400,00200,00010,0,1,                            *********
               'AUTO=(WARM,LIST)    ',                            *********
               192,01011100,16384,1,1032,0,1,00,100,0,0,1
         END
/*
//SG23 EXEC ASMS,OBJ=OBJPDS1,MOD=IEASPL,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEASPLM 1,1,0,                                                *
               1,0,0,                                                  *
               0,0,1,                                                  *
               1,1,1,                                                  *
               1,0,0,                                              *****
               0,0,1,                                              *****
               100,0,0,                                              *****
               1,16,1,                                              *****
               0,1,0,1,                                            *****
               1,1,1,1,1,0,0,1,0
         END
/*
//G09GEN2 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC ASMS,OBJ=OBJPDS3,MOD=IEAASU00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAAIH 16,25,49,Y,Y,Y,SMF,XTIME,NSLICE,DDNO,VME=Y,SVCS=Y,VS1A=N
IQAPFXLP EQU 0
IQAPFXPC EQU 0
IQAPFXPP EQU 0
IQAPFXSV EQU 0
 IEAAPS 16,YFLT,Y,NSLICE,SMF,DDNO,XTIME,VME=Y,VS1A=N,GSI=N
         IEAPGEX PARTNUM=16,SVHI=25,VME=Y,TIMER=EXT,VS1A=N
         END
/*
//SG2 EXEC ASMS,OBJ=OBJPDS3,MOD=IQADSV00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IQADSV00 CSECT
         DS    D
         END
/*
//SG3 EXEC ASMS,OBJ=OBJPDS3,MOD=IQARI100,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IQARI100 CSECT
       ENTRY IQARIH01
       ENTRY IQAPRB
IQAPRB DS    0D
       DC    CL8'IQAINI00'
       DC    X'0004'
       DC    X'0190'
       DS    CL1
       DC    XL3'0'
       DC    X'040C0000'
       DC    A(0)
       DS    CL4
       DC    X'01'
       DC    VL3(IEADSS)
IQARIH01 EQU   *
       LPSW  8
         END
/*
//SG4 EXEC ASMS,OBJ=OBJPDS3,MOD=IQAPF100,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IQAPF100 CSECT
         DS   D
         END
/*
//SG5 EXEC ASMS,OBJ=OBJPDS3,MOD=IEAIOS00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IEAIOS00 CSECT
         AGO   .GBL      SET UP GLOBALS
.IOSTART ENTRY IECIOS
         ENTRY IECIOS0
IECIOS0  DS    H
IECIOS  DS  0D
         AGO   .UCB1     TO FIRST UCB
.RQE     ANOP            RQE AND STST TAB
 IECIOQE 100,0,0,1
         AGO   .IECIOS
.TAB1   ANOP         LOOK UP UCB TAB
UCBTAB   DS    0C         THIS IS THE LOOK UP TAB
IECILK1  DS    0C
 IECULK1 8,0,0,0,0,0,0
         AGO   .TAB2     TO NEXT CHANNEL ENTRY
.TCU1   IECULK2 24,0,0,8,1,0,1
         AGO   .TCU2       TO NEXT ENTRY
.LST1 ANOP   UCB LOOKUP ENTRY
LIST     DS    0H       THIS IS THE LIST OF UCB ADDS
IECILK2  DS    0C
         AGO   .LST2
.LST2 IECULK3 0,12,1,1,24,0,0,0,0,1
         AGO   .LST3  TO NEXT UCB ENTRY
.UCB1 ANOP
 IECIUCB 1,00C,UR,0,0D,1,                                      XXXXXXXXX
               0,,90000801,0,0,0,0,0,0,0,0,00C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB2      TO NEXT UCB
.LST3 IECULK3 12,13,2,0,0,0,0,0,0,1
         AGO   .LST4  TO NEXT UCB ENTRY
.UCB2 ANOP
 IECIUCB 2,00D,UR,0,0D,2,                                      XXXXXXXXX
               0,,90000802,0,0,0,0,0,0,0,0,00D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB3      TO NEXT UCB
.LST4 IECULK3 13,14,3,0,0,0,0,0,0,1
         AGO   .LST5  TO NEXT UCB ENTRY
.UCB3 ANOP
 IECIUCB 3,00E,UR,0,07,3,                                      XXXXXXXXX
               0,,10000808,0,0,0,0,0,0,0,0,00E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB4      TO NEXT UCB
.WK1 IECIUCBA 3,10000808,0,0,0,0,0,0,0,0,0,
         AGO   .WK2   TO NEXT WORK AREA
.TCU2   IECULK2 30,0,1,8,0,0,0
         AGO   .TCU3       TO NEXT ENTRY
.LST5 IECULK3 14,0,4,1,30,0,0,0,0,0
         AGO   .LST6  TO NEXT UCB ENTRY
.UCB4   ANOP       UCB ENTRY
 IECIUCB 4,010,GR,8,69,4,0,4,12501009,0,0,0,0,0,2000
         AGO   .UCB5      TO NEXT UCB
.LST6 IECULK3 0,13,5,0,30,0,0,0,0,0
         AGO   .LST7  TO NEXT UCB ENTRY
.UCB5   ANOP       UCB ENTRY
 IECIUCB 5,01D,TP,16,29,5,0,5,54204012,0,0,0,0
         AGO   .UCB6      TO NEXT UCB
.LST7 IECULK3 13,14,6,0,30,0,0,0,0,0
         AGO   .LST8  TO NEXT UCB ENTRY
.UCB6 ANOP
 IECIUCB 6,01E,UR,0,07,6,                                      XXXXXXXXX
               0,,10000808,0,0,0,0,0,0,0,0,01E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB7      TO NEXT UCB
.WK2 IECIUCBA 6,10000808,0,0,0,0,0,0,0,0,0,
         AGO   .WK3   TO NEXT WORK AREA
.LST8 IECULK3 14,15,7,0,30,0,0,0,0,0
         AGO   .LST9  TO NEXT UCB ENTRY
.UCB7 ANOP
 IECIUCB 7,01F,UR,0,04,7,                                      XXXXXXXXX
               0,,90000823,0,0,0,0,0,0,0,0,01F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB8      TO NEXT UCB
.WK3 IECIUCBA 7,90000823,0,0,0,0,0,0,0,0,0,
         AGO   .WK4   TO NEXT WORK AREA
.TCU3   IECULK2 62,1,2,8,0,0,0
         AGO   .TCU4       TO NEXT ENTRY
.LST9 IECULK3 15,0,8,1,62,0,0,0,0,0
         AGO   .LST10  TO NEXT UCB ENTRY
.UCB8   ANOP       UCB ENTRY
 IECIUCB 8,020,TP,16,2B,8,0,8,55004093,0,0,0,0
         AGO   .UCB9      TO NEXT UCB
.LST10 IECULK3 0,1,9,0,62,0,0,0,0,0
         AGO   .LST11  TO NEXT UCB ENTRY
.UCB9   ANOP       UCB ENTRY
 IECIUCB 9,021,TP,16,2B,9,0,9,55004093,0,0,0,0
         AGO   .UCB10      TO NEXT UCB
.LST11 IECULK3 1,2,10,0,62,0,0,0,0,0
         AGO   .LST12  TO NEXT UCB ENTRY
.UCB10   ANOP       UCB ENTRY
 IECIUCB 10,022,TP,16,2B,10,0,10,55004093,0,0,0,0
         AGO   .UCB11      TO NEXT UCB
.LST12 IECULK3 2,3,11,0,62,0,0,0,0,0
         AGO   .LST13  TO NEXT UCB ENTRY
.UCB11   ANOP       UCB ENTRY
 IECIUCB 11,023,TP,16,2B,11,0,11,55004093,0,0,0,0
         AGO   .UCB12      TO NEXT UCB
.LST13 IECULK3 3,4,12,0,62,0,0,0,0,0
         AGO   .LST14  TO NEXT UCB ENTRY
.UCB12   ANOP       UCB ENTRY
 IECIUCB 12,024,TP,16,2B,12,0,12,55004093,0,0,0,0
         AGO   .UCB13      TO NEXT UCB
.LST14 IECULK3 4,5,13,0,62,0,0,0,0,0
         AGO   .LST15  TO NEXT UCB ENTRY
.UCB13   ANOP       UCB ENTRY
 IECIUCB 13,025,TP,16,2B,13,0,13,55004093,0,0,0,0
         AGO   .UCB14      TO NEXT UCB
.LST15 IECULK3 5,6,14,0,62,0,0,0,0,0
         AGO   .LST16  TO NEXT UCB ENTRY
.UCB14   ANOP       UCB ENTRY
 IECIUCB 14,026,TP,16,2B,14,0,14,55004093,0,0,0,0
         AGO   .UCB15      TO NEXT UCB
.LST16 IECULK3 6,7,15,0,62,0,0,0,0,0
         AGO   .LST17  TO NEXT UCB ENTRY
.UCB15   ANOP       UCB ENTRY
 IECIUCB 15,027,TP,16,2B,15,0,15,55004093,0,0,0,0
         AGO   .UCB16      TO NEXT UCB
.TCU4   IECULK2 78,2,3,8,0,0,0
         AGO   .TCU5       TO NEXT ENTRY
.LST17 IECULK3 7,0,16,1,78,0,0,0,0,0
         AGO   .LST18  TO NEXT UCB ENTRY
.UCB16   ANOP       UCB ENTRY
 IECIUCB 16,030,TP,16,2B,16,0,16,56904093,0,0,0,0
         AGO   .UCB17      TO NEXT UCB
.LST18 IECULK3 0,1,17,0,78,0,0,0,0,0
         AGO   .LST19  TO NEXT UCB ENTRY
.UCB17   ANOP       UCB ENTRY
 IECIUCB 17,031,TP,16,2B,17,0,17,56904093,0,0,0,0
         AGO   .UCB18      TO NEXT UCB
.LST19 IECULK3 1,2,18,0,78,0,0,0,0,0
         AGO   .LST20  TO NEXT UCB ENTRY
.UCB18   ANOP       UCB ENTRY
 IECIUCB 18,032,TP,16,2B,18,0,18,56904093,0,0,0,0
         AGO   .UCB19      TO NEXT UCB
.LST20 IECULK3 2,3,19,0,78,0,0,0,0,0
         AGO   .LST21  TO NEXT UCB ENTRY
.UCB19   ANOP       UCB ENTRY
 IECIUCB 19,033,TP,16,2B,19,0,19,56904093,0,0,0,0
         AGO   .UCB20      TO NEXT UCB
.LST21 IECULK3 3,4,20,0,78,0,0,0,0,0
         AGO   .LST22  TO NEXT UCB ENTRY
.UCB20   ANOP       UCB ENTRY
 IECIUCB 20,034,TP,16,2B,20,0,20,56904093,0,0,0,0
         AGO   .UCB21      TO NEXT UCB
.LST22 IECULK3 4,5,21,0,78,0,0,0,0,0
         AGO   .LST23  TO NEXT UCB ENTRY
.UCB21   ANOP       UCB ENTRY
 IECIUCB 21,035,TP,16,2B,21,0,21,56904093,0,0,0,0
         AGO   .UCB22      TO NEXT UCB
.LST23 IECULK3 5,6,22,0,78,0,0,0,0,0
         AGO   .LST24  TO NEXT UCB ENTRY
.UCB22   ANOP       UCB ENTRY
 IECIUCB 22,036,TP,16,2B,22,0,22,56904093,0,0,0,0
         AGO   .UCB23      TO NEXT UCB
.LST24 IECULK3 6,7,23,0,78,0,0,0,0,0
         AGO   .LST25  TO NEXT UCB ENTRY
.UCB23   ANOP       UCB ENTRY
 IECIUCB 23,037,TP,16,2B,23,0,23,56904093,0,0,0,0
         AGO   .UCB24      TO NEXT UCB
.TCU5   IECULK2 94,3,4,8,0,0,0
         AGO   .TCU6       TO NEXT ENTRY
.LST25 IECULK3 7,0,24,1,94,0,0,0,0,0
         AGO   .LST26  TO NEXT UCB ENTRY
.UCB24   ANOP       UCB ENTRY
 IECIUCB 24,040,TP,16,2B,24,0,24,57404093,0,0,0,0
         AGO   .UCB25      TO NEXT UCB
.LST26 IECULK3 0,1,25,0,94,0,0,0,0,0
         AGO   .LST27  TO NEXT UCB ENTRY
.UCB25   ANOP       UCB ENTRY
 IECIUCB 25,041,TP,16,2B,25,0,25,57404093,0,0,0,0
         AGO   .UCB26      TO NEXT UCB
.LST27 IECULK3 1,2,26,0,94,0,0,0,0,0
         AGO   .LST28  TO NEXT UCB ENTRY
.UCB26   ANOP       UCB ENTRY
 IECIUCB 26,042,TP,16,2B,26,0,26,57404093,0,0,0,0
         AGO   .UCB27      TO NEXT UCB
.LST28 IECULK3 2,3,27,0,94,0,0,0,0,0
         AGO   .LST29  TO NEXT UCB ENTRY
.UCB27   ANOP       UCB ENTRY
 IECIUCB 27,043,TP,16,2B,27,0,27,57404093,0,0,0,0
         AGO   .UCB28      TO NEXT UCB
.LST29 IECULK3 3,4,28,0,94,0,0,0,0,0
         AGO   .LST30  TO NEXT UCB ENTRY
.UCB28   ANOP       UCB ENTRY
 IECIUCB 28,044,TP,16,2B,28,0,28,57404093,0,0,0,0
         AGO   .UCB29      TO NEXT UCB
.LST30 IECULK3 4,5,29,0,94,0,0,0,0,0
         AGO   .LST31  TO NEXT UCB ENTRY
.UCB29   ANOP       UCB ENTRY
 IECIUCB 29,045,TP,16,2B,29,0,29,57404093,0,0,0,0
         AGO   .UCB30      TO NEXT UCB
.LST31 IECULK3 5,6,30,0,94,0,0,0,0,0
         AGO   .LST32  TO NEXT UCB ENTRY
.UCB30   ANOP       UCB ENTRY
 IECIUCB 30,046,TP,16,2B,30,0,30,57404093,0,0,0,0
         AGO   .UCB31      TO NEXT UCB
.LST32 IECULK3 6,7,31,0,94,0,0,0,0,0
         AGO   .LST33  TO NEXT UCB ENTRY
.UCB31   ANOP       UCB ENTRY
 IECIUCB 31,047,TP,16,2B,31,0,31,57404093,0,0,0,0
         AGO   .UCB32      TO NEXT UCB
.TCU6   IECULK2 110,4,5,8,0,0,0
         AGO   .TCU7       TO NEXT ENTRY
.LST33 IECULK3 7,0,32,1,110,0,0,0,0,0
         AGO   .LST34  TO NEXT UCB ENTRY
.UCB32   ANOP       UCB ENTRY
 IECIUCB 32,050,TP,16,29,32,0,32,56104013,0,0,0,0
         AGO   .UCB33      TO NEXT UCB
.LST34 IECULK3 0,2,33,0,110,0,0,0,0,0
         AGO   .LST35  TO NEXT UCB ENTRY
.UCB33   ANOP       UCB ENTRY
 IECIUCB 33,052,TP,16,29,33,0,33,55104013,0,0,0,0
         AGO   .UCB34      TO NEXT UCB
.LST35 IECULK3 2,8,34,0,110,0,0,0,0,0
         AGO   .LST36  TO NEXT UCB ENTRY
.UCB34   ANOP       UCB ENTRY
 IECIUCB 34,058,TP,16,29,34,0,34,51104053,0,0,0,0
         AGO   .UCB35      TO NEXT UCB
.LST36 IECULK3 8,12,35,0,110,0,0,0,0,0
         AGO   .LST37  TO NEXT UCB ENTRY
.UCB35   ANOP       UCB ENTRY
 IECIUCB 35,05C,TP,16,29,35,0,35,51004063,0,0,0,0
         AGO   .UCB36      TO NEXT UCB
.TCU7   IECULK2 136,5,6,8,0,0,0
         AGO   .TCU8       TO NEXT ENTRY
.LST37 IECULK3 12,0,36,1,136,0,0,0,0,0
         AGO   .LST38  TO NEXT UCB ENTRY
.UCB36   ANOP       UCB ENTRY
 IECIUCB 36,060,TP,16,31,36,0,36,50004015,0,0,0,0
         AGO   .UCB37      TO NEXT UCB
.LST38 IECULK3 0,8,37,0,136,0,0,0,0,0
         AGO   .LST39  TO NEXT UCB ENTRY
.UCB37   ANOP       UCB ENTRY
 IECIUCB 37,068,TP,16,31,37,0,37,50004025,0,0,0,0
         AGO   .UCB38      TO NEXT UCB
.TCU8   IECULK2 154,6,7,8,0,0,0
         AGO   .TCU9       TO NEXT ENTRY
.LST39 IECULK3 8,0,38,1,154,0,0,0,0,0
         AGO   .LST40  TO NEXT UCB ENTRY
.UCB38   ANOP       UCB ENTRY
 IECIUCB 38,070,TP,16,00,38,0,38,500040F1,0,0,0,0
         AGO   .UCB39      TO NEXT UCB
.TCU9   IECULK2 156,7,12,8,0,0,0
         AGO   .TCU10       TO NEXT ENTRY
.LST40 IECULK3 0,0,39,1,156,0,0,0,0,0
         AGO   .LST41  TO NEXT UCB ENTRY
.UCB39   ANOP       UCB ENTRY
 IECIUCB 39,0C0,GR,8,69,39,0,39,12501009,0,0,0,0,0,2000
         AGO   .UCB40      TO NEXT UCB
.LST41 IECULK3 0,1,40,0,156,0,0,0,0,0
         AGO   .LST42  TO NEXT UCB ENTRY
.UCB40   ANOP       UCB ENTRY
 IECIUCB 40,0C1,GR,8,69,40,0,40,12501009,0,0,0,0,0,2000
         AGO   .UCB41      TO NEXT UCB
.LST42 IECULK3 1,2,41,0,156,0,0,0,0,0
         AGO   .LST43  TO NEXT UCB ENTRY
.UCB41   ANOP       UCB ENTRY
 IECIUCB 41,0C2,GR,8,69,41,0,41,12501009,0,0,0,0,0,2000
         AGO   .UCB42      TO NEXT UCB
.LST43 IECULK3 2,3,42,0,156,0,0,0,0,0
         AGO   .LST44  TO NEXT UCB ENTRY
.UCB42   ANOP       UCB ENTRY
 IECIUCB 42,0C3,GR,8,69,42,0,42,12501009,0,0,0,0,0,2000
         AGO   .UCB43      TO NEXT UCB
.LST44 IECULK3 3,4,43,0,156,0,0,0,0,0
         AGO   .LST45  TO NEXT UCB ENTRY
.UCB43   ANOP       UCB ENTRY
 IECIUCB 43,0C4,GR,8,69,43,0,43,12501009,0,0,0,0,0,2000
         AGO   .UCB44      TO NEXT UCB
.LST45 IECULK3 4,5,44,0,156,0,0,0,0,0
         AGO   .LST46  TO NEXT UCB ENTRY
.UCB44   ANOP       UCB ENTRY
 IECIUCB 44,0C5,GR,8,69,44,0,44,12501009,0,0,0,0,0,2000
         AGO   .UCB45      TO NEXT UCB
.LST46 IECULK3 5,6,45,0,156,0,0,0,0,0
         AGO   .LST47  TO NEXT UCB ENTRY
.UCB45   ANOP       UCB ENTRY
 IECIUCB 45,0C6,GR,8,69,45,0,45,12501009,0,0,0,0,0,2000
         AGO   .UCB46      TO NEXT UCB
.LST47 IECULK3 6,7,46,0,156,0,0,0,0,0
         AGO   .LST48  TO NEXT UCB ENTRY
.UCB46   ANOP       UCB ENTRY
 IECIUCB 46,0C7,GR,8,69,46,0,46,12501009,0,0,0,0,0,2000
         AGO   .UCB47      TO NEXT UCB
.SRCH1  ANOP         CHAN SEARCH FOR MPX
    IECICS 0,0,0,,0,0,0,0,0,(0,0,0,0)
         AGO   .SRCH2     TO NEXT SEARCH
.TCH1   ANOP            TCH FOR MPX
       IECXTCH 1,0,0,,0,0,0,0,0,1
         AGO   .TCH2     TO NEXT TXH
.TAB2   ANOP         LOOK UP UCB TAB
 IECULK1 21,0,1,0,0,1,0
         AGO   .TAB3     TO NEXT CHANNEL ENTRY
.TCU10   IECULK2 148,12,0,21,1,0,0
         AGO   .TCU11       TO NEXT ENTRY
.LST48 IECULK3 7,12,47,1,148,0,1,0,0,0
         AGO   .LST49  TO NEXT UCB ENTRY
.UCB47 ANOP
 IECIUCB 47,10C,UR,0,0D,47,                                      XXXXXXXXX
               1,,90000801,0,0,0,0,0,0,0,0,10C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB48      TO NEXT UCB
.LST49 IECULK3 12,13,48,0,148,0,1,0,0,0
         AGO   .LST50  TO NEXT UCB ENTRY
.UCB48 ANOP
 IECIUCB 48,10D,UR,0,0D,48,                                      XXXXXXXXX
               1,,90000802,0,0,0,0,0,0,0,0,10D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB49      TO NEXT UCB
.TCU11   IECULK2 176,0,3,21,0,0,0
         AGO   .TCU12       TO NEXT ENTRY
.LST50 IECULK3 13,0,49,1,176,0,1,0,1,0
         AGO   .LST51  TO NEXT UCB ENTRY
.UCB49 ANOP
 IECIUCB 49,130,DS,24,01,49,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,130,                 XXXXXXXXX
               0,00,0
         AGO   .UCB50      TO NEXT UCB
.WK4 IECIUCBA 49,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK5   TO NEXT WORK AREA
.LST51 IECULK3 0,1,50,0,176,0,1,1,1,0
         AGO   .LST52  TO NEXT UCB ENTRY
.UCB50 ANOP
 IECIUCB 50,131,DS,24,01,49,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,131,                 XXXXXXXXX
               0,00,0
         AGO   .UCB51      TO NEXT UCB
.WK5 IECIUCBA 50,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK6   TO NEXT WORK AREA
.LST52 IECULK3 1,2,51,0,176,0,1,2,1,0
         AGO   .LST53  TO NEXT UCB ENTRY
.UCB51 ANOP
 IECIUCB 51,132,DS,24,01,49,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,132,                 XXXXXXXXX
               0,00,0
         AGO   .UCB52      TO NEXT UCB
.WK6 IECIUCBA 51,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK7   TO NEXT WORK AREA
.LST53 IECULK3 2,3,52,0,176,0,1,3,1,0
         AGO   .LST54  TO NEXT UCB ENTRY
.UCB52 ANOP
 IECIUCB 52,133,DS,24,01,49,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,133,                 XXXXXXXXX
               0,00,0
         AGO   .UCB53      TO NEXT UCB
.WK7 IECIUCBA 52,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK8   TO NEXT WORK AREA
.LST54 IECULK3 3,4,53,0,176,0,1,4,1,0
         AGO   .LST55  TO NEXT UCB ENTRY
.UCB53 ANOP
 IECIUCB 53,134,DS,24,01,49,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,134,                 XXXXXXXXX
               0,00,0
         AGO   .UCB54      TO NEXT UCB
.WK8 IECIUCBA 53,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK9   TO NEXT WORK AREA
.LST55 IECULK3 4,5,54,0,176,0,1,5,1,0
         AGO   .LST56  TO NEXT UCB ENTRY
.UCB54 ANOP
 IECIUCB 54,135,DS,24,01,49,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,135,                 XXXXXXXXX
               0,00,0
         AGO   .UCB55      TO NEXT UCB
.WK9 IECIUCBA 54,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK10   TO NEXT WORK AREA
.LST56 IECULK3 5,6,55,0,176,0,1,6,1,0
         AGO   .LST57  TO NEXT UCB ENTRY
.UCB55 ANOP
 IECIUCB 55,136,DS,24,01,49,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,136,                 XXXXXXXXX
               0,00,0
         AGO   .UCB56      TO NEXT UCB
.WK10 IECIUCBA 55,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK11   TO NEXT WORK AREA
.LST57 IECULK3 6,7,56,0,176,0,1,7,1,0
         AGO   .LST58  TO NEXT UCB ENTRY
.UCB56 ANOP
 IECIUCB 56,137,DS,24,01,49,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,137,                 XXXXXXXXX
               0,00,0
         AGO   .UCB57      TO NEXT UCB
.WK11 IECIUCBA 56,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK12   TO NEXT WORK AREA
.LST58 IECULK3 7,8,57,0,176,0,1,8,1,0
         AGO   .LST59  TO NEXT UCB ENTRY
.UCB57 ANOP
 IECIUCB 57,138,DS,24,01,58,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,138,                 XXXXXXXXX
               0,00,0
         AGO   .UCB58      TO NEXT UCB
.WK12 IECIUCBA 57,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK13   TO NEXT WORK AREA
.LST59 IECULK3 8,9,58,0,176,0,1,9,1,0
         AGO   .LST60  TO NEXT UCB ENTRY
.UCB58 ANOP
 IECIUCB 58,139,DS,24,01,58,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,139,                 XXXXXXXXX
               0,00,0
         AGO   .UCB59      TO NEXT UCB
.WK13 IECIUCBA 58,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK14   TO NEXT WORK AREA
.LST60 IECULK3 9,10,59,0,176,0,1,10,1,0
         AGO   .LST61  TO NEXT UCB ENTRY
.UCB59 ANOP
 IECIUCB 59,13A,DS,24,01,58,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,13A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB60      TO NEXT UCB
.WK14 IECIUCBA 59,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK15   TO NEXT WORK AREA
.LST61 IECULK3 10,11,60,0,176,0,1,11,1,0
         AGO   .LST62  TO NEXT UCB ENTRY
.UCB60 ANOP
 IECIUCB 60,13B,DS,24,01,58,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,13B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB61      TO NEXT UCB
.WK15 IECIUCBA 60,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK16   TO NEXT WORK AREA
.LST62 IECULK3 11,12,61,0,176,0,1,12,1,0
         AGO   .LST63  TO NEXT UCB ENTRY
.UCB61 ANOP
 IECIUCB 61,13C,DS,24,01,58,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,13C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB62      TO NEXT UCB
.WK16 IECIUCBA 61,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK17   TO NEXT WORK AREA
.LST63 IECULK3 12,13,62,0,176,0,1,13,1,0
         AGO   .LST64  TO NEXT UCB ENTRY
.UCB62 ANOP
 IECIUCB 62,13D,DS,24,01,58,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,13D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB63      TO NEXT UCB
.WK17 IECIUCBA 62,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK18   TO NEXT WORK AREA
.LST64 IECULK3 13,14,63,0,176,0,1,14,1,0
         AGO   .LST65  TO NEXT UCB ENTRY
.UCB63 ANOP
 IECIUCB 63,13E,DS,24,01,58,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,13E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB64      TO NEXT UCB
.WK18 IECIUCBA 63,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK19   TO NEXT WORK AREA
.LST65 IECULK3 14,15,64,0,176,0,1,15,1,0
         AGO   .LST66  TO NEXT UCB ENTRY
.UCB64 ANOP
 IECIUCB 64,13F,DS,24,01,58,                                      XXXXXXXXX
               1,,30E02008,0,0,0,0,0,0,0,0,13F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB65      TO NEXT UCB
.WK19 IECIUCBA 64,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK20   TO NEXT WORK AREA
.TCU12   IECULK2 208,3,4,21,0,0,0
         AGO   .TCU13       TO NEXT ENTRY
.LST66 IECULK3 15,0,65,1,208,0,1,16,1,0
         AGO   .LST67  TO NEXT UCB ENTRY
.UCB65 ANOP
 IECIUCB 65,140,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,140,                 XXXXXXXXX
               0,00,0
         AGO   .UCB66      TO NEXT UCB
.WK20 IECIUCBA 65,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK21   TO NEXT WORK AREA
.LST67 IECULK3 0,1,66,0,208,0,1,17,1,0
         AGO   .LST68  TO NEXT UCB ENTRY
.UCB66 ANOP
 IECIUCB 66,141,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,141,                 XXXXXXXXX
               0,00,0
         AGO   .UCB67      TO NEXT UCB
.WK21 IECIUCBA 66,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK22   TO NEXT WORK AREA
.LST68 IECULK3 1,2,67,0,208,0,1,18,1,0
         AGO   .LST69  TO NEXT UCB ENTRY
.UCB67 ANOP
 IECIUCB 67,142,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,142,                 XXXXXXXXX
               0,00,0
         AGO   .UCB68      TO NEXT UCB
.WK22 IECIUCBA 67,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK23   TO NEXT WORK AREA
.LST69 IECULK3 2,3,68,0,208,0,1,19,1,0
         AGO   .LST70  TO NEXT UCB ENTRY
.UCB68 ANOP
 IECIUCB 68,143,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,143,                 XXXXXXXXX
               0,00,0
         AGO   .UCB69      TO NEXT UCB
.WK23 IECIUCBA 68,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK24   TO NEXT WORK AREA
.LST70 IECULK3 3,4,69,0,208,0,1,20,1,0
         AGO   .LST71  TO NEXT UCB ENTRY
.UCB69 ANOP
 IECIUCB 69,144,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,144,                 XXXXXXXXX
               0,00,0
         AGO   .UCB70      TO NEXT UCB
.WK24 IECIUCBA 69,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK25   TO NEXT WORK AREA
.LST71 IECULK3 4,5,70,0,208,0,1,21,1,0
         AGO   .LST72  TO NEXT UCB ENTRY
.UCB70 ANOP
 IECIUCB 70,145,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,145,                 XXXXXXXXX
               0,00,0
         AGO   .UCB71      TO NEXT UCB
.WK25 IECIUCBA 70,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK26   TO NEXT WORK AREA
.LST72 IECULK3 5,6,71,0,208,0,1,22,1,0
         AGO   .LST73  TO NEXT UCB ENTRY
.UCB71 ANOP
 IECIUCB 71,146,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,146,                 XXXXXXXXX
               0,00,0
         AGO   .UCB72      TO NEXT UCB
.WK26 IECIUCBA 71,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK27   TO NEXT WORK AREA
.LST73 IECULK3 6,7,72,0,208,0,1,23,1,0
         AGO   .LST74  TO NEXT UCB ENTRY
.UCB72 ANOP
 IECIUCB 72,147,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,147,                 XXXXXXXXX
               0,00,0
         AGO   .UCB73      TO NEXT UCB
.WK27 IECIUCBA 72,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK28   TO NEXT WORK AREA
.LST74 IECULK3 7,8,73,0,208,0,1,24,1,0
         AGO   .LST75  TO NEXT UCB ENTRY
.UCB73 ANOP
 IECIUCB 73,148,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,148,                 XXXXXXXXX
               0,00,0
         AGO   .UCB74      TO NEXT UCB
.WK28 IECIUCBA 73,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK29   TO NEXT WORK AREA
.LST75 IECULK3 8,9,74,0,208,0,1,25,1,0
         AGO   .LST76  TO NEXT UCB ENTRY
.UCB74 ANOP
 IECIUCB 74,149,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,149,                 XXXXXXXXX
               0,00,0
         AGO   .UCB75      TO NEXT UCB
.WK29 IECIUCBA 74,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK30   TO NEXT WORK AREA
.LST76 IECULK3 9,10,75,0,208,0,1,26,1,0
         AGO   .LST77  TO NEXT UCB ENTRY
.UCB75 ANOP
 IECIUCB 75,14A,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,14A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB76      TO NEXT UCB
.WK30 IECIUCBA 75,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK31   TO NEXT WORK AREA
.LST77 IECULK3 10,11,76,0,208,0,1,27,1,0
         AGO   .LST78  TO NEXT UCB ENTRY
.UCB76 ANOP
 IECIUCB 76,14B,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,14B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB77      TO NEXT UCB
.WK31 IECIUCBA 76,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK32   TO NEXT WORK AREA
.LST78 IECULK3 11,12,77,0,208,0,1,28,1,0
         AGO   .LST79  TO NEXT UCB ENTRY
.UCB77 ANOP
 IECIUCB 77,14C,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,14C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB78      TO NEXT UCB
.WK32 IECIUCBA 77,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK33   TO NEXT WORK AREA
.LST79 IECULK3 12,13,78,0,208,0,1,29,1,0
         AGO   .LST80  TO NEXT UCB ENTRY
.UCB78 ANOP
 IECIUCB 78,14D,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,14D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB79      TO NEXT UCB
.WK33 IECIUCBA 78,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK34   TO NEXT WORK AREA
.LST80 IECULK3 13,14,79,0,208,0,1,30,1,0
         AGO   .LST81  TO NEXT UCB ENTRY
.UCB79 ANOP
 IECIUCB 79,14E,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,14E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB80      TO NEXT UCB
.WK34 IECIUCBA 79,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK35   TO NEXT WORK AREA
.LST81 IECULK3 14,15,80,0,208,0,1,31,1,0
         AGO   .LST82  TO NEXT UCB ENTRY
.UCB80 ANOP
 IECIUCB 80,14F,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200B,8,4,0,0,0,0,0,0,14F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB81      TO NEXT UCB
.WK35 IECIUCBA 80,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK36   TO NEXT WORK AREA
.TCU13   IECULK2 240,4,5,21,0,0,0
         AGO   .TCU14       TO NEXT ENTRY
.LST82 IECULK3 15,0,81,1,240,0,1,32,1,0
         AGO   .LST83  TO NEXT UCB ENTRY
.UCB81 ANOP
 IECIUCB 81,150,ML,32,01,67,                                      XXXXXXXXX
               1,,30702009,8,0,0,0,0,0,0,0,150,                 XXXXXXXXX
               0,00,0
         AGO   .UCB82      TO NEXT UCB
.WK36 IECIUCBA 81,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK37   TO NEXT WORK AREA
.LST83 IECULK3 0,1,82,0,240,0,1,33,1,0
         AGO   .LST84  TO NEXT UCB ENTRY
.UCB82 ANOP
 IECIUCB 82,151,ML,32,01,67,                                      XXXXXXXXX
               1,,30702009,8,0,0,0,0,0,0,0,151,                 XXXXXXXXX
               0,00,0
         AGO   .UCB83      TO NEXT UCB
.WK37 IECIUCBA 82,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK38   TO NEXT WORK AREA
.LST84 IECULK3 1,2,83,0,240,0,1,34,1,0
         AGO   .LST85  TO NEXT UCB ENTRY
.UCB83 ANOP
 IECIUCB 83,152,ML,32,01,67,                                      XXXXXXXXX
               1,,30702009,8,0,0,0,0,0,0,0,152,                 XXXXXXXXX
               0,00,0
         AGO   .UCB84      TO NEXT UCB
.WK38 IECIUCBA 83,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK39   TO NEXT WORK AREA
.LST85 IECULK3 2,3,84,0,240,0,1,35,1,0
         AGO   .LST86  TO NEXT UCB ENTRY
.UCB84 ANOP
 IECIUCB 84,153,ML,32,01,67,                                      XXXXXXXXX
               1,,30702009,8,0,0,0,0,0,0,0,153,                 XXXXXXXXX
               0,00,0
         AGO   .UCB85      TO NEXT UCB
.WK39 IECIUCBA 84,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK40   TO NEXT WORK AREA
.LST86 IECULK3 3,4,85,0,240,0,1,36,1,0
         AGO   .LST87  TO NEXT UCB ENTRY
.UCB85 ANOP
 IECIUCB 85,154,ML,32,01,67,                                      XXXXXXXXX
               1,,30702009,8,0,0,0,0,0,0,0,154,                 XXXXXXXXX
               0,00,0
         AGO   .UCB86      TO NEXT UCB
.WK40 IECIUCBA 85,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK41   TO NEXT WORK AREA
.LST87 IECULK3 4,5,86,0,240,0,1,37,1,0
         AGO   .LST88  TO NEXT UCB ENTRY
.UCB86 ANOP
 IECIUCB 86,155,ML,32,01,67,                                      XXXXXXXXX
               1,,30702009,8,0,0,0,0,0,0,0,155,                 XXXXXXXXX
               0,00,0
         AGO   .UCB87      TO NEXT UCB
.WK41 IECIUCBA 86,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK42   TO NEXT WORK AREA
.LST88 IECULK3 5,6,87,0,240,0,1,38,1,0
         AGO   .LST89  TO NEXT UCB ENTRY
.UCB87 ANOP
 IECIUCB 87,156,ML,32,01,67,                                      XXXXXXXXX
               1,,30702009,8,0,0,0,0,0,0,0,156,                 XXXXXXXXX
               0,00,0
         AGO   .UCB88      TO NEXT UCB
.WK42 IECIUCBA 87,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK43   TO NEXT WORK AREA
.LST89 IECULK3 6,7,88,0,240,0,1,39,1,0
         AGO   .LST90  TO NEXT UCB ENTRY
.UCB88 ANOP
 IECIUCB 88,157,ML,32,01,67,                                      XXXXXXXXX
               1,,30702009,8,0,0,0,0,0,0,0,157,                 XXXXXXXXX
               0,00,0
         AGO   .UCB89      TO NEXT UCB
.WK43 IECIUCBA 88,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK44   TO NEXT WORK AREA
.LST90 IECULK3 7,8,89,0,240,0,1,40,1,0
         AGO   .LST91  TO NEXT UCB ENTRY
.UCB89 ANOP
 IECIUCB 89,158,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200D,8,0,0,0,0,0,0,0,158,                 XXXXXXXXX
               0,00,0
         AGO   .UCB90      TO NEXT UCB
.WK44 IECIUCBA 89,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK45   TO NEXT WORK AREA
.LST91 IECULK3 8,9,90,0,240,0,1,41,1,0
         AGO   .LST92  TO NEXT UCB ENTRY
.UCB90 ANOP
 IECIUCB 90,159,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200D,8,0,0,0,0,0,0,0,159,                 XXXXXXXXX
               0,00,0
         AGO   .UCB91      TO NEXT UCB
.WK45 IECIUCBA 90,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK46   TO NEXT WORK AREA
.LST92 IECULK3 9,10,91,0,240,0,1,42,1,0
         AGO   .LST93  TO NEXT UCB ENTRY
.UCB91 ANOP
 IECIUCB 91,15A,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200D,8,0,0,0,0,0,0,0,15A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB92      TO NEXT UCB
.WK46 IECIUCBA 91,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK47   TO NEXT WORK AREA
.LST93 IECULK3 10,11,92,0,240,0,1,43,1,0
         AGO   .LST94  TO NEXT UCB ENTRY
.UCB92 ANOP
 IECIUCB 92,15B,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200D,8,0,0,0,0,0,0,0,15B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB93      TO NEXT UCB
.WK47 IECIUCBA 92,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK48   TO NEXT WORK AREA
.LST94 IECULK3 11,12,93,0,240,0,1,44,1,0
         AGO   .LST95  TO NEXT UCB ENTRY
.UCB93 ANOP
 IECIUCB 93,15C,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200D,8,0,0,0,0,0,0,0,15C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB94      TO NEXT UCB
.WK48 IECIUCBA 93,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK49   TO NEXT WORK AREA
.LST95 IECULK3 12,13,94,0,240,0,1,45,1,0
         AGO   .LST96  TO NEXT UCB ENTRY
.UCB94 ANOP
 IECIUCB 94,15D,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200D,8,0,0,0,0,0,0,0,15D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB95      TO NEXT UCB
.WK49 IECIUCBA 94,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK50   TO NEXT WORK AREA
.LST96 IECULK3 13,14,95,0,240,0,1,46,1,0
         AGO   .LST97  TO NEXT UCB ENTRY
.UCB95 ANOP
 IECIUCB 95,15E,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200D,8,0,0,0,0,0,0,0,15E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB96      TO NEXT UCB
.WK50 IECIUCBA 95,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK51   TO NEXT WORK AREA
.LST97 IECULK3 14,15,96,0,240,0,1,47,1,0
         AGO   .LST98  TO NEXT UCB ENTRY
.UCB96 ANOP
 IECIUCB 96,15F,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200D,8,0,0,0,0,0,0,0,15F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB97      TO NEXT UCB
.WK51 IECIUCBA 96,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK52   TO NEXT WORK AREA
.TCU14   IECULK2 272,5,8,21,0,0,0
         AGO   .TCU15       TO NEXT ENTRY
.LST98 IECULK3 15,0,97,1,272,0,1,48,0,0
         AGO   .LST99  TO NEXT UCB ENTRY
.UCB97 ANOP
 IECIUCB 97,180,AT,40,09,68,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,180,                 XXXXXXXXX
               0,00,0
         AGO   .UCB98      TO NEXT UCB
.WK52 IECIUCBA 97,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK53   TO NEXT WORK AREA
.LST99 IECULK3 0,1,98,0,272,0,1,48,0,0
         AGO   .LST100  TO NEXT UCB ENTRY
.UCB98 ANOP
 IECIUCB 98,181,AT,40,09,70,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,181,                 XXXXXXXXX
               0,00,0
         AGO   .UCB99      TO NEXT UCB
.WK53 IECIUCBA 98,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK54   TO NEXT WORK AREA
.LST100 IECULK3 1,2,99,0,272,0,1,48,0,0
         AGO   .LST101  TO NEXT UCB ENTRY
.UCB99 ANOP
 IECIUCB 99,182,AT,40,09,72,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,182,                 XXXXXXXXX
               0,00,0
         AGO   .UCB100      TO NEXT UCB
.WK54 IECIUCBA 99,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK55   TO NEXT WORK AREA
.LST101 IECULK3 2,3,100,0,272,0,1,48,0,0
         AGO   .LST102  TO NEXT UCB ENTRY
.UCB100 ANOP
 IECIUCB 100,183,AT,40,09,74,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,183,                 XXXXXXXXX
               0,00,0
         AGO   .UCB101      TO NEXT UCB
.WK55 IECIUCBA 100,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK56   TO NEXT WORK AREA
.LST102 IECULK3 3,4,101,0,272,0,1,48,0,0
         AGO   .LST103  TO NEXT UCB ENTRY
.UCB101 ANOP
 IECIUCB 101,184,AT,40,09,76,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,184,                 XXXXXXXXX
               0,00,0
         AGO   .UCB102      TO NEXT UCB
.WK56 IECIUCBA 101,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK57   TO NEXT WORK AREA
.LST103 IECULK3 4,5,102,0,272,0,1,48,0,0
         AGO   .LST104  TO NEXT UCB ENTRY
.UCB102 ANOP
 IECIUCB 102,185,AT,40,09,78,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,185,                 XXXXXXXXX
               0,00,0
         AGO   .UCB103      TO NEXT UCB
.WK57 IECIUCBA 102,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK58   TO NEXT WORK AREA
.LST104 IECULK3 5,6,103,0,272,0,1,48,0,0
         AGO   .LST105  TO NEXT UCB ENTRY
.UCB103 ANOP
 IECIUCB 103,186,AT,40,09,80,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,186,                 XXXXXXXXX
               0,00,0
         AGO   .UCB104      TO NEXT UCB
.WK58 IECIUCBA 103,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK59   TO NEXT WORK AREA
.LST105 IECULK3 6,7,104,0,272,0,1,48,0,0
         AGO   .LST106  TO NEXT UCB ENTRY
.UCB104 ANOP
 IECIUCB 104,187,AT,40,09,82,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,187,                 XXXXXXXXX
               0,00,0
         AGO   .UCB105      TO NEXT UCB
.WK59 IECIUCBA 104,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK60   TO NEXT WORK AREA
.LST106 IECULK3 7,8,105,0,272,0,1,48,0,0
         AGO   .LST107  TO NEXT UCB ENTRY
.UCB105 ANOP
 IECIUCB 105,188,AT,40,09,84,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,188,                 XXXXXXXXX
               0,00,0
         AGO   .UCB106      TO NEXT UCB
.WK60 IECIUCBA 105,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK61   TO NEXT WORK AREA
.LST107 IECULK3 8,9,106,0,272,0,1,48,0,0
         AGO   .LST108  TO NEXT UCB ENTRY
.UCB106 ANOP
 IECIUCB 106,189,AT,40,09,86,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,189,                 XXXXXXXXX
               0,00,0
         AGO   .UCB107      TO NEXT UCB
.WK61 IECIUCBA 106,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK62   TO NEXT WORK AREA
.LST108 IECULK3 9,10,107,0,272,0,1,48,0,0
         AGO   .LST109  TO NEXT UCB ENTRY
.UCB107 ANOP
 IECIUCB 107,18A,AT,40,09,88,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,18A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB108      TO NEXT UCB
.WK62 IECIUCBA 107,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK63   TO NEXT WORK AREA
.LST109 IECULK3 10,11,108,0,272,0,1,48,0,0
         AGO   .LST110  TO NEXT UCB ENTRY
.UCB108 ANOP
 IECIUCB 108,18B,AT,40,09,90,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,18B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB109      TO NEXT UCB
.WK63 IECIUCBA 108,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK64   TO NEXT WORK AREA
.LST110 IECULK3 11,12,109,0,272,0,1,48,0,0
         AGO   .LST111  TO NEXT UCB ENTRY
.UCB109 ANOP
 IECIUCB 109,18C,AT,40,09,92,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,18C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB110      TO NEXT UCB
.WK64 IECIUCBA 109,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK65   TO NEXT WORK AREA
.LST111 IECULK3 12,13,110,0,272,0,1,48,0,0
         AGO   .LST112  TO NEXT UCB ENTRY
.UCB110 ANOP
 IECIUCB 110,18D,AT,40,09,94,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,18D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB111      TO NEXT UCB
.WK65 IECIUCBA 110,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK66   TO NEXT WORK AREA
.LST112 IECULK3 13,14,111,0,272,0,1,48,0,0
         AGO   .LST113  TO NEXT UCB ENTRY
.UCB111 ANOP
 IECIUCB 111,18E,AT,40,09,96,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,18E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB112      TO NEXT UCB
.WK66 IECIUCBA 111,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK67   TO NEXT WORK AREA
.LST113 IECULK3 14,15,112,0,272,0,1,48,0,0
         AGO   .LST114  TO NEXT UCB ENTRY
.UCB112 ANOP
 IECIUCB 112,18F,AT,40,09,98,                                      XXXXXXXXX
               1,,32108003,24,0,0,0,0,0,0,0,18F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB113      TO NEXT UCB
.WK67 IECIUCBA 112,32108003,0,0,0,0,0,0,0,0,0,
         AGO   .WK68   TO NEXT WORK AREA
.TCU15   IECULK2 304,8,12,21,0,0,0
         AGO   .TCU16       TO NEXT ENTRY
.LST114 IECULK3 15,0,113,1,304,0,1,48,1,0
         AGO   .LST115  TO NEXT UCB ENTRY
.UCB113 ANOP
 IECIUCB 113,1C0,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C0,                 XXXXXXXXX
               0,00,0
         AGO   .UCB114      TO NEXT UCB
.WK68 IECIUCBA 113,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK69   TO NEXT WORK AREA
.LST115 IECULK3 0,1,114,0,304,0,1,49,1,0
         AGO   .LST116  TO NEXT UCB ENTRY
.UCB114 ANOP
 IECIUCB 114,1C1,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C1,                 XXXXXXXXX
               0,00,0
         AGO   .UCB115      TO NEXT UCB
.WK69 IECIUCBA 114,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK70   TO NEXT WORK AREA
.LST116 IECULK3 1,2,115,0,304,0,1,50,1,0
         AGO   .LST117  TO NEXT UCB ENTRY
.UCB115 ANOP
 IECIUCB 115,1C2,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C2,                 XXXXXXXXX
               0,00,0
         AGO   .UCB116      TO NEXT UCB
.WK70 IECIUCBA 115,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK71   TO NEXT WORK AREA
.LST117 IECULK3 2,3,116,0,304,0,1,51,1,0
         AGO   .LST118  TO NEXT UCB ENTRY
.UCB116 ANOP
 IECIUCB 116,1C3,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C3,                 XXXXXXXXX
               0,00,0
         AGO   .UCB117      TO NEXT UCB
.WK71 IECIUCBA 116,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK72   TO NEXT WORK AREA
.LST118 IECULK3 3,4,117,0,304,0,1,52,1,0
         AGO   .LST119  TO NEXT UCB ENTRY
.UCB117 ANOP
 IECIUCB 117,1C4,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C4,                 XXXXXXXXX
               0,00,0
         AGO   .UCB118      TO NEXT UCB
.WK72 IECIUCBA 117,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK73   TO NEXT WORK AREA
.LST119 IECULK3 4,5,118,0,304,0,1,53,1,0
         AGO   .LST120  TO NEXT UCB ENTRY
.UCB118 ANOP
 IECIUCB 118,1C5,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C5,                 XXXXXXXXX
               0,00,0
         AGO   .UCB119      TO NEXT UCB
.WK73 IECIUCBA 118,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK74   TO NEXT WORK AREA
.LST120 IECULK3 5,6,119,0,304,0,1,54,1,0
         AGO   .LST121  TO NEXT UCB ENTRY
.UCB119 ANOP
 IECIUCB 119,1C6,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C6,                 XXXXXXXXX
               0,00,0
         AGO   .UCB120      TO NEXT UCB
.WK74 IECIUCBA 119,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK75   TO NEXT WORK AREA
.LST121 IECULK3 6,7,120,0,304,0,1,55,1,0
         AGO   .LST122  TO NEXT UCB ENTRY
.UCB120 ANOP
 IECIUCB 120,1C7,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C7,                 XXXXXXXXX
               0,00,0
         AGO   .UCB121      TO NEXT UCB
.WK75 IECIUCBA 120,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK76   TO NEXT WORK AREA
.LST122 IECULK3 7,8,121,0,304,0,1,56,1,0
         AGO   .LST123  TO NEXT UCB ENTRY
.UCB121 ANOP
 IECIUCB 121,1C8,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C8,                 XXXXXXXXX
               0,00,0
         AGO   .UCB122      TO NEXT UCB
.WK76 IECIUCBA 121,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK77   TO NEXT WORK AREA
.LST123 IECULK3 8,9,122,0,304,0,1,57,1,0
         AGO   .LST124  TO NEXT UCB ENTRY
.UCB122 ANOP
 IECIUCB 122,1C9,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1C9,                 XXXXXXXXX
               0,00,0
         AGO   .UCB123      TO NEXT UCB
.WK77 IECIUCBA 122,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK78   TO NEXT WORK AREA
.LST124 IECULK3 9,10,123,0,304,0,1,58,1,0
         AGO   .LST125  TO NEXT UCB ENTRY
.UCB123 ANOP
 IECIUCB 123,1CA,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1CA,                 XXXXXXXXX
               0,00,0
         AGO   .UCB124      TO NEXT UCB
.WK78 IECIUCBA 123,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK79   TO NEXT WORK AREA
.LST125 IECULK3 10,11,124,0,304,0,1,59,1,0
         AGO   .LST126  TO NEXT UCB ENTRY
.UCB124 ANOP
 IECIUCB 124,1CB,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1CB,                 XXXXXXXXX
               0,00,0
         AGO   .UCB125      TO NEXT UCB
.WK79 IECIUCBA 124,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK80   TO NEXT WORK AREA
.LST126 IECULK3 11,12,125,0,304,0,1,60,1,0
         AGO   .LST127  TO NEXT UCB ENTRY
.UCB125 ANOP
 IECIUCB 125,1CC,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1CC,                 XXXXXXXXX
               0,00,0
         AGO   .UCB126      TO NEXT UCB
.WK80 IECIUCBA 125,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK81   TO NEXT WORK AREA
.LST127 IECULK3 12,13,126,0,304,0,1,61,1,0
         AGO   .LST128  TO NEXT UCB ENTRY
.UCB126 ANOP
 IECIUCB 126,1CD,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1CD,                 XXXXXXXXX
               0,00,0
         AGO   .UCB127      TO NEXT UCB
.WK81 IECIUCBA 126,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK82   TO NEXT WORK AREA
.LST128 IECULK3 13,14,127,0,304,0,1,62,1,0
         AGO   .LST129  TO NEXT UCB ENTRY
.UCB127 ANOP
 IECIUCB 127,1CE,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1CE,                 XXXXXXXXX
               0,00,0
         AGO   .UCB128      TO NEXT UCB
.WK82 IECIUCBA 127,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK83   TO NEXT WORK AREA
.LST129 IECULK3 14,15,128,0,304,0,1,63,1,0
         AGO   .LST130  TO NEXT UCB ENTRY
.UCB128 ANOP
 IECIUCB 128,1CF,ML,32,01,67,                                      XXXXXXXXX
               1,,3070200A,8,0,0,0,0,0,0,0,1CF,                 XXXXXXXXX
               0,00,0
         AGO   .UCB129      TO NEXT UCB
.WK83 IECIUCBA 128,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK84   TO NEXT WORK AREA
.TCH2   ANOP           TEST CHANNEL
    IECXTCH 2,1,(1,0,0,0,0,                                           *****
               0),(0,0,0,0),0,0,0,0,0,1
         AGO   .TCH3      TO NEXT TCH MOD
.SRCH2  ANOP       CHANNEL SEARCH MOD2
               IECICS 1,64,0,       I267                      ************
               (1,                            I267                 ********
               1,1,         I267                                       *
               0),0,0,0,1,(0,0,0,0),0
         AGO   .SRCH3     TO NEXT CHAN SRCH MOD
.TAB3   ANOP         LOOK UP UCB TAB
 IECULK1 31,1,2,0,0,1,0
         AGO   .TAB4     TO NEXT CHANNEL ENTRY
.TCU16   IECULK2 336,12,3,31,1,0,0
         AGO   .TCU17       TO NEXT ENTRY
.LST130 IECULK3 15,0,129,1,336,0,2,0,1,0
         AGO   .LST131  TO NEXT UCB ENTRY
.UCB129 ANOP
 IECIUCB 129,230,DS,24,01,100,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,230,                 XXXXXXXXX
               0,00,0
         AGO   .UCB130      TO NEXT UCB
.WK84 IECIUCBA 129,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK85   TO NEXT WORK AREA
.LST131 IECULK3 0,1,130,0,336,0,2,1,1,0
         AGO   .LST132  TO NEXT UCB ENTRY
.UCB130 ANOP
 IECIUCB 130,231,DS,24,01,100,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,231,                 XXXXXXXXX
               0,00,0
         AGO   .UCB131      TO NEXT UCB
.WK85 IECIUCBA 130,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK86   TO NEXT WORK AREA
.LST132 IECULK3 1,2,131,0,336,0,2,2,1,0
         AGO   .LST133  TO NEXT UCB ENTRY
.UCB131 ANOP
 IECIUCB 131,232,DS,24,01,100,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,232,                 XXXXXXXXX
               0,00,0
         AGO   .UCB132      TO NEXT UCB
.WK86 IECIUCBA 131,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK87   TO NEXT WORK AREA
.LST133 IECULK3 2,3,132,0,336,0,2,3,1,0
         AGO   .LST134  TO NEXT UCB ENTRY
.UCB132 ANOP
 IECIUCB 132,233,DS,24,01,100,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,233,                 XXXXXXXXX
               0,00,0
         AGO   .UCB133      TO NEXT UCB
.WK87 IECIUCBA 132,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK88   TO NEXT WORK AREA
.LST134 IECULK3 3,4,133,0,336,0,2,4,1,0
         AGO   .LST135  TO NEXT UCB ENTRY
.UCB133 ANOP
 IECIUCB 133,234,DS,24,01,100,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,234,                 XXXXXXXXX
               0,00,0
         AGO   .UCB134      TO NEXT UCB
.WK88 IECIUCBA 133,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK89   TO NEXT WORK AREA
.LST135 IECULK3 4,5,134,0,336,0,2,5,1,0
         AGO   .LST136  TO NEXT UCB ENTRY
.UCB134 ANOP
 IECIUCB 134,235,DS,24,01,100,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,235,                 XXXXXXXXX
               0,00,0
         AGO   .UCB135      TO NEXT UCB
.WK89 IECIUCBA 134,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK90   TO NEXT WORK AREA
.LST136 IECULK3 5,6,135,0,336,0,2,6,1,0
         AGO   .LST137  TO NEXT UCB ENTRY
.UCB135 ANOP
 IECIUCB 135,236,DS,24,01,100,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,236,                 XXXXXXXXX
               0,00,0
         AGO   .UCB136      TO NEXT UCB
.WK90 IECIUCBA 135,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK91   TO NEXT WORK AREA
.LST137 IECULK3 6,7,136,0,336,0,2,7,1,0
         AGO   .LST138  TO NEXT UCB ENTRY
.UCB136 ANOP
 IECIUCB 136,237,DS,24,01,100,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,237,                 XXXXXXXXX
               0,00,0
         AGO   .UCB137      TO NEXT UCB
.WK91 IECIUCBA 136,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK92   TO NEXT WORK AREA
.LST138 IECULK3 7,8,137,0,336,0,2,8,1,0
         AGO   .LST139  TO NEXT UCB ENTRY
.UCB137 ANOP
 IECIUCB 137,238,DS,24,01,109,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,238,                 XXXXXXXXX
               0,00,0
         AGO   .UCB138      TO NEXT UCB
.WK92 IECIUCBA 137,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK93   TO NEXT WORK AREA
.LST139 IECULK3 8,9,138,0,336,0,2,9,1,0
         AGO   .LST140  TO NEXT UCB ENTRY
.UCB138 ANOP
 IECIUCB 138,239,DS,24,01,109,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,239,                 XXXXXXXXX
               0,00,0
         AGO   .UCB139      TO NEXT UCB
.WK93 IECIUCBA 138,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK94   TO NEXT WORK AREA
.LST140 IECULK3 9,10,139,0,336,0,2,10,1,0
         AGO   .LST141  TO NEXT UCB ENTRY
.UCB139 ANOP
 IECIUCB 139,23A,DS,24,01,109,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,23A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB140      TO NEXT UCB
.WK94 IECIUCBA 139,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK95   TO NEXT WORK AREA
.LST141 IECULK3 10,11,140,0,336,0,2,11,1,0
         AGO   .LST142  TO NEXT UCB ENTRY
.UCB140 ANOP
 IECIUCB 140,23B,DS,24,01,109,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,23B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB141      TO NEXT UCB
.WK95 IECIUCBA 140,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK96   TO NEXT WORK AREA
.LST142 IECULK3 11,12,141,0,336,0,2,12,1,0
         AGO   .LST143  TO NEXT UCB ENTRY
.UCB141 ANOP
 IECIUCB 141,23C,DS,24,01,109,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,23C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB142      TO NEXT UCB
.WK96 IECIUCBA 141,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK97   TO NEXT WORK AREA
.LST143 IECULK3 12,13,142,0,336,0,2,13,1,0
         AGO   .LST144  TO NEXT UCB ENTRY
.UCB142 ANOP
 IECIUCB 142,23D,DS,24,01,109,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,23D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB143      TO NEXT UCB
.WK97 IECIUCBA 142,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK98   TO NEXT WORK AREA
.LST144 IECULK3 13,14,143,0,336,0,2,14,1,0
         AGO   .LST145  TO NEXT UCB ENTRY
.UCB143 ANOP
 IECIUCB 143,23E,DS,24,01,109,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,23E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB144      TO NEXT UCB
.WK98 IECIUCBA 143,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK99   TO NEXT WORK AREA
.LST145 IECULK3 14,15,144,0,336,0,2,15,1,0
         AGO   .LST146  TO NEXT UCB ENTRY
.UCB144 ANOP
 IECIUCB 144,23F,DS,24,01,109,                                      XXXXXXXXX
               2,,30E02008,0,0,0,0,0,0,0,0,23F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB145      TO NEXT UCB
.WK99 IECIUCBA 144,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK100   TO NEXT WORK AREA
.TCU17   IECULK2 368,3,4,31,0,0,0
         AGO   .TCU18       TO NEXT ENTRY
.LST146 IECULK3 15,0,145,1,368,0,2,16,1,0
         AGO   .LST147  TO NEXT UCB ENTRY
.UCB145 ANOP
 IECIUCB 145,240,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,240,                 XXXXXXXXX
               0,00,0
         AGO   .UCB146      TO NEXT UCB
.WK100 IECIUCBA 145,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK101   TO NEXT WORK AREA
.LST147 IECULK3 0,1,146,0,368,0,2,17,1,0
         AGO   .LST148  TO NEXT UCB ENTRY
.UCB146 ANOP
 IECIUCB 146,241,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,241,                 XXXXXXXXX
               0,00,0
         AGO   .UCB147      TO NEXT UCB
.WK101 IECIUCBA 146,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK102   TO NEXT WORK AREA
.LST148 IECULK3 1,2,147,0,368,0,2,18,1,0
         AGO   .LST149  TO NEXT UCB ENTRY
.UCB147 ANOP
 IECIUCB 147,242,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,242,                 XXXXXXXXX
               0,00,0
         AGO   .UCB148      TO NEXT UCB
.WK102 IECIUCBA 147,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK103   TO NEXT WORK AREA
.LST149 IECULK3 2,3,148,0,368,0,2,19,1,0
         AGO   .LST150  TO NEXT UCB ENTRY
.UCB148 ANOP
 IECIUCB 148,243,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,243,                 XXXXXXXXX
               0,00,0
         AGO   .UCB149      TO NEXT UCB
.WK103 IECIUCBA 148,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK104   TO NEXT WORK AREA
.LST150 IECULK3 3,4,149,0,368,0,2,20,1,0
         AGO   .LST151  TO NEXT UCB ENTRY
.UCB149 ANOP
 IECIUCB 149,244,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,244,                 XXXXXXXXX
               0,00,0
         AGO   .UCB150      TO NEXT UCB
.WK104 IECIUCBA 149,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK105   TO NEXT WORK AREA
.LST151 IECULK3 4,5,150,0,368,0,2,21,1,0
         AGO   .LST152  TO NEXT UCB ENTRY
.UCB150 ANOP
 IECIUCB 150,245,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,245,                 XXXXXXXXX
               0,00,0
         AGO   .UCB151      TO NEXT UCB
.WK105 IECIUCBA 150,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK106   TO NEXT WORK AREA
.LST152 IECULK3 5,6,151,0,368,0,2,22,1,0
         AGO   .LST153  TO NEXT UCB ENTRY
.UCB151 ANOP
 IECIUCB 151,246,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,246,                 XXXXXXXXX
               0,00,0
         AGO   .UCB152      TO NEXT UCB
.WK106 IECIUCBA 151,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK107   TO NEXT WORK AREA
.LST153 IECULK3 6,7,152,0,368,0,2,23,1,0
         AGO   .LST154  TO NEXT UCB ENTRY
.UCB152 ANOP
 IECIUCB 152,247,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,247,                 XXXXXXXXX
               0,00,0
         AGO   .UCB153      TO NEXT UCB
.WK107 IECIUCBA 152,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK108   TO NEXT WORK AREA
.LST154 IECULK3 7,8,153,0,368,0,2,24,1,0
         AGO   .LST155  TO NEXT UCB ENTRY
.UCB153 ANOP
 IECIUCB 153,248,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,248,                 XXXXXXXXX
               0,00,0
         AGO   .UCB154      TO NEXT UCB
.WK108 IECIUCBA 153,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK109   TO NEXT WORK AREA
.LST155 IECULK3 8,9,154,0,368,0,2,25,1,0
         AGO   .LST156  TO NEXT UCB ENTRY
.UCB154 ANOP
 IECIUCB 154,249,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,249,                 XXXXXXXXX
               0,00,0
         AGO   .UCB155      TO NEXT UCB
.WK109 IECIUCBA 154,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK110   TO NEXT WORK AREA
.LST156 IECULK3 9,10,155,0,368,0,2,26,1,0
         AGO   .LST157  TO NEXT UCB ENTRY
.UCB155 ANOP
 IECIUCB 155,24A,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,24A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB156      TO NEXT UCB
.WK110 IECIUCBA 155,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK111   TO NEXT WORK AREA
.LST157 IECULK3 10,11,156,0,368,0,2,27,1,0
         AGO   .LST158  TO NEXT UCB ENTRY
.UCB156 ANOP
 IECIUCB 156,24B,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,24B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB157      TO NEXT UCB
.WK111 IECIUCBA 156,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK112   TO NEXT WORK AREA
.LST158 IECULK3 11,12,157,0,368,0,2,28,1,0
         AGO   .LST159  TO NEXT UCB ENTRY
.UCB157 ANOP
 IECIUCB 157,24C,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,24C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB158      TO NEXT UCB
.WK112 IECIUCBA 157,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK113   TO NEXT WORK AREA
.LST159 IECULK3 12,13,158,0,368,0,2,29,1,0
         AGO   .LST160  TO NEXT UCB ENTRY
.UCB158 ANOP
 IECIUCB 158,24D,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,24D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB159      TO NEXT UCB
.WK113 IECIUCBA 158,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK114   TO NEXT WORK AREA
.LST160 IECULK3 13,14,159,0,368,0,2,30,1,0
         AGO   .LST161  TO NEXT UCB ENTRY
.UCB159 ANOP
 IECIUCB 159,24E,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,24E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB160      TO NEXT UCB
.WK114 IECIUCBA 159,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK115   TO NEXT WORK AREA
.LST161 IECULK3 14,15,160,0,368,0,2,31,1,0
         AGO   .LST162  TO NEXT UCB ENTRY
.UCB160 ANOP
 IECIUCB 160,24F,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200B,8,4,0,0,0,0,0,0,24F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB161      TO NEXT UCB
.WK115 IECIUCBA 160,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK116   TO NEXT WORK AREA
.TCU18   IECULK2 400,4,5,31,0,0,0
         AGO   .TCU19       TO NEXT ENTRY
.LST162 IECULK3 15,0,161,1,400,0,2,32,1,0
         AGO   .LST163  TO NEXT UCB ENTRY
.UCB161 ANOP
 IECIUCB 161,250,ML,32,01,67,                                      XXXXXXXXX
               2,,30702009,8,0,0,0,0,0,0,0,250,                 XXXXXXXXX
               0,00,0
         AGO   .UCB162      TO NEXT UCB
.WK116 IECIUCBA 161,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK117   TO NEXT WORK AREA
.LST163 IECULK3 0,1,162,0,400,0,2,33,1,0
         AGO   .LST164  TO NEXT UCB ENTRY
.UCB162 ANOP
 IECIUCB 162,251,ML,32,01,67,                                      XXXXXXXXX
               2,,30702009,8,0,0,0,0,0,0,0,251,                 XXXXXXXXX
               0,00,0
         AGO   .UCB163      TO NEXT UCB
.WK117 IECIUCBA 162,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK118   TO NEXT WORK AREA
.LST164 IECULK3 1,2,163,0,400,0,2,34,1,0
         AGO   .LST165  TO NEXT UCB ENTRY
.UCB163 ANOP
 IECIUCB 163,252,ML,32,01,67,                                      XXXXXXXXX
               2,,30702009,8,0,0,0,0,0,0,0,252,                 XXXXXXXXX
               0,00,0
         AGO   .UCB164      TO NEXT UCB
.WK118 IECIUCBA 163,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK119   TO NEXT WORK AREA
.LST165 IECULK3 2,3,164,0,400,0,2,35,1,0
         AGO   .LST166  TO NEXT UCB ENTRY
.UCB164 ANOP
 IECIUCB 164,253,ML,32,01,67,                                      XXXXXXXXX
               2,,30702009,8,0,0,0,0,0,0,0,253,                 XXXXXXXXX
               0,00,0
         AGO   .UCB165      TO NEXT UCB
.WK119 IECIUCBA 164,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK120   TO NEXT WORK AREA
.LST166 IECULK3 3,4,165,0,400,0,2,36,1,0
         AGO   .LST167  TO NEXT UCB ENTRY
.UCB165 ANOP
 IECIUCB 165,254,ML,32,01,67,                                      XXXXXXXXX
               2,,30702009,8,0,0,0,0,0,0,0,254,                 XXXXXXXXX
               0,00,0
         AGO   .UCB166      TO NEXT UCB
.WK120 IECIUCBA 165,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK121   TO NEXT WORK AREA
.LST167 IECULK3 4,5,166,0,400,0,2,37,1,0
         AGO   .LST168  TO NEXT UCB ENTRY
.UCB166 ANOP
 IECIUCB 166,255,ML,32,01,67,                                      XXXXXXXXX
               2,,30702009,8,0,0,0,0,0,0,0,255,                 XXXXXXXXX
               0,00,0
         AGO   .UCB167      TO NEXT UCB
.WK121 IECIUCBA 166,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK122   TO NEXT WORK AREA
.LST168 IECULK3 5,6,167,0,400,0,2,38,1,0
         AGO   .LST169  TO NEXT UCB ENTRY
.UCB167 ANOP
 IECIUCB 167,256,ML,32,01,67,                                      XXXXXXXXX
               2,,30702009,8,0,0,0,0,0,0,0,256,                 XXXXXXXXX
               0,00,0
         AGO   .UCB168      TO NEXT UCB
.WK122 IECIUCBA 167,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK123   TO NEXT WORK AREA
.LST169 IECULK3 6,7,168,0,400,0,2,39,1,0
         AGO   .LST170  TO NEXT UCB ENTRY
.UCB168 ANOP
 IECIUCB 168,257,ML,32,01,67,                                      XXXXXXXXX
               2,,30702009,8,0,0,0,0,0,0,0,257,                 XXXXXXXXX
               0,00,0
         AGO   .UCB169      TO NEXT UCB
.WK123 IECIUCBA 168,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK124   TO NEXT WORK AREA
.LST170 IECULK3 7,8,169,0,400,0,2,40,1,0
         AGO   .LST171  TO NEXT UCB ENTRY
.UCB169 ANOP
 IECIUCB 169,258,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200D,8,0,0,0,0,0,0,0,258,                 XXXXXXXXX
               0,00,0
         AGO   .UCB170      TO NEXT UCB
.WK124 IECIUCBA 169,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK125   TO NEXT WORK AREA
.LST171 IECULK3 8,9,170,0,400,0,2,41,1,0
         AGO   .LST172  TO NEXT UCB ENTRY
.UCB170 ANOP
 IECIUCB 170,259,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200D,8,0,0,0,0,0,0,0,259,                 XXXXXXXXX
               0,00,0
         AGO   .UCB171      TO NEXT UCB
.WK125 IECIUCBA 170,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK126   TO NEXT WORK AREA
.LST172 IECULK3 9,10,171,0,400,0,2,42,1,0
         AGO   .LST173  TO NEXT UCB ENTRY
.UCB171 ANOP
 IECIUCB 171,25A,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200D,8,0,0,0,0,0,0,0,25A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB172      TO NEXT UCB
.WK126 IECIUCBA 171,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK127   TO NEXT WORK AREA
.LST173 IECULK3 10,11,172,0,400,0,2,43,1,0
         AGO   .LST174  TO NEXT UCB ENTRY
.UCB172 ANOP
 IECIUCB 172,25B,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200D,8,0,0,0,0,0,0,0,25B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB173      TO NEXT UCB
.WK127 IECIUCBA 172,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK128   TO NEXT WORK AREA
.LST174 IECULK3 11,12,173,0,400,0,2,44,1,0
         AGO   .LST175  TO NEXT UCB ENTRY
.UCB173 ANOP
 IECIUCB 173,25C,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200D,8,0,0,0,0,0,0,0,25C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB174      TO NEXT UCB
.WK128 IECIUCBA 173,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK129   TO NEXT WORK AREA
.LST175 IECULK3 12,13,174,0,400,0,2,45,1,0
         AGO   .LST176  TO NEXT UCB ENTRY
.UCB174 ANOP
 IECIUCB 174,25D,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200D,8,0,0,0,0,0,0,0,25D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB175      TO NEXT UCB
.WK129 IECIUCBA 174,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK130   TO NEXT WORK AREA
.LST176 IECULK3 13,14,175,0,400,0,2,46,1,0
         AGO   .LST177  TO NEXT UCB ENTRY
.UCB175 ANOP
 IECIUCB 175,25E,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200D,8,0,0,0,0,0,0,0,25E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB176      TO NEXT UCB
.WK130 IECIUCBA 175,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK131   TO NEXT WORK AREA
.LST177 IECULK3 14,15,176,0,400,0,2,47,1,0
         AGO   .LST178  TO NEXT UCB ENTRY
.UCB176 ANOP
 IECIUCB 176,25F,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200D,8,0,0,0,0,0,0,0,25F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB177      TO NEXT UCB
.WK131 IECIUCBA 176,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK132   TO NEXT WORK AREA
.TCU19   IECULK2 432,5,12,31,0,0,0
         AGO   .TCU20       TO NEXT ENTRY
.LST178 IECULK3 15,0,177,1,432,0,2,48,1,0
         AGO   .LST179  TO NEXT UCB ENTRY
.UCB177 ANOP
 IECIUCB 177,2C0,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C0,                 XXXXXXXXX
               0,00,0
         AGO   .UCB178      TO NEXT UCB
.WK132 IECIUCBA 177,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK133   TO NEXT WORK AREA
.LST179 IECULK3 0,1,178,0,432,0,2,49,1,0
         AGO   .LST180  TO NEXT UCB ENTRY
.UCB178 ANOP
 IECIUCB 178,2C1,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C1,                 XXXXXXXXX
               0,00,0
         AGO   .UCB179      TO NEXT UCB
.WK133 IECIUCBA 178,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK134   TO NEXT WORK AREA
.LST180 IECULK3 1,2,179,0,432,0,2,50,1,0
         AGO   .LST181  TO NEXT UCB ENTRY
.UCB179 ANOP
 IECIUCB 179,2C2,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C2,                 XXXXXXXXX
               0,00,0
         AGO   .UCB180      TO NEXT UCB
.WK134 IECIUCBA 179,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK135   TO NEXT WORK AREA
.LST181 IECULK3 2,3,180,0,432,0,2,51,1,0
         AGO   .LST182  TO NEXT UCB ENTRY
.UCB180 ANOP
 IECIUCB 180,2C3,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C3,                 XXXXXXXXX
               0,00,0
         AGO   .UCB181      TO NEXT UCB
.WK135 IECIUCBA 180,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK136   TO NEXT WORK AREA
.LST182 IECULK3 3,4,181,0,432,0,2,52,1,0
         AGO   .LST183  TO NEXT UCB ENTRY
.UCB181 ANOP
 IECIUCB 181,2C4,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C4,                 XXXXXXXXX
               0,00,0
         AGO   .UCB182      TO NEXT UCB
.WK136 IECIUCBA 181,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK137   TO NEXT WORK AREA
.LST183 IECULK3 4,5,182,0,432,0,2,53,1,0
         AGO   .LST184  TO NEXT UCB ENTRY
.UCB182 ANOP
 IECIUCB 182,2C5,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C5,                 XXXXXXXXX
               0,00,0
         AGO   .UCB183      TO NEXT UCB
.WK137 IECIUCBA 182,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK138   TO NEXT WORK AREA
.LST184 IECULK3 5,6,183,0,432,0,2,54,1,0
         AGO   .LST185  TO NEXT UCB ENTRY
.UCB183 ANOP
 IECIUCB 183,2C6,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C6,                 XXXXXXXXX
               0,00,0
         AGO   .UCB184      TO NEXT UCB
.WK138 IECIUCBA 183,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK139   TO NEXT WORK AREA
.LST185 IECULK3 6,7,184,0,432,0,2,55,1,0
         AGO   .LST186  TO NEXT UCB ENTRY
.UCB184 ANOP
 IECIUCB 184,2C7,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C7,                 XXXXXXXXX
               0,00,0
         AGO   .UCB185      TO NEXT UCB
.WK139 IECIUCBA 184,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK140   TO NEXT WORK AREA
.LST186 IECULK3 7,8,185,0,432,0,2,56,1,0
         AGO   .LST187  TO NEXT UCB ENTRY
.UCB185 ANOP
 IECIUCB 185,2C8,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C8,                 XXXXXXXXX
               0,00,0
         AGO   .UCB186      TO NEXT UCB
.WK140 IECIUCBA 185,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK141   TO NEXT WORK AREA
.LST187 IECULK3 8,9,186,0,432,0,2,57,1,0
         AGO   .LST188  TO NEXT UCB ENTRY
.UCB186 ANOP
 IECIUCB 186,2C9,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2C9,                 XXXXXXXXX
               0,00,0
         AGO   .UCB187      TO NEXT UCB
.WK141 IECIUCBA 186,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK142   TO NEXT WORK AREA
.LST188 IECULK3 9,10,187,0,432,0,2,58,1,0
         AGO   .LST189  TO NEXT UCB ENTRY
.UCB187 ANOP
 IECIUCB 187,2CA,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2CA,                 XXXXXXXXX
               0,00,0
         AGO   .UCB188      TO NEXT UCB
.WK142 IECIUCBA 187,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK143   TO NEXT WORK AREA
.LST189 IECULK3 10,11,188,0,432,0,2,59,1,0
         AGO   .LST190  TO NEXT UCB ENTRY
.UCB188 ANOP
 IECIUCB 188,2CB,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2CB,                 XXXXXXXXX
               0,00,0
         AGO   .UCB189      TO NEXT UCB
.WK143 IECIUCBA 188,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK144   TO NEXT WORK AREA
.LST190 IECULK3 11,12,189,0,432,0,2,60,1,0
         AGO   .LST191  TO NEXT UCB ENTRY
.UCB189 ANOP
 IECIUCB 189,2CC,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2CC,                 XXXXXXXXX
               0,00,0
         AGO   .UCB190      TO NEXT UCB
.WK144 IECIUCBA 189,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK145   TO NEXT WORK AREA
.LST191 IECULK3 12,13,190,0,432,0,2,61,1,0
         AGO   .LST192  TO NEXT UCB ENTRY
.UCB190 ANOP
 IECIUCB 190,2CD,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2CD,                 XXXXXXXXX
               0,00,0
         AGO   .UCB191      TO NEXT UCB
.WK145 IECIUCBA 190,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK146   TO NEXT WORK AREA
.LST192 IECULK3 13,14,191,0,432,0,2,62,1,0
         AGO   .LST193  TO NEXT UCB ENTRY
.UCB191 ANOP
 IECIUCB 191,2CE,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2CE,                 XXXXXXXXX
               0,00,0
         AGO   .UCB192      TO NEXT UCB
.WK146 IECIUCBA 191,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK147   TO NEXT WORK AREA
.LST193 IECULK3 14,15,192,0,432,0,2,63,1,0
         AGO   .LST194  TO NEXT UCB ENTRY
.UCB192 ANOP
 IECIUCB 192,2CF,ML,32,01,67,                                      XXXXXXXXX
               2,,3070200A,8,0,0,0,0,0,0,0,2CF,                 XXXXXXXXX
               0,00,0
         AGO   .UCB193      TO NEXT UCB
.WK147 IECIUCBA 192,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK148   TO NEXT WORK AREA
.TCH3   ANOP           TEST CHANNEL
    IECXTCH 3,1,(0,1,0,0,0,                                           *****
               0),(0,0,0,0),0,0,0,0,0,1
         AGO   .TCH4      TO NEXT TCH MOD
.SRCH3  ANOP       CHANNEL SEARCH MOD3
               IECICS 2,64,0,       I267                      ************
               (2,                            I267                 ********
               1,1,         I267                                       *
               0),0,0,0,1,(0,0,0,0),0
         AGO   .SRCH4     TO NEXT CHAN SRCH MOD
.TAB4   ANOP         LOOK UP UCB TAB
 IECULK1 41,2,3,0,0,1,0
         AGO   .TAB5     TO NEXT CHANNEL ENTRY
.TCU20   IECULK2 464,12,3,41,1,0,0
         AGO   .TCU21       TO NEXT ENTRY
.LST194 IECULK3 15,0,193,1,464,0,3,0,1,0
         AGO   .LST195  TO NEXT UCB ENTRY
.UCB193 ANOP
 IECIUCB 193,330,DS,24,01,118,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,330,                 XXXXXXXXX
               0,00,0
         AGO   .UCB194      TO NEXT UCB
.WK148 IECIUCBA 193,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK149   TO NEXT WORK AREA
.LST195 IECULK3 0,1,194,0,464,0,3,1,1,0
         AGO   .LST196  TO NEXT UCB ENTRY
.UCB194 ANOP
 IECIUCB 194,331,DS,24,01,118,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,331,                 XXXXXXXXX
               0,00,0
         AGO   .UCB195      TO NEXT UCB
.WK149 IECIUCBA 194,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK150   TO NEXT WORK AREA
.LST196 IECULK3 1,2,195,0,464,0,3,2,1,0
         AGO   .LST197  TO NEXT UCB ENTRY
.UCB195 ANOP
 IECIUCB 195,332,DS,24,01,118,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,332,                 XXXXXXXXX
               0,00,0
         AGO   .UCB196      TO NEXT UCB
.WK150 IECIUCBA 195,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK151   TO NEXT WORK AREA
.LST197 IECULK3 2,3,196,0,464,0,3,3,1,0
         AGO   .LST198  TO NEXT UCB ENTRY
.UCB196 ANOP
 IECIUCB 196,333,DS,24,01,118,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,333,                 XXXXXXXXX
               0,00,0
         AGO   .UCB197      TO NEXT UCB
.WK151 IECIUCBA 196,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK152   TO NEXT WORK AREA
.LST198 IECULK3 3,4,197,0,464,0,3,4,1,0
         AGO   .LST199  TO NEXT UCB ENTRY
.UCB197 ANOP
 IECIUCB 197,334,DS,24,01,118,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,334,                 XXXXXXXXX
               0,00,0
         AGO   .UCB198      TO NEXT UCB
.WK152 IECIUCBA 197,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK153   TO NEXT WORK AREA
.LST199 IECULK3 4,5,198,0,464,0,3,5,1,0
         AGO   .LST200  TO NEXT UCB ENTRY
.UCB198 ANOP
 IECIUCB 198,335,DS,24,01,118,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,335,                 XXXXXXXXX
               0,00,0
         AGO   .UCB199      TO NEXT UCB
.WK153 IECIUCBA 198,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK154   TO NEXT WORK AREA
.LST200 IECULK3 5,6,199,0,464,0,3,6,1,0
         AGO   .LST201  TO NEXT UCB ENTRY
.UCB199 ANOP
 IECIUCB 199,336,DS,24,01,118,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,336,                 XXXXXXXXX
               0,00,0
         AGO   .UCB200      TO NEXT UCB
.WK154 IECIUCBA 199,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK155   TO NEXT WORK AREA
.LST201 IECULK3 6,7,200,0,464,0,3,7,1,0
         AGO   .LST202  TO NEXT UCB ENTRY
.UCB200 ANOP
 IECIUCB 200,337,DS,24,01,118,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,337,                 XXXXXXXXX
               0,00,0
         AGO   .UCB201      TO NEXT UCB
.WK155 IECIUCBA 200,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK156   TO NEXT WORK AREA
.LST202 IECULK3 7,8,201,0,464,0,3,8,1,0
         AGO   .LST203  TO NEXT UCB ENTRY
.UCB201 ANOP
 IECIUCB 201,338,DS,24,01,127,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,338,                 XXXXXXXXX
               0,00,0
         AGO   .UCB202      TO NEXT UCB
.WK156 IECIUCBA 201,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK157   TO NEXT WORK AREA
.LST203 IECULK3 8,9,202,0,464,0,3,9,1,0
         AGO   .LST204  TO NEXT UCB ENTRY
.UCB202 ANOP
 IECIUCB 202,339,DS,24,01,127,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,339,                 XXXXXXXXX
               0,00,0
         AGO   .UCB203      TO NEXT UCB
.WK157 IECIUCBA 202,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK158   TO NEXT WORK AREA
.LST204 IECULK3 9,10,203,0,464,0,3,10,1,0
         AGO   .LST205  TO NEXT UCB ENTRY
.UCB203 ANOP
 IECIUCB 203,33A,DS,24,01,127,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,33A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB204      TO NEXT UCB
.WK158 IECIUCBA 203,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK159   TO NEXT WORK AREA
.LST205 IECULK3 10,11,204,0,464,0,3,11,1,0
         AGO   .LST206  TO NEXT UCB ENTRY
.UCB204 ANOP
 IECIUCB 204,33B,DS,24,01,127,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,33B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB205      TO NEXT UCB
.WK159 IECIUCBA 204,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK160   TO NEXT WORK AREA
.LST206 IECULK3 11,12,205,0,464,0,3,12,1,0
         AGO   .LST207  TO NEXT UCB ENTRY
.UCB205 ANOP
 IECIUCB 205,33C,DS,24,01,127,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,33C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB206      TO NEXT UCB
.WK160 IECIUCBA 205,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK161   TO NEXT WORK AREA
.LST207 IECULK3 12,13,206,0,464,0,3,13,1,0
         AGO   .LST208  TO NEXT UCB ENTRY
.UCB206 ANOP
 IECIUCB 206,33D,DS,24,01,127,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,33D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB207      TO NEXT UCB
.WK161 IECIUCBA 206,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK162   TO NEXT WORK AREA
.LST208 IECULK3 13,14,207,0,464,0,3,14,1,0
         AGO   .LST209  TO NEXT UCB ENTRY
.UCB207 ANOP
 IECIUCB 207,33E,DS,24,01,127,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,33E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB208      TO NEXT UCB
.WK162 IECIUCBA 207,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK163   TO NEXT WORK AREA
.LST209 IECULK3 14,15,208,0,464,0,3,15,1,0
         AGO   .LST210  TO NEXT UCB ENTRY
.UCB208 ANOP
 IECIUCB 208,33F,DS,24,01,127,                                      XXXXXXXXX
               3,,30E02008,0,0,0,0,0,0,0,0,33F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB209      TO NEXT UCB
.WK163 IECIUCBA 208,30E02008,0,0,0,0,0,0,0,0,0,
         AGO   .WK164   TO NEXT WORK AREA
.TCU21   IECULK2 496,3,4,41,0,0,0
         AGO   .TCU22       TO NEXT ENTRY
.LST210 IECULK3 15,0,209,1,496,0,3,16,1,0
         AGO   .LST211  TO NEXT UCB ENTRY
.UCB209 ANOP
 IECIUCB 209,340,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,340,                 XXXXXXXXX
               0,00,0
         AGO   .UCB210      TO NEXT UCB
.WK164 IECIUCBA 209,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK165   TO NEXT WORK AREA
.LST211 IECULK3 0,1,210,0,496,0,3,17,1,0
         AGO   .LST212  TO NEXT UCB ENTRY
.UCB210 ANOP
 IECIUCB 210,341,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,341,                 XXXXXXXXX
               0,00,0
         AGO   .UCB211      TO NEXT UCB
.WK165 IECIUCBA 210,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK166   TO NEXT WORK AREA
.LST212 IECULK3 1,2,211,0,496,0,3,18,1,0
         AGO   .LST213  TO NEXT UCB ENTRY
.UCB211 ANOP
 IECIUCB 211,342,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,342,                 XXXXXXXXX
               0,00,0
         AGO   .UCB212      TO NEXT UCB
.WK166 IECIUCBA 211,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK167   TO NEXT WORK AREA
.LST213 IECULK3 2,3,212,0,496,0,3,19,1,0
         AGO   .LST214  TO NEXT UCB ENTRY
.UCB212 ANOP
 IECIUCB 212,343,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,343,                 XXXXXXXXX
               0,00,0
         AGO   .UCB213      TO NEXT UCB
.WK167 IECIUCBA 212,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK168   TO NEXT WORK AREA
.LST214 IECULK3 3,4,213,0,496,0,3,20,1,0
         AGO   .LST215  TO NEXT UCB ENTRY
.UCB213 ANOP
 IECIUCB 213,344,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,344,                 XXXXXXXXX
               0,00,0
         AGO   .UCB214      TO NEXT UCB
.WK168 IECIUCBA 213,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK169   TO NEXT WORK AREA
.LST215 IECULK3 4,5,214,0,496,0,3,21,1,0
         AGO   .LST216  TO NEXT UCB ENTRY
.UCB214 ANOP
 IECIUCB 214,345,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,345,                 XXXXXXXXX
               0,00,0
         AGO   .UCB215      TO NEXT UCB
.WK169 IECIUCBA 214,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK170   TO NEXT WORK AREA
.LST216 IECULK3 5,6,215,0,496,0,3,22,1,0
         AGO   .LST217  TO NEXT UCB ENTRY
.UCB215 ANOP
 IECIUCB 215,346,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,346,                 XXXXXXXXX
               0,00,0
         AGO   .UCB216      TO NEXT UCB
.WK170 IECIUCBA 215,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK171   TO NEXT WORK AREA
.LST217 IECULK3 6,7,216,0,496,0,3,23,1,0
         AGO   .LST218  TO NEXT UCB ENTRY
.UCB216 ANOP
 IECIUCB 216,347,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,347,                 XXXXXXXXX
               0,00,0
         AGO   .UCB217      TO NEXT UCB
.WK171 IECIUCBA 216,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK172   TO NEXT WORK AREA
.LST218 IECULK3 7,8,217,0,496,0,3,24,1,0
         AGO   .LST219  TO NEXT UCB ENTRY
.UCB217 ANOP
 IECIUCB 217,348,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,348,                 XXXXXXXXX
               0,00,0
         AGO   .UCB218      TO NEXT UCB
.WK172 IECIUCBA 217,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK173   TO NEXT WORK AREA
.LST219 IECULK3 8,9,218,0,496,0,3,25,1,0
         AGO   .LST220  TO NEXT UCB ENTRY
.UCB218 ANOP
 IECIUCB 218,349,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,349,                 XXXXXXXXX
               0,00,0
         AGO   .UCB219      TO NEXT UCB
.WK173 IECIUCBA 218,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK174   TO NEXT WORK AREA
.LST220 IECULK3 9,10,219,0,496,0,3,26,1,0
         AGO   .LST221  TO NEXT UCB ENTRY
.UCB219 ANOP
 IECIUCB 219,34A,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,34A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB220      TO NEXT UCB
.WK174 IECIUCBA 219,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK175   TO NEXT WORK AREA
.LST221 IECULK3 10,11,220,0,496,0,3,27,1,0
         AGO   .LST222  TO NEXT UCB ENTRY
.UCB220 ANOP
 IECIUCB 220,34B,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,34B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB221      TO NEXT UCB
.WK175 IECIUCBA 220,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK176   TO NEXT WORK AREA
.LST222 IECULK3 11,12,221,0,496,0,3,28,1,0
         AGO   .LST223  TO NEXT UCB ENTRY
.UCB221 ANOP
 IECIUCB 221,34C,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,34C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB222      TO NEXT UCB
.WK176 IECIUCBA 221,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK177   TO NEXT WORK AREA
.LST223 IECULK3 12,13,222,0,496,0,3,29,1,0
         AGO   .LST224  TO NEXT UCB ENTRY
.UCB222 ANOP
 IECIUCB 222,34D,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,34D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB223      TO NEXT UCB
.WK177 IECIUCBA 222,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK178   TO NEXT WORK AREA
.LST224 IECULK3 13,14,223,0,496,0,3,30,1,0
         AGO   .LST225  TO NEXT UCB ENTRY
.UCB223 ANOP
 IECIUCB 223,34E,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,34E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB224      TO NEXT UCB
.WK178 IECIUCBA 223,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK179   TO NEXT WORK AREA
.LST225 IECULK3 14,15,224,0,496,0,3,31,1,0
         AGO   .LST226  TO NEXT UCB ENTRY
.UCB224 ANOP
 IECIUCB 224,34F,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200B,8,4,0,0,0,0,0,0,34F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB225      TO NEXT UCB
.WK179 IECIUCBA 224,3070200B,0,0,0,0,0,0,0,0,0,
         AGO   .WK180   TO NEXT WORK AREA
.TCU22   IECULK2 528,4,5,41,0,0,0
         AGO   .TCU23       TO NEXT ENTRY
.LST226 IECULK3 15,0,225,1,528,0,3,32,1,0
         AGO   .LST227  TO NEXT UCB ENTRY
.UCB225 ANOP
 IECIUCB 225,350,ML,32,01,67,                                      XXXXXXXXX
               3,,30702009,8,0,0,0,0,0,0,0,350,                 XXXXXXXXX
               0,00,0
         AGO   .UCB226      TO NEXT UCB
.WK180 IECIUCBA 225,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK181   TO NEXT WORK AREA
.LST227 IECULK3 0,1,226,0,528,0,3,33,1,0
         AGO   .LST228  TO NEXT UCB ENTRY
.UCB226 ANOP
 IECIUCB 226,351,ML,32,01,67,                                      XXXXXXXXX
               3,,30702009,8,0,0,0,0,0,0,0,351,                 XXXXXXXXX
               0,00,0
         AGO   .UCB227      TO NEXT UCB
.WK181 IECIUCBA 226,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK182   TO NEXT WORK AREA
.LST228 IECULK3 1,2,227,0,528,0,3,34,1,0
         AGO   .LST229  TO NEXT UCB ENTRY
.UCB227 ANOP
 IECIUCB 227,352,ML,32,01,67,                                      XXXXXXXXX
               3,,30702009,8,0,0,0,0,0,0,0,352,                 XXXXXXXXX
               0,00,0
         AGO   .UCB228      TO NEXT UCB
.WK182 IECIUCBA 227,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK183   TO NEXT WORK AREA
.LST229 IECULK3 2,3,228,0,528,0,3,35,1,0
         AGO   .LST230  TO NEXT UCB ENTRY
.UCB228 ANOP
 IECIUCB 228,353,ML,32,01,67,                                      XXXXXXXXX
               3,,30702009,8,0,0,0,0,0,0,0,353,                 XXXXXXXXX
               0,00,0
         AGO   .UCB229      TO NEXT UCB
.WK183 IECIUCBA 228,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK184   TO NEXT WORK AREA
.LST230 IECULK3 3,4,229,0,528,0,3,36,1,0
         AGO   .LST231  TO NEXT UCB ENTRY
.UCB229 ANOP
 IECIUCB 229,354,ML,32,01,67,                                      XXXXXXXXX
               3,,30702009,8,0,0,0,0,0,0,0,354,                 XXXXXXXXX
               0,00,0
         AGO   .UCB230      TO NEXT UCB
.WK184 IECIUCBA 229,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK185   TO NEXT WORK AREA
.LST231 IECULK3 4,5,230,0,528,0,3,37,1,0
         AGO   .LST232  TO NEXT UCB ENTRY
.UCB230 ANOP
 IECIUCB 230,355,ML,32,01,67,                                      XXXXXXXXX
               3,,30702009,8,0,0,0,0,0,0,0,355,                 XXXXXXXXX
               0,00,0
         AGO   .UCB231      TO NEXT UCB
.WK185 IECIUCBA 230,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK186   TO NEXT WORK AREA
.LST232 IECULK3 5,6,231,0,528,0,3,38,1,0
         AGO   .LST233  TO NEXT UCB ENTRY
.UCB231 ANOP
 IECIUCB 231,356,ML,32,01,67,                                      XXXXXXXXX
               3,,30702009,8,0,0,0,0,0,0,0,356,                 XXXXXXXXX
               0,00,0
         AGO   .UCB232      TO NEXT UCB
.WK186 IECIUCBA 231,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK187   TO NEXT WORK AREA
.LST233 IECULK3 6,7,232,0,528,0,3,39,1,0
         AGO   .LST234  TO NEXT UCB ENTRY
.UCB232 ANOP
 IECIUCB 232,357,ML,32,01,67,                                      XXXXXXXXX
               3,,30702009,8,0,0,0,0,0,0,0,357,                 XXXXXXXXX
               0,00,0
         AGO   .UCB233      TO NEXT UCB
.WK187 IECIUCBA 232,30702009,0,0,0,0,0,0,0,0,0,
         AGO   .WK188   TO NEXT WORK AREA
.LST234 IECULK3 7,8,233,0,528,0,3,40,1,0
         AGO   .LST235  TO NEXT UCB ENTRY
.UCB233 ANOP
 IECIUCB 233,358,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200D,8,0,0,0,0,0,0,0,358,                 XXXXXXXXX
               0,00,0
         AGO   .UCB234      TO NEXT UCB
.WK188 IECIUCBA 233,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK189   TO NEXT WORK AREA
.LST235 IECULK3 8,9,234,0,528,0,3,41,1,0
         AGO   .LST236  TO NEXT UCB ENTRY
.UCB234 ANOP
 IECIUCB 234,359,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200D,8,0,0,0,0,0,0,0,359,                 XXXXXXXXX
               0,00,0
         AGO   .UCB235      TO NEXT UCB
.WK189 IECIUCBA 234,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK190   TO NEXT WORK AREA
.LST236 IECULK3 9,10,235,0,528,0,3,42,1,0
         AGO   .LST237  TO NEXT UCB ENTRY
.UCB235 ANOP
 IECIUCB 235,35A,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200D,8,0,0,0,0,0,0,0,35A,                 XXXXXXXXX
               0,00,0
         AGO   .UCB236      TO NEXT UCB
.WK190 IECIUCBA 235,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK191   TO NEXT WORK AREA
.LST237 IECULK3 10,11,236,0,528,0,3,43,1,0
         AGO   .LST238  TO NEXT UCB ENTRY
.UCB236 ANOP
 IECIUCB 236,35B,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200D,8,0,0,0,0,0,0,0,35B,                 XXXXXXXXX
               0,00,0
         AGO   .UCB237      TO NEXT UCB
.WK191 IECIUCBA 236,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK192   TO NEXT WORK AREA
.LST238 IECULK3 11,12,237,0,528,0,3,44,1,0
         AGO   .LST239  TO NEXT UCB ENTRY
.UCB237 ANOP
 IECIUCB 237,35C,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200D,8,0,0,0,0,0,0,0,35C,                 XXXXXXXXX
               0,00,0
         AGO   .UCB238      TO NEXT UCB
.WK192 IECIUCBA 237,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK193   TO NEXT WORK AREA
.LST239 IECULK3 12,13,238,0,528,0,3,45,1,0
         AGO   .LST240  TO NEXT UCB ENTRY
.UCB238 ANOP
 IECIUCB 238,35D,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200D,8,0,0,0,0,0,0,0,35D,                 XXXXXXXXX
               0,00,0
         AGO   .UCB239      TO NEXT UCB
.WK193 IECIUCBA 238,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK194   TO NEXT WORK AREA
.LST240 IECULK3 13,14,239,0,528,0,3,46,1,0
         AGO   .LST241  TO NEXT UCB ENTRY
.UCB239 ANOP
 IECIUCB 239,35E,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200D,8,0,0,0,0,0,0,0,35E,                 XXXXXXXXX
               0,00,0
         AGO   .UCB240      TO NEXT UCB
.WK194 IECIUCBA 239,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK195   TO NEXT WORK AREA
.LST241 IECULK3 14,15,240,0,528,0,3,47,1,0
         AGO   .LST242  TO NEXT UCB ENTRY
.UCB240 ANOP
 IECIUCB 240,35F,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200D,8,0,0,0,0,0,0,0,35F,                 XXXXXXXXX
               0,00,0
         AGO   .UCB241      TO NEXT UCB
.WK195 IECIUCBA 240,3070200D,0,0,0,0,0,0,0,0,0,
         AGO   .WK196   TO NEXT WORK AREA
.TCU23   IECULK2 560,5,12,41,0,0,0
         AGO   .TCU24       TO NEXT ENTRY
.LST242 IECULK3 15,0,241,1,560,0,3,48,1,0
         AGO   .LST243  TO NEXT UCB ENTRY
.UCB241 ANOP
 IECIUCB 241,3C0,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C0,                 XXXXXXXXX
               0,00,0
         AGO   .UCB242      TO NEXT UCB
.WK196 IECIUCBA 241,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK197   TO NEXT WORK AREA
.LST243 IECULK3 0,1,242,0,560,0,3,49,1,0
         AGO   .LST244  TO NEXT UCB ENTRY
.UCB242 ANOP
 IECIUCB 242,3C1,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C1,                 XXXXXXXXX
               0,00,0
         AGO   .UCB243      TO NEXT UCB
.WK197 IECIUCBA 242,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK198   TO NEXT WORK AREA
.LST244 IECULK3 1,2,243,0,560,0,3,50,1,0
         AGO   .LST245  TO NEXT UCB ENTRY
.UCB243 ANOP
 IECIUCB 243,3C2,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C2,                 XXXXXXXXX
               0,00,0
         AGO   .UCB244      TO NEXT UCB
.WK198 IECIUCBA 243,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK199   TO NEXT WORK AREA
.LST245 IECULK3 2,3,244,0,560,0,3,51,1,0
         AGO   .LST246  TO NEXT UCB ENTRY
.UCB244 ANOP
 IECIUCB 244,3C3,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C3,                 XXXXXXXXX
               0,00,0
         AGO   .UCB245      TO NEXT UCB
.WK199 IECIUCBA 244,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK200   TO NEXT WORK AREA
.LST246 IECULK3 3,4,245,0,560,0,3,52,1,0
         AGO   .LST247  TO NEXT UCB ENTRY
.UCB245 ANOP
 IECIUCB 245,3C4,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C4,                 XXXXXXXXX
               0,00,0
         AGO   .UCB246      TO NEXT UCB
.WK200 IECIUCBA 245,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK201   TO NEXT WORK AREA
.LST247 IECULK3 4,5,246,0,560,0,3,53,1,0
         AGO   .LST248  TO NEXT UCB ENTRY
.UCB246 ANOP
 IECIUCB 246,3C5,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C5,                 XXXXXXXXX
               0,00,0
         AGO   .UCB247      TO NEXT UCB
.WK201 IECIUCBA 246,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK202   TO NEXT WORK AREA
.LST248 IECULK3 5,6,247,0,560,0,3,54,1,0
         AGO   .LST249  TO NEXT UCB ENTRY
.UCB247 ANOP
 IECIUCB 247,3C6,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C6,                 XXXXXXXXX
               0,00,0
         AGO   .UCB248      TO NEXT UCB
.WK202 IECIUCBA 247,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK203   TO NEXT WORK AREA
.LST249 IECULK3 6,7,248,0,560,0,3,55,1,0
         AGO   .LST250  TO NEXT UCB ENTRY
.UCB248 ANOP
 IECIUCB 248,3C7,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C7,                 XXXXXXXXX
               0,00,0
         AGO   .UCB249      TO NEXT UCB
.WK203 IECIUCBA 248,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK204   TO NEXT WORK AREA
.LST250 IECULK3 7,8,249,0,560,0,3,56,1,0
         AGO   .LST251  TO NEXT UCB ENTRY
.UCB249 ANOP
 IECIUCB 249,3C8,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C8,                 XXXXXXXXX
               0,00,0
         AGO   .UCB250      TO NEXT UCB
.WK204 IECIUCBA 249,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK205   TO NEXT WORK AREA
.LST251 IECULK3 8,9,250,0,560,0,3,57,1,0
         AGO   .LST252  TO NEXT UCB ENTRY
.UCB250 ANOP
 IECIUCB 250,3C9,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3C9,                 XXXXXXXXX
               0,00,0
         AGO   .UCB251      TO NEXT UCB
.WK205 IECIUCBA 250,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK206   TO NEXT WORK AREA
.LST252 IECULK3 9,10,251,0,560,0,3,58,1,0
         AGO   .LST253  TO NEXT UCB ENTRY
.UCB251 ANOP
 IECIUCB 251,3CA,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3CA,                 XXXXXXXXX
               0,00,0
         AGO   .UCB252      TO NEXT UCB
.WK206 IECIUCBA 251,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK207   TO NEXT WORK AREA
.LST253 IECULK3 10,11,252,0,560,0,3,59,1,0
         AGO   .LST254  TO NEXT UCB ENTRY
.UCB252 ANOP
 IECIUCB 252,3CB,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3CB,                 XXXXXXXXX
               0,00,0
         AGO   .UCB253      TO NEXT UCB
.WK207 IECIUCBA 252,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK208   TO NEXT WORK AREA
.LST254 IECULK3 11,12,253,0,560,0,3,60,1,0
         AGO   .LST255  TO NEXT UCB ENTRY
.UCB253 ANOP
 IECIUCB 253,3CC,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3CC,                 XXXXXXXXX
               0,00,0
         AGO   .UCB254      TO NEXT UCB
.WK208 IECIUCBA 253,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK209   TO NEXT WORK AREA
.LST255 IECULK3 12,13,254,0,560,0,3,61,1,0
         AGO   .LST256  TO NEXT UCB ENTRY
.UCB254 ANOP
 IECIUCB 254,3CD,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3CD,                 XXXXXXXXX
               0,00,0
         AGO   .UCB255      TO NEXT UCB
.WK209 IECIUCBA 254,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK210   TO NEXT WORK AREA
.LST256 IECULK3 13,14,255,0,560,0,3,62,1,0
         AGO   .LST257  TO NEXT UCB ENTRY
.UCB255 ANOP
 IECIUCB 255,3CE,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3CE,                 XXXXXXXXX
               0,00,0
         AGO   .UCB256      TO NEXT UCB
.WK210 IECIUCBA 255,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK211   TO NEXT WORK AREA
.LST257 IECULK3 14,15,256,0,560,0,3,63,1,0
         AGO   .LST258  TO NEXT UCB ENTRY
.UCB256 ANOP
 IECIUCB 256,3CF,ML,32,01,67,                                      XXXXXXXXX
               3,,3070200A,8,0,0,0,0,0,0,0,3CF,                 XXXXXXXXX
               0,00,0
         AGO   .UCB257      TO NEXT UCB
.WK211 IECIUCBA 256,3070200A,0,0,0,0,0,0,0,0,0,
         AGO   .WK212   TO NEXT WORK AREA
.LST258 ANOP     LAST UCB ADD ENTRY
    IECULK3 0,0,0,0,0,1
         AGO   .END     TO STATISTICS TABLE
.TAB5   ANOP          LAST CHANNEL ENTRY
  IECULK1 0,0,3,1
         AGO   .TCU1       TO FIRST CU ENTRY
.TCH4   ANOP           TEST CHANNEL
    IECXTCH 4,1,(0,0,1,0,0,                                           *****
               0),(0,0,0,0),0,0,1,0,0,1
         AGO   .TCH5      TO NEXT TCH MOD
.SRCH4  ANOP       CHANNEL SEARCH MOD4
               IECICS 3,64,0,       I267                      ************
               (3,                            I267                 ********
               1,1,         I267                                       *
               1),0,0,0,1,(0,0,0,0),0
         AGO   .SRCH5     TO NEXT CHAN SRCH MOD
.TCH5   ANOP       LAST TEST CHAN MOD
         AGO   .SRCH1     TO FIRST CSRCH MOD
.SRCH5  ANOP         LAST CHANNEL SEARCH MOD
         AGO   .TBLTAB          TO TABLE MACRO
.TCU24   ANOP       LAST CU ENRY TO TABLE
         AGO   .LST1       TO FIRST CUB ADD
.UCB257   ANOP      LAST UCB ENTRY4
         AGO   .RQE     TO RQE AND STATAB
.WK212 ANOP    LAST WORK ENTRY
         AGO   .UCBEND  TO STATISTICS
.GBL      IECGBL 1,0,224,225
         AGO   .IOSTART
.IECIOS  ANOP      MAINLINE IOS
 IECXCP  1,1,0,1,0,0,0,1,0,0,0,1,                                    XXXXXX
               100,0,1,0,1,0,0,0,0,1,0,1,2,          @X609E38      *********
               1,0,0,1,1,1,0,0,1,1,1,0,                         *********
               0,16,1,7,0,1,0,0,N,0
 IECINT  1,1,0,1,0,0,0,1,0,0,0,1,                                    XXXXXX
               100,0,1,0,1,0,0,0,0,1,0,1,2,          @X609E38      *********
               1,0,0,1,1,1,0,0,1,1,1,0,                         *********
               0,16,1,7,0,1,0,0,N,0
 IECIOS  1,1,0,1,0,0,0,1,0,0,0,1,                                    XXXXXX
               100,0,1,0,1,0,0,0,0,1,0,1,2,          @X609E38      *********
               1,0,0,1,1,1,0,0,1,1,1,0,                         *********
               0,16,1,7,0,1,0,0,N,0
         AGO   .TCH1    TO FIRST TCH MOD
.TBLTAB  ANOP  LCH,DEVICE AND CHAN TABLE
 IECTBL  (1,3,3,3,0,0,0),0,4,                                      ******
               (UR,                                                 ******
               GR,                                                  ******
               TP,                                                  ******
               DS,                                                  ******
               ML,                                                  ******
               AT),1
         AGO  .TAB1     TO FIRST UCB ADDR
.IOSB    ANOP
 IECTRA  1,1,0,1,0,0,0,1,0,0,0,1,                                    XXXXXX
               100,0,1,0,1,0,0,0,1,1,0,1,1,                     ***********
               1,0,0,1,1,1,0,0,1,1,1,0,                         *********
               0,16,1,7,0,1,0,0,N,0
 IECIOSB  1,1,0,1,0,0,0,1,0,0,0,1,                                    XXXXXX
               100,0,1,0,1,0,0,0,1,1,0,1,1,                     ***********
               1,0,0,1,1,1,0,0,1,1,1,0,                         *********
               0,16,1,7,0,1,0,0,N,0
          AGO   .WK1
.END    ANOP
          AGO   .IOSB
.UCBEND  ANOP
 IECIST 136,(0,0,0,0,0),1
         END
/*
//SG6 EXEC ASMS,OBJ=OBJPDS3,MOD=CHLOADTB,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
CHLOADTB CSECT
         DC   H'0'
         DC    H'5'
         DC   H'172'
         DC    H'0'
         DC   H'336'
         DC    H'0'
         DC   H'464'
         DC    H'0'
         DC   H'592'
         DC H'32767'
         END
/*
//SG7 EXEC ASMS,OBJ=OBJPDS3,MOD=IEC23XXF,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEC23XXF 1,0,0,0,0,1,1,0,                                           XXXXXX
               0,0,1,0,1,1,1,1
         END
/*
//SG8 EXEC ASMS,OBJ=OBJPDS3,MOD=IEASMFEX,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEASMFEX 1,1,1
         END
/*
//SG9 EXEC ASMS,OBJ=OBJPDS3,MOD=IEACVT00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IHASETSU SYS=VS1
IEACVTRN CSECT
         ENTRY IEACVT
         ENTRY CVTBRET
         DC    A(0)
         IHBRELNO
IEACVT   CVT SYS=AOS1,OPTIONS=(NOSLICE,INTERVAL,16),DSECT=NO,  XXXXXXXXXXXXX
               FLAG=138,FLAGB=228,PATCH=YES,RPS=YES,                  XXXXXXXXX
               CVTTZ=0,LOADBAL=NO,LIST=YES,WARN=0,CBMRTN=YES
         END
/*
//SG10 EXEC ASMS,OBJ=OBJPDS3,MOD=IGF201,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IORMSCOM 1,0,0,0,000,SECT=C
         TITLE 'IGF201--IGFRVT RMS VECTOR TABLE'
IGFRVT   CSECT
         IGFRVT TYPE=1,DSECT=NO
         END
/*
//SG11 EXEC ASMS,OBJ=OBJPDS3,MOD=IEAAMS00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEAAMS Y,Y,N,1,Y,VME=Y,MICRO=NO
         END
/*
//SG12 EXEC ASMS,OBJ=OBJPDS3,MOD=IEAATA00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 IEAATA 16,Y,Y,Y,NOSLCE,DDNO,SMF,ATCAM,XTIMER,YCS,VME=Y,VS1A=N
         END
/*
//SG13 EXEC ASMS,OBJ=OBJPDS3,MOD=IEATCB00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEATCB LOG,                                                 XXX
               (131072,                                              XXXXXXXX
               3145728,                                               XXXXXXXX
               3145728,                                               XXXXXXXX
               3145728,                                               XXXXXXXX
               3145728,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0,                                               XXXXXXXX
               0),                                              XXXXXXXX
               NOTSLC,,,                                              XXXXXX
               ,,,,,,,                                                 X
               NRMS,SMF,RTAM,FPREGS,XTIMER,NOSS1
         END
/*
//SG14 EXEC ASMS,OBJ=OBJPDS3,MOD=IEFSD032,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEFSD032 16,                                                XXXXXXXXXXX
               ('              **',                                    X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A',                                     X
               '               A'),                                    X
               ('               A',                                    X
               '               A',                                     X
               '               A'),                                    X
               ,                                                       X
               ,                                                       X
               JST,RTAM
         END
/*
//SG15 EXEC ASMS,OBJ=OBJPDS3,MOD=IEAATC00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEAATC Y,Y,N,PART,SSS,Y,Y,Y,N,Y,Y,N,Y,N,Y
         END
/*
//SG16 EXEC ASMS,OBJ=OBJPDS3,MOD=IGC0000A,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEAAWT SMF,XTIME,17100
         END
/*
//SG17 EXEC ASMS,OBJ=OBJPDS3,MOD=IGC0000B,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEAAPT XTIME,CS,VM370
         END
/*
//SG18 EXEC ASMS,OBJ=OBJPDS3,MOD=IEAATR00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEATRC 100,XTIME,VS1A=N
         END
/*
//SG19 EXEC ASMS,OBJ=OBJPDS3,MOD=IEAQAT00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEAQAT  NOSLICE,FPREGS,NODDISP,XTIMER
    END
/*
//SG20 EXEC ASMS,OBJ=OBJPDS3,MOD=IEAQCH00,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         IEAQCH  NOSLICE,NODDISP
    END
/*
//G09GEN3 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC ASMS,OBJ=OBJPDS2,MOD=IEFQMSGV,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IEFQMSGV CSECT
         SGIEF0QM DSECT=NO,             XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               SWFMT=12,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               SWTMT=90,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               JQTMT=15,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               JQLMT=5,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               JQLST=4
         END
/*
//SG2 EXEC ASMS,OBJ=OBJPDS2,MOD=IEFYRCDS,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 SGIEF060 NE=(0000000000000000000,                                     X
               000000000000000000,                             XXXXXXXXXXXXXXXX
               00000000000)                                           X
    END
/*
//SG3 EXEC ASMS,OBJ=OBJPDS2,MOD=IEFSGOPT,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
    SGIEF002  0,0,0,1
    END
/*
//SG4 EXEC ASMS,OBJ=OBJPDS2,MOD=HEWLF064,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
  TITLE  'HEWLFDEF    EDITOR DEFAULT SIZE PARAMETERS'
  SGHEW011 VAL1=524288,VAL2=102400
  IHBRELNO
  END
/*
//SG5 EXEC ASMS,OBJ=OBJPDS2,MOD=HEWLDDEF,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
         SGHEW060 FLAG=(1,0,1,0,0),SIZE=524288,                      XXXXXXXX
               LIN=SYSLIN,PRINT=SYSLOUT,LIB=SYSLIB
         END
/*
//SG6 EXEC ASMS,OBJ=OBJPDS2,MOD=JESCTIEF,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IEFJESCT IEFJESCT TYPE=CSECT,IOSC=IEFJPRMS,WAMDA=IEFWAVCB,             X
               JPDFP=IEFJPDFP,                                         X
               JPSMF=0,                                                X
               ALCUT=28138,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               SMFOP=1,                                 XXXXXXXXXXXXXXXX
               LOGOP=1,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               BFSIZ=3952,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               BFNBR=50,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               WACAP=80,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               SWADS=15,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               MWTP=25,                  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               NORDR=5,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               NOWTR=8,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               PRLRL=133,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               WTBLK=4890,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               USRTN=3,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               INCTL=50,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               OUCTL=50,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               RWSUP=368667,                                 XXXXXXXXXXXXXXXX
               WTLRS=3000,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               OUTLI=0,                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               SMNBR=77,                                 XXXXXXXXXXXXXXXX
               QBKSZ=936,                                              X
               JBLOG=1,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               EADSS=1,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               EMXDD=42,         XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
               RDBLK=9600
         EXTRN IEFWAVCB
IEFJPRMS CSECT
         IHAJPRMS  DSECT=NO
IEFJPDFP CSECT
         DC    A(21)
         DC    CL48'00600300005011E00011A'
         DC    A(2)
         DC    CL48'PA'
         DC    A(2)
         DC    CL48'CB'
         DC    A(21)
         DC    CL48'00600300005010E00011A'
         DC    A(2)
         DC    CL48'PA'
         DC    A(2)
         DC    CL48'CB'
         END
/*
//SG7 EXEC ASMS,OBJ=OBJPDS2,MOD=IEFSD569,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 SGIEE0VV A,1,1,1,1,0,0,0,0
         TITLE 'SPOOL AND JOB QUE PACKS'
IEFPACKS CSECT
         DC    CL6'FGEN67',Y(0)
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    F'-1'
         ENTRY IEFJQVOL
IEFJQVOL DC    0F'0'
         DC    CL6'FGEN67',Y(0)
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    2F'0'
         DC    F'-1'
         END   IEFSD569
/*
//SG8 EXEC ASMS,OBJ=OBJPDS2,MOD=IEFWMAS1,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
DEVNAMET CSECT
         SGIEF010                                                      X
               8,3400-6,X'3210',X'8003',                             XXXXXXXX
               12,1403,X'1000',X'0808',                             XXXXXXXX
               25,3215,X'9000',X'0823',                             XXXXXXXX
               27,3277-2,X'1200',X'1009',                             XXXXXXXX
               41,2540,X'9000',X'0801',                             XXXXXXXX
               42,2540-2,X'9000',X'0802',                             XXXXXXXX
               49,3340,X'3050',X'200A',                             XXXXXXXX
               50,3350,X'3050',X'200B',                             XXXXXXXX
               52,2314,X'30C0',X'2008',                             XXXXXXXX
               53,3330-1,X'3050',X'200D',                             XXXXXXXX
               55,3330,X'3050',X'2009',                             XXXXXXXX
               58,AAAE,X'4000',X'400E',                             XXXXXXXX
               59,AAAF,X'4000',X'400F',                             XXXXXXXX
               60,AAAD,X'4000',X'400D',                             XXXXXXXX
               77,AAA7,X'0000',X'4007',                             XXXXXXXX
               78,AAA8,X'4000',X'4008',                             XXXXXXXX
               79,AAA9,X'4000',X'4009',                             XXXXXXXX
               80,AAAA,X'4000',X'400A',                             XXXXXXXX
               81,AAAB,X'4000',X'400B',                             XXXXXXXX
               87,3705,X'5000',X'5005',                             XXXXXXXX
               88,3791L,X'5000',X'40F1',                             XXXXXXXX
               LAST
         DC    F'31'
 SGIEF011 41,41
 SGIEF011 42,42
 SGIEF011 12,12
 SGIEF011 27,27
 SGIEF011 78,78
 SGIEF011 25,25
 SGIEF011 79,79
 SGIEF011 80,80
 SGIEF011 81,81
 SGIEF011 58,58
 SGIEF011 59,59
 SGIEF011 77,77
 SGIEF011 60,60
 SGIEF011 87,87
 SGIEF011 88,88
 SGIEF011 52,52
 SGIEF011 50,50
 SGIEF011 55,55
 SGIEF011 53,53
 SGIEF011 8,8
 SGIEF011 49,49
         DC    CL8'2400-3'
         DC    X'34008001'
         DC    CL8'3400-3'
         DC    X'34008003'
          DC    CL8'3400-5'
          DC    X'32008003'
 SGIEF013 16,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
 SGIEF011 0,0,TAPE
 SGIEF013 16,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 32,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 64,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 80,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 96,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 112,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 128,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 144,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF011 0,0,SYSDA
 SGIEF013 16,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 32,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 64,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 80,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 96,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 112,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 128,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 144,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF011 0,0,SYSALLDA
 SGIEF013 16,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 48,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF011 0,0,SORT
 SGIEF013 16,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 48,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF011 0,0,SORTWORK
 SGIEF013 16,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 48,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF011 0,0,SORTWK
 SGIEF013 16,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 32,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 64,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 80,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 96,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 112,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 128,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 144,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF011 0,0,SYSSQ
 END
/*
//SG9 EXEC ASMS,OBJ=OBJPDS2,MOD=IEFDEVPT,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
IEFDEVPT CSECT
DVPTLEN  DC    H'10'
DVPTSIZE DC    H'296'
DVPTDEV  DC    H'256'
DVPT2321 DC    H'0'
DVPT     DC    F'0'
     DC  X'000F000FFFFFFF41180FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
     DC  X'FFFFFFFFFFFFFFFFFF000000'
     END
/*
//SG10 EXEC ASMS,OBJ=OBJPDS2,MOD=IEFWMSKA,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
DEVMASKT CSECT
          DC    H'31'
         DC    H'32'
         SGIEF010                                                      X
               8,3400-6,X'3210',X'8003',                             XXXXXXXX
               12,1403,X'1000',X'0808',                             XXXXXXXX
               25,3215,X'9000',X'0823',                             XXXXXXXX
               27,3277-2,X'1200',X'1009',                             XXXXXXXX
               41,2540,X'9000',X'0801',                             XXXXXXXX
               42,2540-2,X'9000',X'0802',                             XXXXXXXX
               49,3340,X'3050',X'200A',                             XXXXXXXX
               50,3350,X'3050',X'200B',                             XXXXXXXX
               52,2314,X'30C0',X'2008',                             XXXXXXXX
               53,3330-1,X'3050',X'200D',                             XXXXXXXX
               55,3330,X'3050',X'2009',                             XXXXXXXX
               58,AAAE,X'4000',X'400E',                             XXXXXXXX
               59,AAAF,X'4000',X'400F',                             XXXXXXXX
               60,AAAD,X'4000',X'400D',                             XXXXXXXX
               77,AAA7,X'0000',X'4007',                             XXXXXXXX
               78,AAA8,X'4000',X'4008',                             XXXXXXXX
               79,AAA9,X'4000',X'4009',                             XXXXXXXX
               80,AAAA,X'4000',X'400A',                             XXXXXXXX
               81,AAAB,X'4000',X'400B',                             XXXXXXXX
               87,3705,X'5000',X'5005',                             XXXXXXXX
               88,3791L,X'5000',X'40F1',                             XXXXXXXX
               LAST
 SGIEF012 41,2,                                                  XXXXXXXX
               00080000000000000000020000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 42,2,                                                  XXXXXXXX
               00040000000000000000010000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 12,2,                                                  XXXXXXXX
               00020004000000000000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 27,9,                                                  XXXXXXXX
               00010000000000000003FC0000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 78,1,                                                  XXXXXXXX
               00000008000000000000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 25,1,                                                  XXXXXXXX
               00000002000000000000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 79,8,                                                  XXXXXXXX
               00000001FE0000000000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 80,8,                                                  XXXXXXXX
               0000000001FE00000000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 81,8,                                                  XXXXXXXX
               000000000001FE000000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 58,1,                                                  XXXXXXXX
               00000000000001000000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 59,1,                                                  XXXXXXXX
               00000000000000400000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 77,1,                                                  XXXXXXXX
               00000000000000010000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 60,1,                                                  XXXXXXXX
               00000000000000001000000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 87,2,                                                  XXXXXXXX
               00000000000000000808000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 88,1,                                                  XXXXXXXX
               00000000000000000004000000000000000000000000000000000000X
               000000000000000000000000
 SGIEF012 52,48,                                                  XXXXXXXX
               0000000000000000000000FFFF0000000000000000FFFF0000000000X
               00FFFF000000000000000000
 SGIEF012 50,48,                                                  XXXXXXXX
               00000000000000000000000000FFFF0000000000000000FFFF000000X
               000000FFFF00000000000000
 SGIEF012 55,24,                                                  XXXXXXXX
               000000000000000000000000000000FF000000000000000000FF0000X
               0000000000FF000000000000
 SGIEF012 53,24,                                                  XXXXXXXX
               00000000000000000000000000000000FF000000000000000000FF00X
               000000000000FF0000000000
 SGIEF012 8,16,                                                  XXXXXXXX
               0000000000000000000000000000000000FFFF000000000000000000X
               000000000000000000000000
 SGIEF012 49,48,                                                  XXXXXXXX
               00000000000000000000000000000000000000FFFF000000000000FFX
               FF000000000000FFFF000000
        DC        F'16'
        DC        X'34008001'
   DC  X'0000000000000000000000000000000000FFFF000000000000000000'
   DC  X'000000000000000000000000'
        DC        F'16'
        DC        X'34008003'
   DC  X'0000000000000000000000000000000000FFFF000000000000000000'
   DC  X'000000000000000000000000'
        DC        F'16'
        DC        X'32008003'
   DC  X'0000000000000000000000000000000000FFFF000000000000000000'
   DC  X'000000000000000000000000'
 SGIEF013 16,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
 SGIEF012 0,16,                                                      XXXX
               0000000000000000000000000000000000FFFF000000000000000000X
               000000000000000000000000
 SGIEF013 16,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 32,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 64,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 80,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 96,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 112,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 128,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 144,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF012 0,144,                                                      XXXX
               00000000000000000000000000FFFFFFFF0000FFFF0000FFFFFFFFFFX
               FF0000FFFFFFFFFFFF000000
 SGIEF013 16,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 32,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 64,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 80,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 96,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 112,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 128,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 144,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF012 0,144,                                                      XXXX
               00000000000000000000000000FFFFFFFF0000FFFF0000FFFFFFFFFFX
               FF0000FFFFFFFFFFFF000000
 SGIEF013 16,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 48,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF012 0,48,                                                      XXXX
               0000000000000000000000FFFF0000000000000000FFFF0000000000X
               00FFFF000000000000000000
 SGIEF013 16,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 48,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF012 0,48,                                                      XXXX
               0000000000000000000000FFFF0000000000000000FFFF0000000000X
               00FFFF000000000000000000
 SGIEF013 16,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 32,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF013 48,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52
 SGIEF012 0,48,                                                      XXXX
               0000000000000000000000FFFF0000000000000000FFFF0000000000X
               00FFFF000000000000000000
 SGIEF013 16,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 32,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 64,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 80,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 96,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF013 112,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50
 SGIEF013 128,55,55,55,55,55,55,55,55,53,53,53,53,53,53,53,53
 SGIEF013 144,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49
 SGIEF012 0,144,                                                      XXXX
               00000000000000000000000000FFFFFFFF0000FFFF0000FFFFFFFFFFX
               FF0000FFFFFFFFFFFF000000
 SGIEF013 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 SGIEF012 0,192,                                                      XXXX
               0000000000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFX
               FFFFFFFFFFFFFFFFFF000000
          END
/*
//SG11 EXEC ASMS,OBJ=OBJPDS2,MOD=UCSIMAGE,CLASS=A
//SYSIN DD *
      PRINT ON,NODATA
 SGIEC0UC  (AN,D,                                                      X
               HN,D,                                                   X
               PCAN,D,                                                 X
               PCHN,D,                                                 X
               PN,D,                                                   X
               QN,D,                                                   X
               RN,D,                                                   X
               SN,D,                                                   X
               TN,D,                                                   X
               XN,D,                                                   X
               YN,D,                                                   X
               QNC,D,                                                  X
               A11,D,                                                  X
               H11,D,                                                  X
               G11,D,                                                  X
               P11,D,                                                  X
               T11,D,                                                  X
               AN3203,D,                                               X
               PCAN3203,D,                                             X
               HN3203,D,                                               X
               PCHN3203,D,                                             X
               PN3203,D,                                               X
               QN3203,D,                                               X
               QNC3203,D,                                              X
               RN3203,D,                                               X
               SN3203,D,                                               X
               TN3203,D,                                               X
               XN3203,D,                                               X
               YN3203,D)
         END
/*
//G09GEN4 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC PGM=IEBCOPY,COND=(8,LT)
//SYSUT3 DD DSN=&SYSUT3,SPACE=(1700,(10,5)),UNIT=SYSDA
//SYSUT4 DD DSN=&SYSUT4,SPACE=(460,(30,24)),UNIT=SYSDA
//SYSPRINT DD SPACE=(121,(500,100),RLSE),
//   DCB=(RECFM=FB,LRECL=121,BLKSIZE=121),SYSOUT=A
//AOS05 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS05
//AOS11 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS11
//AOS12 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS12
//AOSB0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB0
//AOSB3 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB3
//AOSC5 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSC5
//AOSCD DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSCD
//AOSD0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSD0
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//AOSBB DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSBB
//LINKLIB DD VOL=(,RETAIN,SER=FGEN67),DISP=OLD,
//   DSN=SYS1.LINKLIB,UNIT=3350
//AOS0A DD DISP=SHR,DSNAME=SYS1.AOS0A,VOLUME=(,RETAIN)
//SYSIN DD *
 COPY OUTDD=LINKLIB,INDD=AOS12
 SELECT MEMBER=(HMAPTFLE,IMAPTFLE,HMAPTF01,HMAPTF02)
 SELECT MEMBER=(HMASPZAP,IMASPZAP)
 SELECT MEMBER=(HMDPRLPA,HMDPRQCB,HMDPRDPS,HMDPRFSR)
 SELECT MEMBER=(HMDPRFUR,HMDPRFXT,HMDPRPMS,HMDPRNUC)
 SELECT MEMBER=(HMDPRPAL,HMDPRFUB,HMDPRPCR,HMDPRPDR)
 SELECT MEMBER=(HMDPRPJB,HMDPREAD,HMDPRMST,HMDPRLOD)
 SELECT MEMBER=(IEAAAD0R,HMDPRECT,HMDPRFMT)
 SELECT MEMBER=(HMDPROOT,HMDSYS00,HMDSYS02,HMDSYS03)
 SELECT MEMBER=((IMDUSRF9,HMDUSRF9),(IMDUSRFF,HMDUSRFF))
 SELECT MEMBER=(HMDSAPRO,HMDSAPGE,HMDPRPPG)
 COPY OUTDD=LINKLIB,INDD=AOS11
 SELECT MEMBER=(HHLTPMT,HHLTTAB,HHLWRTE,HHLWRAP)
 SELECT MEMBER=(HHLTSYNC,HHLTSCN,HHLT103,HHLSERVA)
 SELECT MEMBER=(HHLTSYSM,HHLTSIO,HHLTPED,HHLTUSR)
 SELECT MEMBER=(HHLTAR2,HHLTAR3,HHLTAR4,HHLTAR5)
 SELECT MEMBER=(HHLTAR6,HHLTFIL,HHLTDCB)
 COPY OUTDD=LINKLIB,INDD=AOS05
 SELECT MEMBER=(HEWLDRGO,IEWLDRGO,LOADER)    LOADER IS ALIAS
 COPY OUTDD=LINKLIB,INDD=AOS0A
   SELECT MEMBER=(IHKAST,IHKAWS,IHKBSH,IHKBST,IHKCC1,IHKCC2)
   SELECT MEMBER=(IHKCC3,IHKCC4,IHKCC5,IHKCC6,IHKCC7,IHKCC8)
   SELECT MEMBER=(IHKCDP,IHKCGN,IHKCIP)
   SELECT MEMBER=(IHKCLN,IHKDEQ,IHKEDT,IHKED1,IHKEOS,IHKGET)
   SELECT MEMBER=(IHKLAY,IHKLDC,IHKLDS,IHKLGN,IHKMAA,IHKMGE)
   SELECT MEMBER=(IHKMUF,IHKOPN,IHKPUT,IHKRNR,IHKSAV,IHKSND)
   SELECT MEMBER=(IHKSRV,IHKSTS,IHKSUB)
 COPY OUTDD=LINKLIB,INDD=AOSC5
 SELECT MEMBER=(IEAXPSIM,IEAXPALL,IEAXPDXR)
 SELECT MEMBER=IEASPL2
 SELECT MEMBER=(IEANIPSP,IEANIPPS,IEANIPTM)
 SELECT MEMBER=IEACPU00
 SELECT MEMBER=IEAPGSIP
 SELECT MEMBER=IEANIPDR
 SELECT MEMBER=IEANPRMS
 SELECT MEMBER=IEAPGSFP
 SELECT MEMBER=IEAAAD0N
 COPY OUTDD=LINKLIB,INDD=AOSD0
 SELECT MEMBER=(IECQBFG1,IECBBFB1)
 SELECT MEMBER=(IGG019B0)
 SELECT MEMBER=(IGG019AH)
  COPY  OUTDD=LINKLIB,INDD=AOSBB
  SELECT MEMBER=(IFSGEN,IFSRMT,IFSLETR,IFSSYS3)
 COPY OUTDD=LINKLIB,INDD=AOSB3
 S M=((IEFBR14,,R))
 S M=((IEFVGM1,,R))
 S M=((IEFVGM2,,R))
 S M=((IEFVGM3,,R))
 S M=((IEFVGM4,,R))
 S M=((IEFVGM5,,R))
 S M=((IEFVGM6,,R))
 S M=((IEFVGM7,,R))
 S M=((IEFVGM8,,R))
 S M=((IEFVGM9,,R))
 S M=((IEFVGM10,,R))
 S M=((IEFVGM11,,R))
 S M=((IEFVGM12,,R))
 S M=((IEFVGM13,,R))
 S M=((IEFVGM14,,R))
 S M=((IEFVGM15,,R))
 S M=((IEFVGM16,,R))
 S M=((IEFVGM17,,R))
 S M=((IEFVGM18,,R))
 S M=((IEFVGM19,,R))
 S M=((IEFVGM70,,R))
 S M=((IEFVGM71,,R))
 S M=((IEFVGM72,,R))
 S M=((IEFVGM73,,R))
 S M=((IEFVGM75,,R))
 S M=((IEFVGM78,,R))
 S M=((IEFVGM67,,R))
 S M=((IEFVGM76,,R))
 S M=((IEE0503D,,R))
 S M=((IEEQID,,R))
 S M=((IEECB860,,R))
 S M=((IEESETPT,,R))
 COPY OUTDD=LINKLIB,INDD=AOSC5
 S M=((IEECVGCI,,R))
 COPY OUTDD=LINKLIB,INDD=AOSB3
 S M=((IEFDSOAL,,R))
 S M=((IEFDSOFB,,R))
 COPY OUTDD=LINKLIB,INDD=AOSB0
 S M=((IEFOSC06,,R))
 S M=((IEFSSIPM,,R))
 COPY OUTDD=LINKLIB,INDD=AOSB3
 S M=((IEFAB416,,R))
 S M=((IEFAB410,,R))
 S M=((IEFAB411,,R))
 COPY OUTDD=LINKLIB,INDD=AOSB3
 S M=((IEELIST,,R))
 S M=((IEELIST1,,R))
 COPY OUTDD=LINKLIB,INDD=AOSB3
 S M=((IEELGON,,R))
 S M=((IEELGON1,,R))
 S M=((IEELGON2,,R))
/*
//G09GEN5 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC PGM=IEBCOPY,COND=(8,LT)
//SYSUT3 DD DSN=&SYSUT3,SPACE=(1700,(10,5)),UNIT=SYSDA
//SYSUT4 DD DSN=&SYSUT4,SPACE=(460,(30,24)),UNIT=SYSDA
//SYSPRINT DD SPACE=(121,(500,100),RLSE),
//   DCB=(RECFM=FB,LRECL=121,BLKSIZE=121),SYSOUT=A
//SVCLIB DD DSN=SYS1.SVCLIB,VOL=(,RETAIN,SER=FGEN67),
//     UNIT=3350,DISP=OLD
//AOSC5 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSC5
//AOS00 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS00
//AOS21 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS21
//AOSB3 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB3
//AOSCA DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSCA
//AOSCD DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSCD
//AOSD0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSD0
//AOSD7 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSD7
//AOSG0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSG0
//AOSA0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSA0
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//AOSCE DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSCE
//AOS20 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS20
//AOSD8 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSD8
//AOSC6 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSC6
//AOS06 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS06
//AOSBB DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSBB
//SVCLIBA DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AUSERSVC
//SYSIN DD *
    COPY OUTDD=SVCLIB,INDD=AOSCA
   SELECT MEMBER=(IGE0000I,IGE0100I,IGE0200I,IGE0300I)
      SELECT  MEMBER=(IGE0400I)
  SELECT MEMBER=(IGE0800I)
     SELECT MEMBER=(IGE0900I)
         SELECT MEMBER=(IGE0000A,IGE0000B)
        SELECT MEMBER=(IGE0000D)
        SELECT MEMBER=(IGE0000G)
        SELECT MEMBER=(IGE0001C,IGE0101C)
  SELECT MEMBER=(IGC0009A,IGC0109A)
    COPY OUTDD=SVCLIB,INDD=AOSG0
     SELECT MEMBER=(IGE0010E,IGE0110E,IGE0210E)
    COPY OUTDD=SVCLIB,INDD=AOSC5
    SELECT MEMBER=(IGE0025E)
  SELECT MEMBER=(IGE0125E,IGE0225E)
  SELECT MEMBER=(IGE0025C,IGE0025D)
   SELECT MEMBER=(IGE0125C,IGE0225C,IGE0325C)
    SELECT MEMBER=(IGE0425C)
 SELECT MEMBER=((IECIPR12,IGC0001F),IGC0001G)
   SELECT MEMBER=(IGC0003C)
    COPY OUTDD=SVCLIB,INDD=AOSCD
  SELECT MEMBER=(IGE0025F,IGE0125F,IGE0225F)
   SELECT MEMBER=(IGE0625F)
 COPY OUTDD=SVCLIB,INDD=AOSC5
 SELECT MEMBER=((IEACTM0B,IGC0B01C,R))
~raw00001200402021004020410011000000204040202040420040202001001240224022400140204400440012001100100010001102400140044100100010001000001050002022202200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 COPY OUTDD=SVCLIB,INDD=AOSCD
 SELECT MEMBER=((IFBSTAT,IGC0007F))
 SELECT MEMBER=((IFBSTAT1,IGC0107F))
 SELECT MEMBER=((IFBSTAT0,IGC0307F))
 SELECT MEMBER=((IFBSTAT2,IGC0207F))
 COPY OUTDD=SVCLIB,INDD=AOSCE
 SELECT MEMBER=(IGC0008H)
 COPY OUTDD=SVCLIB,INDD=AOSC5
 SELECT MEMBER=((IEAAAD00,IGC0005A),(IEAAAD0A,IGC0A05A))
 SELECT MEMBER=((IEAAAD01,IGC0105A))
 SELECT MEMBER=((IEAAAD0B,IGC0B05A),(IEAAAD02,IGC0205A))
 SELECT MEMBER=((IEAAAD03,IGC0305A),(IEAAAD04,IGC0405A))
 SELECT MEMBER=((IEAAAD05,IGC0505A))
 SELECT MEMBER=((IEAAAD0C,IGC0C05A))
 SELECT MEMBER=((IEAAAD0D,IGC0D05A),(IEAAAD0E,IGC0E05A))
 SELECT MEMBER=((IEAAAD0F,IGC0F05A))
 SELECT MEMBER=((IEAAAD0M,IGC0M05A))
 SELECT MEMBER=((IEAAAD0L,IGC0L05A))
 SELECT MEMBER=(IGX00005)
 SELECT MEMBER=((IEASTM11,IGC0111C),(IEASTM12,IGC0211C))
 SELECT MEMBER=((IEASTM13,IGC0311C),(IEASTM14,IGC0411C))
 SELECT MEMBER=((IEADTM22,IGC0221C),(IEADTM23,IGC0321C))
 SELECT MEMBER=((IEANTM0H,IGC0H01C),(IEANTM0M,IGC0M01C))
 SELECT MEMBER=((IEANTM0J,IGC0J01C))
 SELECT MEMBER=((IEANTM01,IGC0101C))
 SELECT MEMBER=((IEANTM02,IGC0201C),(IEANTM03,IGC0301C))
 SELECT MEMBER=((IEANTM04,IGC0401C))
 SELECT MEMBER=((IEANTM06,IGC0601C),(IEANTM07,IGC0701C))
 SELECT MEMBER=((IEANTM08,IGC0801C),(IEANTM09,IGC0901C))
 SELECT MEMBER=((IEANTM0A,IGC0A01C))
 SELECT MEMBER=((IEANTM05,IGC0501C))
 SELECT MEMBER=((IEANTM0C,IGC0C01C))
 SELECT MEMBER=((IEANTM0E,IGC0E01C))
 SELECT MEMBER=((IEANTM0F,IGC0F01C))
 SELECT MEMBER=((IEANTM0K,IGC0K01C))
 SELECT MEMBER=((IEAAEF00,IGC0004C))
 SELECT MEMBER=((IEAGED02,IGC0006B))
 COPY OUTDD=SVCLIB,INDD=AOSD0
 SELECT MEMBER=(IGC0010C)
 COPY OUTDD=SVCLIB,INDD=AOSD0
 SELECT MEMBER=(IGC0010E)
 SELECT MEMBER=(IFGAAABA)
 SELECT MEMBER=(IGG019AA,IGG019AB,IGG019AC,IGG019AD)
 SELECT MEMBER=(IGG019AF,IGG019AG,IGG019AI,IGG019AJ)
 SELECT MEMBER=(IGG019AK,IGG019AL,IGG019AM,IGG019AN)
 SELECT MEMBER=(IGG019AQ,IGG019AR,IGG019AT,IGG019AV)
 SELECT MEMBER=(IGG019AW,IGG019AX)
 SELECT MEMBER=(IGG019BA,IGG019BB,IGG019BD,IGG019BE)
 SELECT MEMBER=(IGG019BF,IGG019BG,IGG019BI,IGG019BL)
 SELECT MEMBER=(IGG019BM,IGG019BN,IGG019BO,IGG019BP)
 SELECT MEMBER=(IGG019BQ,IGG019BU,IGG019BV)
 SELECT MEMBER=(IGG019CA,IGG019CB,IGG019CC,IGG019CD)
 SELECT MEMBER=(IGG019CE,IGG019CF,IGG019CH)
 SELECT MEMBER=(IGG019CL,IGG019CM,IGG019CN,IGG019CO)
 SELECT MEMBER=(IGG019CP,IGG019CQ,IGG019CR,IGG019CS)
 SELECT MEMBER=(IGG019CT,IGG019CX,IGG019CY,IGG019CZ)
 SELECT MEMBER=(IGG019C0,IGG019C1,IGG019C2,IGG019C3)
 SELECT MEMBER=(IGG019C4)
 SELECT MEMBER=(IGG019DF,IGG019DG,IGG019DH)
 SELECT MEMBER=(IGG019DJ,IGG019DK)
 SELECT MEMBER=(IGG019DL,IGG019DM)
 SELECT MEMBER=(IGG019EA,IGG019EB,IGG019EC,IGG019ED)
 SELECT MEMBER=(IGG019EE,IGG019EF)
 SELECT MEMBER=(IGG019EI,IGG019EJ)
 SELECT MEMBER=(IGG019FB,IGG019FD,IGG019FF,IGG019FG)
 SELECT MEMBER=(IGG019FJ,IGG019FL,IGG019FM,IGG019FN)
 SELECT MEMBER=(IGG019FP)
 SELECT MEMBER=(IGG019HT)
 SELECT MEMBER=(IGG019JD)
 SELECT MEMBER=(IGG019TC,IGG019TD)
 SELECT MEMBER=(IGG019T2)
 SELECT MEMBER=(IGG019VX,IGG019VY)
 SELECT MEMBER=(IGG0191A,IGG0191B,IGG0191C,IGG0191D)
 SELECT MEMBER=(IGG0191E,IGG0191F,IGG0191G,IGG0191H)
 SELECT MEMBER=(IGG0191I,IGG0191J,IGG0191K,IGG0191N)
 SELECT MEMBER=(IGG0191O,IGG0191P,IGG0191Q,IGG0191R)
 SELECT MEMBER=(IGG0191S,IGG0191T,IGG0191U,IGG0191V)
 SELECT MEMBER=(IGG0191W,IGG0191X,IGG0191Y,IGG0191Z)
 SELECT MEMBER=(IGG01910,IGG01911,IGG01912,IGG01913)
 SELECT MEMBER=(IGG01914,IGG01915,IGG01916,IGG01917)
 SELECT MEMBER=(IGG01918,IGG01919,IGG01923)
 SELECT MEMBER=(IGG01926,IGG0193I)
 SELECT MEMBER=(IGG0196A,IGG0196B)
 SELECT MEMBER=(IGG0196I,IGG0196J,IGG0196K)
 SELECT MEMBER=(IGG0196L)
 SELECT MEMBER=(IGG0196P)
 SELECT MEMBER=(IGG0196Q)
 SELECT MEMBER=(IGG0196U,IGG0196V,IGG0196W,IGG0196X)
 SELECT MEMBER=(IGG0196Y,IGG0196Z)
 SELECT MEMBER=(IGG0197U)
 SELECT MEMBER=(IGG0198L)
 SELECT MEMBER=(IGG0199F,IGG0199G,IGG0199E)
 SELECT MEMBER=(IGG0199K,IGG0199O)
 SELECT MEMBER=(IGG0199W)
 SELECT MEMBER=(IGG01990,IGG01991,IGG01992,IGG01993)
 SELECT MEMBER=(IGG01994)
 SELECT MEMBER=(IGG0201A,IGG0201B)
 SELECT MEMBER=(IGG0201M,IGG0201N,IGG0210A,IGG021AB)
 SELECT MEMBER=(IGG0201W,IGG0201X,IGG0201Y,IGG0201Z)
 SELECT MEMBER=(IGC0002E,IGC0002A,IGC0002D)
 SELECT MEMBER=(IGC0005G)
 SELECT MEMBER=(IGC0006I)
 SELECT MEMBER=(IGC0006H,IGC0106H,IGC0206H,IGC0306H)
 SELECT MEMBER=(IGC0406H,IGC0506H,IGC0606H,IGC0706H)
 SELECT MEMBER=(IGC0806H,IGC0906H)
 SELECT MEMBER=(IGC0008A,IGG08101,IGG08102)
 SELECT MEMBER=(IGG08110,IGG08111,IGG08112)
 SELECT MEMBER=(IGG08113,IGG08114,IGG08115)
 SELECT MEMBER=(IGG019AE,IGG019BC,IGG019BH,IGG019BK)
 SELECT MEMBER=(IGG019CG,IGG019CI,IGG019CJ,IGG019CU)
 SELECT MEMBER=(IGG019CV,IGG019CW)
 SELECT MEMBER=(IGG019TV,IGG019TW)
   COPY OUTDD=SVCLIB,INDD=AOSBB
   SELECT MEMBER=(IGG0196T,IGG0201L)
 COPY OUTDD=SVCLIB,INDD=AOSD8
 SELECT MEMBER=(IGG019GG,IGG019HA,IGG019JH)
 COPY OUTDD=SVCLIB,INDD=AOSD8
 SELECT MEMBER=(IGG019HC,IGG019GH,IGG019JG)
 SELECT MEMBER=(IGG0192A,IGG0192B,IGG01921,IGG01920,IGG0202D,IGG0192C)
 SELECT MEMBER=(IGG01922)
 SELECT MEMBER=(IGG0192D,IGG0192E,IGG0192F,IGG0192G)
 SELECT MEMBER=(IGG0192U,IGG0192R,IGG0192S,IGG0192V,IGG0192T)
 SELECT MEMBER=(IGG019GA,IGG019GB,IGG019GC,IGG019GD,IGG019GE,IGG019GF)
 SELECT MEMBER=(IGG019IA,IGG019IB,IGG019IE,IGG019IF)
 SELECT MEMBER=(IGG0202N)
 SELECT MEMBER=(IGG0202I,IGG0202J,IGG0202K,IGG0202L,IGG0202M,IGG02028)
 SELECT MEMBER=(IGG019HB,IGG019HD,IGG019HF,IGG019HG)
 SELECT MEMBER=(IGG01924,IGG01928,IGG01929)
 SELECT MEMBER=(IGG02029,IGG019HL,IGG019HN)
 SELECT MEMBER=(IGG019HH,IGG019HI,IGG019HJ,IGG019HK)
 SELECT MEMBER=(IGG0195D,IGG0195G,IGG0196D,IGG0196G)
 SELECT MEMBER=(IGG0196C)
 SELECT MEMBER=(IGG0195T,IGG0195U,IGG019I1,IGG019I2)
 SELECT MEMBER=(IGG0192H,IGG0192P,IGG0192I,IGG0192K,IGG0192L,IGG0192M)
 SELECT MEMBER=(IGG0192Q,IGG0192N,IGG0192O,IGG0192J,IGG0202A,IGG019JU)
 SELECT MEMBER=(IGG0192W,IGG0192X,IGG0192Z,IGG01950)
 SELECT MEMBER=(IGG019J6,IGG019J7,IGG019JX,IGG019J0)
 SELECT MEMBER=(IGG019J3,IGG019JV,IGG019H3,IGG019H7)
 SELECT MEMBER=(IGG019JW,IGG019G0,IGG019G1,IGG019G2,IGG019G3,IGG019G4)
 SELECT MEMBER=(IGG019G5,IGG019G6,IGG019G7,IGG019G8,IGG019G9)
 SELECT MEMBER=(IGG019GO,IGG019GL,IGG019GM,IGG019GN)
 SELECT MEMBER=(IGG019IM,IGG019IN,IGG019IO,IGG019I9)
 SELECT MEMBER=(IGG019GW,IGG019GX,IGG019GY,IGG019GV,IGG019GZ)
 SELECT MEMBER=(IGG019IX,IGG019IY,IGG019IZ,IGG019JC)
 SELECT MEMBER=(IGG019JI,IGG019JJ,IGG019JK,IGG019JL,IGG019JM,IGG019JN)
 SELECT MEMBER=(IGG019JO,IGG019JP,IGG019JQ,IGG019JR)
 SELECT MEMBER=(IGG019JS,IGG019JT,IGG019HP)
 SELECT MEMBER=(IGG032I1,IGG032I2,IGG032I3,IGG032I4,IGG032I5,IGG032I6)
 SELECT MEMBER=(IGG032I7)
  SELECT  MEMBER=(IGG032I8)
 COPY OUTDD=SVCLIB,INDD=AOSB3
 S M=((IEE4303D,IGC4303D,R))
 S M=((IEE4403D,IGC4403D,R))
 S M=((IEE4603D,IGC4603D,R))
 S M=((IEE4703D,IGC4703D,R))
 S M=((IEE4903D,IGC4903D,R))
 S M=((IEE7203D,IGC7203D,R))
 S M=((IEE7303D,IGC7303D,R))
 COPY OUTDD=SVCLIB,INDD=AOSB3
 S M=((IEE4503D,IGC4503D,R))
 COPY OUTDD=SVCLIB,INDD=AOS00
 S M=((IEESMF8C,IGC0008C,R))
 S M=((IEESMFOP,IGC0108C,R))
 S M=((IEESMFAL,IGC0208C,R))
 COPY OUTDD=SVCLIB,INDD=AOSB3
 S M=((IEE2303D,IGC2303D,R))
 S M=((IEE0603D,IGC0603D,R))
 S M=((IEE1103D,IGC1103D,R))
 S M=((IEE3303D,IGC3303D,R))
 S M=((IEE3A03D,IGC3A03D,R))
 S M=((IEE3703D,IGC3703D,R))
 S M=((IEE2A03D,IGC2A03D,R))
 COPY OUTDD=SVCLIB,INDD=AOSB3
 S M=((IEE6603D,IGX00009,R))
 S M=((IEE5603D,IGC5603D,R))
 S M=((IEE5903D,IGC5903D,R))
 S M=((IEE1403D,IGX00011,R))
 S M=((IEE6303D,IGC6303D,R))
 S M=((IEE6403D,IGC6403D,R))
 S M=((IEE6703D,IGC6703D,R))
 S M=((IEE6803D,IGC6803D,R))
 S M=((IEE6903D,IGC6903D,R))
 S M=((IEE7503D,IGC7503D,R))
 S M=((IEE7603D,IGC7603D,R))
 S M=((IEE7703D,IGC7703D,R))
 S M=((IEE7803D,IGC7803D,R))
 S M=((IEE7103D,IGC7103D,R))
 S M=((IEESD566,IGX00012,R))
 S M=((IEE3503D,IGC3503D,R))
 S M=((IEE8703D,IGC8703D,R))
 S M=((IEE8803D,IGC8803D,R))
 S M=((IEE8903D,IGC8903D,R))
 S M=((IEE9603D,IGC9603D,R))
 S M=((IEE2903D,IGC2903D,R))
 S M=((IEE9903D,IGC9903D,R))
 S M=((IEEDFIN1,IGX00000,R))
 S M=((IEEDFIN2,IGX01000,R))
 S M=((IEEDFIN3,IGX02000,R))
 S M=((IEEDFIN4,IGX00001,R))
 S M=((IEEDFIN5,IGX00002,R))
 S M=((IEEDFIN6,IGX03000,R))
 S M=((IEEDFIN7,IGX04000,R))
 S M=((IEEDFINA,IGX00003,R))
 S M=((IEEXEDNA,IGCXE03D,R))
 S M=((IEE3803D,IGC3803D,R))
 S M=((IEE9303D,IGC9303D,R))
 S M=((IEE60110,IGC60110,R))
 S M=((IEE7903D,IGC7903D,R))
 S M=((IEE8503D,IGC8503D,R))
 S M=((IEE0403D,IGC0403D,R))
 S M=((IHK1503D,IGC1503D,R))
 S M=((IEE1903D,IGC1903D,R))
 S M=((IEESD571,IGC1803D,R))
 S M=((IEE0303D,IGC0003D,R))
 S M=((IEE5103D,IGX00016,R))
 S M=((IEE9403D,IGC9403D,R))
 S M=((IEE1603D,IGC1603D,R))
 S M=((IEE0303F,IGC0003F,R))
 S M=((IEE0403F,IGC0403F,R))
 COPY OUTDD=SVCLIB,INDD=AOSC5
 S M=((IEECMOCP,IGC2I07B,R))
 S M=((IEECVOCC,IGC1I07B,R))
 S M=((IEECVOCX,IGC0I07B,R))
 S M=((IEEVROUT,IGC0503E,R))
 S M=((IEEMFWTO,IGC0003E,R))
 S M=((IEEVWTOR,IGC0103E,R))
 COPY OUTDD=SVCLIB,INDD=AOSB3
 S M=((IEFWTP00,IGC0203E,R))
 COPY OUTDD=SVCLIB,INDD=AOSC5
 S M=((IEECMPM1,IGC0207B,R))
 S M=((IEECVML3,IGC0603E,R))
 S M=((IEECVML5,IGC0703E,R))
 S M=((IEECVFT1,IGC6107B,R))
 S M=((IEECVFTA,IGC6A07B,R))
 S M=((IEECVFTB,IGC6B07B,R))
 S M=((IEECVFT2,IGC6207B,R))
 S M=((IEECVFTD,IGC6D07B,R))
 S M=((IEECVFTN,IGC6N07B,R))
 S M=((IEECVFTP,IGC6P07B,R))
 S M=((IEECVFTL,IGC6L07B,R))
 S M=((IEECVFTM,IGC6M07B,R))
 S M=((IEECVFTO,IGC6O07B,R))
 S M=((IEECVFTQ,IGC6Q07B,R))
 S M=((IEECLCTX,IGCXL07B,R))
 S M=((IEECMCTX,IGCXM07B,R))
 S M=((IEECNCTX,IGCXN07B,R))
 S M=((IEECOCTX,IGCXO07B,R))
 S M=((IEE1A03D,IGC1203D,R))
 S M=((IEE1B03D,IGC1B03D,R))
 S M=((IEECMCTR,IGC0007B,R))
 S M=((IEECMPMP,IGC2107B,R))
 S M=((IEECMPMC,IGC1107B,R))
 S M=((IEECMPMX,IGC0107B,R))
 S M=((IEECVETW,IGC5W07B,R))
 S M=((IEECMWTL,IGC0907B,R))
 S M=((IEAPGSTN,IGC9203D,R))
 COPY OUTDD=SVCLIB,INDD=AOSC5
 S M=((IEECVFTT,IGC6T07B,R))
 S M=((IEECVFTG,IGC6G07B,R))
 S M=((IEECVET1,IGC5107B,R))
 S M=((IEECVET2,IGC5207B,R))
 S M=((IEECVET3,IGC5307B,R))
 S M=((IEECVET4,IGC5407B,R))
 S M=((IEECVET6,IGC5607B,R))
 S M=((IEECVET7,IGC5707B,R))
 S M=((IEECVET8,IGC5807B,R))
 S M=((IEECVET9,IGC5907B,R))
 S M=((IEECVETA,IGC5A07B,R))
 S M=((IEECVETC,IGC5C07B,R))
 S M=((IEECVETD,IGC5D07B,R))
 S M=((IEECVETE,IGC5E07B,R))
 S M=((IEECVETF,IGC5F07B,R))
 S M=((IEECVETG,IGC5G07B,R))
 S M=((IEECVETJ,IGC5J07B,R))
 S M=((IEECVETK,IGC5K07B,R))
 S M=((IEECVETZ,IGC5Z07B,R))
 S M=((IEECXDOM,IGC0008G,R))
 S M=((IEECVETU,IGC5U07B,R))
 S M=((IEECVETV,IGC5V07B,R))
 COPY OUTDD=SVCLIB,INDD=AOSD7
 SELECT MEMBER=(IGG019KC,IGG019KE,IGG019KG)
 SELECT MEMBER=(IGG019KR,IGG0193G,IGG0193F)
 SELECT MEMBER=(IGG019KA,IGG019KJ,IGG019KL)
 SELECT MEMBER=(IGG019KQ,IGG019KU,IGG0193A,IGG0193C)
 SELECT MEMBER=(IGG019JA,IGG019JB)
 SELECT MEMBER=(IGG0203A,IGG019DC,IGG0191L)
 SELECT MEMBER=(IGG019BR,IGG019BS,IGG019BT,IGG0199L)
 SELECT MEMBER=(IGG0191M,IGG019KF,IGG019KH)
 SELECT MEMBER=(IGG019LG)
 SELECT MEMBER=(IGC0005C)
 SELECT MEMBER=(IGG019KW,IGG019KY,IGG019LA,IGG019LC,IGG019LI)
 SELECT MEMBER=(IGG019LE,IGG0193E)
 SELECT MEMBER=(IGG019DA,IGG019DB,IGG019DD)
 SELECT MEMBER=(IGG019KN)
 SELECT MEMBER=(IGG019KI,IGG019KK,IGG019KM)
 SELECT MEMBER=(IGG019KO)
 COPY OUTDD=SVCLIB,INDD=AOSD0
~raw00001200402021004020410011000000204040202040420040202001001240224022400140044100100010001000020010001102400140044100100010001000020050002022202200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 SELECT MEMBER=(IGC0001I)
 SELECT MEMBER=(IGC0002B)
 SELECT MEMBER=(IGC0002C,IFG0232A)
 SELECT MEMBER=(IGC0003A)
 SELECT MEMBER=(READPSWD)
 SELECT MEMBER=(SECLOADA)
 SELECT MEMBER=(IGG0196M,IGG0193K,IGG0203K)
 SELECT MEMBER=(IGG0193H,IGG0203S)
 SELECT MEMBER=(IGC0005E)
 SELECT MEMBER=(IGC0006D)
 SELECT MEMBER=(IFG019RA)
 SELECT MEMBER=(IFG0190P)
 SELECT MEMBER=(IFG0190R,IFG0200R,IFG0550R)
 SELECT MEMBER=(IFG0193A,IFG0193B,IFG0193D)
 SELECT MEMBER=(IFG0193C,OMODVOL1)
 SELECT MEMBER=(IFG0193E,IFG0194A,IFG0194C,IFG0194D)
 SELECT MEMBER=(IFG0194E,IFG0194F,IFG0194G,IFG0194H)
 SELECT MEMBER=(IFG0194I,IFG0194R)
 SELECT MEMBER=(IFG0194J,IGG0190A)
 SELECT MEMBER=(IFG0195A,IFG0195B)
 SELECT MEMBER=(IFG0195C,IFG0195E,IFG0195G)
 SELECT MEMBER=(IFG0195D,IGG0190B)
 SELECT MEMBER=(IFG0195H,IFG0195J,IFG0195K,IFG0195M)
 SELECT MEMBER=(IFG0195N,IFG0195O,IFG0195P,IFG0195T)
 SELECT MEMBER=(IFG0195U,IFG0196J,IFG0196K)
 SELECT MEMBER=(IFG0196L,IFG0196M,IFG0196N)
 SELECT MEMBER=(IFG0196O,IGG0190R)
 SELECT MEMBER=(IFG0196Q,IFG0196T,IFG0196U,IFG0196V)
 SELECT MEMBER=(IFG0197A,IGG0190S)
 SELECT MEMBER=(IFG0196W,IGG01999)
 SELECT MEMBER=(IFG0196X,IFG0198N)
 SELECT MEMBER=(IFG0199B,IFG0209B,IFG0239B,IFG0559B)
 SELECT MEMBER=(IFG0199D,IFG0209D,IFG0239D,IFG0559D)
 SELECT MEMBER=(IFG0199E,IFG0209E,IFG0239E,IFG0559E)
 SELECT MEMBER=(IFG0199R,IFG0209R,IFG0239R,IFG0559R)
 SELECT MEMBER=(IFG019TR,IFG020TR,IFG023TR,IFG055TR)
 SELECT MEMBER=(IFG0200P,IGG0206M)
 SELECT MEMBER=(IFG0200V,IFG0200W,IFG0200Z)
 SELECT MEMBER=(IFG0200X,IGG0200G)
 SELECT MEMBER=(IFG0200Y,IGG02099)
 SELECT MEMBER=(IFG0201R,IFG0202A)
 SELECT MEMBER=(IFG0202B,IGG0200B,IFG0232Y,IFG0556B)
 SELECT MEMBER=(IFG0202C,IFG0202D,IFG0202E,IFG0202F)
 SELECT MEMBER=(IFG0202H,IFG0553B)
 SELECT MEMBER=(IFG0202G,IFG0202I,IFG0202J)
 SELECT MEMBER=(IFG0202K,IFG0202L)
 SELECT MEMBER=(IFG0230P,IFG0232D,IFG0232G,IFG0232J)
 SELECT MEMBER=(IFG0232M,IFG0232S)
 SELECT MEMBER=(IFG0232Z,IFG0202U)
 SELECT MEMBER=(IFG0550P,IFG0551B,IFG0551D,IFG0551F)
 SELECT MEMBER=(IFG0551H,IFG0551J)
 SELECT MEMBER=(IFG0551L,IGG0551A)
 SELECT MEMBER=(IFG0551N,IGG0551B)
 SELECT MEMBER=(IFG0551P,IFG0551R,IFG0551V,IFG0551Z)
 SELECT MEMBER=(IFG0551T,IGG0550F)
 SELECT MEMBER=(IFG0551X,IGG0550P)
 SELECT MEMBER=(IFG0552B,IFG0552D,IFG0552F,IFG0552H)
 SELECT MEMBER=(IFG0552J,EMODVOL1)
 SELECT MEMBER=(IFG0552N,IGG0550H)
 SELECT MEMBER=(IFG0552R,IGG0550B)
 SELECT MEMBER=(IFG0552L,IFG0552P,IFG0552T)
 SELECT MEMBER=(IFG0552V,IFG0552X,IFG0552Y,IFG0552Z)
 SELECT MEMBER=(IFG0553D,IFG0553F,IFG0553P,IFG0553R)
 SELECT MEMBER=(IFG0553H,IGG0550D)
 SELECT MEMBER=(IFG0553T,IFG0553V,IFG0553X,IFG0553Z)
 SELECT MEMBER=(IFG0554B,IFG0554D,IFG0554J,IFG0554N)
 SELECT MEMBER=(IFG0554L,IFG0195F)
 SELECT MEMBER=(IFG0554P,IGG0550K)
 SELECT MEMBER=(IFG0554R,IGG0552K)
 SELECT MEMBER=(IFG0554T,IGG0550S)
 SELECT MEMBER=(IFG0554V,IFG0554X,IFG0554Z,IFG0555B)
 SELECT MEMBER=(IFG0555D,IFG0555F,IFG0555H)
 SELECT MEMBER=(IFG0555J,IFG0196P)
 SELECT MEMBER=(IFG0558X)
 COPY OUTDD=SVCLIB,INDD=AOSD0
 SELECT MEMBER=(IGC0002G,IGC0102G)
 SELECT MEMBER=(IGC0002I,IGG0290A,IGG0290B,IGG0290C)
 SELECT MEMBER=(IGG0290D,IGG0290E,IGG0290F,IGG0299A)
~raw00001200402021004020410011000000204040202040420040202001001240224022400140044100100010001000010010001102400140044100100010001000010050002022110240014004400410000100100010000400202200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 SELECT MEMBER=(IGG03002,IGG03003)
 SELECT MEMBER=(IGC0003B,IGG0325A,IGG0325B,IGG0325C,IGG0325D)
 SELECT MEMBER=(IGG0325E,IGG0325G,IGG0325H,IGG0325K)
 SELECT MEMBER=(IGG0325F,IGG0325J,IGG0325L)
 SELECT MEMBER=(IGG0325M,IGG0325S)
 SELECT MEMBER=(IGG0325P,IGG0325Q,IGG0325R,IGG0325T)
 SELECT MEMBER=(IGG0325U,IGG0325V,IGG0325W,IGG0325Z)
 SELECT MEMBER=(IGC0007H,IGC0107H)
 SELECT MEMBER=(IGC0009H,IGC0109H,IGC0209H)
 SELECT MEMBER=(IGG019EK)
 SELECT MEMBER=(IGG020P1,IGG020P2,IGG020P3,IGG020D0,IGG020D1)
 SELECT MEMBER=(IGG0553A,IGG0553B,IGG0553C,IGG0553D)
 SELECT MEMBER=(IGG0553E,IGG0553F,IGG0553G)
 SELECT MEMBER=(IGC0002H)
 SELECT MEMBER=(IGG0CLF2,IGG0CLC1,IGG0CLC2,IGG0CLC3)
 SELECT MEMBER=(IGG0CLC0,IGG0CLC4,IGG0CLC5,IGG0CLC6,IGG0CLC7)
 SELECT MEMBER=((IGG0CLCC,IGC0002F),IGG0CLCA,IGG0CLCB)
 COPY OUTDD=SVCLIB,INDD=AOSU0
 SELECT MEMBER=(IGC0008B,IGC0108B,IGC0208B,IGG019P8,IGG019P9)
 SELECT MEMBER=(IGC0008F,IGG0860A,IGG0860B,IGG0860C,IGG0860D)
 SELECT MEMBER=(IGG086AE,IGC0308B,IGG019C8,IGG019FT,IGG019P7)
 COPY OUTDD=SVCLIB,INDD=AOSC6
 SELECT MEMBER=((IHJACP00,IGC0006C),(IHJACP01,IGC0106C))
 SELECT MEMBER=((IHJACP02,IGC0206C),(IHJACP20,IGC0A06C))
 SELECT MEMBER=((IHJACP50,IGC0Q06C),(IHJARS00,IGC0005B))
 SELECT MEMBER=((IHJACP25,IGC0D06C),(IHJACP70,IGC0S06C))
 SELECT MEMBER=((IHJARS01,IGC0205B),(IHJARS60,IGC0V05B))
 SELECT MEMBER=((IHJACP30,IGC0F06C),(IHJARS20,IGC0505B))
 SELECT MEMBER=(IGC0506C,IGC0N06C,IGC0G95B,IGC0G05B)
 SELECT MEMBER=(IGC0H05B,IGC0I05B,IGC0K05B,IGC0L05B,IGC0M05B)
 SELECT MEMBER=(IGC0N05B,IGC0P05B,IGC0S05B,IGC0W05B)
 SELECT MEMBER=(IGC0R05B,IGC0T05B,IGC0U05B)
 SELECT MEMBER=((IHJARS21,IGC0605B))
 COPY OUTDD=SVCLIB,INDD=AOS06
 SELECT MEMBER=(IGC0005I,IGC0505I)
 SELECT MEMBER=(IGC0605I,IGC0905I)
 COPY OUTDD=SVCLIB,INDD=AOSC5
 SELECT MEMBER=(IGC0105I)
 COPY OUTDD=SVCLIB,INDD=SVCLIBA
 SELECT MEMBER=(IGC0022G)
 SELECT MEMBER=(IGC0022H)
 SELECT MEMBER=(IGC0023A)
 SELECT MEMBER=(IGC0023D)
 SELECT MEMBER=(IGC0024B)
 SELECT MEMBER=(IGC0024H)
 SELECT MEMBER=(IGC0024I)
/*
//G09GEN6 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC  PGM=IEBCOPY,COND=(4,LT)
//SYSPRINT DD SPACE=(121,(500,40),RLSE),
//   DCB=(RECFM=FB,LRECL=121,BLKSIZE=121),SYSOUT=A
//AMACLIB DD DSNAME=SYS1.AMACLIB,DISP=SHR
//MACLIB DD DSN=SYS1.MACLIB,VOL=(,RETAIN,SER=FGEN67),
//             DISP=OLD,UNIT=3350
//SYSUT3 DD DSN=&SYSUT3,SPACE=(1700,(10,5)),UNIT=SYSDA
//SYSUT4 DD DSN=&SYSUT4,SPACE=(460,(30,24)),UNIT=SYSDA
//ASAMPLIB DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.ASAMPLIB
//SAMPLIB DD DSN=SYS1.SAMPLIB,
//        VOL=(,RETAIN,SER=FGEN67),
//        UNIT=3350,DISP=OLD
//APARMLIB DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.APARMLIB
//PARMLIB DD VOL=(,RETAIN,SER=FGEN67),DISP=OLD,
//   DSN=SYS1.PARMLIB,UNIT=3350
//APROCLIB DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.APROCLIB
//PROCLIB DD VOL=(,RETAIN,SER=FGEN67),DISP=OLD,
//   DSN=SYS1.PROCLIB,UNIT=3350
//ARMTMAC DD DISP=SHR,DSNAME=SYS1.ARMTMAC
//RMTMAC  DD DSN=SYS1.RMTMAC,UNIT=3350,VOL=SER=FGEN67,DISP=OLD
//ATCAMMAC DD DISP=SHR,DSNAME=SYS1.ATCAMMAC
//SYSIN DD *
 COPY OUTDD=MACLIB,INDD=AMACLIB
 COPY OUTDD=MACLIB,INDD=ATCAMMAC
 COPY OUTDD=RMTMAC,INDD=ARMTMAC
 COPY OUTDD=PARMLIB,INDD=APARMLIB
 COPY OUTDD=PROCLIB,INDD=APROCLIB
 COPY  OUTDD=SAMPLIB,INDD=ASAMPLIB
/*
//G09GEN7 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC PGM=IFCDIP00,COND=(8,LT)
//STEPLIB DD DSN=SYS1.AOSCD,DISP=SHR
//SERERDS DD   DSN=SYS1.LOGREC,DISP=(NEW,KEEP),
//             VOLUME=(,RETAIN,SER=FGEN67),
//             SPACE=(TRK,(15),,CONTIG),UNIT=3350
//SG2 EXEC PGM=IEHPROGM,COND=(8,LT)
//TARG DD VOLUME=SER=FGEN67,DISP=OLD,UNIT=3350
//SYSPRINT DD SYSOUT=A
//SYSIN DD *
 CATLG CVOL=3350=FGEN67,VOL=3350=FGEN67,DSNAME=SYS1.LOGREC
/*
//G09GEN8 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC PGM=IEBCOPY,COND=(8,LT)
//SYSUT3 DD DSN=&SYSUT3,SPACE=(1700,(10,5)),UNIT=SYSDA
//SYSUT4 DD DSN=&SYSUT4,SPACE=(460,(30,24)),UNIT=SYSDA
//SYSPRINT DD SPACE=(121,(500,40),RLSE),
//   DCB=(RECFM=FB,LRECL=121,BLKSIZE=121),SYSOUT=A
//OBJ1   DD DSN=SYS1.OBJPDS1,DISP=OLD
//OBJ2   DD DSN=SYS1.OBJPDS2,DISP=OLD
//OBJ3   DD DSN=SYS1.OBJPDS3,DISP=OLD
//SYSIN DD *
 COPY OUTDD=OBJ1,INDD=((OBJ2,R))
 COPY OUTDD=OBJ1,INDD=((OBJ3,R))
/*
//G09GEN9 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC PGM=IEBCOPY,COND=(8,LT)
//SYSUT3 DD DSN=&SYSUT3,SPACE=(1700,(10,5)),UNIT=SYSDA
//SYSUT4 DD DSN=&SYSUT4,SPACE=(460,(30,24)),UNIT=SYSDA
//SYSPRINT DD SPACE=(121,(500,40),RLSE),
//   DCB=(RECFM=FB,LRECL=121,BLKSIZE=121),SYSOUT=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//AOSC5 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSC5
//AOSD0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSD0
//AOSCD DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSCD
//LINKLIB DD VOL=(,RETAIN,SER=FGEN67),DISP=OLD,
//   DSN=SYS1.LINKLIB,UNIT=3350
//SVCLIB DD DSN=SYS1.SVCLIB,VOL=(,RETAIN,SER=FGEN67),
//     UNIT=3350,DISP=OLD
//AOSCE DD DISP=SHR,VOL=(,RETAIN),DSN=SYS1.AOSCE
//IMAGELIB DD VOL=(,RETAIN,SER=FGEN67),DISP=OLD,
//   DSN=SYS1.IMAGELIB,UNIT=3350
//AOS20 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS20
//AOS06 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS06
//AOS21 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS21
//AOS0A DD DISP=SHR,DSNAME=SYS1.AOS0A,VOLUME=(,RETAIN)
//TELCMLIB DD VOL=(,RETAIN,SER=FGEN67),DISP=OLD,
//   DSN=SYS1.TELCMLIB,UNIT=3350
//AOS22 DD DISP=SHR,DSNAME=SYS1.AOS22,VOLUME=(,RETAIN)
//AOS23 DD DISP=SHR,DSNAME=SYS1.AOS23,VOLUME=(,RETAIN)
//VTAMLIB DD DISP=OLD,VOL=(,RETAIN,SER=FGEN67),
//      DSN=SYS1.VTAMLIB,UNIT=3350
//SYSIN DD *
 COPY OUTDD=SVCLIB,INDD=AOSU0
 SELECT MEMBER=(IGC0003I)
 COPY  OUTDD=LINKLIB,INDD=AOSCE
 SELECT MEMBER=IGFVMCD0
 SELECT MEMBER=IGFVMCE4
 SELECT MEMBER=IGFVMCE5
 SELECT MEMBER=IGFVMCF6
 SELECT MEMBER=IGFVCC35
 SELECT MEMBER=IGFVMCB1
 SELECT MEMBER=IGFTMCHK
 SELECT MEMBER=IGFVMCF0
 SELECT MEMBER=IGFVCCIN
 SELECT MEMBER=IGFVCC60
 SELECT MEMBER=IGFVCC70
 SELECT MEMBER=IGFVCC80
 SELECT MEMBER=IGFVCC55
 SELECT MEMBER=IGFVCC45
 COPY OUTDD=SVCLIB,INDD=AOSCE
 SELECT MEMBER=IGFVMCD0
 SELECT MEMBER=IGFVMCD1
 SELECT MEMBER=IGFVMCE3
 SELECT MEMBER=IGFVMCE5
 SELECT MEMBER=IGFVMCF1
 SELECT MEMBER=IGFVMCF2
 SELECT MEMBER=IGFVMCF3
 SELECT MEMBER=IGFVMCF4
 SELECT MEMBER=((IGFVMCE1,IGCR207B))
 SELECT MEMBER=((IGFVMCE2,IGCR107B))
 SELECT MEMBER=((IGFVMCD4,IGC2603D))
 SELECT MEMBER=((IGF2503D,IGC2503D))
 COPY OUTDD=TELCMLIB,INDD=AOS0A
 SELECT MEMBER=(IHKAFI,IHKAVT,IHKBGN,IHKBPM,IHKCCI,IHKCCS)
 SELECT MEMBER=(IHKCMD,IHKDEF,IHKDSP,IHKEXC,IHKEXF,IHKGCW)
 SELECT MEMBER=(IHKINI,IHKIRL,IHKIRP,IHKLAB,IHKLAD,IHKLAP)
 SELECT MEMBER=(IHKLAT,IHKLEW,IHKLST,IHKMOD,IHKMSG,IHKNBX)
 SELECT MEMBER=(IHKNUM,IHKRNQ,IHKSCN,IHKSDQ,IHKSMG,IHKSYN)
 SELECT MEMBER=(IHKUTM,IHKWTR)
 COPY OUTDD=SVCLIB,INDD=AOS20
 SELECT MEMBER=(IGE0004A)
 SELECT MEMBER=(IGC0006F,IGC0106F,IGC0206F,IGC0306F)
 SELECT MEMBER=(IGC0406F,IGC0506F,IGC0606F)
 SELECT MEMBER=(IGC0706F,IGC0806F,IGC0906F,IGC0A06F)
 SELECT MEMBER=(IGC0B06F,IGC0C06F,IGC0D06F)
 SELECT MEMBER=(IGC0E06F,IGC0F06F,IGC1006F)
 SELECT MEMBER=(IGC1106F,IGC1206F,IGC1306F)
 SELECT MEMBER=(IGC1406F)
 SELECT MEMBER=(IGG019PI)
 SELECT MEMBER=(IGG019MR)
 SELECT MEMBER=(IGE0104A,IGE0204A,IGE0304A)
 SELECT MEMBER=(IGE0404A,IGE0504A,IGE0604A,IGE0704A)
 SELECT MEMBER=(IGE0804A,IGE0904A,IGE0004B,IGE0104B)
 SELECT MEMBER=(IGE0204B,IGE0304B,IGE0404B,IGE0504B)
 SELECT MEMBER=(IGE0604B,IGE0704B,IGE0804B)
 SELECT MEMBER=(IGE0004C,IGE0104C,IGE0204C,IGE0304C)
 SELECT MEMBER=(IGE0404C,IGE0504C,IGE0604C,IGE0704C)
 SELECT MEMBER=(IGE0804C,IGE0904C)
 SELECT MEMBER=(IGE0504D,IGE0904D)
 SELECT MEMBER=(IGG019MA,IGG019MB,IGG019MC,IGG019MS)
 SELECT MEMBER=(IGG019LP)
 SELECT MEMBER=(IGG019PK)
 SELECT MEMBER=(IGG019PA)
 SELECT MEMBER=(IGG019UP)
 SELECT MEMBER=(IGG019MD,IGG019MF,IGG019MI,IGG019MJ)
 SELECT MEMBER=(IGG019ML,IGG019MN,IGG019MP)
 SELECT MEMBER=(IGG019MT,IGG019MU,IGG019MV,IGG019MW)
 SELECT MEMBER=(IGG019MX,IGG019MY,IGG019MZ,IGG019M0)
 SELECT MEMBER=(IGG019M3)
 SELECT MEMBER=(IGG019ME,IGG019MK,IGG019M1,IGG019M2)
 SELECT MEMBER=(IGG019M4)
 SELECT MEMBER=(IGG019M5,IGG019M6)
 SELECT MEMBER=(IGG019PB,IGG019PC,IGG019PD)
 SELECT MEMBER=(IGG019PE,IGG019PF)
 SELECT MEMBER=(IGG019PL,IGG019PM)
 SELECT MEMBER=(IGG019PN,IGG019PO)
 SELECT MEMBER=(IGG019PP,IGG019PQ)
 SELECT MEMBER=(IGG019PG,IGG019PH)
 SELECT MEMBER=(IGG0193M,IGG0193Q,IGG0193S,IGG0203M)
 SELECT MEMBER=(IGG0194N,IGG0195N)
 SELECT MEMBER=(IGG0194P,IGG0194Q)
 COPY OUTDD=TELCMLIB,INDD=AOS20
 SELECT MEMBER=(IECTEDIT)
 SELECT MEMBER=(IECTLERP,IECTLOPN,IECTONLT)
 SELECT MEMBER=(IECTTRNS,IECTCHGN,IECTSCAN)
 COPY OUTDD=SVCLIB,INDD=AOS21
 SELECT MEMBER=((IED1303D,IGC1303D,R))
 SELECT MEMBER=(IEDQOT01,IGC0Q01C)
 SELECT MEMBER=(IGCAA10D,IGCAB10D,IGCAC10D)
 SELECT MEMBER=(IGCAD10D,IGCAE10D,IGCAF10D)
 SELECT MEMBER=(IGCAG10D,IGCAL10D,IGCAT10D)
 SELECT MEMBER=(IGCA010D,IGCA110D,IGCA210D)
 SELECT MEMBER=(IGCA310D,IGCA410D,IGCA510D)
 SELECT MEMBER=(IGCA610D,IGCA710D,IGCA810D)
 SELECT MEMBER=(IGCA910D,IGCC010D,IGCC110D)
 SELECT MEMBER=(IGCDB10D,IGCDC10D)
 SELECT MEMBER=(IGCDD10D,IGCDL10D)
 SELECT MEMBER=(IGCD010D,IGCD110D,IGCD210D)
 SELECT MEMBER=(IGCD310D,IGCD410D,IGCD510D)
 SELECT MEMBER=(IGCD610D,IGCD710D,IGCD810D)
 SELECT MEMBER=(IGCD910D,IGCFA10D,IGCFB10D)
 SELECT MEMBER=(IGCFC10D,IGCFE10D,IGCFF10D)
 SELECT MEMBER=(IGCFG10D,IGCFH10D,IGCFI10D)
 SELECT MEMBER=(IGCFJ10D,IGCFK10D,IGCFL10D)
 SELECT MEMBER=(IGCFP10D,IGCFQ10D,IGCH010D)
 SELECT MEMBER=(IGCI010D,IGCI110D,IGCI210D)
 SELECT MEMBER=(IGCI310D,IGCMA10D,IGCMB10D)
 SELECT MEMBER=(IGCMD10D,IGCME10D,IGCMF10D)
 SELECT MEMBER=(IGCMG10D,IGCMH10D,IGCMI10D)
 SELECT MEMBER=(IGCMK10D,IGCML10D,IGCMM10D)
 SELECT MEMBER=(IGCMN10D,IGCMP10D,IGCMR10D)
 SELECT MEMBER=(IGCMS10D,IGCMT10D,IGCMU10D)
 SELECT MEMBER=(IGCMV10D,IGCMY10D,IGCMZ10D)
 SELECT MEMBER=(IGCM010D)
 SELECT MEMBER=(IGCM110D,IGCM210D,IGCM310D)
 SELECT MEMBER=(IGCM410D,IGCM510D,IGCM610D)
 SELECT MEMBER=(IGCM710D,IGCM810D,IGCM910D)
 SELECT MEMBER=(IGCN010D,IGCN410D,IGCN510D)
 SELECT MEMBER=(IGCR010D,IGCSW10D,IGCT010D)
 SELECT MEMBER=(IGCT110D,IGCT210D)
 SELECT MEMBER=(IGCVA10D,IGCVE10D,IGCVF10D)
 SELECT MEMBER=(IGCVG10D,IGCVI10D,IGCV010D)
 SELECT MEMBER=(IGCV110D,IGCV210D,IGCV310D)
 SELECT MEMBER=(IGCV410D,IGCV510D,IGCV610D)
 SELECT MEMBER=(IGCV710D,IGCV810D,IGCV910D)
 SELECT MEMBER=(IGCZ010D,IGCZ110D,IGC0A10D)
 SELECT MEMBER=(IGC0B10D,IGC0C10D,IGC0D10D)
 SELECT MEMBER=(IGC0E10D,IGC0G10D)
 SELECT MEMBER=(IGC0H10D,IGC0I10D)
 SELECT MEMBER=(IGC0J05B)
 SELECT MEMBER=(IGC0J10D,IGC0K10D,IGC0L10D)
 SELECT MEMBER=(IGC0N10D,IGC0010D,IGC0110D)
 SELECT MEMBER=(IGC0210D,IGC0310D,IGC0410D)
 SELECT MEMBER=(IGC0510D,IGC0610D,IGC0710D)
 SELECT MEMBER=(IGC0810D,IGC0910D)
 SELECT MEMBER=(IGE0004G,IGE0004H,IGE0004I)
 SELECT MEMBER=(IGE0104G,IGE0104H,IGE0204G)
 SELECT MEMBER=(IGE0204H,IGE0304G,IGE0404G)
 SELECT MEMBER=(IGE0404H,IGE0504G,IGE0504H)
 SELECT MEMBER=(IGE0604G,IGE0804G,IGE0804H)
 SELECT MEMBER=(IGE0904G,IGE0904H,IGE0904I)
 SELECT MEMBER=(IGG019AO,IGG019AP)
 SELECT MEMBER=(IGG01930,IGG01931,IGG01933)
 SELECT MEMBER=(IGG01934,IGG01935,IGG01936)
 SELECT MEMBER=(IGG01937,IGG01938,IGG01939)
 SELECT MEMBER=(IGG0194B,IGG01940,IGG01941)
 SELECT MEMBER=(IGG01942,IGG01943,IGG01944)
 SELECT MEMBER=(IGG01945,IGG01946,IGG01947)
 SELECT MEMBER=(IGG01948,IGG01949,IGG0198B)
 SELECT MEMBER=(IGG0198D,IGG0198E,IGG0203B)
 SELECT MEMBER=(IGG02030,IGG02035,IGG02036)
 SELECT MEMBER=(IGG02041,IGG02046,IGG02047)
 COPY OUTDD=SVCLIB,INDD=AOS21
 SELECT MEMBER=(IGG019EM,IGG019QE,IGG019Q0)
 SELECT MEMBER=(IGG019Q1,IGG019Q2,IGG019Q3)
 SELECT MEMBER=(IGG019Q4,IGG019Q5,IGG019Q6)
 SELECT MEMBER=(IGG019Q7,IGG019Q8,IGG019Q9)
 SELECT MEMBER=(IGG019RA,IGG019RC,IGG019RD)
 SELECT MEMBER=(IGG019RE,IGG019RF,IGG019RG)
 SELECT MEMBER=(IGG019RI,IGG019RK,IGG019RL)
 SELECT MEMBER=(IGG019RM,IGG019RN,IGG019RO)
 SELECT MEMBER=(IGG019RP,IGG019RQ,IGG019RR)
 SELECT MEMBER=(IGG019RS,IGG019RT,IGG019RU)
 SELECT MEMBER=(IGG019RV,IGG019RW,IGG019RX)
 SELECT MEMBER=(IGG019RY,IGG019R0,IGG019R1)
 SELECT MEMBER=(IGG019R2,IGG019R3,IGG019R4)
 SELECT MEMBER=(IGG019R5,IGG019R6,IGG019R7)
 SELECT MEMBER=(IGG019R8,IGG019R9,IGG019TE)
 SELECT MEMBER=(IGG019TH,IGG019TI,IGG019TM)
 COPY OUTDD=TELCMLIB,INDD=AOS21
 SELECT MEMBER=(IEDBITN,IEDCMIN,IEDCMOUT)
 SELECT MEMBER=((IEDCSA,IEDIAP03,R))
 SELECT MEMBER=(IEDCSCIN,IEDDFOUT,IEDDVAS)
 SELECT MEMBER=(IEDFSSTB,IEDIAH,IEDIAM)
 SELECT MEMBER=((IEDIAP,IEDIAP01,R))
 SELECT MEMBER=(IEDIAQ,IEDIAR,IEDIAS,IEDIAU)
 SELECT MEMBER=(IEDLUS,IEDMVBFR,IEDNCU)
 SELECT MEMBER=(IEDNCU2,IEDNGD,IEDNID,IEDNKA)
 SELECT MEMBER=(IEDNSL,IEDN25,IEDOPTN)
 SELECT MEMBER=(IEDPCIN,IEDPCOUT,IEDQAA)
 SELECT MEMBER=(IEDQAB,IEDQAC,IEDQAD,IEDQAE)
 SELECT MEMBER=(IEDQAF,IEDQAG,IEDQAH,IEDQAI)
 SELECT MEMBER=(IEDQAJ,IEDQAK,IEDQAL,IEDQAM)
 SELECT MEMBER=(IEDQAN,IEDQAO,IEDQAP,IEDQAQ)
 SELECT MEMBER=(IEDQAR,IEDQAS,IEDQAT,IEDQAU)
 SELECT MEMBER=(IEDQAV,IEDQAW,IEDQAX,IEDQAY)
 SELECT MEMBER=(IEDQAZ,IEDQA0,IEDQA1,IEDQA2)
 SELECT MEMBER=(IEDQA3,IEDQA4,IEDQA5,IEDQA6)
 SELECT MEMBER=(IEDQA7,IEDQA8,IEDQA9,IEDQBA)
 SELECT MEMBER=(IEDQBB,IEDQBC,IEDQBD,IEDQBE)
 SELECT MEMBER=(IEDQBF,IEDQBG,IEDQBH,IEDQBI)
 SELECT MEMBER=(IEDQBJ,IEDQBL,IEDQBM,IEDQBN)
 SELECT MEMBER=(IEDQBO,IEDQBP,IEDQBQ,IEDQBR)
 SELECT MEMBER=(IEDQBS,IEDQBT,IEDQBU)
 SELECT MEMBER=(IEDQBUFF,IEDQBV)
 SELECT MEMBER=(IEDQBX,IEDQBY,IEDQBZ,IEDQB1)
 SELECT MEMBER=(IEDQB2,IEDQB3,IEDQB4,IEDQB7)
 SELECT MEMBER=(IEDQFA,IEDQFA1,IEDQFA2)
 SELECT MEMBER=(IEDQFE,IEDQFM,IEDQGH,IEDQGP)
 SELECT MEMBER=(IEDQGR,IEDQHG,IEDQHK)
 SELECT MEMBER=(IEDQHM,IEDQHM1,IEDQHM2)
 SELECT MEMBER=(IEDQIN,IEDQKA,IEDQKB,IEDQKC)
 SELECT MEMBER=(IEDQKD,IEDQKE,IEDQNA,IEDQRS)
 SELECT MEMBER=(IEDQSBT,IEDQTL,IEDQUI,IEDQ10)
 SELECT MEMBER=(IEDQ11,IEDQ12,IEDQ13,IEDQ14)
 SELECT MEMBER=(IEDQ16,IEDQ17,IEDQ18,IEDQ19)
 SELECT MEMBER=(IEDQ20,IEDQ21,IEDQ22,IEDQ23)
 SELECT MEMBER=(IEDQ24,IEDQ25,IEDQ26,IEDQ27)
 SELECT MEMBER=(IEDQ28,IEDRQIN,IEDRSPIN)
 SELECT MEMBER=(IEDSAC,IEDTEDIT)
 SELECT MEMBER=(IEDSAI,IEDSAO,IEDSARI)
 SELECT MEMBER=(IEDSCLU,IEDSCPDS,IEDSCPRP)
 SELECT MEMBER=(IEDSCPRQ,IEDSCPSS,IEDSNS)
 SELECT MEMBER=(IEDUNBND,IEDUSSTB,IEDXFMI)
 SELECT MEMBER=(IEDXFMO,IEDXTREQ)
 COPY OUTDD=LINKLIB,INDD=AOS21
 SELECT MEMBER=(IEAAAD0Q)
 SELECT MEMBER=(IEDBSM,IEDIAA,IEDIAB)
 SELECT MEMBER=(IEDKHISC,IEDNLT,IEDNMG)
 SELECT MEMBER=(IEDNTR,IEDPMD,IEDQCA,IEDQDA)
 SELECT MEMBER=(IEDQEC,IEDQET,IEDQEU,IEDQEW)
 SELECT MEMBER=(IEDQEZ,IEDQE1,IEDQE2,IEDQE3)
 SELECT MEMBER=(IEDQE4,IEDQE6,IEDQE8)
 SELECT MEMBER=(IEDQFE10,IEDQFE20,IEDQFE30)
 SELECT MEMBER=(IEDQFW,IEDQGA,IEDQGQ,IEDQGT)
 SELECT MEMBER=(IEDQHI,IEDQNA2)
 SELECT MEMBER=(IEDQNB,IEDQNB02,IEDQNB05)
 SELECT MEMBER=(IEDQND,IEDQNF,IEDQNG,IEDQNH)
 SELECT MEMBER=(IEDQNJ,IEDQNK,IEDQNM,IEDQNO)
 SELECT MEMBER=(IEDQNP,IEDQNQ,IEDQNR,IEDQNS)
 SELECT MEMBER=(IEDQNT,IEDQNU,IEDQNV,IEDQNW)
 SELECT MEMBER=(IEDQNX,IEDQOA,IEDQOB,IEDQWA)
 SELECT MEMBER=(IEDQWAA,IEDQWAB,IEDQWAJ)
 SELECT MEMBER=(IEDQWA1,IEDQWB,IEDQWB1)
 SELECT MEMBER=(IEDQWB2,IEDQWC,IEDQWC1)
 SELECT MEMBER=(IEDQWC2,IEDQWD)
 SELECT MEMBER=(IEDQWE,IEDQWE1)
 SELECT MEMBER=(IEDQWEC,IEDQWE2,IEDQWF)
 SELECT MEMBER=(IEDQWF1,IEDQWH)
 SELECT MEMBER=(IEDQWI,IEDQWI1)
 SELECT MEMBER=(IEDQWIA,IEDQWID,IEDQWIE)
 SELECT MEMBER=(IEDQWI5U,IEDQWI7,IEDQWI8)
 SELECT MEMBER=(IEDQWI9,IEDQWJ,IEDQWJ1)
 SELECT MEMBER=(IEDQWJ2)
 SELECT MEMBER=(IEDQWK,IEDQWK1)
 SELECT MEMBER=(IEDQWL,IEDQWL1,IEDQWL2)
 SELECT MEMBER=(IEDQWL3,IEDQWM2)
 SELECT MEMBER=((IEDQWN,IEDQW35,R))
 SELECT MEMBER=(IEDQWO)
 SELECT MEMBER=((IEDQWP,IEDQW39,R))
 SELECT MEMBER=(IEDQWP1,IEDQWP2)
 SELECT MEMBER=((IEDQWQ,IEDQW37,R))
 SELECT MEMBER=((IEDQWR,IEDQW28,R))
 SELECT MEMBER=((IEDQWS,IEDQW36,R))
 SELECT MEMBER=(IEDQWAC,IEDQW21)
 SELECT MEMBER=((IEDQWX,IEDQW41,R))
 SELECT MEMBER=((IEDQWY,IEDQW16,R))
 SELECT MEMBER=(IEDQW25,IEDQW33)
 SELECT MEMBER=(IEDQW42,IEDQW43)
 SELECT MEMBER=(IEDQW44,IEDQW47,IEDQXA)
 SELECT MEMBER=(IEDQXB,IEDQXC,IGCFD10D)
 COPY OUTDD=VTAMLIB,INDD=AOS22
 SELECT MEMBER=(ISTAIAPT)
 SELECT MEMBER=(ISTAIATN)
 SELECT MEMBER=(ISTAUAAG)
 SELECT MEMBER=(ISTAUAAT)
 SELECT MEMBER=(ISTINAFE)
 SELECT MEMBER=(ISTINADT)
 SELECT MEMBER=(ISTINALM)
 SELECT MEMBER=(ISTSEA01)
 SELECT MEMBER=(ISTSEA10)
 SELECT MEMBER=(ISTSEA21)
 SELECT MEMBER=(ISTSEA30)
 SELECT MEMBER=(ISTSEA40)
 SELECT MEMBER=(ISTSEA51)
 SELECT MEMBER=(ISTDCA00)
 SELECT MEMBER=(ISTDCA02)
 SELECT MEMBER=(ISTDCA10)
 SELECT MEMBER=(ISTDCA11)
 SELECT MEMBER=(ISTDCA12)
 SELECT MEMBER=(ISTDCA13)
 SELECT MEMBER=(ISTDCA20)
 SELECT MEMBER=(ISTDCA21)
 SELECT MEMBER=(ISTDCA22)
 SELECT MEMBER=(ISTDCA23)
 SELECT MEMBER=(ISTDCA24)
 SELECT MEMBER=(ISTDCA25)
 SELECT MEMBER=(ISTDCA30)
 SELECT MEMBER=(ISTDCA31)
 SELECT MEMBER=(ISTDCA32)
 SELECT MEMBER=(ISTDCA35)
 SELECT MEMBER=(ISTDCA40)
 SELECT MEMBER=(ISTDCA41)
 SELECT MEMBER=(ISTDCA42)
 SELECT MEMBER=(ISTDCA50)
 SELECT MEMBER=(ISTDCA51)
 SELECT MEMBER=(ISTDCA60)
 SELECT MEMBER=(ISTDCA61)
 SELECT MEMBER=(ISTDCA80)
 SELECT MEMBER=(ISTDCA81)
 SELECT MEMBER=(ISTDCA85)
 SELECT MEMBER=(ISTRCA21)
 SELECT MEMBER=(ISTRCA22)
 SELECT MEMBER=(ISTRCA23)
 SELECT MEMBER=(ISTRCA26)
 SELECT MEMBER=(ISTRCA30)
 SELECT MEMBER=(ISTRCAY0)
 SELECT MEMBER=(ISTRCA51)
 SELECT MEMBER=(ISTRCA52)
 SELECT MEMBER=(ISTRCA53)
 SELECT MEMBER=(ISTRCA54)
 SELECT MEMBER=(ISTRCA63)
 SELECT MEMBER=(ISTRCA65)
 SELECT MEMBER=(ISTRCA80)
 SELECT MEMBER=(ISTRCA81)
 SELECT MEMBER=(ISTNMACA)
 SELECT MEMBER=(ISTNMACB)
 SELECT MEMBER=(ISTNMACF)
 SELECT MEMBER=(ISTNMACI)
 SELECT MEMBER=(ISTNMACO)
 SELECT MEMBER=(ISTNMACR)
 SELECT MEMBER=(ISTNMACS)
 SELECT MEMBER=(ISTNMACT)
 SELECT MEMBER=(ISTNMACZ)
 SELECT MEMBER=(ISTNMA1S)
 SELECT MEMBER=(ISTNMA2S)
 SELECT MEMBER=(ISTNMA3S)
 SELECT MEMBER=(ISTNMA4S)
 SELECT MEMBER=(ISTNMA5S)
 SELECT MEMBER=(ISTNMA6S)
 SELECT MEMBER=(ISTNMA7S)
 SELECT MEMBER=(ISTNMA4P)
 SELECT MEMBER=(ISTNMA5P)
 SELECT MEMBER=(ISTNMA6P)
 SELECT MEMBER=(ISTNMA7P)
 SELECT MEMBER=(ISTNMA8P)
 SELECT MEMBER=(ISTNMA9P)
 SELECT MEMBER=(ISTCRAR4)
 SELECT MEMBER=(ISTINAMS)
 SELECT MEMBER=(ISTOCACB)
 SELECT MEMBER=(ISTOCADF)
 SELECT MEMBER=(ISTOCASA)
 SELECT MEMBER=(ISTAPA11)
 SELECT MEMBER=(ISTAPA12)
 SELECT MEMBER=(ISTAPA31)
 SELECT MEMBER=(ISTAPA32)
 SELECT MEMBER=(ISTAPA24)
 SELECT MEMBER=(ISTAPA33)
 SELECT MEMBER=(ISTAPA34)
 SELECT MEMBER=(ISTAPA35)
 SELECT MEMBER=(ISTAPA36)
 SELECT MEMBER=(ISTAPA37)
 SELECT MEMBER=(ISTAPA38)
 SELECT MEMBER=(ISTAPA51)
 SELECT MEMBER=(ISTAPA52)
 SELECT MEMBER=(ISTAPA53)
 SELECT MEMBER=(ISTAPA54)
 SELECT MEMBER=(ISTAPA57)
 SELECT MEMBER=(ISTAPA58)
 SELECT MEMBER=(ISTAPA62)
 SELECT MEMBER=(ISTAPA63)
 SELECT MEMBER=(ISTAPA64)
 SELECT MEMBER=(ISTAPA65)
 SELECT MEMBER=(ISTAPA81)
 SELECT MEMBER=(ISTATA00)
 SELECT MEMBER=(ISTATA10)
 SELECT MEMBER=(ISTESA01)
 SELECT MEMBER=(ISTESA02)
 SELECT MEMBER=(ISTORABA)
 SELECT MEMBER=(ISTORABD)
 SELECT MEMBER=(ISTORABF)
 SELECT MEMBER=(ISTORABQ)
 SELECT MEMBER=(ISTORACG)
 SELECT MEMBER=(ISTORAID)
 SELECT MEMBER=(ISTORAPR)
 SELECT MEMBER=(ISTORAPO)
 SELECT MEMBER=(ISTORARA)
 SELECT MEMBER=(ISTORASR)
 SELECT MEMBER=(ISTRAACA)
 SELECT MEMBER=(ISTRAACR)
 SELECT MEMBER=(ISTNSC00)
 SELECT MEMBER=(ISTSDAAL)
 SELECT MEMBER=(ISTSDACA)
 SELECT MEMBER=(ISTSDACD)
 SELECT MEMBER=(ISTSDACF)
 SELECT MEMBER=(ISTSDACN)
 SELECT MEMBER=(ISTSDACR)
 SELECT MEMBER=(ISTSDAOD)
 SELECT MEMBER=(ISTZAA0A)
 SELECT MEMBER=(ISTZAA0B)
 SELECT MEMBER=(ISTZAA1A)
 SELECT MEMBER=(ISTZAA1B)
 SELECT MEMBER=(ISTZAA1R)
 SELECT MEMBER=(ISTZBAJA)
 SELECT MEMBER=(ISTZBAAA)
 SELECT MEMBER=(ISTZBAAB)
 SELECT MEMBER=(ISTZBAAE)
 SELECT MEMBER=(ISTZBAAG)
 SELECT MEMBER=(ISTZBAAI)
 SELECT MEMBER=(ISTZBAAL)
 SELECT MEMBER=(ISTZBAAM)
 SELECT MEMBER=(ISTZBAAR)
 SELECT MEMBER=(ISTZBABA)
 SELECT MEMBER=(ISTZBABB)
 SELECT MEMBER=(ISTZBABI)
 SELECT MEMBER=(ISTZBABR)
 SELECT MEMBER=(ISTZBACB)
 SELECT MEMBER=(ISTZBADI)
 SELECT MEMBER=(ISTZBADR)
 SELECT MEMBER=(ISTZBAEB)
 SELECT MEMBER=(ISTZBAFA)
 SELECT MEMBER=(ISTZBAFB)
 SELECT MEMBER=(ISTZBAGA)
 SELECT MEMBER=(ISTZBAGB)
 SELECT MEMBER=(ISTZBAHA)
 SELECT MEMBER=(ISTZBAHB)
 SELECT MEMBER=(ISTZBAIA)
 SELECT MEMBER=(ISTZBAID)
 SELECT MEMBER=(ISTZBAIB)
 SELECT MEMBER=(ISTZBAIF)
 SELECT MEMBER=(ISTZBASC)
 SELECT MEMBER=(ISTZBANB)
 SELECT MEMBER=(ISTZBAND)
 SELECT MEMBER=(ISTZBANE)
 SELECT MEMBER=(ISTZBAPB)
 SELECT MEMBER=(ISTZBAXA)
 SELECT MEMBER=(ISTZBAX0)
 SELECT MEMBER=(ISTZBA0A)
 SELECT MEMBER=(ISTZBA0B)
 SELECT MEMBER=(ISTZBA0L)
 SELECT MEMBER=(ISTZCAAI)
 SELECT MEMBER=(ISTZCABI)
 SELECT MEMBER=(ISTZCACI)
 SELECT MEMBER=(ISTZCA0A)
 SELECT MEMBER=(ISTZCA0B)
 SELECT MEMBER=(ISTZCA1A)
 SELECT MEMBER=(ISTZCA1B)
 SELECT MEMBER=(ISTZDAE0)
 SELECT MEMBER=(ISTZDAKA)
 SELECT MEMBER=(ISTZDAKB)
 SELECT MEMBER=(ISTZDAL0)
 SELECT MEMBER=(ISTZDAWB)
 SELECT MEMBER=(ISTZDAWR)
 SELECT MEMBER=(ISTZFAGB)
 SELECT MEMBER=(ISTZGAAB)
 SELECT MEMBER=(ISTZGABB)
 SELECT MEMBER=(ISTZGA0A)
 SELECT MEMBER=(ISTZGA0B)
 SELECT MEMBER=(ISTZGA1A)
 SELECT MEMBER=(ISTZHAAN)
 SELECT MEMBER=(ISTZIAQA)
 SELECT MEMBER=(ISTZIAAA)
 SELECT MEMBER=(ISTZIAAB)
 SELECT MEMBER=(ISTZIABB)
 SELECT MEMBER=(ISTZIABI)
 SELECT MEMBER=(ISTZIACB)
 SELECT MEMBER=(ISTZIACI)
 SELECT MEMBER=(ISTZIADB)
 SELECT MEMBER=(ISTZIAEB)
 SELECT MEMBER=(ISTZIAGB)
 SELECT MEMBER=(ISTZIAHB)
 SELECT MEMBER=(ISTZIAIB)
 SELECT MEMBER=(ISTZIAID)
 SELECT MEMBER=(ISTZIAJB)
 SELECT MEMBER=(ISTZIAKB)
 SELECT MEMBER=(ISTZIAKG)
 SELECT MEMBER=(ISTZIALB)
 SELECT MEMBER=(ISTZIAMB)
 SELECT MEMBER=(ISTZIANA)
 SELECT MEMBER=(ISTZIANB)
 SELECT MEMBER=(ISTZIAOA)
 SELECT MEMBER=(ISTZIAOB)
 SELECT MEMBER=(ISTZIAOE)
 SELECT MEMBER=(ISTZIASB)
 SELECT MEMBER=(ISTZIASC)
 SELECT MEMBER=(ISTZIASG)
 SELECT MEMBER=(ISTZIATB)
 SELECT MEMBER=(ISTZIAUB)
 SELECT MEMBER=(ISTZIAVB)
 SELECT MEMBER=(ISTZIAWB)
 SELECT MEMBER=(ISTZIAX0)
 SELECT MEMBER=(ISTZIA0B)
 SELECT MEMBER=(ISTZIA1B)
 SELECT MEMBER=(ISTZJAAB)
 SELECT MEMBER=(ISTZJABB)
 SELECT MEMBER=(ISTZJACB)
 SELECT MEMBER=(ISTZJA0B)
 SELECT MEMBER=(ISTZKABB)
 SELECT MEMBER=(ISTZKABN)
 SELECT MEMBER=(ISTZKACB)
 SELECT MEMBER=(ISTZKACN)
 SELECT MEMBER=(ISTZLAAB)
 SELECT MEMBER=(ISTSC034)
 COPY OUTDD=LINKLIB,INDD=AOS23
 SELECT MEMBER=(HMDUSRFD)
 SELECT MEMBER=(ISTINA00)
/*
//SG2 EXEC LINKS,
// PARM='NCAL,LIST,XREF,OL,RENT',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=IMAGELIB,P1='(',
//    MOD=UCSIMAGE,P2=')',OBJ=OBJPDS1,CLASS=A
//SYSLIN DD *
 REPLACE UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,UCS1QN,   **UCS1AN**          X
               UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1AN(R)
 REPLACE UCS1AN,UCS1PCAN,UCS1PCHN,UCS1PN,UCS1QN,   **UCS1HN**          X
               UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1HN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCHN,UCS1PN,UCS1QN,   **UCS1PCAN**          X
               UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1PCAN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PN,UCS1QN,   **UCS1PCHN**          X
               UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1PCHN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1QN,   **UCS1PN**          X
               UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1PN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS1QN**          X
               UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1QN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS1RN**          X
               UCS1QN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1RN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS1SN**          X
               UCS1QN,UCS1RN,UCS1TN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1SN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS1TN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1XN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1TN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS1XN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1YN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1XN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS1YN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1QNC,             X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1YN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS1QNC**         X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS1QNC(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS2A11**         X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2H11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS2A11(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS2H11**         X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2G11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS2H11(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS2G11**         X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2P11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS2G11(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS2P11**         X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2T11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS2P11(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS2T11**         X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS3AN,         X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS2T11(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3AN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3AN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3PCAN**        X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,           X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3PCAN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3HN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3PCHN,UCS3PN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3HN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3PCHN**        X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PN,UCS3QN,UCS3QNC,           X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3PCHN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3PN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PCHN,UCS3QN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3PN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3QN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QNC,         X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3QN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3QNC**         X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,          X
               UCS3RN,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3QNC(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3RN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,          X
               UCS3QNC,UCS3SN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3RN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3SN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,          X
               UCS3QNC,UCS3RN,UCS3TN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3SN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3TN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,          X
               UCS3QNC,UCS3RN,UCS3SN,UCS3XN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3TN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3XN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,          X
               UCS3QNC,UCS3RN,UCS3SN,UCS3TN,UCS3YN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3XN(R)
 REPLACE UCS1AN,UCS1HN,UCS1PCAN,UCS1PCHN,UCS1PN,   **UCS3YN**          X
               UCS1QN,UCS1RN,UCS1SN,UCS1TN,UCS1XN,UCS1YN,              X
               UCS1QNC,UCS2A11,UCS2H11,UCS2G11,UCS2P11,UCS2T11,        X
               UCS3AN,UCS3PCAN,UCS3HN,UCS3PCHN,UCS3PN,UCS3QN,          X
               UCS3QNC,UCS3RN,UCS3SN,UCS3TN,UCS3XN
 INCLUDE SYSPUNCH(UCSIMAGE)
 NAME UCS3YN(R)
/*
//SG3 EXEC LINKS,
// PARM='NCAL,LIST,XREF',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=SVCLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//SYSLIN DD *
  INCLUDE SYSPUNCH(DCM010)
  NAME DCM010(R)
/*
//SG4 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REFR',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=SVCLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSC5 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSC5
//SYSLIN DD *
  INCLUDE AOSC5(IEE10110)
  NAME  IGC10110(R)
  INCLUDE AOSC5(IEE11110)
  NAME  IGC11110(R)
  INCLUDE AOSC5(IEE12110)
  NAME  IGC12110(R)
  INCLUDE AOSC5(IEE20110)
  NAME  IGC20110(R)
  INCLUDE AOSC5(IEE21110)
  NAME  IGC21110(R)
  INCLUDE AOSC5(IEE22110)
  NAME  IGC22110(R)
  INCLUDE AOSC5(IEE23110)
  NAME  IGC23110(R)
  INCLUDE AOSC5(IEE40110)
  NAME  IGC40110(R)
/*
//G09GEN10 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REUS',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSC5 DD DISP=SHR,VOL=(,RETAIN),DSN=SYS1.AOSC5
//SYSLIN DD *
 INCLUDE AOSC5(IEAXYZ5)
 ALIAS IEAXYZ5
 NAME IEAXYZ5A(R)
 INCLUDE AOSC5(IEAHONST)
 ALIAS HONESTY
 NAME IEAHONST(R)
/*
//SG2 EXEC PGM=IEBUPDTE,PARM=NEW,COND=(4,LT)
//SYSPRINT  DD  SYSOUT=A
//SYSUT2 DD DISP=OLD,DSN=SYS1.PARMLIB,UNIT=3350,VOL=SER=FGEN67
//SYSIN DD DATA
./  ADD  NAME=IEASYS00,LIST=ALL
./  NUMBER  NEW1=01,INCR=02
PAGE=(V=P3330X,BLK=8192)                                               *
PAGE=(V=P33301,BLK=8192)                                               *
PAGE=(V=P3340X,BLK=8192)                                               *
PAGE=(V=P3350X,BLK=8192)
./  ENDUP
/*
//SG3 EXEC PGM=IEBUPDTE,PARM=NEW,COND=(4,LT)
//SYSPRINT  DD  SYSOUT=A
//SYSUT2 DD DISP=OLD,DSN=SYS1.PARMLIB,UNIT=3350,VOL=SER=FGEN67
//SYSIN DD DATA
./ ADD  NAME=JESPARMS,LEVEL=01,LIST=ALL,SEQFLD=738
./ NUMBER NEW1=1,INCR=5
         BUFSIZE=3952,NUMBUFS=50,STEPWTP=25,
         SWDSLMT=15,SPOLCAP=80,WTLRCDS=3000,
         RDR=(R=5,Y=50,B=9600,A=1,N=42),
         WTR=(W=8,U=3,Z=50,B=4890),JOUTLIM=0,
         ALCUNIT=28138,JOBLOG=YES,PRLRECL=133,
         LRDPARM=(00600300005011E00011A),
         LPRPARM=(PA),
         LPUPARM=(CB),
         RRDPARM=(00600300005010E00011A),
         RPRPARM=(PA),
         RPUPARM=(CB),
         SPOLVOL=(FGEN67),
         JOBQVOL=(FGEN67)
/*
//SG4 EXEC PGM=IEBUPDTE,PARM=NEW,COND=(4,LT)
//SYSPRINT  DD  SYSOUT=A
//SYSUT2 DD DISP=OLD,DSN=SYS1.PARMLIB,UNIT=3350,VOL=SER=FGEN67
//SYSIN DD DATA
./  ADD NAME=IEARSV00,LIST=ALL
./  NUMBER  NEW1=01,INCR=02
SYS1.SVCLIB    IFG0197A,IFG0200X,IFG0200Y,IFG0196W,IGC0002D,IGC0003B,  X
               IGC0002I,IGC0005E,IGC0001C,IGC0003D,IGC0002B,IGC0002C,  X
~raw00000000000000000000000000000000000000000000000000000000000040014004410010001000100000044200110240014004410010001000100000105000110240014004410010001000100004004010110240014004410010001000100002004010110240014004410010001000100004004001110240014004410010001000100002005000110200000000100400000000000000000000000000000000
               IGC0012D,                                               X
               IGC0E01C,IFG0552R,IFG0553P,IFG0551H,IFG0552X,IGG0191L,  X
               IGG0199L,IGG0193G,IGG0203A,IGG0193E,IGG0193C,IGG0193A,  X
               IFG0196T,IFG0196Q,IFG0196N,IFG0195C,IFG0195K,IFG0195H,  X
               IFG0200Z,IFG0202G,IFG0202F,IFG0195B,IFG0194I,IFG0194H,  X
               IFG0194F,IFG0193B,IGC0203E,IGC1203D,IGC3503D,IGC0403D,  X
               IGC0003E,IGC0103E,IGG0201X,IGG0201A,IGG01993,IGG01991,  X
               IGG01915,IGG0191C,IGG0191F,IGG0191J,IGG01911,IGG0191G,  X
               IGG0193I,IGG0191I,IGG0201N,IGG0CLF2,IGG0CLC7,IGG0CLC2,  X
               IFG0202E,IFG0201R,IGG0290E,IGG0290D,IGG0290C,IGG0290B,  X
               IGG0299A,IGG0290A,IGG0290F,IGG0191O,IGC0G01C,IGC0B01C,  X
               IGG0325H,IGG0325G,IGG0325E,IGG0325D,IGG0325B,IGG0325A,  X
               IGC0J01C,IFG0551F,IGG0203K,IGG0199F,IGG0199W,IGG0198L,  X
               IGG0201Y,IGG0193K,IGG0191D,IFG0232Z,IGG0201W,IGG01917,  X
               IGC0008C,IFG0202H,IFG0202I,                             X
               IGG0196B,IGG0191B,IGG01910,IGG0199G,IFG0232D,IGC0107B,  X
               IGG0196A,IGG0196I,IGG0191A,IGG0191N,IFG0195J,IFG0195A,  X
               IFG0194E,IGG0201Z,IFG0196J,IFG0196M,IFG0196L,IFG0202J,  X
               IFG0202L,IFG0200W,IFG0200V,IFG0196X,IGG0200G,IGG02099,  X
               IFG0202K,IGG01999,IFG0196V,IFG0198N,IFG0193A,IGG0190S
./  ADD  NAME=IEARSV01,LIST=ALL
./  NUMBER  NEW1=01,INCR=02
SYS1.SVCLIB
./  ADD  NAME=IEAIGE00,LIST=ALL
./  NUMBER  NEW1=01,INCR=02
SYS1.SVCLIB
./  ADD  NAME=IEAIGG00,LIST=ALL
./  NUMBER  NEW1=01,INCR=02
SYS1.SVCLIB    IGG019FP,IGG019AN,IGG019AM,IGG019BE,IGG019AG,IGG019AK,  X
               IGG019AJ,IGG019AB,IGG019AL,IGG019AD,IGG019BD,IGG019AC,  X
               IGG019AV,IGG019AA,IGG019CJ,IGG019C0,IGG019C4,IGG019EK,  X
               IGG019FN,IGG019DJ,IGG019AQ,IGG019BC,IGG019DK,IGG019AI,  X
               IGG019AR,IFGAAABA,IGG019CI,IGG019BB,IGG019CC,IGG019BA,  X
               IGG019DG,IGG019DF,IGG019DM,IGG019DL,                    X
               IGG019CH,IGG019HT,IGG019CD
./  ADD  NAME=IEAIGG01,LIST=ALL
./  NUMBER  NEW1=01,INCR=02
SYS1.SVCLIB
./  ADD  NAME=IEAIGG02,LIST=ALL
./  NUMBER  NEW1=01,INCR=02
SYS1.LINKLIB   IEAAAD0N,HMDPRFMT,ISTRAAD1,IEAAAD0Q,IEAAAD0R,           X
               ISTAIAIR,ISTAPA61
./  ADD  NAME=IEAIGG03,LIST=ALL
./  NUMBER  NEW1=01,INCR=02
SYS1.LINKLIB
./  ENDUP
/*
//G09GEN11 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC LINKS,COND=(4,LT),
//     PARM='LIST,XREF,NCAL,SCTR,LET,SIZE=(192K,64K)',
//     UNIT='3350',SER=FGEN67,N=SYS1,NAME=NUCLEUS,P1='(',
//     MOD=IEANUC01,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSCD DD DISP=SHR,DSNAME=SYS1.AOSCD,VOLUME=(,RETAIN)
//AOSCE DD DISP=SHR,DSNAME=SYS1.AOSCE,VOLUME=(,RETAIN)
//AOSD0 DD DISP=SHR,DSNAME=SYS1.AOSD0,VOLUME=(,RETAIN)
//AOSC2 DD DISP=SHR,DSNAME=SYS1.AOSC2,VOLUME=(,RETAIN)
//AOSB0 DD DISP=SHR,DSNAME=SYS1.AOSB0,VOLUME=(,RETAIN)
//AOS00 DD DISP=SHR,DSNAME=SYS1.AOS00,VOLUME=(,RETAIN)
//AOSD8 DD DISP=SHR,DSNAME=SYS1.AOSD8,VOLUME=(,RETAIN)
//AOS21 DD DISP=SHR,DSNAME=SYS1.AOS21,VOLUME=(,RETAIN)
//RESLIB DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AUSERSVC
//AOS20 DD DISP=SHR,DSN=SYS1.AOS20,VOL=(,RETAIN)
//AOSCA DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSCA
//AOSC5 DD DISP=SHR,DSN=SYS1.AOSC5,VOL=(,RETAIN)
//AOSB3 DD DISP=SHR,DSN=SYS1.AOSB3,VOL=(,RETAIN)
//AOS22 DD DISP=SHR,DSN=SYS1.AOS22,VOL=(,RETAIN)
//AOS23 DD DISP=SHR,DSN=SYS1.AOS23,VOL=(,RETAIN)
//AOSA0 DD DISP=SHR,DSN=SYS1.AOSA0,VOL=(,RETAIN)
//SYSLIN DD *
 INSERT IEAANIP0
 INSERT IEAAIH00
 INSERT IEAIOS00
 INSERT IGC040
 INSERT IGC014
 INSERT IGC042
 INSERT IGC012
 INSERT IGC041
 INSERT IGC037
 INSERT IEECIR51
 INSERT IEESTAE
 INSERT IEECMWSV
 INSERT IEECMDOM
 INSERT IEAADTAB
 INSERT IEECMAWR
 INSERT IEECMDSV
 INSERT IFG019RA
 INSERT IEAPGSUR
 INSERT IQAPF100
 INSERT IQADSV00
 INSERT IGC125
 INSERT IEAAPT02
 INSERT HHLMCIHF
 INSERT IEAATA01
 INSERT IEA0EF01
 INSERT IDA019C1
 INSERT IEAAXSNT
 INSERT IEA0PL00
 INSERT IEA0AB00
 INSERT IGC001
 INSERT IGC002
 INSERT IGC010
 INSERT IHASVC00
 INSERT IEAATA00
 INSERT IEFSD032
 INSERT IEAXSVRB
 INSERT IEAQTI00
 INSERT IGC046
 INSERT TPC
 INSERT IEAEXTEF
 INSERT IEASIRBE
 INSERT IECINTRP
 INSERT IEAQCB01
 INSERT IEAPGSAE
 INSERT IEAPGSBP
 INSERT IEAPGSCE
 INSERT IEAPGSDR
 INSERT IEAPGSDY
 INSERT IEAPGSFF
 INSERT IEAPGSPA
 INSERT IEAPGSPM
 INSERT IEAPGSPP
 INSERT IEAPGSQA
 INSERT IEAPGSRC
 INSERT IEAPGSRL
 INSERT IEAPGSVR
 INSERT IEAPGSWR
 INSERT IEAPGS00
 INSERT IEAPTRV
 INSERT IEATSAR
 INSERT IEAPATCH
 ORDER  IEAAIH00,IEAIOS00
 INCLUDE SYSPUNCH(IEAPGSPP)
 INCLUDE    AOSC5(IEAPGSAE)
 INCLUDE    AOSC5(IEAPGSBP)
 INCLUDE    AOSC5(IEAPGSCE)
 INCLUDE SYSPUNCH(IEAPGSDR)
 INCLUDE    AOSC5(IEAPGSDY)
 INCLUDE    AOSC5(IEAPGSPA)
 INCLUDE    AOSC5(IEAPGSQA)
 INCLUDE SYSPUNCH(IEAPGSRC)
 INCLUDE    AOSC5(IEAPGSRL)
 INCLUDE    AOSC5(IEAPGSVR)
 INCLUDE    AOSC5(IEAPGSWR)
 INCLUDE    AOSC5(IEAPGS00)
 INCLUDE    AOSC5(IEAPTRV)
 INCLUDE SYSPUNCH(IEATSAR)
 INCLUDE SYSPUNCH(IEAPGSDD)
 INCLUDE SYSPUNCH(IEAPGSFF)
 INCLUDE SYSPUNCH(IEAPGSPM)
          INCLUDE  AOS20(IECTSVC)
         CHANGE $H3RAH00(IGXERROR)
         CHANGE IEACRERP(IGXERROR)
          INCLUDE  AOSC5(IGC116)
         INCLUDE SYSPUNCH(IEAANIP0)
         INCLUDE SYSPUNCH(IEASPL)
         INCLUDE SYSPUNCH(IEASVC00,IEAASU00)
         INCLUDE SYSPUNCH(IEAIOS00,IEASMFEX)
 CHANGE IEESJQ(IEACVT),IEAQOCR(IEACVT)
 INCLUDE SYSPUNCH(IEACVT00,IQADSV00)
        INCLUDE AOSC5(IEAGENQ2)
        INCLUDE AOSCD(IFBDCB02)
        INCLUDE AOSC5(IEABXR00)
        INCLUDE AOSC5(IEAAID00)
        INCLUDE SYSPUNCH(IEAQAT00)
        INCLUDE AOSC5(IEAMSERB)
        INCLUDE AOSC5(IEAAPX00)
        INCLUDE AOSC5(IEAXSVRB)
        INCLUDE AOSC5(IEAASY00)
        INCLUDE AOSC5(IEAJDL00)
        INCLUDE AOSC5(IEA0PL00)
        INCLUDE AOSC5(HHLMCIH)
        INCLUDE AOSC5(IEAVMODE)
        INCLUDE AOSC5(IEAPATCH)
        INCLUDE AOSC5(IEAGAB00)
         INCLUDE SYSPUNCH(IEA0RT01,IEA0ST01)
         INCLUDE SYSPUNCH(IEA0TI00)
        INCLUDE AOS00(IEFUTL)
        INCLUDE AOS00(IEESMFWT)
        INCLUDE AOS00(IEFU83)
         INCLUDE SYSPUNCH(IGC0000A,IGC0000B,IEAATC00)
         INCLUDE SYSPUNCH(IEATCB00)
         INCLUDE SYSPUNCH(IEAAMS00)
         INCLUDE SYSPUNCH(IEAATA00)
         INCLUDE AOSD0(IFG019RA)
         INCLUDE AOSC5(IEAVTEST)
         INCLUDE AOSC5(IEAPGSUR)
         INCLUDE SYSPUNCH(IQARI100)
         INCLUDE SYSPUNCH(IQAPF100)
     INCLUDE AOSA0(IDA019C1)
   INCLUDE SYSPUNCH(IEC23XXF)
   INCLUDE AOSC5(IECURAT1)
         INCLUDE  AOSC5(IECINTRP)
  INCLUDE SYSPUNCH(IEAATR00)
         INCLUDE AOSCA(IECTATTN)
 INCLUDE  AOSD8(IGC054)
 INCLUDE  SYSPUNCH(IGC018)
 INCLUDE  SYSPUNCH(IFGDEBCK)
 INCLUDE AOSD0(IFGAZ016)
 INCLUDE AOSB3(IEFSD567,IEFATECB)
 INCLUDE SYSPUNCH(IEFAB403)
 CHANGE IEECVPRB(IEEMSER)
 INCLUDE AOSB0(IEFQRESD)
 INCLUDE AOSB0(IEFQMAPG)
 INCLUDE AOSB3(IEESD568)
 INCLUDE AOSB3(IEESTAE)
 INCLUDE AOSC5(IEECVCRA,IEECVCRX)
 INCLUDE AOSC5(IEECMAWR)
 INCLUDE AOSB3(IEELOGWR)
 INCLUDE AOSB3(IEECIR50)
 INCLUDE AOSB3(IEECIR51)
 INCLUDE AOSC5(IEAQCB01)
 INCLUDE SYSPUNCH(IEACVTPC)
 INCLUDE SYSPUNCH(IEFSD032)
 INCLUDE SYSPUNCH(IEECUCB)
 INCLUDE SYSPUNCH(IEECVH1)
 INCLUDE AOSC5(IEECVCTE)
 INCLUDE AOSC5(IEECMDSV,IEECMWSV)
 INCLUDE AOSC5(IEECMDOM)
 INCLUDE SYSPUNCH(IEECVSUB)
 INCLUDE AOS23(ISTAPA41)
 INCLUDE AOS23(ISTRAAA0)
 INCLUDE AOS23(ISTRAAA1)
 INCLUDE AOS23(ISTRAAA2)
 INCLUDE AOS23(ISTZFAAA)
 INCLUDE AOS23(ISTZFAAB)
 INCLUDE AOSCE(IGFMCH00)
 INCLUDE AOSCE(IGFMSB00)
 INCLUDE AOSCE(IGFVCCHC)
 INCLUDE AOSCE(IGFVMCE0)
 INCLUDE SYSPUNCH(IFBCTA00)
 INCLUDE AOSCE(IGFTVT00)
 INCLUDE SYSPUNCH(IGF201)
 INCLUDE AOSCE(ICFBDX00)
 INCLUDE AOS20(IGC058)
 INCLUDE AOS20(IECTATEN)
 INCLUDE AOS21(IEDQEB)
 INCLUDE AOS21(IEDQATTN)
 INCLUDE  AOSC2(IEWFTPCI)
 INCLUDE  AOSC2(IEWSVOVR)
 INCLUDE RESLIB(IGC213)
 INCLUDE RESLIB(IGC214)
 INCLUDE RESLIB(IGC216)
 INCLUDE RESLIB(IGC217)
 INCLUDE RESLIB(IGC251)
 INCLUDE RESLIB(IGC255)
/*
//G09GEN12 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSB3 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB3
//AOS00 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS00
//AOSC5 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSC5
//AOSB0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB0
//SYSLIN DD *
 INCLUDE SYSPUNCH(IEFWMAS1)
 NAME DEVNAMET(R)
 INCLUDE SYSPUNCH(IEFWMSKA)
 NAME DEVMASKT(R)
 INCLUDE AOSB3(IEEVSTAR,IEEVJCL,IEEMFTIO)
 ENTRY IEEVSTAR
 NAME IEEVSTAR(R)
 INCLUDE  AOSB3(IEEVRCTL)
 INCLUDE AOSB3(IEEPSN)
 INCLUDE AOSB3(IEEVLNKT)
 INCLUDE AOSB3(IEEVSMSG)
 ALIAS IEEVIC
 ENTRY IEEVRCTL
 NAME IEEVRCTL(R)
 INCLUDE AOSB3(IEFQMIFC)
 ALIAS IEFQMRAW
 ALIAS IEFQMSSS
 ALIAS IEFSD514
 ALIAS IEFQDELE
 NAME IEFQMIFC(R)
 INCLUDE AOSB3(IEFSD301,IEFSD304,IEFSD305)
 INCLUDE AOSB3(IEFSD309,IEFSD312)
 INCLUDE AOSB3(IEFVSDRA,IEFVSDRD)
 ENTRY IEFSD301
 NAME IEFSD300(R)
 INCLUDE AOSB3(IEESD561,IEESD563,IEESD565)
 INCLUDE AOSB3(IEESD582,IEESD575)
 ENTRY IEESD561
 NAME IEESD561(R)
 INCLUDE AOSB3(IEFVRRC)
 INCLUDE AOSB3(IEFSD304)
 INCLUDE AOSB3(IEFSD312)
 ENTRY IEFVRRC
 ALIAS IEFVRRCA,IEFVRRCB
 NAME IEFVRRC(R)
 INCLUDE AOSB3(IEFVRR1)
 INCLUDE AOSB3(IEFSD304)
 INCLUDE AOSB3(IEFSD312)
 ENTRY IEFVRR1
 NAME IEFVRR1(R)
 INCLUDE AOSB3(IEFVRR2)
 ENTRY IEFVRR2
 NAME IEFVRR2(R)
 INCLUDE AOSB3(IEFVRR3)
 INCLUDE AOSB3(IEFSD312)
 INCLUDE AOSB3(IEFSD304)
 ALIAS IEFVR3AE
 ENTRY IEFVRR3
 NAME IEFVRR3(R)
 INCLUDE   AOSB3(IEFVHA)
 INCLUDE AOSB3(IEFVHC,IEFVHE)
 INCLUDE AOSB3(IEEVLNKT)
 INCLUDE AOSB3(IEFVHF,IEFVHH,IEFVHL)
 INCLUDE AOSB3(IEFVSPL,IEFVSCDQ)
 INCLUDE AOSB3(IEFVHQ,IEFSD536)
 INCLUDE  AOSB3(IEFVGI,IEFVGK,IEFVGM,IEFVGS)
 INCLUDE AOSB3(IEFVGT,IEFVDA,IEFVSD13)
 INCLUDE  AOSB3(IEFVDBSD,IEFVEA,IEFVFA)
 INCLUDE AOSB3(IEFVJA,IEFVHCB)
 INCLUDE  AOSB3(IEFVHEB,IEFVHEC)
 INCLUDE AOSB3(IEFVFB)
 INCLUDE AOSB3(IEFVH1,IEFVHN)
 INCLUDE AOSB3(IEFVINA,IEFVINB,IEFVINC)
 INCLUDE AOSB3(IEFVINE,IEFVHM)
 INCLUDE AOSB3(IEFNB901)
 INCLUDE AOSB3(IEFVSSI)
 ENTRY IEFVH1
 ALIAS IEFVGK
 NAME IEFIRC(R)
 CHANGE IEFVGK(IEFNB901)
 INCLUDE AOSB3(IEFNB901)
 INCLUDE AOSB3(IEFVHQ,IEFVGM)
 INCLUDE AOSB3(IEFVSPL,IEFVHN,IEFSD536)
 ENTRY IEFNB901
 ALIAS IEFVDMI
 NAME IEFNB901(R)
 INCLUDE AOSB3(IEFNB902)
 ALIAS IEFVAMP
 NAME IEFNB902(R)
 INCLUDE AOSB3(IEEVMNT2)
 INCLUDE AOSB3(IEEVSMSG)
 ENTRY IEEVMNT2
 NAME IEEVMNT2(R)
 INCLUDE SYSPUNCH(IEFSD569)
 INCLUDE AOSC5(IEECVCTI,IEEVRFRX)
 INCLUDE AOSB3(IEFPARMS)
 INCLUDE AOSB3(IEFPARMG)
 INCLUDE AOSB3(IEEDFIN1)
 INCLUDE AOSB3(IEEDFIN2)
 INCLUDE AOSB3(IEEDFIN8)
 INCLUDE AOSB3(IEEDFIN6)
 INCLUDE AOSB3(IEFSETRD)
 INCLUDE AOSB3(IEFSETMG)
 INCLUDE AOSB3(IEE0603D)
 INCLUDE AOSB3(IEE9803D)
 INCLUDE AOSB3(IEE9703D)
 INCLUDE AOSB0(IEFBMINT)
 INCLUDE AOSB0(IEFSMINT)
 INCLUDE AOSB3(IEF300SD)
 INCLUDE AOSB0(IEFJLRNQ)
 INCLUDE AOSB0(IEFSD055,IEFSD311,IEFORMAT)
 INCLUDE SYSPUNCH(IEFQMSGV)
 INCLUDE AOSB3(IEEVLIN)
 INCLUDE AOSB3(IEFK1MSG,IEFPRES)
   INCLUDE   AOSB3(IEFSCAN)
   INCLUDE   SYSPUNCH(IEFDEVPT)
 ENTRY IEFSD569
 NAME IEFSD569(R)
 INCLUDE AOSB3(IEEDFIN1)
 INCLUDE AOSB3(IEEDFIN2)
 INCLUDE AOSB3(IEEDFIN6)
 INCLUDE AOSB3(IEEDFIN8)
 ENTRY IEEDFIN8
 NAME IEEDFIN8(R)
 INCLUDE AOS00(IEESMFIT)
 ALIAS IEESMFI4
 ENTRY IEESMFIT
 NAME IEESMFIT(R)
 INCLUDE AOS00(IEESMFI3)
 ALIAS IEESMFMS,IEESMFIO
 NAME IEESMFI3(R)
 INCLUDE AOS00(IEESMFI2)
 ENTRY IEESMFI2
 NAME IEESMFI2(R)
 INCLUDE AOS00(IEESMFOI)
 ENTRY IEESMFOI
 NAME IEESMFOI(R)
 INCLUDE AOS00(IFASMFDP)
 ENTRY IFASMFDP
 NAME IFASMFDP(R)
 INCLUDE AOS00(IEFUJV)
 ENTRY IEFUJV
 NAME IEFUJV(R)
 INCLUDE AOSB3(IEFSD518)
 INCLUDE AOSB3(IEFQMIFC)
 ENTRY IEFSD518
 NAME IEFSD518(R)
 INCLUDE AOSB3(IEFSD519)
 INCLUDE AOSB3(IEFQMIFC)
 ENTRY IEFSD519
 NAME IEFSD519(R)
 INCLUDE AOSB3(IEFDSOSM)
 INCLUDE AOSB3(IEFQMIFC)
 ENTRY IEFDSOSM
 NAME IEFDSOSM(R)
 INCLUDE AOSB3(IEFDSOWR)
 INCLUDE AOSB3(IEFQMIFC)
 ENTRY IEFDSOWR
 NAME IEFDSOWR(R)
 INCLUDE AOSB3(IEFDSOCP)
 INCLUDE AOSB3(IEFQMIFC)
 ENTRY IEFDSOCP
 NAME IEFDSO(R)
 INCLUDE AOSB3(IEFPRTXX)
 ALIAS IEFPRT,SPRINTER
 NAME IEFPRINT(R)
 INCLUDE  AOSB3(IEFMCVOL,IEFVMFAK,IEF41FAK,IEFVMMS1)
 INCLUDE  AOSB3(IEFVMLS6,IEFVMLS7)
 INCLUDE AOSB3(IEFQMIFC)
 INCLUDE AOSB3(IEFYSVMS)
 ALIAS IEFCVOL1,IEFCVOL2,IEFCVOL3
 ENTRY IEFCVOL1
 NAME  IEFMCVOL(R)
 INCLUDE AOSB3(IEFDSDRP)
 ENTRY IEFDSDRP
 NAME IEFDSDRP(R)
 INCLUDE AOSB3(IEFRSTRT)
 ALIAS IEFSMR
 NAME IEFRSTRT(R)
 INCLUDE AOSB3(IEFIIC,IEF160DM)
 INCLUDE AOSB3(IEFQMIFC)
 ENTRY IEFIIC
 NAME IEFIIC(R)
 CHANGE IEFSD110(IEFSD062),IEFSD112(IEFSD062)
 INCLUDE AOSB3(IEFSD162)
 INCLUDE AOS00(IEFSMFIE,IEFUJI,IEFUSI)
 INCLUDE AOSB3(IEF263FK,IEF065FK,IEFQMIFC)
 ALIAS IEFSD62A,IEFALRET
 ENTRY IEFSD062
 NAME IEFSD162(R)
 INCLUDE AOSB3(IEFMF263) MUST BE 1ST CSECT IN LOAD MOD
 INCLUDE AOSB3(IEFBR14)
 INCLUDE AOS00(IEFSMFAT)
 ORDER IEFSD263
 ENTRY IEFSD263
 NAME IEFSD263(R)
 INCLUDE AOSB3(IEFSD510)
 INCLUDE AOSB3(IEFMF106)
 INCLUDE AOSB3(IEFMF105)
 INCLUDE AOSB3(IEFQMIFC)
 ENTRY IEFSD510
 NAME IEFSD510(R)
 INCLUDE AOSB3(IEFSD160)
 INCLUDE AOSB3(IEF161DM)
 INCLUDE AOSB3(IEFINTQA)
 ENTRY IEFSD060
 NAME IEF160SD(R)
 CHANGE IEFINTQS(IEFSD060)
 INCLUDE AOSB3(IEFSD160,IEF161FK)
 ALIAS IEFSD060
 ENTRY IEFSD060
 NAME IEFSD160(R)
 INCLUDE AOSB3(IEFSD161)
 INCLUDE AOSB3(IEFMF102)
 INCLUDE AOSB3(IEFSD101)
 INCLUDE AOSB3(IEFSDPPT)
 INCLUDE AOSB3(IEFSD166)
 INCLUDE AOSB3(IEFSTDSC)
 INCLUDE AOSB3(IEF160DM)
 INCLUDE AOSB3(IEFQMIFC)
 ALIAS IEFIRET
 ALIAS IEFSDA66
 ENTRY IEFSD061
 NAME IEF161SD(R)
 INCLUDE AOSB3(IEFSD515) MUST BE 1ST CSECT IN LOAD MOD
 CHANGE IEFSTDSC(IEFSD061)
 CHANGE IEFSD102(IEFSD061)
 INCLUDE AOSB3(IEFSD161)
 CHANGE IEFSD102(IEFSD061)
 CHANGE IEFSD112(IEFSD062)
 INCLUDE AOSB3(IEFSD101)
 INCLUDE AOSB3(IEFSDPPT)
 CHANGE IEFSD110(IEFSD064)
 INCLUDE AOSB3(IEFSD164)
 INCLUDE AOSB3(IEFSD165,IEF160FK)
 INCLUDE AOSB3(IEEMFTIO)
 INCLUDE AOSB3(IEFSD168)
 INCLUDE AOSB3(IEFVSDRA)
 INCLUDE AOSB3(IEFRPREP)
 INCLUDE SYSPUNCH(IEFYRCDS)
 INCLUDE AOSB3(IEFQMIFC,IEFSD42Q)
 INCLUDE AOSB3(IEFYNIMP,IEFYPJB3,IEFVJIMP,IEFZGST1)
 INCLUDE AOSB3(IEFSD22Q,IEFZGMSG,IEFZHMSG)
 INCLUDE AOSB3(IEFWTERM,IEFYTVMS)
 INCLUDE AOSB3(IEFVJMSG,IEFYNMSG,IEFYPMSG)
 INCLUDE AOSB3(IEFZAJB3)
 INCLUDE AOSB3(IEFZGJB1)
 INCLUDE AOSB3(IEFYSVMS)
 INCLUDE AOSB3(IEFJSTER,IEFJSMSG)
 INCLUDE AOS00(IEFSMFWI,IEFSMFLK)
 INCLUDE AOS00(IEFACTRT)
 INCLUDE AOSB3(IEFZGST2,IEFSD31Q)
 INCLUDE AOSB3(IEFSD166)
 INCLUDE AOSB3(IEFAB418,IEFAB420)
 ORDER IEFSD515
 ALIAS IEFSD065,IEFW42SD,GO
 ALIAS IEFV4221
 ALIAS IEFSD068
 ENTRY IEFSD061
 NAME IEFSD161(R)
 INCLUDE AOSB3(IEEVMNT1,IEEVJCL,IEEMFTIO)
 ENTRY IEEVMNT1
 NAME IEEVMNT1(R)
 INCLUDE AOSB3(IEFYSVMS)
 INCLUDE  AOSB3(IEFCVFAK)
 INCLUDE AOSB3(IEFAB417,IEFAB418,IEFAB420)
 INCLUDE AOSB3(IEFAB405,IEFAB406)
 INCLUDE AOSB3(IEFAB407,IEFAB408)
 INCLUDE  AOSB3(IEFVMLS1)
 CHANGE IEFSEPAR(IEFW41SD)
 INCLUDE SYSPUNCH(IEFSGOPT)
 INCLUDE AOSB3(IEF41FAK,IEFWSTRT)
 INCLUDE  AOSB3(IEFVM3LS)
 INCLUDE  AOSB3(IEFVM5LS,IEFVM2LS,IEFVM4LS)
 INCLUDE AOSB3(IEFQMIFC,IEFVM76)
 INCLUDE  AOSB3(IEFWA000)
   INCLUDE   AOSB3(IEFSCAN)
   INCLUDE   SYSPUNCH(IEFDEVPT)
 INCLUDE  AOSB3(IEFXCSSS)
 INCLUDE SYSPUNCH(CHLOADTB)
 INCLUDE AOSB3(IEFSD180)
 CHANGE IEFXV001(IEFSGOPT)
 INCLUDE  AOSB3(IEFWSWIN)
 INCLUDE AOSB3(IEFX300A,IEFX5FAK,IEFVMLK5)
  INCLUDE AOSB3(IEFXDPTH)
 INCLUDE AOSB3(IEFXJFAK,IEFSD551)
 INCLUDE  AOSB3(IEFVKMSG,IEFXAMSG,IEFWCFAK)
 INCLUDE  AOSB3(IEFWDFAK)
 INCLUDE  AOSB3(IEFVKIMP)
 INCLUDE AOS00(IEFACTFK)
 CHANGE IEFACTLK(IEFACTFK)
 INCLUDE AOSB3(IEFSD21Q)
 ALIAS IEFVM1,IEFVMCVL,IEFXA
 ENTRY IEFW21SD
 NAME  IEFW21SD(R)
 INCLUDE AOSB3(IEFAB417,IEFAB420)
 ENTRY IEFAB417
 NAME IEFAB417(R)
 INCLUDE AOSB3(IEFAB418,IEFAB420)
 ENTRY IEFAB418
 NAME IEFAB418(R)
 INCLUDE AOSB3(IEFYSVMS)
 INCLUDE  AOSB3(IEFXJIMP,IEFXJMSG)
 INCLUDE  AOSB3(IEFXKIMP,IEFXKMSG)
 INCLUDE AOSB3(IEFXAFAK,IEFSD41Q,IEFQMIFC)
 INCLUDE AOSB3(IEFVMMS1)
 INCLUDE AOSB3(IEFCVFAK)
 INCLUDE AOSB3(IEFSD195,IEFSD096)
 INCLUDE AOSB3(IEFVMLS6,IEFVMLS7)
 ALIAS IEFXJX5A,IEFV15XL,IEFXJ000,IEFXK000
 ENTRY IEFVM6
 NAME    IEFVM6LS(R)
 INCLUDE AOSB3(IEFYSVMS)
 INCLUDE AOSB3(IEFX5000,IEFX300A,IEFSD552)
  INCLUDE AOSB3(IEFXDPTH)
 INCLUDE AOSB3(IEFSD551)
 INCLUDE  AOSB3(IEFWCIMP,IEFXH000,IEFWD000,IEFWD001)
 INCLUDE  AOSB3(IEFXT00D,IEFXTDMY,IEFSD195,IEFSD096)
 INCLUDE  AOSB3(IEFXT002,IEFXT003)
 INCLUDE AOSB3(IEFSD097,IEFQMIFC)
 INCLUDE  AOSB3(IEFSD41Q,IEFXJFAK,IEFXKFAK)
 INCLUDE  AOSB3(IEFCVFAK)
 INCLUDE  AOSB3(IEFXTMSG,IEFVMMS1)
 INCLUDE AOSB3(IEFWEXTA)
 INCLUDE AOSB3(IEFAB416,IEFAB417,IEFAB420)
 ALIAS    IEFWD000,IEFW41SD,IEFWC000,IEFX5000
 ENTRY   IEFX5000
 NAME IEFSD526(R)
/*
//SG2 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSB3 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB3
//AOSBB DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSBB
//AOST4 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOST4
//ACMDLIB DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.ACMDLIB
//SYSLIN DD *
 INCLUDE ACMDLIB(IKJEFA00,IKJEFA01)
 ENTRY IKJEFA00
 NAME ACCOUNT(R)
 INCLUDE ACMDLIB(IKJEFA30,IKJEFA31,IKJEFA51)
 INCLUDE ACMDLIB(IKJEFA52,IKJEFA53,IKJEFA54)
 INCLUDE ACMDLIB(IKJEFA32,IKJEFA55)
 ENTRY IKJEFA30
 NAME IKJEFA30(R)
 INCLUDE ACMDLIB(IKJEFA40,IKJEFA41,IKJEFA42)
 INCLUDE ACMDLIB(IKJEFA52,IKJEFA51,IKJEFA55)
 ENTRY IKJEFA40
 NAME IKJEFA40(R)
 INCLUDE ACMDLIB(IKJEFA10,IKJEFA11,IKJEFA12)
 INCLUDE ACMDLIB(IKJEFA13,IKJEFA51)
 INCLUDE ACMDLIB(IKJEFA52,IKJEFA53,IKJEFA55)
 ENTRY IKJEFA10
 NAME IKJEFA10(R)
 INCLUDE ACMDLIB(IKJEFA20,IKJEFA21,IKJEFA22)
 INCLUDE ACMDLIB(IKJEFA23,IKJEFA24,IKJEFA55)
 INCLUDE ACMDLIB(IKJEFA51,IKJEFA52,IKJEFA53)
 INCLUDE ACMDLIB(IKJEFA54)
 ENTRY IKJEFA20
 NAME IKJEFA20(R)
 INCLUDE AOSBB(IKJRBBCR,IKJRBBCM)
 INCLUDE AOST4(IKJEFF02,IEEVSDIO)
 INCLUDE ACMDLIB(IKJEFA51)
 ENTRY IKJRBBCR
 NAME IKJRBBCR(R)
 INCLUDE AOSBB(IKJRBBMP,IKJRBBMG)
 ENTRY IKJRBBMP
 NAME IKJRBBMP(R)
 INCLUDE AOSBB(IKJRBBMC,IKJRBBMI)
 ENTRY IKJRBBMC
 NAME IKJRBBMC(R)
 INCLUDE ACMDLIB(IKJEES40,IKJEES20)
 INCLUDE AOST4(IEEVSDIO)
 ENTRY IKJEES40
 NAME IKJEES40(R)
 INCLUDE AOST4(IKJEFP00,IKJEFP10,IKJEFP20)
 ENTRY IKJPARS
 NAME IKJPARS(R)
 INCLUDE AOST4(IKJEFP30,IKJEFP20)
 ENTRY IKJSCAN
 NAME IKJSCAN(R)
 INCLUDE AOST4(IKJEFT30,IKJEFT35,IKJEFT40)
 INCLUDE AOST4(IKJEFT45,IKJEFT52,IKJEFT53)
 INCLUDE AOST4(IKJEFT54,IKJEFT55,IKJEFT56)
 ALIAS IKJGETL,IKJPUTL,IKJSTCK
 ENTRY IKJPTGT
 NAME IKJPTGT(R)
 INCLUDE AOSB3(IEERTE)
 INCLUDE AOSB3(IEERTE1)
 INCLUDE AOSB3(IEERTE2)
 INCLUDE AOSB3(IEERTE3)
 ORDER IEERTE,IEERTE1,IEERTE2,IEERTE3
 ENTRY IEERTE
 NAME IEERTE(R)
 INCLUDE AOSB3(IEEVSEND)
 INCLUDE AOSB3(IEEVSND1)
 INCLUDE AOSB3(IEEVSND4)
 INCLUDE AOSB3(IEEVSND6)
 INCLUDE AOSB3(IEEVSND9)
 INCLUDE AOSB3(IEEVSND2)
 INCLUDE AOSB3(IEEVSND5)
 INCLUDE AOSB3(IEEVSND3)
 INCLUDE AOSB3(IEEVSND8)
 ORDER IEEVSEND,IEEVSND1,IEEVSND4,IEEVSND6
 ORDER IEEVSND9,IEEVSND2,IEEVSND5,IEEVSND3
 ORDER IEEVSND8
 ENTRY IEEVSEND
 NAME IEEVSEND(R)
/*
//SG3 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=SVCLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSB3 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB3
//AOSCE DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSCE
//AOS00 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS00
//AOSC5 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSC5
//AOSB0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB0
//AOS21 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS21
//SYSLIN DD *
 INCLUDE SYSPUNCH(IEE3203D)
 NAME IGC3203D(R)
 INCLUDE AOSB3(IEE0503D)
 ALIAS IGG2103D
 NAME IGC0503D(R)
 INCLUDE AOSB3(IEE0903D)
 ALIAS IGX00010
 NAME IGC6503D(R)
 INCLUDE AOSC5(IEANTM00)
 ALIAS  IGC0G01C
 NAME IGC0001C(R)
 INCLUDE AOSB3(IEE00110)
 ALIAS IGX00008
 NAME IGC00110(R)
 INCLUDE SYSPUNCH(IEAQCH00)
 NAME IGC0004D(R)
/*
//SG4 EXEC LINKS,
// PARM='NCAL,LIST,XREF,SIZE=(192K,64K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSCD DD DISP=SHR,VOL=(,RETAIN),DSN=SYS1.AOSCD
//AOSC5 DD DISP=SHR,VOL=(,RETAIN),DSN=SYS1.AOSC5
//SYSLIN DD *
 INCLUDE AOSCD(IFCDIP00)
 SETCODE AC(1)
 NAME IFCDIP00(R)
 INCLUDE AOSCD(IFCEREP1)
 INCLUDE AOSCD(IFCIOHND)
 INCLUDE AOSCD(IFCMSG01)
 SETCODE AC(1)
 ENTRY   IFCEREP1
 NAME IFCEREP1(R)
 INCLUDE AOSCD(IFCPARM1)
 INCLUDE AOSCD(IFCPARM2)
 INCLUDE AOSCD(IFCDEVIC)
 ALIAS IFCPARM1
 ENTRY IFCPARM1
 NAME IFCEPARM(R)
 INCLUDE AOSCD(IFCFILT1)
 NAME IFCFILT1(R)
 INCLUDE AOSCD(IFCSYMCD)
 NAME IFCSYMCD(R)
 INCLUDE AOSCD(IFCEDSUM)
 INCLUDE AOSCD(IFCEEDIT)
 INCLUDE AOSCD(IFCESUMS)
 ENTRY   IFCEDSUM
 NAME IFCEDSUM(R)
 INCLUDE AOSCD(IFCFRAME)
 INCLUDE AOSCD(IFCFRAMM)
 INCLUDE AOSCD(IFCFRAMC)
 ENTRY IFCFRAME
 NAME IFCFRAME(R)
 INCLUDE AOSC5(IFCERFMT)
 INCLUDE AOSC5(IFCFMTIO)
 INCLUDE AOSCD(IFCMSG01)
 ENTRY IFCERFMT
 NAME IFCERFMT(R)
 INCLUDE AOSCD(IFCTHRSH)
 NAME IFCTHRSH(R)
 INCLUDE AOSCD(IFCMES01)
 INCLUDE AOSCD(IFCEEDIT)
 ENTRY   IFCMES01
 NAME IFCMES01(R)
 INCLUDE AOSCD(IFCFILT2)
 INCLUDE AOSCD(IFCDEVIC)
 ENTRY IFCFILT2
 NAME IFCFILT2(R)
 INCLUDE AOSCD(IFCSYSUM)
 NAME IFCSYSUM(R)
 INCLUDE AOSCD(IFCFILT3)
 INCLUDE AOSCD(IFCDEVIC)
 ENTRY IFCFILT3
 NAME IFCFILT3(R)
 INCLUDE AOSCD(IFCTREND)
 NAME IFCTREND(R)
 INCLUDE AOSCD(IFCFILT4)
 NAME IFCFILT4(R)
 INCLUDE AOSCD(IFCEVENT)
 INCLUDE AOSCD(IFCDEVIC)
 ENTRY IFCEVENT
 NAME IFCEVENT(R)
 INCLUDE AOSCD(IFCOFFLD)
 INCLUDE AOSCD(IFCIOHND)
 INCLUDE AOSCD(IFCMSG01)
 INCLUDE AOSCD(IFCFILT2)
 INCLUDE AOSCD(IFCDEVIC)
 INCLUDE AOSCD(IFCSYSUM)
 ENTRY IFCOFFLD
 SETCODE AC(1)
 NAME IFCOFFLD(R)
 INCLUDE AOSCD(IFCEIPL0)
 ALIAS IFCEEOD
 NAME IFCEIPL(R)
 INCLUDE AOSCD(IFCSIPL0)
 ALIAS IFCSEOD
 NAME IFCSIPL(R)
 INCLUDE AOSCD(IFCESOFT)
 NAME IFCESOFT(R)
 INCLUDE AOSCD(IFCSSOFT)
 NAME IFCSSOFT(R)
 INCLUDE AOSCD(IFCEDDR0)
 ALIAS IFCEMIH0
 NAME IFCEDDR0(R)
 INCLUDE AOSCD(IFCE0165)
 ALIAS IFCE0168
 ALIAS IFCE3062
 NAME IFCE0165(R)
 INCLUDE AOSCD(IFCEA165)
 ALIAS IFCEA168
 NAME IFCEA165(R)
 INCLUDE AOSCD(IFCEB165)
 ALIAS IFCEB168
 NAME IFCEB165(R)
 INCLUDE AOSCD(IFCEC165)
 ALIAS IFCEC168
 NAME IFCEC165(R)
 INCLUDE AOSCD(IFCED165)
 ALIAS IFCED168
 NAME IFCED165(R)
 INCLUDE AOSCD(IFCEE165)
 ALIAS IFCEE168
 NAME IFCEE165(R)
 INCLUDE AOSCD(IFCEF165)
 ALIAS IFCEF168
 NAME IFCEF165(R)
 INCLUDE AOSCD(IFCELEX1)
 NAME IFCELEX1(R)
 INCLUDE AOSCD(IFCS0165)
 ALIAS IFCS0168
 ALIAS IFCS3062
 NAME IFCS0165(R)
 INCLUDE AOSCD(IFCE0155)
 ALIAS IFCE0158
 NAME IFCE0155(R)
 INCLUDE AOSCD(IFCEA155)
 ALIAS IFCEA158
 NAME IFCEA155(R)
 INCLUDE AOSCD(IFCEB155)
 ALIAS IFCEB158
 NAME IFCEB155(R)
 INCLUDE AOSCD(IFCEC155)
 ALIAS IFCEC158
 NAME IFCEC155(R)
 INCLUDE AOSCD(IFCED155)
 ALIAS IFCED158
 NAME IFCED155(R)
 INCLUDE AOSCD(IFCEE155)
 ALIAS IFCEE158
 NAME IFCEE155(R)
 INCLUDE AOSCD(IFCEF155)
 ALIAS IFCEF158
 NAME IFCEF155(R)
 INCLUDE AOSCD(IFCEG155)
 ALIAS IFCEG158
 NAME IFCEG155(R)
 INCLUDE AOSCD(IFCEL155)
 ALIAS IFCEL158
 NAME IFCEL155(R)
 INCLUDE AOSCD(IFCEM155)
 ALIAS IFCEM158
 NAME IFCEM155(R)
 INCLUDE AOSCD(IFCEI155)
 ALIAS IFCEI158
 NAME IFCEI155(R)
 INCLUDE AOSCD(IFCS0155)
 ALIAS IFCS0158
 NAME IFCS0155(R)
 INCLUDE AOSCD(IFCSI155)
 ALIAS IFCSI158
 NAME IFCSI155(R)
 INCLUDE AOSCD(IFCE0135)
 ALIAS IFCE0138
 NAME IFCE0135(R)
 INCLUDE AOSCD(IFCS0135)
 ALIAS IFCSI135
 ALIAS IFCSI138
 ALIAS IFCS0138
 NAME IFCS0135(R)
 INCLUDE AOSCD(IFCEI135)
 ALIAS IFCEI138
 NAME IFCEI135(R)
 INCLUDE AOSCD(IFCE0145)
 ALIAS IFCE0148
 NAME IFCE0145(R)
 INCLUDE AOSCD(IFCETUL1)
 NAME IFCETUL1(R)
 INCLUDE AOSCD(IFCS0145)
 ALIAS IFCS0148
 NAME IFCS0145(R)
 INCLUDE AOSCD(IFCEI145)
 ALIAS IFCEI148
 NAME IFCEI145(R)
 INCLUDE AOSCD(IFCEJ145)
 NAME IFCEJ145(R)
 INCLUDE AOSCD(IFCSI145)
 ALIAS IFCSI148
 NAME IFCSI145(R)
 INCLUDE AOSCD(IFCE2860)
 NAME IFCE2860(R)
 INCLUDE AOSCD(IFCS2860)
 NAME IFCS2860(R)
 INCLUDE AOSCD(IFCE2870)
 NAME IFCE2870(R)
 INCLUDE AOSCD(IFCS2870)
 NAME IFCS2870(R)
 INCLUDE AOSCD(IFCE2880)
 NAME IFCE2880(R)
 INCLUDE AOSCD(IFCS2880)
 NAME IFCS2880(R)
 INCLUDE AOSCD(IFCEXXXX)
 NAME IFCEXXXX(R)
 INCLUDE AOSCD(IFCSXXXX)
 NAME IFCSXXXX(R)
 INCLUDE AOSCD(IFCEAXXX)
 NAME IFCEAXXX(R)
 INCLUDE AOSCD(IFCSAXXX)
 NAME IFCSAXXX(R)
 INCLUDE AOSCD(IFCEXXXC)
 ALIAS IFCE200A
 ALIAS IFCE200B
 ALIAS IFCE2009
 NAME IFCE200D(R)
 INCLUDE AOSCD(IFCET001)
 ALIAS IFCET009
 ALIAS IFCET00A
 ALIAS IFCET011
 NAME IFCET001(R)
 INCLUDE AOSCD(IFCEMER0)
 NAME IFCEMER0(R)
 INCLUDE AOSCD(IFCEWIN1)
 NAME IFCEWIN1(R)
 INCLUDE AOSCD(IFCEMAD1)
 NAME IFCEMAD1(R)
 INCLUDE AOSCD(IFCEMER1)
 NAME IFCEMER1(R)
 INCLUDE AOSCD(IFCEMER2)
 NAME IFCEMER2(R)
 INCLUDE AOSCD(IFCEMER3)
 NAME IFCEMER3(R)
 INCLUDE AOSCD(IFCEMER4)
 NAME IFCEMER4(R)
 INCLUDE AOSCD(IFCEMER5)
 NAME IFCEMER5(R)
 INCLUDE AOSCD(IFCSXXXC)
 ALIAS IFCST001
 ALIAS IFCST00A
 ALIAS IFCS2009
 NAME IFCS200D(R)
 INCLUDE AOSCD(IFCSAXXC)
 ALIAS IFCST009
 NAME IFCS200A(R)
 INCLUDE AOSCD(IFCS3350)
 ALIAS IFCST011
 NAME IFCS200B(R)
 INCLUDE AOSCD(IFCEXXXD)
 ALIAS IFCE2007
 NAME IFCE2006(R)
 INCLUDE AOSCD(IFCET002)
 ALIAS IFCET012
 NAME IFCET002(R)
 INCLUDE AOSCD(IFCSXXXD)
 ALIAS IFCST002
 ALIAS IFCST012
 ALIAS IFCS2007
 NAME IFCS2006(R)
 INCLUDE AOSCD(IFCET005)
 ALIAS IFCET015
 NAME IFCET005(R)
 INCLUDE AOSCD(IFCETRN0)
 NAME IFCETRN0(R)
 INCLUDE AOSCD(IFCETRN1)
 NAME IFCETRN1(R)
 INCLUDE AOSCD(IFCETRN2)
 NAME IFCETRN2(R)
 INCLUDE AOSCD(IFCETRN3)
 NAME IFCETRN3(R)
 INCLUDE AOSCD(IFCETRN4)
 NAME IFCETRN4(R)
 INCLUDE AOSCD(IFCETRN5)
 NAME IFCETRN5(R)
 INCLUDE AOSCD(IFCST005)
 ALIAS IFCST015
 NAME IFCST005(R)
 INCLUDE AOSCD(IFCET006)
 NAME IFCET006(R)
 INCLUDE AOSCD(IFCST006)
 NAME IFCST006(R)
 INCLUDE AOSCD(IFCET008)
 NAME IFCET008(R)
 INCLUDE AOSCD(IFCST008)
 NAME IFCST008(R)
 INCLUDE AOSCD(IFCEUKNO)
 ALIAS IFCEUCPU
 ALIAS IFCEUCCH
 ALIAS IFCEUTYP
 ALIAS IFCEUOBR
 NAME IFCEUKNO(R)
 INCLUDE AOSCD(IFCSUKNO)
 ALIAS IFCSUCPU
 ALIAS IFCSUCCH
 ALIAS IFCSUTYP
 ALIAS IFCSUOBR
 NAME IFCSUKNO(R)
 INCLUDE AOSCD(IFCEXXX0)
 ALIAS IFCE4001
 ALIAS IFCE4003
 ALIAS IFCE4004
 NAME IFCE4002(R)
 INCLUDE AOSCD(IFCSXXX0)
 ALIAS IFCS4001
 ALIAS IFCS4003
 ALIAS IFCS4004
 NAME IFCS4002(R)
 INCLUDE AOSCD(IFCEXXX1)
 ALIAS IFCE0816
 ALIAS IFCE0803
 ALIAS IFCE0804
 ALIAS IFCE0805
 ALIAS IFCE0818
 ALIAS IFCE0801
 NAME IFCE0802(R)
 INCLUDE AOSCD(IFCSXXX1)
 ALIAS IFCS0816
 ALIAS IFCS0803
 ALIAS IFCS0804
 ALIAS IFCS0805
 ALIAS IFCS0818
 ALIAS IFCS0801
 NAME IFCS0802(R)
 INCLUDE AOSCD(IFCEXXX2)
 ALIAS IFCE0822
 ALIAS IFCE0823
 ALIAS IFCE0830
 ALIAS IFCE1445
 ALIAS IFCE0820
 ALIAS IFCE1004
 ALIAS IFCE0821
 NAME IFCE0808(R)
 INCLUDE AOSCD(IFCSXXX2)
 ALIAS IFCS0822
 ALIAS IFCS0823
 ALIAS IFCS0830
 ALIAS IFCS1445
 ALIAS IFCS0820
 ALIAS IFCS1004
 ALIAS IFCS0821
 NAME IFCS0808(R)
 INCLUDE AOSCD(IFCEXXX3)
 ALIAS IFCE081D
 ALIAS IFCE081E
 ALIAS IFCE081F
 ALIAS IFCE081A
 ALIAS IFCE0810
 NAME IFCE080A(R)
 INCLUDE AOSCD(IFCSXXX3)
 ALIAS IFCS081D
 ALIAS IFCS081E
 ALIAS IFCS081F
 ALIAS IFCS081A
 ALIAS IFCS0810
 NAME IFCS080A(R)
 INCLUDE AOSCD(IFCEXXX4)
 ALIAS IFCE2004
 ALIAS IFCE2003
 ALIAS IFCE2005
 NAME IFCE2001(R)
 INCLUDE AOSCD(IFCSXXX4)
 ALIAS IFCS2004
 ALIAS IFCS2003
 ALIAS IFCS2005
 NAME IFCS2001(R)
 INCLUDE AOSCD(IFCEXXX5)
 NAME IFCE2002(R)
 INCLUDE AOSCD(IFCSXXX5)
 NAME IFCS2002(R)
 INCLUDE AOSCD(IFCEXXX6)
 NAME IFCE2008(R)
 INCLUDE AOSCD(IFCSXXX6)
 NAME IFCS2008(R)
 INCLUDE AOSCD(IFCEXXX7)
 ALIAS IFCE2245
 ALIAS IFCE1009
 ALIAS IFCE100C
 ALIAS IFCE100A
 ALIAS IFCE100B
 ALIAS IFCE100E
 ALIAS IFCE100F
 ALIAS IFCE100D
 NAME IFCE1001(R)
 INCLUDE AOSCD(IFCSXXX7)
 ALIAS IFCS2245
 ALIAS IFCS1009
 ALIAS IFCS100C
 ALIAS IFCS100A
 ALIAS IFCS100B
 ALIAS IFCS100E
 ALIAS IFCS100F
 ALIAS IFCS100D
 NAME IFCS1001(R)
 INCLUDE AOSCD(IFCEXXX8)
 ALIAS IFCE1007
 ALIAS IFCE1008
 ALIAS IFCE081C
 NAME IFCE081B(R)
 INCLUDE AOSCD(IFCSXXX8)
 ALIAS IFCS1007
 ALIAS IFCS1008
 ALIAS IFCS081C
 NAME IFCS081B(R)
 INCLUDE AOSCD(IFCEXXX9)
 ALIAS IFCE0806
 ALIAS IFCE080C
 ALIAS IFCE1003
 ALIAS IFCE1005
 ALIAS IFCE1006
 NAME IFCE1002(R)
 INCLUDE AOSCD(IFCSXXX9)
 ALIAS IFCS080C
 ALIAS IFCS0806
 ALIAS IFCS1003
 ALIAS IFCS1005
 ALIAS IFCS1006
 NAME IFCS1002(R)
 INCLUDE AOSCD(IFCEXXXA)
 ALIAS IFCE0809
 ALIAS IFCE080B
 ALIAS IFCE0844
 NAME IFCE8001(R)
 INCLUDE AOSCD(IFCSXXXA)
 ALIAS IFCS0809
 ALIAS IFCS080B
 ALIAS IFCS0844
 NAME IFCS8001(R)
 INCLUDE AOSCD(IFCEXXXE)
 NAME IFCE0817(R)
 INCLUDE AOSCD(IFCSXXXE)
 NAME IFCS0817(R)
 INCLUDE AOSCD(IFCEGUS1)
 ALIAS IFCE084C
 NAME IFCEGUS1(R)
 INCLUDE AOSCD(IFCSGUS1)
 ALIAS IFCS084C
 NAME IFCSGUS1(R)
 INCLUDE AOSCD(IFCET004)
 ALIAS IFCET010
 NAME IFCET004(R)
 INCLUDE AOSCD(IFCET003)
 ALIAS IFCET013
 NAME IFCET003(R)
 INCLUDE AOSCD(IFCST003)
 ALIAS IFCST013
 NAME IFCST003(R)
 INCLUDE AOSCD(IFCET00B)
 NAME IFCET00B(R)
 INCLUDE AOSCD(IFCST00B)
 NAME IFCST00B(R)
 INCLUDE AOSCD(IFCEXXXB)
 NAME IFCE8003(R)
 INCLUDE AOSCD(IFCSXXXB)
 NAME IFCS8003(R)
 INCLUDE AOSCD(IFCECUA1)
 NAME IFCECUA1(R)
 INCLUDE AOSCD(IFCSCUA1)
 NAME IFCSCUA1(R)
 INCLUDE AOSCD(IFCEVOL0)
 NAME IFCEVOL0(R)
 INCLUDE AOSCD(IFCSVOL0)
 NAME IFCSVOL0(R)
 INCLUDE AOSCD(IFCECUA0)
 NAME IFCECUA0(R)
 INCLUDE AOSCD(IFCSCUA0)
 NAME IFCSCUA0(R)
 INCLUDE AOSCD(IFCEXXXG)
 ALIAS IFCEXXXG
 ALIAS IFCET00E
 NAME IFCE0842(R)
 INCLUDE AOSCD(IFCEOAK1)
 NAME IFCEOAK1(R)
 INCLUDE AOSCD(IFCEOAK2)
 NAME IFCEOAK2(R)
 INCLUDE AOSCD(IFCEOAK3)
 NAME IFCEOAK3(R)
 INCLUDE AOSCD(IFCEOAK4)
 NAME IFCEOAK4(R)
 INCLUDE AOSCD(IFCEOAK5)
 NAME IFCEOAK5(R)
 INCLUDE AOSCD(IFCSXXXG)
 ALIAS IFCSXXXG
 ALIAS IFCST00E
 NAME IFCS0842(R)
 INCLUDE AOSCD(IFCEXXXF)
 ALIAS IFCEXXXF
 NAME IFCE080E(R)
 INCLUDE AOSCD(IFCEARG1)
 NAME IFCEARG1(R)
 INCLUDE AOSCD(IFCEARG2)
 NAME IFCEARG2(R)
 INCLUDE AOSCD(IFCEARG3)
 NAME IFCEARG3(R)
 INCLUDE AOSCD(IFCEARG4)
 NAME IFCEARG4(R)
 INCLUDE AOSCD(IFCEARG5)
 NAME IFCEARG5(R)
 INCLUDE AOSCD(IFCEARG6)
 NAME IFCEARG6(R)
 INCLUDE AOSCD(IFCEARG7)
 NAME IFCEARG7(R)
 INCLUDE AOSCD(IFCET00C)
 NAME IFCET00C(R)
 INCLUDE AOSCD(IFCSXXXF)
 ALIAS IFCSXXXF
 ALIAS IFCST00C
 NAME IFCS080E(R)
 INCLUDE AOSCD(IFCEXXXH)
 ALIAS IFCE0819
 NAME IFCEXXXH(R)
 INCLUDE AOSCD(IFCET00D)
 NAME IFCET00D(R)
 INCLUDE AOSCD(IFCSXXXH)
 ALIAS IFCS0819
 ALIAS IFCST00D
 NAME IFCSXXXH(R)
/*
//SG5 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT,SIZE=(256K,64K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=VTAMLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS22 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS22
//AOS23 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS23
//SYSLIN DD *
 INCLUDE AOS23(ISTCSAAC)
 INCLUDE AOS23(ISTCSAAQ)
 INCLUDE AOS23(ISTCSACL)
 INCLUDE AOS23(ISTCSALG)
 INCLUDE AOS23(ISTCSAMR)
 INCLUDE AOS23(ISTCSARL)
 INCLUDE AOS23(ISTCSAPS)
 ORDER ISTCSAMR
 ENTRY ISTCSAMR
 NAME ISTCSAMR(R)
 INCLUDE AOS23(ISTOCACC)
 INCLUDE AOS23(ISTOCACH)
 INCLUDE AOS23(ISTOCACL)
 INCLUDE AOS23(ISTOCACM)
 INCLUDE AOS23(ISTOCACN)
 INCLUDE AOS23(ISTOCACX)
 INCLUDE AOS23(ISTOCAFB)
 INCLUDE AOS23(ISTOCAFD)
 INCLUDE AOS23(ISTOCAFO)
 INCLUDE AOS23(ISTOCAFR)
 INCLUDE AOS23(ISTOCALD)
 INCLUDE AOS23(ISTOCAMD)
 INCLUDE AOS23(ISTOCANV)
 INCLUDE AOS23(ISTOCAOD)
 INCLUDE AOS23(ISTOCAOE)
 INCLUDE AOS23(ISTOCAOF)
 INCLUDE AOS23(ISTOCAQU)
 INCLUDE AOS23(ISTOCARD)
 INCLUDE AOS23(ISTOCARL)
 INCLUDE AOS23(ISTOCART)
 INCLUDE AOS23(ISTOCASD)
 INCLUDE AOS23(ISTOCASL)
 INCLUDE AOS23(ISTOCAUR)
 INCLUDE AOS23(ISTCFAPC)
 INCLUDE AOS23(ISTCFAR1)
 INCLUDE AOS23(ISTCFAS1)
 INCLUDE AOS23(ISTCFAS2)
 INCLUDE AOS23(ISTCFARP)
 INCLUDE AOS23(ISTSQA00)
 INCLUDE AOS23(ISTSQA01)
 INCLUDE AOS23(ISTSQA02)
 INCLUDE AOS23(ISTSQA03)
 INCLUDE AOS23(ISTSQA04)
 INCLUDE AOS23(ISTSQA05)
 INCLUDE AOS23(ISTSQA06)
 INCLUDE AOS23(ISTSQA07)
 INCLUDE AOS23(ISTSQA08)
 INCLUDE AOS23(ISTSQA09)
 INCLUDE AOS23(ISTSQA0A)
 INCLUDE AOS23(ISTSQA0B)
 INCLUDE AOS23(ISTSTA00)
 ORDER ISTOCART
 ENTRY ISTOCART
 ALIAS ISTOCACX
 NAME ISTOCART(R)
 INCLUDE AOS23(ISTOCAOB)
 INCLUDE AOS23(ISTOCAOC)
 INCLUDE AOS23(ISTCFAPO)
 ORDER ISTOCAOB
 ENTRY ISTOCAOB
 NAME ISTOCAOB(R)
 INCLUDE AOS23(ISTZPAVB)
 INCLUDE AOS23(ISTZBAMB)
 INCLUDE AOS23(ISTZDAA0)
 INCLUDE AOS23(ISTZDAH0)
 INCLUDE AOS23(ISTZDAC0)
 INCLUDE AOS23(ISTZDAD0)
 INCLUDE AOS23(ISTZBAY0)
 INCLUDE AOS23(ISTZDAPR)
 INCLUDE AOS23(ISTZDAQR)
 INCLUDE AOS23(ISTZDAXR)
 INCLUDE AOS23(ISTZDAB0)
 INCLUDE AOS23(ISTZBAOB)
 INCLUDE AOS23(ISTZDAI0)
 INCLUDE AOS23(ISTZDAF0)
 INCLUDE AOS23(ISTZDAMB)
 INCLUDE AOS23(ISTZDAMF)
 INCLUDE AOS23(ISTZDANB)
 INCLUDE AOS23(ISTZBAZ0)
 ORDER ISTZBAOB
 ORDER ISTZBAZ0
 ORDER ISTZDAF0
 ORDER ISTZDAI0
 ORDER ISTZDAMB
 ORDER ISTZDAMF
 ORDER ISTZDANB
 ORDER ISTZDAXR
 ORDER ISTZDAB0
 ORDER ISTZDAQR
 ORDER ISTZDAPR
 ORDER ISTZBAY0
 ORDER ISTZDAD0
 ORDER ISTZDAC0
 ORDER ISTZDAH0
 ORDER ISTZDAA0
 ORDER ISTZBAMB
 ORDER ISTZPAVB
 ENTRY ISTZPAVB
 NAME ISTZPAVB(R)
 INCLUDE AOS23(ISTZEAAA)
 INCLUDE AOS23(ISTZEACA)
 INCLUDE AOS23(ISTZEAFA)
 INCLUDE AOS23(ISTZEATA)
 INCLUDE AOS23(ISTZEABA)
 INCLUDE AOS23(ISTZFAFA)
 INCLUDE AOS23(ISTZFATA)
 INCLUDE AOS23(ISTZFAEA)
 INCLUDE AOS23(ISTZFAXA)
 INCLUDE AOS23(ISTZFAVA)
 INCLUDE AOS23(ISTZDAK0)
 ORDER ISTZFAVA
 ENTRY ISTZFAVA
 NAME ISTZFAVA(R)
 INCLUDE AOS23(ISTZEAAB)
 INCLUDE AOS23(ISTZEABB)
 INCLUDE AOS23(ISTZEACB)
 INCLUDE AOS23(ISTZFAFB)
 INCLUDE AOS23(ISTZFACB)
 INCLUDE AOS23(ISTZFAEB)
 INCLUDE AOS23(ISTZFAVB)
 ORDER ISTZFAVB
 ENTRY ISTZFAVB
 NAME ISTZFAVB(R)
 INCLUDE AOS23(ISTZDAJ0)
 NAME ISTZDAJ0(R)
 INCLUDE AOS23(ISTZEADA)
 INCLUDE AOS23(ISTZPAVA)
 ORDER ISTZPAVA
 ENTRY ISTZPAVA
 NAME ISTZPAVA(R)
 INCLUDE AOS22(ISTPAACH)
 ALIAS ISTPATCH
 NAME ISTPAACH(R)
 INCLUDE AOS22(ISTINADP)
 INCLUDE AOS22(ISTINAR4)
 INCLUDE AOS22(ISTINAR6)
 INCLUDE AOS23(ISTINAY0)
 INCLUDE AOS22(ISTINAY1)
 ORDER ISTINADP
 ENTRY ISTINADP
 ALIAS ISTINCDP
 NAME ISTINADP(R)
 INCLUDE AOS23(ISTINAIP)
 INCLUDE AOS23(ISTINAR5)
 ORDER ISTINAIP
 ENTRY ISTINAIP
 NAME ISTINAIP(R)
/*
//SG6 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,REUS,SIZE=(256K,64K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=VTAMLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS22 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS22
//AOS23 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS23
//SYSLIN DD *
 INCLUDE AOS23(ISTRAATB)
 ALIAS ISTRAFTB
 NAME ISTRAATB(R)
 INCLUDE AOS23(ISTRAATP)
 INCLUDE AOS23(ISTRAATL)
 ORDER ISTRAATP
 ENTRY ISTRAATP
 NAME ISTRAATP(R)
 INCLUDE AOS23(ISTZFADB)
 INCLUDE AOS23(ISTZFA4B)
 INCLUDE AOS23(ISTZFAV0)
 ORDER ISTZFAV0
 ENTRY ISTZFAV0
 NAME ISTZFAV0(R)
 INCLUDE AOS23(ISTZFADF)
 INCLUDE AOS23(ISTZFA4F)
 INCLUDE AOS23(ISTZFAAF)
 INCLUDE AOS23(ISTZFAV1)
 ORDER ISTZFAV1
 ENTRY ISTZFAV1
 NAME ISTZFAV1(R)
 INCLUDE AOS23(ISTZFA0A)
 ENTRY ISTZFA0A
 NAME ISTZFA0A(R)
 INCLUDE AOS23(ISTZFA0B)
 INCLUDE AOS23(ISTZFA1B)
 INCLUDE AOS23(ISTZFA2B)
 INCLUDE AOS23(ISTZFA3B)
 ORDER ISTZFA0B
 ENTRY ISTZFA0B
 ALIAS ISTZCEAB
 NAME ISTZCAAB(R)
 INCLUDE AOS22(ISTYCAUS)
 ALIAS ISTYCLUS
 NAME ISTYCAUS(R)
 INCLUDE AOS22(ISTYCANT)
 ALIAS ISTYCONT
 NAME ISTYCANT(R)
 INCLUDE AOS22(ISTYPAOL)
 ALIAS ISTYPSOL
 NAME ISTYPAOL(R)
 INCLUDE AOS22(ISTYSACP)
 ALIAS ISTYSSCP
 NAME ISTYSACP(R)
 INCLUDE AOS22(ISTYTAM1)
 ALIAS ISTYTCM1
 NAME ISTYTAM1(R)
 INCLUDE AOS22(ISTYTAM2)
 ALIAS ISTYTCM2
 NAME ISTYTAM2(R)
 INCLUDE AOS22(ISTYTAM3)
 ALIAS ISTYTCM3
 NAME ISTYTAM3(R)
 INCLUDE AOS22(ISTDVABA)
 ALIAS ISTDVCBA
 NAME ISTDVABA(R)
 INCLUDE AOS22(ISTDVARC)
 ALIAS ISTDVCRC
 NAME ISTDVARC(R)
 INCLUDE AOS22(ISTSDALM)
 ALIAS ISTSDCLM
 NAME ISTSDALM(R)
 INCLUDE AOS23(ISTIC000)
 INCLUDE AOS23(ISTIC001)
 INCLUDE AOS23(ISTIC002)
 INCLUDE AOS23(ISTIC003)
 INCLUDE AOS23(ISTIC004)
 INCLUDE AOS23(ISTIC005)
 INCLUDE AOS23(ISTIC006)
 INCLUDE AOS23(ISTIC007)
 INCLUDE AOS23(ISTIC008)
 INCLUDE AOS23(ISTIC009)
 INCLUDE AOS23(ISTIC00A)
 INCLUDE AOS23(ISTSC020)
 INCLUDE AOS23(ISTSC021)
 INCLUDE AOS23(ISTSC022)
 INCLUDE AOS23(ISTSC023)
 INCLUDE AOS23(ISTSC024)
 INCLUDE AOS23(ISTSC025)
 INCLUDE AOS23(ISTSC026)
 INCLUDE AOS23(ISTSC027)
 INCLUDE AOS23(ISTSC028)
 INCLUDE AOS23(ISTSC029)
 INCLUDE AOS23(ISTSC02A)
 INCLUDE AOS23(ISTSC02B)
 INCLUDE AOS23(ISTSC02C)
 INCLUDE AOS23(ISTSC02D)
 INCLUDE AOS23(ISTSC02E)
 INCLUDE AOS23(ISTSC02F)
 INCLUDE AOS23(ISTSC030)
 INCLUDE AOS23(ISTSC031)
 INCLUDE AOS23(ISTSC032)
 INCLUDE AOS23(ISTSC033)
 INCLUDE AOS23(ISTTC035)
 INCLUDE AOS23(ISTTC037)
 INCLUDE AOS23(ISTCC010)
 INCLUDE AOS23(ISTCC011)
 INCLUDE AOS23(ISTCC012)
 INCLUDE AOS23(ISTCC013)
 INCLUDE AOS23(ISTCC014)
 INCLUDE AOS23(ISTCC015)
 INCLUDE AOS23(ISTCC016)
 INCLUDE AOS23(ISTEC123)
 INCLUDE AOS23(ISTEC456)
 INCLUDE AOS23(ISTEC789)
 INCLUDE AOS23(ISTEC000)
 ORDER ISTIC000
 ENTRY ISTIC000
 NAME ISTOLTEP(R)
/*
//SG7 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT,SIZE=(256K,64K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=SVCLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS23 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS23
//SYSLIN DD *
 INCLUDE AOS23(ISTCFA3D)
 NAME IGCAT030(R)
 INCLUDE AOS23(ISTOCACA)
 NAME IFG0200U(R)
 INCLUDE AOS23(ISTOCAOA)
 NAME IFG0192F(R)
 INCLUDE AOS23(ISTAPA21)
 NAME IGC0012D(R)
/*
//SG8 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,REUS,SIZE=(256K,64K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=SVCLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS23 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS23
//SYSLIN DD *
 INCLUDE AOS23(ISTZBA0J)
 NAME IGE0010F(R)
 INCLUDE AOS23(ISTZBA1J)
 NAME IGE0110F(R)
 INCLUDE AOS23(ISTZBA2J)
 NAME IGE0210F(R)
 INCLUDE AOS23(ISTZBA0K)
~raw00002020440020404020000040014004402010001000100000405000402220012022000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 INCLUDE AOS23(ISTZBA1K)
~raw00002020440020404020000040014004402010000400100000405000402220012022000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 INCLUDE AOS23(ISTZBA2K)
~raw00002020440020404020000040014004402010000200100000405000402220012022000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 INCLUDE AOS23(ISTZBA3K)
~raw00002020440020404020000040014004402010000100100000405000402220012022000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
/*
//SG9 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT,SIZE=(320K,100K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS23 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS23
//SYSLIN DD *
 INCLUDE AOS23(ISTAIACK)
 INCLUDE AOS23(ISTAIAIR)
 ORDER ISTAIAIR
 ENTRY ISTAIAIR
 ALIAS ISTAICIR
 ALIAS CCKRIUWT
 NAME ISTAIAIR(R)
 INCLUDE AOS23(ISTAPA61)
 ALIAS ISTAPC61
 NAME ISTAPA61(R)
 INCLUDE AOS23(ISTRAAD1)
 ALIAS ISTRAFD1
 NAME ISTRAAD1(R)
 INCLUDE AOS23(ISTINAOQ)
 ALIAS ISTINCOQ
 NAME ISTINAOQ(R)
/*
//SG10 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,REUS,SIZE=(400K,100K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS23 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS23
//SYSLIN DD *
 INCLUDE AOS23(ISTINA01)
 INCLUDE AOS23(ISTINAAD)
 INCLUDE AOS23(ISTINAAL)
 INCLUDE AOS23(ISTINAAV)
 INCLUDE AOS23(ISTINAAW)
 INCLUDE AOS23(ISTINAA0)
 INCLUDE AOS23(ISTINABL)
 INCLUDE AOS23(ISTINACC)
 INCLUDE AOS23(ISTINACF)
 INCLUDE AOS23(ISTINACL)
 INCLUDE AOS23(ISTINADL)
 INCLUDE AOS23(ISTINADU)
 INCLUDE AOS23(ISTINAD0)
 INCLUDE AOS23(ISTINAD1)
 INCLUDE AOS23(ISTINAD2)
 INCLUDE AOS23(ISTINAD3)
 INCLUDE AOS23(ISTINAD4)
 INCLUDE AOS23(ISTINAD5)
 INCLUDE AOS23(ISTINAD6)
 INCLUDE AOS23(ISTINAD7)
 INCLUDE AOS23(ISTINAD8)
 INCLUDE AOS23(ISTINAD9)
 INCLUDE AOS23(ISTINAE0)
 INCLUDE AOS23(ISTINAE1)
 INCLUDE AOS23(ISTINAE2)
 INCLUDE AOS23(ISTINAE3)
 INCLUDE AOS23(ISTINAE4)
 INCLUDE AOS23(ISTINAE5)
 INCLUDE AOS23(ISTINAE6)
 INCLUDE AOS23(ISTINAE7)
 INCLUDE AOS23(ISTINAE8)
 INCLUDE AOS23(ISTINAE9)
 INCLUDE AOS23(ISTINAFM)
 INCLUDE AOS23(ISTINAFS)
 INCLUDE AOS23(ISTINAF1)
 INCLUDE AOS23(ISTINAF3)
 INCLUDE AOS23(ISTINAF4)
 INCLUDE AOS23(ISTINAF9)
 INCLUDE AOS23(ISTINAHT)
 INCLUDE AOS23(ISTINAIB)
 INCLUDE AOS23(ISTINAIO)
 INCLUDE AOS23(ISTINAIT)
 INCLUDE AOS23(ISTINALF)
 INCLUDE AOS23(ISTINAL0)
 INCLUDE AOS23(ISTINAL1)
 INCLUDE AOS23(ISTINAL2)
 INCLUDE AOS23(ISTINAL3)
 INCLUDE AOS23(ISTINAL4)
 INCLUDE AOS23(ISTINAL5)
 INCLUDE AOS23(ISTINAL6)
 INCLUDE AOS23(ISTINAL7)
 INCLUDE AOS23(ISTINAL8)
 INCLUDE AOS23(ISTINAMD)
 INCLUDE AOS23(ISTINAMR)
 INCLUDE AOS23(ISTINAMY)
 INCLUDE AOS23(ISTINANS)
 INCLUDE AOS23(ISTINAOE)
 INCLUDE AOS23(ISTINAOI)
 INCLUDE AOS23(ISTINAOS)
 INCLUDE AOS23(ISTINAPD)
 INCLUDE AOS23(ISTINAPH)
 INCLUDE AOS23(ISTINAQB)
 INCLUDE AOS23(ISTINAQE)
 INCLUDE AOS23(ISTINARD)
 INCLUDE AOS23(ISTINARF)
 INCLUDE AOS23(ISTINARR)
 INCLUDE AOS23(ISTINARS)
 INCLUDE AOS23(ISTINAR3)
 INCLUDE AOS23(ISTINAR5)
 INCLUDE AOS23(ISTINASH)
 INCLUDE AOS23(ISTINASM)
 INCLUDE AOS23(ISTINAST)
 INCLUDE AOS23(ISTINAS1)
 INCLUDE AOS23(ISTINATE)
 INCLUDE AOS23(ISTINATM)
 INCLUDE AOS23(ISTINATR)
 INCLUDE AOS23(ISTINAUA)
 INCLUDE AOS23(ISTINAUB)
 INCLUDE AOS23(ISTINAUM)
 INCLUDE AOS23(ISTINAUQ)
 INCLUDE AOS23(ISTINAU0)
 INCLUDE AOS23(ISTINAU1)
 INCLUDE AOS23(ISTINAU2)
 INCLUDE AOS23(ISTINAU3)
 INCLUDE AOS23(ISTINAU4)
 INCLUDE AOS23(ISTINAU5)
 INCLUDE AOS23(ISTINAU6)
 INCLUDE AOS23(ISTINAU7)
 INCLUDE AOS23(ISTINAU8)
 INCLUDE AOS23(ISTINAVA)
 INCLUDE AOS23(ISTINAVI)
 INCLUDE AOS23(ISTINAVN)
 INCLUDE AOS23(ISTINAVO)
 INCLUDE AOS23(ISTINAVP)
 INCLUDE AOS23(ISTINAVS)
 INCLUDE AOS23(ISTINAVX)
 INCLUDE AOS23(ISTINAV2)
 INCLUDE AOS23(ISTINAV3)
 INCLUDE AOS23(ISTINAV4)
 INCLUDE AOS23(ISTINAV5)
 INCLUDE AOS23(ISTINAV6)
 INCLUDE AOS23(ISTINAV8)
 INCLUDE AOS23(ISTINAV9)
 INCLUDE AOS23(ISTINAW0)
 INCLUDE AOS23(ISTINAW2)
 INCLUDE AOS23(ISTINAW3)
 INCLUDE AOS23(ISTINAW4)
 INCLUDE AOS23(ISTINAW5)
 INCLUDE AOS23(ISTINAW6)
 INCLUDE AOS23(ISTINAW7)
 INCLUDE AOS23(ISTINAW8)
 INCLUDE AOS23(ISTINAW9)
 INCLUDE AOS23(ISTINAXR)
 INCLUDE AOS23(ISTINAX0)
 INCLUDE AOS23(ISTINAX1)
 INCLUDE AOS23(ISTINAX2)
 INCLUDE AOS23(ISTINAX3)
 INCLUDE AOS23(ISTINAX6)
 INCLUDE AOS23(ISTINAX7)
 INCLUDE AOS23(ISTINAX8)
 INCLUDE AOS23(ISTINAX9)
 INCLUDE AOS23(ISTINAY3)
 INCLUDE AOS23(ISTINAY4)
 INCLUDE AOS23(ISTINAY5)
 INCLUDE AOS23(ISTINA02)
 INCLUDE AOS23(ISTCFADP)
 INCLUDE AOS23(ISTCFAR2)
 INCLUDE AOS23(ISTINAIC)
 INCLUDE AOS23(ISTVTAOD)
 INCLUDE AOS23(ISTINAR1)
 INCLUDE AOS23(ISTINAR2)
 INCLUDE AOS23(ISTSDAAP)
 INCLUDE AOS23(ISTSDABU)
 INCLUDE AOS23(ISTSDACB)
 INCLUDE AOS23(ISTSDACL)
 INCLUDE AOS23(ISTSDAC1)
 INCLUDE AOS23(ISTSDAC2)
 INCLUDE AOS23(ISTSDAC3)
 INCLUDE AOS23(ISTSDAC4)
 INCLUDE AOS23(ISTSDAC5)
 INCLUDE AOS23(ISTSDAC7)
 INCLUDE AOS23(ISTSDADS)
 INCLUDE AOS23(ISTSDAD1)
 INCLUDE AOS23(ISTSDAD2)
 INCLUDE AOS23(ISTSDAD3)
 INCLUDE AOS23(ISTSDAGE)
 INCLUDE AOS23(ISTSDAGP)
 INCLUDE AOS23(ISTSDAHS)
 INCLUDE AOS23(ISTSDAIN)
 INCLUDE AOS23(ISTSDALN)
 INCLUDE AOS23(ISTSDALP)
 INCLUDE AOS23(ISTSDALU)
 INCLUDE AOS23(ISTSDAML)
 INCLUDE AOS23(ISTSDAMT)
 INCLUDE AOS23(ISTSDAPA)
 INCLUDE AOS23(ISTSDAPC)
 INCLUDE AOS23(ISTSDAPU)
 INCLUDE AOS23(ISTSDAP1)
 INCLUDE AOS23(ISTSDAP2)
 INCLUDE AOS23(ISTSDAP3)
 INCLUDE AOS23(ISTSDAP4)
 INCLUDE AOS23(ISTSDAP5)
 INCLUDE AOS23(ISTSDAP6)
 INCLUDE AOS23(ISTSDARC)
 INCLUDE AOS23(ISTSDARN)
 INCLUDE AOS23(ISTSDARS)
 INCLUDE AOS23(ISTSDASB)
 INCLUDE AOS23(ISTSDASC)
 INCLUDE AOS23(ISTSDASS)
 INCLUDE AOS23(ISTSDASU)
 INCLUDE AOS23(ISTSDATM)
 INCLUDE AOS23(ISTSDAVB)
 INCLUDE AOS23(ISTSDAVG)
 INCLUDE AOS23(ISTSDAVI)
 ORDER ISTINA01
 ENTRY ISTINA01
 NAME ISTINA01(R)
 INCLUDE AOS23(ISTINA32)
 ALIAS ISTINC32
 NAME ISTINA32(R)
 INCLUDE AOS23(ISTINA05)
 INCLUDE AOS23(ISTINAN8)
 ORDER ISTINA05
 ENTRY ISTINA05
 ALIAS ISTINC05
 NAME ISTINA05(R)
 INCLUDE AOS23(ISTINAXI)
 INCLUDE AOS23(ISTINAN8)
 ORDER ISTINAXI
 ENTRY ISTINAXI
 ALIAS ISTINCXI
 NAME ISTINAXI(R)
 INCLUDE AOS23(ISTCFATM)
 ALIAS ISTCFCTM
 NAME ISTCFATM(R)
 INCLUDE AOS23(ISTCFAMM)
 ALIAS ISTCFCMM
 NAME ISTCFAMM(R)
 INCLUDE AOS23(ISTINARP)
 ALIAS ISTINCRP
 NAME ISTINARP(R)
 INCLUDE AOS23(ISTINAXM)
 ALIAS ISTINCXM
 NAME ISTINAXM(R)
/*
//SG11 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS0A DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS0A
//SYSLIN DD *
 INCLUDE AOS0A(IHKRER)
 ENTRY IHKRER
 ALIAS IHKRER01
 ALIAS IHKRER02
 ALIAS IHKRER03
 NAME IHKRER(R)
 INCLUDE AOS0A(IHKLGF)
 NAME IHKLGF(R)
 INCLUDE AOS0A(IHKEND)
 NAME IHKEND(R)
 INCLUDE AOS0A(IHKALC)
 INCLUDE AOS0A(IHKERR)
 ENTRY IHKALC
 ALIAS IHKERR
 NAME IHKALC(R)
 INCLUDE AOS0A(IHKIPT)
 INCLUDE AOS0A(IHKOUT)
 ENTRY IHKIPT
 ALIAS IHKOUT
 NAME IHKIPT(R)
 INCLUDE AOS0A(IHKTAB)
 INCLUDE AOS0A(IHKSTP)
 ENTRY IHKTAB
 ALIAS IHKSTP
 NAME IHKTAB(R)
/*
//SG12 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT,LET,SIZE=(256K,96K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=SVCLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSA0 DD DISP=SHR,VOL=(,RETAIN),DSN=SYS1.AOSA0
//SYSLIN DD *
 INCLUDE AOSA0(IGG0CLA1)
 ENTRY IGG0CLA1
 NAME IGG0CLA1(R)
 INCLUDE AOSA0(IGG0CLC9,IGG0CLAA,IGG0CLAB,IGG0CLAC)
 INCLUDE AOSA0(IGG0CLAD,IGG0CLAE,IGG0CLAF,IGG0CLAG)
 INCLUDE AOSA0(IGG0CLAH,IGG0CLAI)
 INCLUDE AOSA0(IGG0CLAJ,IGG0CLAK,IGG0CLAL,IGG0CLAM)
 INCLUDE AOSA0(IGG0CLAN,IGG0CLAP,IGG0CLAQ,IGG0CLAR)
 INCLUDE AOSA0(IGG0CLAS,IGG0CLAT,IGG0CLAU,IGG0CLAV)
 INCLUDE AOSA0(IGG0CLAW,IGG0CLAX,IGG0CLAY,IGG0CLAZ)
 INCLUDE AOSA0(IGG0CLBA,IGG0CLBB,IGG0CLBC,IGG0CLBD)
 INCLUDE AOSA0(IGG0CLBE,IGG0CLBF,IGG0CLBG,IGG0CLBH)
 INCLUDE AOSA0(IGG0CLBI)
 INCLUDE AOSA0(IGG0CLBJ,IGG0CLBK,IGG0CLBL,IGG0CLBM)
 INCLUDE AOSA0(IGG0CLBO)
 INCLUDE AOSA0(IGG0CLBN,IGG0CLBP,IGG0CLBQ,IGG0CLBR)
 INCLUDE AOSA0(IGG0CLBS,IGG0CLBT,IGG0CLBU,IGG0CLBV)
 INCLUDE AOSA0(IGG0CLBW,IGG0CLBX,IGG0CLBY,IGG0CLBZ)
 INCLUDE AOSA0(IGG0CLA6,IGG0CLA7,IGG0CLA8)
 INCLUDE AOSA0(IGG0CLB0,IGG0CLB1,IGG0CLB2,IGG0CLB3)
 INCLUDE AOSA0(IGG0CLB4,IGG0CLB5,IGG0CLB6,IGG0CLB7)
 INCLUDE AOSA0(IGG0CLB8,IGG0CLB9,IGG0CLDA)
 ENTRY IGG0CLC9
 NAME IGG0CLC9(R)
 INCLUDE AOSA0(IFG0191X)
 NAME IFG0191X(R)
 INCLUDE AOSA0(IFG0191Y)
 NAME IFG0191Y(R)
 INCLUDE AOSA0(IFG0200N)
 ALIAS IFG0550Y
 NAME IFG0200N(R)
 INCLUDE AOSA0(IDA0192A)
 INCLUDE AOSA0(IDA0192B)
 INCLUDE AOSA0(IDA0192C)
 INCLUDE AOSA0(IDA0192D)
 INCLUDE AOSA0(IDA0192F)
 INCLUDE AOSA0(IDA0192G)
 INCLUDE AOSA0(IDA0192M)
 INCLUDE AOSA0(IDA0192P)
 INCLUDE AOSA0(IDA0192S)
 INCLUDE AOSA0(IDA0192V)
 INCLUDE AOSA0(IDA0192W)
 INCLUDE AOSA0(IDA0192Y)
 INCLUDE AOSA0(IDA0192Z)
 INCLUDE AOSA0(IDA0200T)
 INCLUDE AOSA0(IDA0200B)
 INCLUDE AOSA0(IDA0231T)
 INCLUDE AOSA0(IDA0231B)
 INCLUDE AOSA0(IDA0557A)
 INCLUDE AOSA0(IDA0192I)
 INCLUDE AOSA0(IDA0200S)
 INCLUDE AOSA0(IDA0C06C)
 INCLUDE AOSA0(IDA0A05B)
 INCLUDE AOSA0(IDA0B05B)
 ALIAS IDA0192V,IDA0192P,IDA0192G,IDA0192Y
 ALIAS IDA0200T,IDA0231T,IDA0557A,IDA0192I
 ALIAS IDA0C06C,IDA0A05B
 ALIAS IDA0200S
 ENTRY IDA0192A
 NAME IDA0192A(R)
 INCLUDE AOSA0(IFG0192A)
 ALIAS IFG0200T,IFG0231T,IFG0192Y
 ALIAS IFG0557A,IFG0192I,IFG0200S
 ENTRY IFG0192A
 NAME IFG0192A(R)
 INCLUDE AOSA0(IDA019R1)
 INCLUDE AOSA0(IDA019R4)
 INCLUDE AOSA0(IDA019RZ)
 INCLUDE AOSA0(IDA019R2)
 INCLUDE AOSA0(IDA019RW)
 INCLUDE AOSA0(IDA019R3)
 INCLUDE AOSA0(IDA019RA)
 INCLUDE AOSA0(IDA019RB)
 INCLUDE AOSA0(IDA019RC)
 INCLUDE AOSA0(IDA019R8)
 INCLUDE AOSA0(IDA019RL)
 INCLUDE AOSA0(IDA019RM)
 INCLUDE AOSA0(IDA019SA)
 INCLUDE AOSA0(IDA019RX)
 INCLUDE AOSA0(IDA019RU)
 INCLUDE AOSA0(IDA019RS)
 INCLUDE AOSA0(IDA019RT)
 INCLUDE AOSA0(IDA019SF)
 INCLUDE AOSA0(IDA019RY)
 INCLUDE AOSA0(IDA019SB)
 INCLUDE AOSA0(IDA019RP)
 INCLUDE AOSA0(IDA019RR)
 INCLUDE AOSA0(IDA019RQ)
 INCLUDE AOSA0(IDA019RV)
 INCLUDE AOSA0(IDA019RE)
 INCLUDE AOSA0(IDA019RH)
 INCLUDE AOSA0(IDA019RF)
 INCLUDE AOSA0(IDA019RI)
 INCLUDE AOSA0(IDA019RN)
 INCLUDE AOSA0(IDA019RJ)
 INCLUDE AOSA0(IDA019RG)
 INCLUDE AOSA0(IDA019RK)
 INCLUDE AOSA0(IDA019R5)
 INCLUDE AOSA0(IDA019SE)
 INCLUDE AOSA0(IDA019RO)
 INCLUDE AOSA0(IDA019S6)
 INCLUDE AOSA0(IDA019ST)
 INCLUDE AOSA0(IDA019SU)
 ALIAS IDA019ST
 ENTRY IDA019R1
 NAME IDA019L1(R)
 INCLUDE AOSA0(IDA019R6)
 NAME IDA019R6(R)
 INCLUDE AOSA0(IDA019R7)
 NAME IDA019R7(R)
 INCLUDE AOSA0(IDA019R9)
 NAME IDA019R9(R)
 INCLUDE AOSA0(IDA019RD)
 NAME IDA019RD(R)
 INCLUDE AOSA0(IDA019S1)
 INCLUDE AOSA0(IDA019S3)
 INCLUDE AOSA0(IDA019R5)
 ENTRY IDA019S1
 NAME IDA019L2(R)
 INCLUDE AOSA0(IDAIIPM1)
 NAME IDAIIPM1(R)
 INCLUDE AOSA0(IDAIIPM2)
 NAME IDAIIPM2(R)
 INCLUDE AOSA0(IDAIIPM3)
 NAME IDAIIPM3(R)
 INCLUDE AOSA0(IDAIISM1)
 NAME IDAIISM1(R)
 INCLUDE AOSA0(IDAIIFBF)
 NAME IDAIIFBF(R)
/*
//SG13 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSA0 DD DISP=SHR,VOL=(,RETAIN),DSN=SYS1.AOSA0
//SYSLIN DD *
 INCLUDE AOSA0(IGG0CLA0)
 ENTRY IGG0CLA0
 NAME IGG0CLA0(R)
/*
//SG14 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IDCEX01,IDCTP01,IDCSA01,IDCSA02)
 INCLUDE AOSU0(IDCSA03,IDCIO01)
 INCLUDE AOSU0(IDCTP06)
 INCLUDE AOSU0(IDCSA06,IDCSA07,IDCSA08)
 INCLUDE AOSU0(IDCSA09,IDCSA10,IDCIO05)
 ENTRY IDCSA01
 NAME IDCAMS(R)
 INCLUDE AOSU0(IDCTP04)
 NAME IDCTP04(R)
 INCLUDE AOSU0(IDCTP05)
 NAME IDCTP05(R)
 INCLUDE AOSU0(IDCEX02)
 NAME IDCEX02(R)
 INCLUDE AOSU0(IDCEX03)
 NAME IDCEX03(R)
 INCLUDE AOSU0(IDCIO02)
 NAME IDCIO02(R)
 INCLUDE AOSU0(IDCIO03)
 NAME IDCIO03(R)
 INCLUDE AOSU0(IDCSA05)
 NAME IDCSA05(R)
 INCLUDE AOSU0(IDCRI01,IDCRI02,IDCRI03)
 ENTRY IDCRI01
 NAME IDCRI01(R)
 INCLUDE AOSU0(IDCDB01)
 NAME IDCDB01(R)
 INCLUDE AOSU0(IDCDB02)
 NAME IDCDB02(R)
 INCLUDE AOSU0(IDCAL01)
 NAME IDCAL01(R)
 INCLUDE AOSU0(IDCRP01)
 NAME IDCRP01(R)
 INCLUDE AOSU0(IDCDE01,IDCDE02)
 ENTRY IDCDE01
 NAME IDCDE01(R)
 INCLUDE AOSU0(IDCDL01)
 NAME IDCDL01(R)
 INCLUDE AOSU0(IDCLC01,IDCLC02)
 ENTRY IDCLC01
 NAME IDCLC01(R)
 INCLUDE AOSU0(IDCMP01)
 NAME IDCMP01(R)
 INCLUDE AOSU0(IDCPM01)
 NAME IDCPM01(R)
 INCLUDE AOSU0(IDCPR01)
 NAME IDCPR01(R)
 INCLUDE AOSU0(IDCXP01)
 NAME IDCXP01(R)
 INCLUDE AOSU0(IDCVY01)
 NAME IDCVY01(R)
 INCLUDE AOSU0(IDCCDAL)
 NAME IDCCDAL(R)
 INCLUDE AOSU0(IDCCDRP)
 NAME IDCCDRP(R)
 INCLUDE AOSU0(IDCCDDE)
 NAME IDCCDDE(R)
 INCLUDE AOSU0(IDCCDDL)
 NAME IDCCDDL(R)
 INCLUDE AOSU0(IDCCDLC)
 NAME IDCCDLC(R)
 INCLUDE AOSU0(IDCCDMP)
 NAME IDCCDMP(R)
 INCLUDE AOSU0(IDCCDPM)
 NAME IDCCDPM(R)
 INCLUDE AOSU0(IDCCDPR)
 NAME IDCCDPR(R)
 INCLUDE AOSU0(IDCCDXP)
 NAME IDCCDXP(R)
 INCLUDE AOSU0(IDCCDVY)
 NAME IDCCDVY(R)
 INCLUDE AOSU0(IDCRILT)
 INCLUDE AOSU0(IDCRIFF)
 ORDER  IDCRILT,IDCRIFF
 NAME IDCRILT(R)
 INCLUDE AOSU0(IDCRIKT)
 NAME IDCRIKT(R)
 INCLUDE AOSU0(IDCTSAL0)
 NAME IDCTSAL0(R)
 INCLUDE AOSU0(IDCTSDE0)
 NAME IDCTSDE0(R)
 INCLUDE AOSU0(IDCTSDL0)
 NAME IDCTSDL0(R)
 INCLUDE AOSU0(IDCTSEX0)
 NAME IDCTSEX0(R)
 INCLUDE AOSU0(IDCTSIO0)
 NAME IDCTSIO0(R)
 INCLUDE AOSU0(IDCTSLC0)
 NAME IDCTSLC0(R)
 INCLUDE AOSU0(IDCTSLC1)
 NAME IDCTSLC1(R)
 INCLUDE AOSU0(IDCTSMP0)
 NAME IDCTSMP0(R)
 INCLUDE AOSU0(IDCTSPR0)
 NAME IDCTSPR0(R)
 INCLUDE AOSU0(IDCTSRI0)
 NAME IDCTSRI0(R)
 INCLUDE AOSU0(IDCTSSA0)
 NAME IDCTSSA0(R)
 INCLUDE AOSU0(IDCTSTP0)
 NAME IDCTSTP0(R)
 INCLUDE AOSU0(IDCTSTP1)
 NAME IDCTSTP1(R)
 INCLUDE AOSU0(IDCTSTP6)
 NAME IDCTSTP6(R)
 INCLUDE AOSU0(IDCTSUV0)
 NAME IDCTSUV0(R)
 INCLUDE AOSU0(IDCTSXP0)
 NAME IDCTSXP0(R)
 INCLUDE AOSU0(IDCCDBI)
 NAME IDCCDBI(R)
 INCLUDE AOSU0(IDCBI01)
 NAME IDCBI01(R)
 INCLUDE AOSU0(IDCTSBI0)
 NAME IDCTSBI0(R)
 INCLUDE AOSU0(IDCCDCK)
 NAME IDCCDCK(R)
 INCLUDE AOSU0(IDCCK01)
 NAME IDCCK01(R)
 INCLUDE AOSU0(IDCTSCK0)
 NAME IDCTSCK0(R)
 INCLUDE AOSU0(IDCCDLR)
 NAME IDCCDLR(R)
 INCLUDE AOSU0(IDCLR01)
 INCLUDE AOSU0(IDCLR02)
 INCLUDE AOSU0(IDCRC04)
 ENTRY IDCLR01
 NAME IDCLR01(R)
 INCLUDE AOSU0(IDCTSLR0)
 NAME IDCTSLR0(R)
 INCLUDE AOSU0(IDCTSLR1)
 NAME IDCTSLR1(R)
 INCLUDE AOSU0(IDCCDRC)
 NAME IDCCDRC(R)
 INCLUDE AOSU0(IDCRC01)
 INCLUDE AOSU0(IDCRC02)
 INCLUDE AOSU0(IDCRC03)
 INCLUDE AOSU0(IDCRC04)
 ENTRY IDCRC01
 NAME IDCRC01(R)
 INCLUDE AOSU0(IDCTSRC0)
 NAME IDCTSRC0(R)
 INCLUDE AOSU0(IDCCDRM)
 NAME IDCCDRM(R)
 INCLUDE AOSU0(IDCRM01)
 NAME IDCRM01(R)
 INCLUDE AOSU0(IDCCDRS)
 NAME IDCCDRS(R)
 INCLUDE AOSU0(IDCRS01)
 INCLUDE AOSU0(IDCRS02)
 INCLUDE AOSU0(IDCRS03)
 INCLUDE AOSU0(IDCRS04)
 INCLUDE AOSU0(IDCRS05)
 INCLUDE AOSU0(IDCRS06)
 INCLUDE AOSU0(IDCRS07)
 ENTRY IDCRS01
 NAME IDCRS01(R)
 INCLUDE AOSU0(IDCTSRS0)
 NAME IDCTSRS0(R)
/*
//SG15 EXEC LINKS,
// PARM='NCAL,LIST,XREF',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS03 DD DISP=SHR,VOL=(,RETAIN),DSN=SYS1.AOS03
//SYSLIN DD *
  INCLUDE  AOS03(IFOX0A,IFOX0B)
  ENTRY  IFOX0A01
  ALIAS  ASMBLR,IEUASM
  NAME  IFOX00(R)
  INCLUDE  AOS03(IFOX0C)
  ENTRY IFOX0C01
  NAME  IFOX01(R)
  INCLUDE  AOS03(IFOX0D,IFOX0J)
  ENTRY IFOX0D01
  NAME  IFOX02(R)
  INCLUDE  AOS03(IFOX0E)
  ENTRY  IFOX0E01
  NAME  IFOX03(R)
  INCLUDE  AOS03(IFOX0F)
  ENTRY IFOX0F01
  NAME  IFOX04(R)
  INCLUDE  AOS03(IFOX0G)
  ENTRY IFOX0G01
  NAME  IFOX05(R)
  INCLUDE  AOS03(IFOX0H)
  ENTRY IFOX0H01
  NAME  IFOX06(R)
  INCLUDE  AOS03(IFOX0I)
  ENTRY IFOX0I01
  NAME  IFOX07(R)
  INCLUDE  AOS03(IFNX1A,IFNX1J,IFNX1K,IFNX1S)
  ENTRY  IFNX1A01
  NAME  IFOX11(R)
  INCLUDE  AOS03(IFNX2A)
  ENTRY IFNX2A01
  NAME  IFOX21(R)
  INCLUDE  AOS03(IFNX3A,IFNX3B,IFNX3K,IFNX3N)
  ENTRY  IFNX3A01
  NAME  IFOX31(R)
  INCLUDE  AOS03(IFNX4D,IFNX4E,IFNX4M,IFNX4S,IFNX4V)
  ENTRY  IFNX4M01
  NAME  IFOX41(R)
  INCLUDE  AOS03(IFNX4E,IFNX4N,IFNX4S,IFNX4T,IFNX4V)
  ENTRY  IFNX4T01
  NAME  IFOX42(R)
  INCLUDE  AOS03(IFNX5A,IFNX5C,IFNX5D,IFNX5F)
  INCLUDE  AOS03(IFNX5L,IFNX5M,IFNX5P,IFNX5V)
  ENTRY  IFNX5C01
  NAME  IFOX51(R)
  INCLUDE  AOS03(IFNX6A)
  ENTRY IFNX6A01
  NAME  IFOX61(R)
  INCLUDE  AOS03(IFNX6B,IFNX6C)
  ENTRY  IFNX6B01
  NAME  IFOX62(R)
/*
//SG16 EXEC LINKS,
// PARM='NCAL,LIST,XREF,OVLY,XCAL,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS04 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS04
//SYSLIN DD *
 INCLUDE AOS04(HEWLFROU,HEWLFAPT,HEWLFINT,HEWLFOPT)
 INCLUDE AOS04(HEWLFINP,HEWLFESD,HEWLFEND,HEWLFSYM)
 INCLUDE AOS04(HEWLFRCG,HEWLFSCN,HEWLFRAT,HEWLFIDR)
 INCLUDE AOS04(HEWLFINC,HEWLFMAP,HEWLFADA)
 INCLUDE AOS04(HEWLFENT,HEWLFENS,HEWLFOUT,HEWLFREL)
 INCLUDE AOS04(HEWLFSCD,HEWLFFNL,HEWLFBTP)
 INCLUDE SYSPUNCH(HEWLF064)
 INSERT HEWLFROU,HEWLFAPT,HEWLFDEF
 OVERLAY ONE  *** VALID EXCLUSIVE CALL TO HEWLFINP ***
 INSERT HEWLFINT,HEWLFOPT
 OVERLAY ONE **VALID EXCL. CALLS TO HEWLFADA,IEWLCFNI,HEWLFADA
 INSERT HEWLFINP,HEWLFESD,HEWLFEND,HEWLFSYM,HEWLFRCG
 INSERT HEWLFSCN,HEWLFRAT,HEWLFTXT,HEWLFINC,HEWLFIDR
 OVERLAY ONE
 INSERT HEWLFMAP
 OVERLAY TWO **VALID EXCL. CALLS TO HEWLFFNL,HEWLFSCD,HEWLFFNL
 INSERT HEWLFADA,HEWLFENT,HEWLFENS,HEWLFOUT
 OVERLAY TWO   *** VALID EXCLUSIVE CALL TO HEWLFFNL ***
 INSERT HEWLFREL,HEWLFSCD,HEWLFSIO
 OVERLAY TWO   *** VALID EXCLUSIVE CALL TO IEWLENAM ***
 INSERT HEWLFFNL,HEWLFBTP
 ENTRY HEWLFROU
 ALIAS IEWL
 ALIAS IEWLF440
 ALIAS IEWLF880
 ALIAS IEWLF128
 ALIAS HEWL
 ALIAS LINKEDIT
 NAME HEWLF064(R)
/*
//SG17 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT,REFR,REUS,OL',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS05  DD DSNAME=SYS1.AOS05,DISP=SHR,VOLUME=(,RETAIN)
//SYSLIN DD *
 INCLUDE AOS05(HEWLDIOC,HEWLDREL,HEWLDLIB,HEWLDIDY)
 INCLUDE SYSPUNCH(HEWLDDEF)
 ENTRY HEWLIOCA
 ALIAS IEWLOAD
 ALIAS IEWLOADR
 ALIAS HEWLOAD
 NAME HEWLOADR(R)
/*
//SG18 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REUS,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=IEHDASDR,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEHDASDR)
 SETCODE AC(1)
 NAME IEHDASDR(R)
 INCLUDE AOSU0(IEHDASDS,IEHDCONS)
 ENTRY IEHDASDS
 SETCODE AC(1)
 NAME IEHDASDS(R)
 INCLUDE AOSU0(IEHDPRNT,IEHDDATE)
 ENTRY IEHDPRNT
 SETCODE AC(1)
 NAME IEHDPRNT(R)
 INCLUDE AOSU0(IEHDMSGB,IEHDMSGS)
 ENTRY IEHDMSGB
 SETCODE AC(1)
 NAME IEHDMSGB(R)
 INCLUDE AOSU0(IEHDSCAN)
 SETCODE AC(1)
 NAME IEHDSCAN(R)
 INCLUDE AOSU0(IEHDREST,IEHDINIT,IEHDRVID)
 ENTRY IEHDINIT
 SETCODE AC(1)
 NAME IEHDREST(R)
 INCLUDE AOSU0(IEHDDUMP,IEHDEXCP,IEHDDOIO)
 ENTRY IEHDDUMP
 SETCODE AC(1)
 NAME IEHDDUMP(R)
 INCLUDE AOSU0(IEHDAOUT)
 SETCODE AC(1)
 NAME IEHDAOUT(R)
 INCLUDE AOSU0(IEHDANAL)
 SETCODE AC(1)
 NAME IEHDANAL(R)
 INCLUDE AOSU0(IEHDVTOC)
 SETCODE AC(1)
 NAME IEHDVTOC(R)
 INCLUDE AOSU0(IEHDLABL)
 SETCODE AC(1)
 NAME IEHDLABL(R)
 INCLUDE AOSU0(IEHDGETA)
 SETCODE AC(1)
 NAME IEHDGETA(R)
 INCLUDE AOSU0(IEHDPASS)
 SETCODE AC(1)
 NAME IEHDPASS(R)
 INCLUDE AOSU0(IEHDRCVR)
 SETCODE AC(1)
 NAME IEHDRCVR(R)
 INCLUDE AOSU0(IEHDIPLI)
 SETCODE AC(1)
 NAME IEHDIPLI(R)
/*
//SG19 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEHIOSUP)
 SETCODE AC(1)
 NAME   IEHIOSUP(R)
/*
//SG20 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT,REFR',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEHATLAS,IEHMESS)
 ENTRY  IEHATLAS
 SETCODE AC(1)
 NAME   IEHATLAS(R)
 INCLUDE AOSU0(IAPCNTRL,IAPBLDIO,IAPCHKIO,IAPTIMER)
 INCLUDE AOSU0(IAPABNAP,IAPPFXAP)
 ENTRY  IAPCNTRL
 ALIAS  IAPTIMER
 SETCODE AC(1)
 NAME   IAPAP100(R)
/*
//SG21 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=IEBPTPCH,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEBPPUN1,IEBPPMSG)
 INCLUDE AOSU0(IEBPPAL1,IEBCCS02)
 INCLUDE AOSU0(IEBPPCH1)
 ENTRY PRPCH        ** CANCEL OVERLAY FOR IEBPTPCH  **
 NAME   IEBPTPCH(R) ** WHEN MSG IEW0201 IS GENERATED**
 INCLUDE AOSU0(IEBPTRCP)
 SETCODE AC(1)
 ENTRY IEBPTRCP
 NAME  IEBPTRCP(R)
 INCLUDE AOSU0(IEBGENRT,IEBGMESG)
 INCLUDE AOSU0(IEBCCS02,IEBGSCAN)
 INCLUDE AOSU0(IEBGENR3,IEBCONP2,IEBCONH2)
 INCLUDE AOSU0(IEBCONZ2,IEBEDIT2,IEBLENP2)
 INCLUDE AOSU0(IEBMOVE2)
 INCLUDE AOSU0(IEBGENS3)
 INCLUDE AOSU0(IEBGEN03)
 ENTRY IEBGENER     ** CANCEL OVERLAY FOR IEBGENER  **
 NAME   IEBGENER(R) ** WHEN MSG IEW0201 IS GENERATED**
 INCLUDE AOSU0(IEBCROOT,IEBCOMPM,IEBCULET)
 INCLUDE AOSU0(IEBCCS02,IEBCANAL)
 INCLUDE AOSU0(IEBCMAIN,IEBCQSAM)
 ENTRY COMPARE      ** CANCEL OVERLAY FOR IEBCOMPR  **
 NAME   IEBCOMPR(R) ** WHEN MSG IEW0201 IS GENERATED**
 INCLUDE AOSU0(IEBUPDTE,IEBUPLOG,IEBUPDT2,IEBUPXIT)
 INCLUDE AOSU0(IEBUPNIT)
 INCLUDE AOSU0(IEBASCAN,IEBBSCAN)
 ENTRY IEBUPDTE     ** CANCEL OVERLAY FOR IEBUPDTE  **
 NAME   IEBUPDTE(R) ** WHEN MSG IEW0201 IS GENERATED**
/*
//SG22 EXEC LINKS,
// PARM='NCAL,LIST,XREF,OVLY,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEBDSCPY,IEBVMS)
 INCLUDE AOSU0(IEBDV1,IEBLDUL)
 INCLUDE AOSU0(IEBSCN)
 INCLUDE AOSU0(IEBVCT)
 INCLUDE AOSU0(IEBIOE)
 INCLUDE AOSU0(IEBRSAM,IEBCNVT,IEBDRD)
 INCLUDE AOSU0(IEBWSAM,IEBDSU)
 INCLUDE AOSU0(IEBWSU,IEBDWR)
 INCLUDE AOSU0(IEBBAM)
 INCLUDE AOSU0(IEBVDM)
 INCLUDE AOSU0(IEBDRB)
 INCLUDE AOSU0(IEBMCM)
 INCLUDE AOSU0(IEBVTT)
 INCLUDE AOSU0(IEBVTM)
 INSERT IEBDSCPY,IEBDSCP2,IEBDSMCA,IEBVMS,IEBVMTXT
 OVERLAY 1
 INSERT IEBDV1,IEBDV1MG,IEBLDUL
 OVERLAY 1
 INSERT IEBSCN
 OVERLAY 1
 INSERT IEBVCT
 OVERLAY 1
 INSERT IEBIOE,IEBIOEMG
 OVERLAY 1
 INSERT IEBRSAM,IEBCNVT,IEBDRD,IEBDRDR
 OVERLAY 2
 INSERT IEBWSAM,IEBDSU
 OVERLAY 2
 INSERT IEBWSU,IEBWSUMG,IEBDWR,IEBDWRR
 OVERLAY 3
 INSERT IEBBAM
 OVERLAY 3
 INSERT IEBVDM
 OVERLAY 3
 INSERT IEBDRB
 OVERLAY 3
 INSERT IEBMCM
 OVERLAY 3
 INSERT IEBVTT
 OVERLAY 3
 INSERT IEBVTM
 ENTRY IEBDSCPY
 NAME    IEBCOPY(R)
/*
//SG23 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REUS,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEHMVESI)
 NAME       IEHMVESI(R)
 INCLUDE AOSU0(IEHMVESH)
 NAME       IEHMVESH(R)
 INCLUDE AOSU0(IEHMVESU)
 NAME       IEHMVESU(R)
 INCLUDE AOSU0(IEHMVESO)
 NAME       IEHMVESO(R)
 INCLUDE AOSU0(IEHMVESP)
 NAME       IEHMVESP(R)
 INCLUDE AOSU0(IEHMVESC)
 NAME       IEHMVESC(R)
 INCLUDE AOSU0(IEHMVESK)
 NAME       IEHMVESK(R)
 INCLUDE AOSU0(IEHMVESR)
 NAME       IEHMVESR(R)
 INCLUDE AOSU0(IEHMVESJ)
 NAME       IEHMVESJ(R)
/*
//SG24 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REUS',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=IEHMVXSF,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEHMVXSF,IEHMVSSF)
 ENTRY   IEHMVXSF
 NAME    IEHMVXSF(R)
 INCLUDE AOSU0(IEHMVSRX,IEHMVSRM,IEHMVSSY)
 INCLUDE AOSU0(IEHMVMSY)
 ENTRY   IEHMVESY
 NAME    IEHMVESY(R)
 INCLUDE AOSU0(IEHMVSSX,IEHMVSRY,IEHMVSTC)
 INCLUDE AOSU0(IEHMVMRY)
 ENTRY   IEHMVESY
 NAME    IEHMVESV(R)
 INCLUDE AOSU0(IEHMVSRV,IEHMVSRZ,IEHMVSRK)
 INCLUDE AOSU0(IEHMVMRZ)
 ENTRY   IEHMVESZ
 NAME    IEHMVESX(R)
 INCLUDE AOSU0(IEHMVSSZ,IEHMVSSV)
 INCLUDE AOSU0(IEHMVMRZ)
 ENTRY   IEHMVESZ
 NAME    IEHMVESZ(R)
 INCLUDE AOSU0(IEHMVSRD,IEHMVSRM)
 ENTRY   IEHMVERD
 NAME    IEHMVERD(R)
 INCLUDE AOSU0(IEHMVSRA,IEHMVSRK)
 ENTRY   IEHMVERA
 NAME    IEHMVERA(R)
 INCLUDE AOSU0(IEHMVSTA,IEHMVSRK,IEHMVSRM)
 INCLUDE AOSU0(IEHMVMTA)
 ENTRY   IEHMVETA
 NAME    IEHMVETA(R)
 INCLUDE AOSU0(IEHMVSTL,IEHMVSRK,IEHMVSRM)
 INCLUDE AOSU0(IEHMVMTL)
 ENTRY   IEHMVETL
 NAME    IEHMVETL(R)
 INCLUDE AOSU0(IEHMVSSS)
 ENTRY   IEHMVESS
 NAME    IEHMVESS(R)
 INCLUDE AOSU0(IEHMVETG)
 ENTRY IEHMVETG
 NAME IEHMVETG(R)
 INCLUDE AOSU0(IEHMVESM)
 ENTRY IEHMVESM
 NAME IEHMVESM(R)
 INCLUDE AOSU0(IEHMVESL)
 ENTRY IEHMVESL
 NAME IEHMVESL(R)
 INCLUDE AOSU0(IEHMVETJ)
 ENTRY IEHMVETJ
 NAME IEHMVETJ(R)
 INCLUDE AOSU0(IEHMVESQ,IEHMVMSQ)
 ENTRY IEHMVESQ
 NAME IEHMVESQ(R)
 INCLUDE AOSU0(IEHMVESN,IEHMVMSN)
 ENTRY IEHMVESN
 NAME IEHMVESN(R)
 INCLUDE AOSU0(IEHMVESA)
 ENTRY IEHMVESA
 NAME IEHMVESA(R)
/*
//SG25 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEHMVXSE)
 ALIAS      IEHMVESE
 NAME       IEHMVXSE(R)
 INCLUDE AOSU0(IEHMVEST)
 NAME       IEHMVEST(R)
 INCLUDE AOSU0(IEHMOVE)
 ENTRY IEHMVESD
 NAME       IEHMOVE(R)
/*
//SG26 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEBISAM)
 NAME IEBISAM(R)
 INCLUDE AOSU0(IEBISU,IEBISSO)
 ENTRY IEBISU
 NAME IEBISU(R)
 INCLUDE AOSU0(IEBISL,IEBISSI)
 ENTRY IEBISL
 NAME IEBISL(R)
 INCLUDE AOSU0(IEBISF,IEBISMES)
 ENTRY IEBISF
 NAME IEBISF(R)
 INCLUDE AOSU0(IEBISC)
 NAME IEBISC(R)
 INCLUDE AOSU0(IEBISPL)
 NAME IEBISPL(R)
/*
//SG27 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT,REFR',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEBDG)
 NAME IEBDG(R)
 INCLUDE AOSU0(IEBDGCUP)
 NAME IEBDGCUP(R)
 INCLUDE AOSU0(IEBFDANL)
 NAME IEBFDANL(R)
 INCLUDE AOSU0(IEBFDTBL)
 NAME IEBFDTBL(R)
 INCLUDE AOSU0(IEBCRANL)
 NAME IEBCRANL(R)
 INCLUDE AOSU0(IEBCREAT)
 NAME IEBCREAT(R)
 INCLUDE AOSU0(IEBDGMSG)
 NAME IEBDGMSG(R)
/*
//SG28 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=IEWSZOVR,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSC2 DD DISP=SHR,VOL=(,RETAIN),DSN=SYS1.AOSC2
//SYSLIN DD *
 INCLUDE  AOSC2(IEWSXOVR)
 NAME  IEWSZOVR(R)
/*
//SG29 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,DC',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEHLIST1,IEHLIST2,IEHLIST3,IEHMVSSF)
 ENTRY IEHLISTR
 NAME  IEHLIST(R)
  INCLUDE AOSU0(IEHPROG1,IEHPROG2,IEHPROG3,IEHPROG4)
 INCLUDE AOSU0(IEHPROG5,IEHMVSSF)
  ENTRY IEHPROG1
  NAME IEHPROGM(R)
/*
//SG30 EXEC LINKS,
// PARM='NCAL,LIST,XREF,RENT,LET,DC',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=IEHINITT,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEHINITT)
 NAME    IEHINITT(R)
 INCLUDE AOSU0(IEHPRNT)
 NAME    IEHPRNT(R)
 INCLUDE AOSU0(IEHSCAN)
 NAME    IEHSCAN(R)
/*
//SG31 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REUS,LET,DC',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=IEBEDIT,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEBEDIT)
 NAME    IEBEDIT(R)
/*
//SG32 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REUS,LET',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=IEBIMAGE,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSN=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IEBIMAGE,IEBISCAN,IEBIMSGS)
 ENTRY   IEBIMAGE
 NAME    IEBIMAGE(R)
/*
//SG33 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REUS',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=IFDOLT,P2=')',OBJ=OBJPDS1,CLASS=A
//AOS06 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS06
//AOSC5 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSC5
//SYSLIN DD *
 ORDER IFDOLT23(P),IFDOLT00
 INCLUDE AOS06(IFDOLT00,IFDOLT12,IFDOLT18,IFDOLT23,IFDOLT30)
 INCLUDE AOS06(IFDOLT39,IFDOLT51,IFDOLT52,IFDOLT48,IFDMSG00)
 INCLUDE AOS06(IFDOLT05,IFDMSG05,IFDOLT06,IFDMSG06,IFDOLT08)
 INCLUDE AOS06(IFDMSG08,IFDOLT09,IFDOLT10,IFDOLT11,IFDOLT13)
 INCLUDE AOS06(IFDMSG13,IFDOLT16,IFDOLT21,IFDOLT22,IFDMSG22)
 INCLUDE AOS06(IFDOLT24,IFDOLT26,IFDOLT28,IFDOLT35,IFDOLT36)
 INCLUDE AOS06(IFDOLT37,IFDMSG37,IFDOLT41,IFDOLT42,IFDOLT43)
 INCLUDE AOS06(IFDOLT44,IFDOLT46,IFDOLTAA,IFDOLTAB,IFDOLTAJ)
 INCLUDE AOS06(IFDMSGAJ,IFDOLT03,IFDMSG03,IFDOLT04,IFDMSG04)
 INCLUDE AOS06(IFDOLT07,IFDMSG07,IFDOLT14,IFDOLT15,IFDOLT17)
 INCLUDE AOS06(IFDOLT34,IFDOLT53,IFDMSG53,IFDOLT54,IFDMSG54)
 INCLUDE AOS06(IFDOLT56,IFDMSG56,IFDOLT31,IFDMSG31,IFDOLT61)
 INCLUDE AOS06(IFDMSG61,IFDOLT32,IFDMSG32,IFDOLT33,IFDMSG33)
 INCLUDE AOS06(IFDOLT38,IFDMSG38,IFDOLT49,IFDOLT50,IFDMSG50)
 INCLUDE AOS06(IFDOLT55,IFDOLT73,IFDMSG73,IFDOLT74)
 INCLUDE AOS06(IFDOLT67)
 ENTRY IFDOLT00
 ALIAS IFDOLT00
 NAME IFDOLT(R)
 INCLUDE AOS06(IFDOLT29)
 NAME IFDOLT29(R)
 INCLUDE AOSC5(IECIOLTS)
 NAME IECIOLTS(R)
 INCLUDE AOS06(IFDOLT98)
 NAME IFDOLT98(R)
 INCLUDE AOS06(IFDOLT99)
 NAME IFDOLT99(R)
/*
//SG34 EXEC LINKS,
// PARM='NCAL,LIST,XREF',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS12 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS12
//SYSLIN DD *
 INCLUDE AOS12(HMDPRCTL,HMDPRCOM,HMDPRRDC)
 INCLUDE AOS12(HMDPRPMG,HMDPRSEG,HMDPRUIM)
 ENTRY HMDPRDMP
 ALIAS IMDPRDMP
 NAME HMDPRDMP(R)
 INCLUDE AOS12(HMDPRSCN,HMDPRSN2,HMDPRSN3,HMDPRSMG,HMDPREID)
 ENTRY HMDPRSCN
 NAME HMDPRSCN(R)
 INCLUDE AOS12(HMDSYS01,HMDSY101)
 ENTRY HMDSYS01
 NAME HMDSYS01(R)
 INCLUDE AOS12(HMDPRFRM,HMDPRFMG,HMDPRGET,HMDPRFLT)
 INCLUDE AOS12(HMDPREXT,HMDPRAPP,HMDPRREC)
 ENTRY HMDPRFRM
 NAME HMDPRXED(R)
 INCLUDE AOS12(HMDSALDR,HMDSAMSG)
 ENTRY HMDSALDR
 NAME HMDSALDR(R)
 INCLUDE AOS12(IMCOSMCI,IMCVSMCI,IMCJQAPP)
 ENTRY IMCOSMCI
 NAME IMCOSJQD(R)
/*
//SG35 EXEC LINKS,
// PARM='NCAL,LIST,XREF',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS11 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS11
//SYSLIN DD *
 INCLUDE AOS11(HHLGTF01,HHLGTF02,HHLGTF03)
 ENTRY HHLGTF01
 ALIAS IHLGTF
 NAME HHLGTF(R)
 INCLUDE AOS11(HHLGTF11,HHLGTF12,HHLGTF13)
 ENTRY HHLGTF11
 NAME HHLGTF1(R)
 INCLUDE AOS11(HHLSCAN1,HHLSCMSG)
 ENTRY HHLSCAN1
 NAME HHLSCAN(R)
 INCLUDE AOS11(HHLINT21,HHLINT22)
 ENTRY HHLINT21
 NAME HHLINT2(R)
 INCLUDE AOS11(HHLINT31,HHLINT32)
 ENTRY HHLINT31
 NAME HHLINT3(R)
 INCLUDE AOS11(HHLINT41,HHLINT43)
 ENTRY HHLINT41
 NAME HHLINT4(R)
 INCLUDE AOS11(HHLTERM,HHLRMMSG)
 ENTRY HHLTERM
 NAME HHLTERM(R)
 INCLUDE AOS11(HHLROUT,HHLSERV)
 ENTRY HHLROUT
 NAME HHLROUT(R)
 INCLUDE AOS11(HHLRMON,HHLRMSTA,HHLRCOV,HHLRMMSG)
 ENTRY HHLRMON
 NAME HHLRMON(R)
 INCLUDE AOS11(HHLTAIR1,HHLTAIR2)
 ENTRY HHLTAIR1
 NAME HHLTAIR(R)
 INCLUDE AOS11(HHLTCTL1,HHLTCTL2)
 ENTRY HHLTCTL1
 NAME HHLTCTL(R)
 INCLUDE AOS11(HHLTMG1,HHLTCIR,HHLTMG2)
 ENTRY HHLTMG1
 NAME HHLTMG1(R)
 INCLUDE AOS11(HHLTSV1,HHLTSV2)
 ENTRY HHLTSV1
 NAME HHLTSVC(R)
/*
//SG36 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS12  DD  DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS12  SERVICE AIDS
//SYSLIN DD *
 INCLUDE  AOS12(HMBLKCTL,HMBLKOBJ,HMBLKLDM,HMBLKXRF,HMBLKIDR)
 INCLUDE  AOS12(HMBLKMSG,HMBLKERR,HMBLKSZE,HMBLKLPA)
 ENTRY  HMBLKCTL
 ALIAS  IMBLIST
 NAME  HMBLIST(R)
/*
//SG37 EXEC LINKS,
// PARM='NCAL,LIST,XREF,SIZE=(512K,100K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//*******************************
//*                             *
//* SMP 1.4 SYSGEN MACRO        *
//*                             *
//*******************************
//AOS12    DD DSNAME=SYS1.AOS12,
//         VOLUME=(,RETAIN),DISP=SHR
//SYSLIN DD *
 ORDER HMASMDRV           SMP DRIVER FUNCTION
 ORDER HMASMDSU,HMASMDC2
 ORDER HMASMDS1,HMASMBDL
 ORDER HMASMDR1,HMASMDR2
 ORDER HMASMIO              SMP IO RTNS
 ORDER HMASMION,HMASMIO1
 ORDER HMASMEIS,HMASMRDS
 ORDER HMASMALC
 ORDER HMASMSTA           SMP STAE RTNS
 ORDER HMASMSER
 ORDER HMASMEFR           X37 RECOVERY @IR09104
 ORDER HMASMREC           SMP RECEIVE RTNS
 ORDER HMASMRCC,HMASMRCD
 ORDER HMASMRCF,HMASMRCL
 ORDER HMASMTBL           SMP ICT BUILD RTNS
 ORDER HMASMTAD,HMASMTAI
 ORDER HMASMTBM,HMASMTCL
 ORDER HMASMTSB,HMASMTEC
 ORDER HMASMTDD
 ORDER HMASMTPD               ICT PTF BUILD
 ORDER HMASMTPA,HMASMTPR
 ORDER HMASMTPC,HMASMTPL
 ORDER HMASMTP2,HMASMTPS
 ORDER HMASMTD1,HMASMTPO
 ORDER HMASMTCR,HMASMTR1
 ORDER HMASMTMJ               INLINE JCLIN
 ORDER HMASMTMD               ICT MOD BUILD
 ORDER HMASMTMS,HMASMTRM
 ORDER HMASMTM1,HMASMTM2
 ORDER HMASMTM3,HMASMTM4
 ORDER HMASMTMW,HMASMTID
 ORDER HMASMTL1               ICT LMOD BUILD
 ORDER HMASMTL2,HMASMTL3
 ORDER HMASMAAR           SMP APP/ACC/RES RTN
 ORDER HMASMDLE               DELETE RTN
 ORDER HMASMCOM,HMASMCPI      COPY INTF
 ORDER HMASMUPI               UPDATE INTF
 ORDER HMASMCMP,HMASMASI      ASSEM INTF
 ORDER HMASMCIL,HMASMLKI      COPY/LINK INTF
 ORDER HMASMPIN           X37 RECOVERY @IR09104
 ORDER HMASMULI           X37 RECOVERY @IR09104
 ORDER HMASMZAP               ZAP INTF
 ORDER HMASMCPL               COMPLETION RTNS
 ORDER HMASMCP2,HMASMPGC
 ORDER HMASMIDU,HMASMSUP
 ORDER HMASMSEC,HMASMCRW
 ORDER HMASMREJ           SMP REJECT RTNS
 ORDER HMASMRJD
 ORDER HMASMUPD           SMP JCLIN RTNS
 ORDER HMASMASM,HMASMCPY
 ORDER HMASMLKD
 ORDER HMASMBUE,HMASMBUR
 ORDER HMASMUCD           SMP UCLIN RTNS
 ORDER HMASMUC1,HMASMULK        @IR08637
 ORDER HMASMUC2                 @IR08637
 ORDER HMASMUC3,HMASMUC4
 ORDER HMASMLID           SMP LIST RTNS
 ORDER HMASMLCD,HMASMLCP
 ORDER HMASMLCC,HMASMLOG
 ORDER HMASMLC1
 ORDER HMASMFPT,HMASMFVL
 ORDER HMASMXRF,HMASMFXF
 ORDER HMASMADD                 @IR08637
 ORDER HMASMARL           SMP REPORT RTNS
 ORDER HMASMAR1,HMASMAR2
 ORDER HMASMAR3,HMASMAR4
 ORDER HMASMMPD           SMP SYSMOD PARSE
 ORDER HMASMMPE,HMASMMPH
 ORDER HMASMMPI,HMASMMPV
 ORDER HMASMMPL                   @IR18012
 ORDER HMASMMPA,HMASMMDR  R3 COMPAT PTF @IR64329
 ORDER HMASMMSG           SMP MESSAGE RTNS
 ORDER HMASMDC1
 ORDER HMASMSUB           SMP GENERAL RTNS
 ORDER HMASMCRD,HMASMSCN
 ORDER HMASMGTA,HMASMVLU
 ORDER HMASMUXC           SMP USER EXIT INTF
 INCLUDE AOS12(HMASMDRV)           SMP DRIVER FUNCTION
 INCLUDE AOS12(HMASMDSU,HMASMDC2)
 INCLUDE AOS12(HMASMDS1,HMASMBDL)
 INCLUDE AOS12(HMASMDR1,HMASMDR2)
 INCLUDE AOS12(HMASMIO)            SMP IO RTNS
 INCLUDE AOS12(HMASMION,HMASMIO1)
 INCLUDE AOS12(HMASMEIS,HMASMRDS)
 INCLUDE AOS12(HMASMALC)
 INCLUDE AOS12(HMASMSTA)           SMP STAE RTNS
 INCLUDE AOS12(HMASMSER)
 INCLUDE AOS12(HMASMEFR)  X37 RECOVERY     @IR09104
 INCLUDE AOS12(HMASMREC)           SMP RECEIVE RTNS
 INCLUDE AOS12(HMASMRCC,HMASMRCD)
 INCLUDE AOS12(HMASMRCF,HMASMRCL)
 INCLUDE AOS12(HMASMTBL)           SMP ICT BUILD RTNS
 INCLUDE AOS12(HMASMTAD,HMASMTAI)
 INCLUDE AOS12(HMASMTBM,HMASMTCL)
 INCLUDE AOS12(HMASMTSB,HMASMTEC)
 INCLUDE AOS12(HMASMTDD)
 INCLUDE AOS12(HMASMTPD)               ICT PTF BUILD
 INCLUDE AOS12(HMASMTPA,HMASMTPR)
 INCLUDE AOS12(HMASMTPC,HMASMTPL)
 INCLUDE AOS12(HMASMTP2,HMASMTPS)
 INCLUDE AOS12(HMASMTD1,HMASMTPO)
 INCLUDE AOS12(HMASMTCR,HMASMTR1)
 INCLUDE AOS12(HMASMTMJ)               INLINE JCLIN
 INCLUDE AOS12(HMASMTMD)               ICT MOD BUILD
 INCLUDE AOS12(HMASMTMS,HMASMTRM)
 INCLUDE AOS12(HMASMTM1,HMASMTM2)
 INCLUDE AOS12(HMASMTM3,HMASMTM4)
 INCLUDE AOS12(HMASMTMW,HMASMTID)
 INCLUDE AOS12(HMASMTL1)               ICT LMOD BUILD
 INCLUDE AOS12(HMASMTL2,HMASMTL3)
 INCLUDE AOS12(HMASMAAR)           SMP APP/ACC/RES RTN
 INCLUDE AOS12(HMASMDLE)               DELETE RTN
 INCLUDE AOS12(HMASMCOM,HMASMCPI)      COPY INTF
 INCLUDE AOS12(HMASMUPI)               UPDATE INTF
 INCLUDE AOS12(HMASMCMP,HMASMASI)      ASSEM INTF
 INCLUDE AOS12(HMASMCIL,HMASMLKI)      COPY/LINK INTF
 INCLUDE AOS12(HMASMPIN)  X37 RECOVERY     @IR09104
 INCLUDE AOS12(HMASMULI)  X37 RECOVERY     @IR09104
 INCLUDE AOS12(HMASMZAP)               ZAP INTF
 INCLUDE AOS12(HMASMCPL)               COMPLETION RTNS
 INCLUDE AOS12(HMASMCP2,HMASMPGC)
 INCLUDE AOS12(HMASMIDU,HMASMSUP)
 INCLUDE AOS12(HMASMSEC,HMASMCRW)
 INCLUDE AOS12(HMASMREJ)           SMP REJECT RTNS
 INCLUDE AOS12(HMASMRJD)
 INCLUDE AOS12(HMASMUPD)           SMP JCLIN RTNS
 INCLUDE AOS12(HMASMASM,HMASMCPY)
 INCLUDE AOS12(HMASMLKD)
 INCLUDE AOS12(HMASMBUE,HMASMBUR)
 INCLUDE AOS12(HMASMUCD)           SMP UCLIN RTNS
 INCLUDE AOS12(HMASMUC1,HMASMULK)        @IR08637
 INCLUDE AOS12(HMASMUC2)                 @IR08637
 INCLUDE AOS12(HMASMUC3,HMASMUC4)
 INCLUDE AOS12(HMASMLID)           SMP LIST RTNS
 INCLUDE AOS12(HMASMLCD,HMASMLCP)
 INCLUDE AOS12(HMASMLCC,HMASMLOG)
 INCLUDE AOS12(HMASMLC1)
 INCLUDE AOS12(HMASMFPT,HMASMFVL)
 INCLUDE AOS12(HMASMXRF,HMASMFXF)
 INCLUDE AOS12(HMASMADD)                 @IR08637
 INCLUDE AOS12(HMASMARL)           SMP REPORT RTNS
 INCLUDE AOS12(HMASMAR1,HMASMAR2)
 INCLUDE AOS12(HMASMAR3,HMASMAR4)
 INCLUDE AOS12(HMASMMPD)           SMP SYSMOD PARSE
 INCLUDE AOS12(HMASMMPE,HMASMMPH)
 INCLUDE AOS12(HMASMMPI,HMASMMPV)
 INCLUDE AOS12(HMASMMPL)                   @IR18012
 INCLUDE AOS12(HMASMMPA,HMASMMDR) R3COMP PTF @IR64329
 INCLUDE AOS12(HMASMMSG)           SMP MESSAGE RTNS
 INCLUDE AOS12(HMASMDC1)
 INCLUDE AOS12(HMASMSUB)           SMP GENERAL RTNS
 INCLUDE AOS12(HMASMCRD,HMASMSCN)
 INCLUDE AOS12(HMASMGTA,HMASMVLU)
 INCLUDE AOS12(HMASMUXC)           SMP USER EXIT INTF
 ENTRY HMASMDRV
 SETCODE AC(1)
 NAME HMASMP(R)
 INCLUDE AOS12(HMASMUXD)          SMP DUMMY USER EXIT
 ENTRY HMASMUXD
 NAME HMASMUXD(R)
/*
//SG38 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,ALIGN2,SIZE=(192K,64K)',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOSB0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB0
//AOS00 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOS00
//AOSB3 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSB3
//SYSLIN DD *
 ORDER IEFOSC02(P)
 ORDER IEFOSC01(P)
 ORDER IEFOSC05
 ORDER IEFJPRMS
 ORDER IEFOSC06(P)
 ORDER IEFOSC03(P)
 ORDER IEFOSC04
 ORDER IEFTRT
 ORDER IEFOSC09(P)
 ORDER IEFOSC07
 ORDER IEFOSC08
 ORDER IEFVMA(P)
 ORDER IEEFSTAR(P)
 ORDER IEFJPDFP
 ORDER IEE0503D(P)
 ORDER IEFVME(P)
 ORDER IEFVMD(P)
 ORDER IEFSMEND
 ORDER IEFMSGJP(P)
 ORDER IEFJLRBM
 ORDER IEFVMB
 ORDER IEFVMC
 ORDER IEFVMG
 ORDER IEFSMPUT
 ORDER IEFSMIFC
 ORDER IEFJESCT
 ORDER IEFWAMGR
 ORDER IEFBMPUT
 ORDER IEFSMGET(P)
 ORDER IEFWAALC(P)
 ORDER IEFWAA01
 ORDER IEFBMGET
 ORDER IEFSMCLD(P)
 ORDER IEFWAA02
 ORDER IEFJLMRT
 ORDER IEFSMODS(P)
 ORDER IEFSMREP
 ORDER IEFWAA03(P)
 ORDER IEFWAA04
 ORDER IEFUMPRF(P)
 ORDER IEFSMFSO
 ORDER IEFUMJOB
 ORDER IEFUMOUT
 ORDER IEFUMFLG
 ORDER IEFQMJ01(P)
 ORDER IEFJLRES
 ORDER IEFSUNAV
 ORDER IEFJLENQ(P)
 ORDER IEFJLDEQ
 ORDER IEFQMJ02
 ORDER IEFJLSCN(P)
 ORDER IEFJLMSG
 ORDER IEFJDUMP
 ORDER IEFJLECP(P)
 ORDER IEFBMPUR
 ORDER IEFXSYFL
 ORDER IEFQMJ03(P)
 ORDER IEFQMMAC
 ORDER IEFJAGST(P)
 ORDER IEFJASGN
 ORDER IEFQMMSG(P)
 ORDER IEFJQDEL
 ORDER IEFJLUNC(P)
 ORDER IEFQASNM
 ORDER IEFWAD
 ORDER IEFUJP
 ORDER IEFUSO
 ORDER IEFUIV
 ORDER IEFJQRWI
 ORDER IEFJLVER(P)
 ORDER IEFJQRAW
 ORDER IEEVRJCL(P)
 ORDER IEFVMF
 INCLUDE AOSB0(IEFJSREQ)
 INCLUDE AOSB0(IEFOSC01)
 INCLUDE AOSB0(IEFOSC05)
 INCLUDE AOSB0(IEFMSGJP)
 INCLUDE AOSB0(IEFOSC04)
 INCLUDE AOSB0(IEFVMB)
 INCLUDE AOSB0(IEFVMC)
 INCLUDE AOSB0(IEFOSC06)
 INCLUDE AOSB0(IEFOSC02)
 INCLUDE AOSB0(IEFOSC09)
 INCLUDE AOSB0(IEFOSC03)
 INCLUDE AOSB0(IEFOSC07)
 INCLUDE AOSB0(IEFOSC08)
 INCLUDE AOSB0(IEFVMA)
 INCLUDE AOSB0(IEFVME)
 INCLUDE AOSB0(IEFVMD)
 INCLUDE AOSB0(IEFVMG)
 INCLUDE AOS00(IEFUIV)
 INCLUDE AOSB0(IEFJLECP)
 INCLUDE AOSB0(IEFJLMSG)
 INCLUDE AOSB0(IEFJLRBM)
 INCLUDE AOSB0(IEFJLUNC)
 INCLUDE AOSB0(IEFUMPRF)
 INCLUDE AOSB0(IEFSMREP)
 INCLUDE AOSB0(IEFSMFSO)
 INCLUDE AOS00(IEFUSO)
 INCLUDE AOS00(IEFUJP)
 INCLUDE AOS00(IEFWAD)
 INCLUDE AOSB0(IEFQMMSG)
 INCLUDE AOSB0(IEFQMJ03)
 INCLUDE AOSB0(IEFQMJ02)
 INCLUDE AOSB0(IEFWAA04)
 INCLUDE AOSB0(IEFWAA03)
 INCLUDE AOSB0(IEFBMPUR)
 INCLUDE AOSB0(IEFWAA01)
 INCLUDE AOSB0(IEFJLENQ)
 INCLUDE AOSB0(IEFSUNAV)
 INCLUDE AOSB0(IEFJLDEQ)
 INCLUDE AOSB0(IEFJQDEL)
 INCLUDE AOSB0(IEFJASGN)
 INCLUDE AOSB0(IEFJLRES)
 INCLUDE AOSB0(IEFJAGST)
 INCLUDE AOSB0(IEFBMPUT)
 INCLUDE AOSB0(IEFBMGET)
 INCLUDE AOSB0(IEFWAALC)
 INCLUDE AOSB0(IEFWAA02)
 INCLUDE AOSB0(IEFQMMAC)
 INCLUDE AOSB0(IEFSMCLD)
 INCLUDE AOSB0(IEFSMODS)
 INCLUDE AOSB0(IEFSMEND)
 INCLUDE AOSB0(IEFJLSCN)
 INCLUDE AOSB0(IEFJQRAW)
 INCLUDE AOSB0(IEFJQRWI)
 INCLUDE AOSB0(IEFJLMRT)
 INCLUDE AOSB0(IEFQMJ01)
 INCLUDE AOSB0(IEFWAMGR)
 INCLUDE AOSB0(IEFSMGET)
 INCLUDE AOSB0(IEFSMIFC)
 INCLUDE SYSPUNCH(JESCTIEF)
 INCLUDE AOSB0(IEFSMPUT)
 INCLUDE AOSB0(IEFJDUMP)
 INCLUDE AOSB0(IEFJLVER)
 INCLUDE AOSB3(IEFXSYFL)
 INCLUDE AOSB0(IEFTRT)
 INCLUDE AOSB3(IEE0503D)
 INCLUDE AOSB3(IEEVRJCL)
 INCLUDE AOSB3(IEFVMF)
 ENTRY IEFJESCT
 NAME IEFJES(R)
 INCLUDE AOSB0(IEFWAMIN)
 INCLUDE AOSB0(IEFWAMAP)
 INCLUDE AOSB0(IEFJLMIN)
 INCLUDE SYSPUNCH(IEFQMSGV)
 INCLUDE AOSB0(IEFWAFMT)
 INCLUDE AOSB0(IEFWAMSG)
 ENTRY  IEFWAMIN
 NAME  IEFWAMIN(R)
 INCLUDE AOSB0(IEFWAFMT)
 INCLUDE AOSB0(IEFWAEXD)
 INCLUDE AOSB0(IEFWAMSG)
 ENTRY IEFWAEXD
 NAME IEFWAEXD(R)
/*
//SG39 EXEC LINKS,
// PARM='NCAL,LIST,XREF,REUS,AC=1',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS29 DD DSN=SYS1.AOS29,DISP=OLD
//SYSLIN DD *
 INCLUDE AOS29(BNGLOGR1)
 ENTRY BNGLOGER
 NAME BNGLOGER(R)
/*
//SG40 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,AC=1',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS29 DD DSN=SYS1.AOS29,DISP=OLD
//SYSLIN DD *
 INCLUDE AOS29(BNGTDISP)
 ENTRY BNGTDISP
 NAME BNGTDISP(R)
 INCLUDE AOS29(BNGT3270)
 ENTRY BNGT3270
 NAME BNGT3270(R)
 INCLUDE AOS29(BNGTLOCL)
 ENTRY BNGTLOCL
 NAME BNGTLOCL(R)
 INCLUDE AOS29(BNGTRMOT)
 ENTRY BNGTRMOT
 NAME BNGTRMOT(R)
 INCLUDE AOS29(BNGTMENU)
 ENTRY BNGTMENU
 NAME BNGTMENU(R)
 INCLUDE AOS29(BNGTQEMF)
 ENTRY BNGTQEMF
 NAME BNGTQEMF(R)
/*
//SG41 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,AC=1',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=TELCMLIB,P1=' ',
//    MOD=,P2=' ',OBJ=OBJPDS1,CLASS=A
//AOS29 DD DSN=SYS1.AOS29,DISP=OLD
//SYSLIN DD *
 INCLUDE AOS29(BNGTQEMA)
 ENTRY BNGTQEMA
 NAME BNGTQEMA(R)
/*
//SG42 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT,REFR,SCTR',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=ICKDSF,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(ICKEX01,ICKIO01,ICKSA01,ICKSA02)
 INCLUDE AOSU0(ICKSA03,ICKSA08,ICKSA10,ICKDV01)
 INCLUDE AOSU0(ICKDV02,ICKDV03,ICKDV04,ICKTP01)
 ENTRY ICKSA01
 NAME ICKDSF(R)
/*
//SG43 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT,REFR,SCTR',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=LINKLIB,P1='(',
//    MOD=ICKEX02,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(ICKEX02)
 NAME ICKEX02(R)
 INCLUDE AOSU0(ICKEX03)
 NAME ICKEX03(R)
 INCLUDE AOSU0(ICKIO02)
 NAME ICKIO02(R)
 INCLUDE AOSU0(ICKSA05)
 NAME ICKSA05(R)
 INCLUDE AOSU0(ICKRI01,ICKRI02,ICKRI03)
 ENTRY ICKRI01
 NAME ICKRI01(R)
 INCLUDE AOSU0(ICKRIKT)
 NAME ICKRIKT(R)
 INCLUDE AOSU0(ICKRILT)
 NAME ICKRILT(R)
 INCLUDE AOSU0(ICKTP04)
 NAME ICKTP04(R)
 INCLUDE AOSU0(ICKTP05)
 NAME ICKTP05(R)
 INCLUDE AOSU0(ICKTSEX0)
 NAME ICKTSEX0(R)
 INCLUDE AOSU0(ICKTSTP0)
 NAME ICKTSTP0(R)
 INCLUDE AOSU0(ICKTSTP1)
 NAME ICKTSTP1(R)
 INCLUDE AOSU0(ICKTSSA0)
 NAME ICKTSSA0(R)
 INCLUDE AOSU0(ICKTSIO0)
 NAME ICKTSIO0(R)
 INCLUDE AOSU0(ICKTSRI0)
 NAME ICKTSRI0(R)
 INCLUDE AOSU0(ICKTSUV0)
 NAME ICKTSUV0(R)
 INCLUDE AOSU0(ICKTSCC0)
 NAME ICKTSCC0(R)
 INCLUDE AOSU0(ICKTSEF0)
 NAME ICKTSEF0(R)
 INCLUDE AOSU0(ICKTSDV0)
 NAME ICKTSDV0(R)
 INCLUDE AOSU0(ICKCDIN)
 NAME ICKCDIN(R)
 INCLUDE AOSU0(ICKCDRF)
 NAME ICKCDRF(R)
 INCLUDE AOSU0(ICKCDIT)
 NAME ICKCDIT(R)
 INCLUDE AOSU0(ICKIN01,ICKRF01,ICKIT01,ICKTA01)
 INCLUDE AOSU0(ICKAA01,ICKRA01,ICKRP01,ICKRT01)
 INCLUDE AOSU0(ICKVA01,ICKRL01,ICKWL01,ICKVV01)
 INCLUDE AOSU0(ICKCV01,ICKCL01,ICKWV01,ICKRD01)
 INCLUDE AOSU0(ICKWI01,ICKVP01,ICKVD01,ICKBM01)
 INCLUDE AOSU0(ICKPP01)
 ALIAS ICKIN01,ICKRF01,ICKIT01
 NAME ICKDAS1(R)
 INCLUDE AOSU0(ICKVLBL)
 NAME ICKVLBL(R)
/*
//SG44 EXEC LINKS,
// PARM='NCAL,LIST,XREF,LET,RENT,REFR,SCTR',
//    UNIT='3350',SER=FGEN67,N=SYS1,NAME=SVCLIB,P1='(',
//    MOD=IGG019P2,P2=')',OBJ=OBJPDS1,CLASS=A
//AOSU0 DD DISP=SHR,VOLUME=(,RETAIN),DSNAME=SYS1.AOSU0
//SYSLIN DD *
 INCLUDE AOSU0(IGG019P2)
 NAME IGG019P2(R)
/*
//G09GEN13 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC PGM=IEHIOSUP
//STEPLIB DD DSN=SYS1.LINKLIB,DISP=SHR,
//   VOL=SER=FGEN67,UNIT=3350
//SYSPRINT DD SPACE=(121,(500,40),RLSE),
//   DCB=(RECFM=FB,LRECL=121,BLKSIZE=121),SYSOUT=A
//SYSUT1 DD DSN=SYS1.SVCLIB,DISP=(OLD,PASS),
//     VOL=(,RETAIN,SER=FGEN67),UNIT=3350
/*
//G09GEN14 JOB 1,'SYSTEM GENERATION',CLASS=A,MSGCLASS=A,TYPRUN=HOLD
//SG1 EXEC PGM=IEHLIST
//SYSPRINT DD SPACE=(121,(1500,300),RLSE),
//   DCB=(RECFM=FB,LRECL=121,BLKSIZE=121),SYSOUT=A
//LINK DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.LINKLIB,DISP=OLD
//NUC DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.NUCLEUS,DISP=OLD
//PARM DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.PARMLIB,DISP=OLD
//IMG DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.IMAGELIB,DISP=OLD
//TEL DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.TELCMLIB,DISP=OLD
//PROC DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.PROCLIB,DISP=OLD
//MAC DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.MACLIB,DISP=OLD
//VTAM DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.VTAMLIB,DISP=OLD
//RMT DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.RMTMAC,DISP=OLD
//SAMP DD VOL=(,RETAIN,SER=FGEN67),UNIT=3350,
//       DSN=SYS1.SAMPLIB,DISP=OLD
//SYSIN DD *
 LISTCTLG VOL=3350=FGEN67
 LISTVTOC DUMP,VOL=3350=FGEN67
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.LINKLIB
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.SVCLIB
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.PARMLIB
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.IMAGELIB
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.TELCMLIB
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.VTAMLIB
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.RMTMAC
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.PROCLIB
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.MACLIB
 LISTPDS VOL=3350=FGEN67,DSNAME=SYS1.SAMPLIB
/*
 
 
 
