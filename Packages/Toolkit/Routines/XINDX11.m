XINDX11 ;ISC/GRK - Create phantom routines for functions, options, etc. ;07/08/98  15:06
 ;;7.3;TOOLKIT;**20,27,121,132**;Apr 25, 1995;Build 13
 ; Per VHA Directive 2004-038, this routine should not be modified.
 G:INP(10)=9.7 RTN
 W !,"The option and function files are being processed.",!
 G:INP(10)=9.4 PKG
 N KRN,TYPE ;Build file
 S INDFN="^DD(""FUNC"",",INDRN="|func",INDD="Function",INDSB="FUNC",INDXN="Build file" D HDR
 F KRN=0:0 S KRN=$O(^XPD(9.6,INDDA,"KRN",.5,"NM",KRN)) Q:KRN'>0  S INDXN=$P(^(KRN,0),U) D ENTRY
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN) ;patch 121
 S INDFN="^DIC(19,",INDRN="|opt",INDD="Option",INDSB="OPT",INDXN="Build file" D HDR
 F KRN=0:0 S KRN=$O(^XPD(9.6,INDDA,"KRN",19,"NM",KRN)) Q:KRN'>0  S INDXN=$P(^(KRN,0),U) D ENTRY
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN)
 ; CJE Add more build components that can have MUMPS Code
 S INDFN="^DIC(19.1,",INDRN="|key",INDD="Security Key",INDSB="KEY",INDXN="Build file" D HDR
 ; TODO: Check this as i don't think it is correct, it is based on assumptions
 F KRN=0:0 S KRN=$O(^XPD(9.6,INDDA,"KRN",19.1,"NM",KRN)) Q:KRN'>0  S INDXN=$P(^(KRN,0),U) D ENTRY
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN)
RTN ;Routines
 ;F KRN=0:0 S KRN=$O(^XPD(9.6,INDDA,"KRN",9.8,"NM",KRN)) Q:KRN'>0  S X=^(KRN,0) I '$P(X,U,3) S ^UTILITY($J,$P(X,U))=""
 I $T(RTN^XTRUTL1)]"" D RTN^XTRUTL1(INDDA,INP(10))
 Q
PKG D NAMSP ;Package file
 S INDFN="^DD(""FUNC"",",INDRN="|func",INDD="Function",INDSB="FUNC" D NAME
 S INDFN="^DIC(19,",INDRN="|opt",INDD="Option",INDSB="OPT" D NAME
 ; CJE Add more build components that chan have MUMPS Code
 S INDFN="^DIBT(",INDRN="|sort",INDD="Sort Template",INDSB="SORT" D NAME
 S INDFN="^DIST(.403,",INDRN="|form",INDD="Form",INDSB="FORM" D NAME
 S INDFN="^DI(.84,",INDRN="|dialog",INDD="Dialog",INDSB="DIALOG" D NAME
 S INDFN="^DIC(9.2,",INDRN="|help",INDD="Help Frame",INDSB="HELP" D NAME
 S INDFN="^DIC(19.1,",INDRN="|key",INDD="Security Key",INDSB="KEY" D NAME
 S INDFN="^SD(409.61,",INDRN="|list",INDD="List Template",INDSB="LIST" D NAME
 Q
NAME Q:'$D(@(INDFN_"""B"")"))
 D HDR
 S INDL=$E(INDXN,1,$L(INDXN)-1)_$C($A(INDXN,$L(INDXN))-1)_"z"
 F A=0:0 S INDL=$O(@(INDFN_"""B"",INDL)")) Q:$P(INDL,INDXN,1)]""!(INDL="")  F B=0:0 S B=$O(@(INDFN_"""B"",INDL,B)")) Q:B=""  X INDF D:C8 @INDSB
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN) Q
 S ^UTILITY($J,1,INDRN,0,0)=INDLC
 Q
NAMSP S INDXN=$P(^DIC(9.4,DA,0),"^",2),C9=0,INDXN(C9)="," F A=0:0 S A=$O(^DIC(9.4,DA,"EX",A)) Q:A'>0  I $D(^(A,0))#2 S C9=C9+1,INDXN(C9)=$P(^(0),"^")
 S INDF="S C8=1 F H=1:1:C9 I $P(INDL,INDXN(H))="""" S C8=0 Q" ; Checks excluded namespaces
 Q
HDR S INDLC=0,INDC=INDRN_" ; '"_INDXN_"' "_INDD_"s.",INDX=";" D ADD S ^UTILITY($J,INDRN)="",^UTILITY($J,1,INDRN,0,0)=0
 Q
ENTRY F B=0:0 S B=$O(@(INDFN_"""B"",INDXN,B)")) Q:B=""  D @INDSB
 ;I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN) Q ;patch 121 moved to top of routine
 S ^UTILITY($J,1,INDRN,0,0)=INDLC
 Q
FUNC ;Process Function file entry
 Q:'($D(^DD("FUNC",B,0))#2)  S INDC=B_" ; "_$P(^(0),"^",1)_" - "_$S($D(^(9))#2:$E(^(9),1,190),1:""),INDX=$S($D(^(1))#2:^(1),1:";") D ADD
 Q
OPT ;Process option file entry for MUMPS code
 Q:'$D(^DIC(19,B,0))  S T=$P(^(0),"^",4),INDC=B_" ; "_$P(^(0),"^",1)_" - "_$P(^(0),"^",2)_" ("_$P($P($P(^DD(19,4,0),"^",3),T_":",2),";",1)_")"_$S($P(^DIC(19,B,0),"^",6)]"":" - Locked by "_$P(^(0),"^",6),1:""),INDX="" D ADD
 S INDN="15,20,26,"_$S(T="E":"34,35,54",T="I":"34,35",T="P":"69,69.1,69.2,69.3,71,72,73",T="R":25,1:"") D OPTC:INDN
 W !,"Processing Options",!
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "INDN: ",$G(INDN),!
 W "T: ",$G(T),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 Q
OPTC F J=1:1 S H=$P(INDN,",",J) Q:H=""  I $D(^DIC(19,B,H))#2 D
 . S %=^(H),INDX=$S(H'=25:%,1:"D "_$E("^",%'["^")_$P(%,"[")),INDC=" ; "_$P(^DD(19,H,0),"^",1) D ADD
 Q
ADD ;Put code in UTILITY for processing
 S INDLC=INDLC+1,^UTILITY($J,1,INDRN,0,INDLC,0)=INDC I INDX]"" S INDLC=INDLC+1,^UTILITY($J,1,INDRN,0,INDLC,0)=" "_INDX
 Q
 ; CJE Add more build components that can have MUMPS Code
 ;
 ; Variables passed through the stack:
 ; B = {IEN}
 ; INDLC = {counter}
 ; INDRN = {faux routine prefix}
 ; INDC = {IEN} ; {NAME} - {DISPLAY NAME}
 ; INDX = {code to be XINDEXED}
 ; INDL = {NAME field (.01) of IEN}
 ;
 ; FAUX Routine Structure
 ; ^UTILITY($J,1,INDRN,0,INDLC,0)={Field Name (INDC)}
 ; ^UTILITY($J,1,INDRN,0,INDLC+1,0)={MUMPS Code (INDX)}
 ;
SORT ;Process Sort Templates
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; .401      1815   ROUTINE INVOKED                  ^DIBT(D0,ROU)
 ; .401      1816   PREVIOUS ROUTINE INVOKED         ^DIBT(D0,ROUOLD)
 ; .4014     10     GET CODE                         ^DIBT(D0,2,D1,GET)                   Part of Sort Field Data Subfile
 ; .4014     11     QUERY CONDITION                  ^DIBT(D0,2,D1,QCON)                  Part of Sort Field Data Subfile
 ; .4014     16     COMPUTED FIELD CODE              ^DIBT(D0,2,D1,CM)                    Part of Sort Field Data Subfile
 ; .4014     20     SUBHEADER OUTPUT                 ^DIBT(D0,2,D1,OUT)                   Part of Sort Field Data Subfile
 ; .401418   5      RELATIONAL CODE                  ^DIBT(D0,2,D1,2,D2,RCOD)             Part of Relational Jump Field Data Subfile
 ; .401419   2      OVERFLOW CODE                    ^DIBT(D0,2,D1,3,D2,OVF0)             Part of Overflow Data Subfile
 ; .4011624  4      DISPAR(0,n,OUT)                  ^DIBT(D0,BY0D,D1,2)                  Part of Sort Range Data For BY(0)
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing Sort Templates",!
 S INDX=$P($G(^DIBT(B,"ROU")),U,1)
 S INDX=INDX_" "_$P($G(^DIBT(B,"ROUOLD")),U,1)
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 Q
FORM ;Process Forms
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; .403      11     PRE ACTION                       ^DIST(.403,D0,11)
 ; .403      12     POST ACTION                      ^DIST(.403,D0,12)
 ; .403      14     POST SAVE                        ^DIST(.403,D0,14)
 ; .403      20     DATA VALIDATION                  ^DIST(.403,D0,20)
 ; .4031     11     PRE ACTION                       ^DIST(.403,D0,40,D1,11)
 ; .4031     12     POST ACTION                      ^DIST(.403,D0,40,D1,12)
 ; .4032     11     PRE ACTION                       ^DIST(.403,D0,40,D1,40,D2,11)
 ; .4032     12     POST ACTION                      ^DIST(.403,D0,40,D1,40,D2,12)
 ; .4032     98     COMPUTED MULTIPLE                ^DIST(.403,D0,40,D1,40,D2,COMP MUL)
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing Forms",!
 S INDX=$P($G(^DIST(.403,B,11)),U,1)
 S INDX=INDX_" "_$P($G(^DIST(.403,B,12)),U,1)
 S INDX=INDX_" "_$P($G(^DIST(.403,B,14)),U,1)
 S INDX=INDX_" "_$P($G(^DIST(.403,B,20)),U,1)
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 Q
DIALOG ;Process Dialogs
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; .84       6      POST MESSAGE ACTION              ^DI(.84,D0,6)
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing Dialogs",!
 S INDX=$S($L($P($G(^DI(.84,B,6)),U,1)):$P($G(^DI(.84,B,6)),U,1),1:";")
 S INDC=B_" ; "_INDL_" - POST MESSAGE ACTION (#6)"
 D ADD
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 Q
HELP ;Process Help Frames
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; 9.2       10.1   ENTRY EXECUTE STATEMENT          ^DIC(9.2,D0,10.1)
 ; 9.2       10.2   EXIT EXECUTE STATEMENT           ^DIC(9.2,D0,10.2)
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing Help Frames",!
 S INDX=$S($L($P($G(^DIC(9.2,B,10.1)),U,1)):$P($G(^DIC(9.2,B,10.1)),U,1),1:";")
 S INDC=B_" ; "_INDL_" - ENTRY EXECUTE STATEMENT (#10.1)"
 D ADD
 W "FIELD 10.1",!
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 S INDX=$S($L($P($G(^DIC(9.2,B,10.2)),U,1)):$P($G(^DIC(9.2,B,10.2)),U,1),1:";")
 S INDC=" ; "_INDL_" - EXIT EXECUTE STATEMENT (#10.2)"
 D ADD
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 Q
KEY ;Process Security Keys
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; 19.1      4      GRANTING CONDITION               ^DIC(19.1,D0,4)
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing Security Keys",!
 S INDX=$S($L($P($G(^DIC(19.1,B,4)),U,1)):$P($G(^DIC(19.1,B,4)),U,1),1:";")
 S INDC=B_" ; "_INDL_" - GRANTING CONDITION (#4)"
 D ADD
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 Q
LIST ;Process List Templates
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; 409.61    100    HEADER CODE                      ^SD(409.61,D0,HDR)
 ; 409.61    102    EXPAND CODE                      ^SD(409.61,D0,EXP)
 ; 409.61    103    HELP CODE                        ^SD(409.61,D0,HLP)
 ; 409.61    105    EXIT CODE                        ^SD(409.61,D0,FNL)
 ; 409.61    106    ENTRY CODE                       ^SD(409.61,D0,INIT)
 ; 409.61    107    ARRAY NAME                       ^SD(409.61,D0,ARRAY)                 Holds a variable name prefaced by a space
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing List Templates",!
 S INDX=$S($L($G(^SD(409.61,B,"HDR"))):$G(^SD(409.61,B,"HDR")),1:";")
 S INDC=B_" ; "_INDL_" - HEADER CODE (#100)"
 D ADD
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 S INDX=$S($L($G(^SD(409.61,B,"EXP"))):$G(^SD(409.61,B,"EXP")),1:";")
 S INDC=" ; "_INDL_" - EXPAND CODE (#102)"
 D ADD
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 S INDX=$S($L($G(^SD(409.61,B,"HLP"))):$G(^SD(409.61,B,"HLP")),1:";")
 S INDC=" ; "_INDL_" - HELP CODE (#103)"
 D ADD
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 S INDX=$S($L($G(^SD(409.61,B,"FNL"))):$G(^SD(409.61,B,"FNL")),1:";")
 S INDC=" ; "_INDL_" - EXIT CODE (#105)"
 D ADD
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 S INDX=$S($L($G(^SD(409.61,B,"INIT"))):$G(^SD(409.61,B,"INIT")),1:";")
 S INDC=" ; "_INDL_" - ENTRY CODE (#106)"
 D ADD
 W "B: ",$G(B),!
 W "INDLC: ",$G(INDLC),!
 W "INDRN: ",$G(INDRN),!
 W "INDC: ",$G(INDC),!
 W "INDX: ",$G(INDX),!
 W "INDL: ",$G(INDL),!
 W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 ; S INDX=INDX_" "_$P($G(^SD(409.61,B,"ARRAY")),U,1)
 ; W "B: ",$G(B),!
 ; W "INDLC: ",$G(INDLC),!
 ; W "INDRN: ",$G(INDRN),!
 ; W "INDC: ",$G(INDC),!
 ; W "INDX: ",$G(INDX),!
 ; W "INDL: ",$G(INDL),!
 ; W "FAUX Routine1: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC-1,0)
 ; W "FAUX Routine: ",! ZWRITE ^UTILITY($J,1,INDRN,0,INDLC,0)
 Q
