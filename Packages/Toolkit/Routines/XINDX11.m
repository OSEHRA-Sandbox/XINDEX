XINDX11 ;ISC/GRK - Create phantom routines for functions, options, etc. ;07/08/98  15:06
 ;;7.3;TOOLKIT;**20,27,121,132**;Apr 25, 1995;Build 13
 ; Per VHA Directive 2004-038, this routine should not be modified.
 G:INP(10)=9.7 RTN
 W !,"The option and function files are being processed.",!
 G:INP(10)=9.4 PKG
 G:INP(10)="NAMESPACE" LNS
 N KRN,TYPE ;Build file
 S INDFN="^DD(""FUNC"",",INDRN="|func",INDD="Function",INDSB="FUNC",INDXN="Build file" D HDR
 F KRN=0:0 S KRN=$O(^XPD(9.6,INDDA,"KRN",.5,"NM",KRN)) Q:KRN'>0  S INDXN=$P(^(KRN,0),U) D ENTRY
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN) ;patch 121
 S INDFN="^DIC(19,",INDRN="|opt",INDD="Option",INDSB="OPT",INDXN="Build file" D HDR
 F KRN=0:0 S KRN=$O(^XPD(9.6,INDDA,"KRN",19,"NM",KRN)) Q:KRN'>0  S INDXN=$P(^(KRN,0),U) D ENTRY
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
LNS S INDXN="NAMESPACE" ; Defined list of namespaces
 S INDFN="^DD(""FUNC"",",INDRN="|func",INDD="Function",INDSB="FUNC" D NS
 S INDFN="^DIC(19,",INDRN="|opt",INDD="Option",INDSB="OPT" D NS
 S INDFN="^DIBT(",INDRN="|sort",INDD="Sort Template",INDSB="SORT" D NS
 S INDFN="^DIST(.403,",INDRN="|form",INDD="Form",INDSB="FORM" D NS
 S INDFN="^DI(.84,",INDRN="|dialog",INDD="Dialog",INDSB="DIALOG" D NS
 S INDFN="^DIC(9.2,",INDRN="|help",INDD="Help Frame",INDSB="HELP" D NS
 S INDFN="^DIC(19.1,",INDRN="|key",INDD="Security Key",INDSB="KEY" D NS
 S INDFN="^SD(409.61,",INDRN="|list",INDD="List Template",INDSB="LIST" D NS
 S INDFN="^ORD(101,",INDRN="|ptcl",INDD="Protocol",INDSB="PROTOCOL" D NS
 S INDFN="^HL(771,",INDRN="|hlap",INDD="HL7 Application Parameter",INDSB="HL7AP" D NS
 S INDFN="^XWB(8994,",INDRN="|rpc",INDD="Remote Procedure",INDSB="RPC" D NS
 K NAMESPACES,ENAMESPACES,FILES
 Q
NS
 Q:'$D(@(INDFN_"""B"")")) ; Don't run if there isn't a B cross reference
 D HDR ; Add Header in the style of |{component} ; '{Namespace}' {Filename as defined above}s. With a comment line below.
 N EXCLUDE,ISNOTEXCLUDED,PROCESSEDIENS
 F  S INDXN=$O(NAMESPACES($J,INDXN)) Q:INDXN=""  D
 . S INDL=$E(INDXN,1,$L(INDXN)-1)_$C($A(INDXN,$L(INDXN))-1)_"z" ; get the last letter of the prefix(INDXN) and get the previous letter (B=A), then append "z" to the end
 . F A=0:0 S INDL=$O(@(INDFN_"""B"",INDL)")) Q:$P(INDL,INDXN,1)]""!(INDL="")  D ; Order through the B index of the given file. If it nolonger matches the prefix or we hit the end of the B index quit
 . . F B=0:0 S B=$O(@(INDFN_"""B"",INDL,B)")) Q:B=""  D ; For each IEN in the B index
  . . . I $D(PROCESSEDIENS(B)) Q
 . . . S PROCESSEDIENS(B)=""
 . . . S ISNOTEXCLUDED=1 S EXCLUDE="" F  S EXCLUDE=$O(ENAMESPACES($J,EXCLUDE)) Q:EXCLUDE=""  I $P(INDL,$E(EXCLUDE,2,$L(EXCLUDE)))="" S ISNOTEXCLUDED=0 Q
 . . . D:ISNOTEXCLUDED @INDSB ; cross reference it
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN) Q ; If there is only a header delete the faux routine
 S ^UTILITY($J,1,INDRN,0,0)=INDLC ; set the number of lines in the routine where the output will find it
 Q
NAME
 Q:'$D(@(INDFN_"""B"")")) ; Don't run if there isn't a B cross reference
 D HDR ; Add Header in the style of |{component} ; '{Namespace}' {Filename as defined above}s. With a comment line below.
 S INDL=$E(INDXN,1,$L(INDXN)-1)_$C($A(INDXN,$L(INDXN))-1)_"z" ; get the last letter of the prefix and get the previous letter (B=A), then append "z" to the end
 F A=0:0 S INDL=$O(@(INDFN_"""B"",INDL)")) Q:$P(INDL,INDXN,1)]""!(INDL="")  D ; Order through the B index of the given file. If it nolonger matches the prefix or we hit the end of the B index quit
 . F B=0:0 S B=$O(@(INDFN_"""B"",INDL,B)")) Q:B=""  D ; For each IEN in the B index
 . . X INDF ; Make sure it isn't an excluded namespace
 . . D:C8 @INDSB ; If it isn't an excluded namesapce cross reference it
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN) Q ; If there is only a header delete the faux routine
 S ^UTILITY($J,1,INDRN,0,0)=INDLC ; set the number of lines in the routine where the output will find it
 Q
NAMSP
 S INDXN=$P(^DIC(9.4,DA,0),"^",2) ; PREFIX (#1) from Package File
 S C9=0 ; Subscript for INDXN
 S INDXN(C9)="," ; 0th subscript is always ","
 F A=0:0 S A=$O(^DIC(9.4,DA,"EX",A)) Q:A'>0  D ; For each excluded name space in the package file
 . I $D(^(A,0))#2 D ; If there is an excluded namespace value
 . . S C9=C9+1 ; increment the counter
 . . S INDXN(C9)=$P(^(0),"^") ; set INDXN(COUNTER)=excluded namespace
 S INDF="S C8=1 F H=1:1:C9 I $P(INDL,INDXN(H))="""" S C8=0 Q" ; Checks excluded namespaces
 ; expanded code for the above:
 ; S C8=1 ; This will skip subscript (0), which is always ","
 ; F  H=1:1:C9 I $P(INDL,INDXN(H))="""" D ; For each subscript in INDXN check to see if the prefix of INDL matches INDXN(H), if so don't process INDL
 ; . S C8=0 Q
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
 S INDX=$S($L($P($G(^DIBT(B,"ROU")),U,1)):"D ^"_$P($G(^DIBT(B,"ROU")),U,1),1:";")
 S INDC=B_" ; "_INDL_" - ROUTINE INVOKED (#1815)"
 D ADD
 ;
 S INDX=$S($L($P($G(^DIBT(B,"ROUOLD")),U,1)):"D ^"_$P($G(^DIBT(B,"ROUOLD")),U,1),1:";")
 S INDC=" ; "_INDL_" - PREVIOUS ROUTINE INVOKED (#1816)"
 D ADD
 ;
 N SUB,SUB2
 S (SUB,SUB2)=""
 F  S SUB=$O(^DIBT(B,2,SUB)) Q:SUB=""  Q:SUB'=+SUB  D
 . S INDX=$S($L($P($G(^DIBT(B,2,SUB,"GET")),U,1)):$G(^DIBT(B,2,SUB,"GET")),1:";")
 . S INDC=B_"P"_SUB_" ; "_INDL_" - GET CODE (#10) - "_SUB
 . D ADD
 . ;
 . S INDX=$S($L($P($G(^DIBT(B,2,SUB,"QCON")),U,1)):$G(^DIBT(B,2,SUB,"QCON")),1:";")
 . S INDC=" ; "_INDL_" - QUERY CONDITION (#11) - "_SUB
 . D ADD
 . ;
 . S INDX=$S($L($P($G(^DIBT(B,2,SUB,"CM")),U,1)):$G(^DIBT(B,2,SUB,"CM")),1:";")
 . S INDC=" ; "_INDL_" - COMPUTED FIELD CODE (#16) - "_SUB
 . D ADD
 . ;
 . S INDX=$S($L($P($G(^DIBT(B,2,SUB,"OUT")),U,1)):$G(^DIBT(B,2,SUB,"OUT")),1:";")
 . S INDC=" ; "_INDL_" - SUBHEADER OUTPUT (#20) - "_SUB
 . D ADD
 . ;
 . F  S SUB2=$O(^DIBT(B,2,SUB,2,SUB2)) Q:SUB2=""  Q:SUB2'=+SUB2  D
 . . S INDX=$S($L($P($G(^DIBT(B,2,SUB,2,SUB2,"RCOD")),U,1)):$G(^DIBT(B,2,SUB,2,SUB2,"RCOD")),1:";")
 . . S INDC=B_"RCOD"_SUB_"P"_SUB2_" ; "_INDL_" - RELATIONAL CODE (#5) - "_SUB_" - "_SUB2
 . . D ADD
 . ;
 . S SUB2=""
 . F  S SUB2=$O(^DIBT(B,2,SUB,3,SUB2)) Q:SUB2=""  Q:SUB2'=+SUB2  D
 . . S INDX=$S($L($P($G(^DIBT(B,2,SUB,3,SUB2,"OVF0")),U,1)):$G(^DIBT(B,2,SUB,3,SUB2,"OVF0")),1:";")
 . . S INDC=B_"OVF0"_SUB_"P"_SUB2_" ; "_INDL_" - OVERFLOW CODE (#2) - "_SUB_" - "_SUB2
 . . D ADD
 ;
 S SUB=""
 F  S SUB=$O(^DIBT(B,"BY0D",SUB)) Q:SUB=""  Q:SUB'=+SUB  D
 . S INDX=$S($L($P($G(^DIBT(B,"BY0D",SUB,2)),U,1)):$G(^DIBT(B,"BY0D",SUB,2)),1:";")
 . S INDC=B_"BY0D"_SUB_" ; "_INDL_" - DISPAR (#4) - "_SUB
 . D ADD
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
 S INDX=$S($L($P($G(^DIST(.403,B,11)),U,1)):$P($G(^DIST(.403,B,11)),U,1),1:";")
 S INDC=B_" ; "_INDL_" - PRE ACTION (#11)"
 D ADD
 ;
 S INDX=$S($L($P($G(^DIST(.403,B,12)),U,1)):$P($G(^DIST(.403,B,12)),U,1),1:";")
 S INDC=" ; "_INDL_" - POST ACTION (#12)"
 D ADD
 ;
 S INDX=$S($L($P($G(^DIST(.403,B,14)),U,1)):$P($G(^DIST(.403,B,14)),U,1),1:";")
 S INDC=" ; "_INDL_" - POST SAVE (#14)"
 D ADD
 ;
 S INDX=$S($L($P($G(^DIST(.403,B,20)),U,1)):$P($G(^DIST(.403,B,20)),U,1),1:";")
 S INDC=" ; "_INDL_" - DATA VALIDATION (#20)"
 D ADD
 ;
 N SUB,SUB2
 S (SUB,SUB2)=""
 F  S SUB=$O(^DIST(.403,B,40,SUB)) Q:SUB=""  Q:SUB'=+SUB  D
 . S INDX=$S($L($P($G(^DIST(.403,B,40,SUB,11)),U,1)):$P($G(^DIST(.403,B,40,SUB,11)),U,1),1:";")
 . S INDC=B_"P"_SUB_" ; "_INDL_" - PRE ACTION FILE (#.4031) FIELD (#11) - "_SUB
 . D ADD
 . ;
 . S INDX=$S($L($P($G(^DIST(.403,B,40,SUB,12)),U,1)):$P($G(^DIST(.403,B,40,SUB,12)),U,1),1:";")
 . S INDC=" ; "_INDL_" - POST ACTION FILE (#.4031) FIELD (#12) - "_SUB
 . D ADD
 . ;
 . F  S SUB2=$O(^DIST(.403,B,40,SUB,40,SUB2)) Q:SUB2=""  Q:SUB2'=+SUB2  D
 . . S INDX=$S($L($P($G(^DIST(.403,B,40,SUB,40,SUB2,11)),U,1)):$P($G(^DIST(.403,B,40,SUB,40,SUB2,11)),U,1),1:";")
 . . S INDC=B_"P"_SUB_"P"_SUB2_" ; "_INDL_" - PRE ACTION FILE (#.4032) FIELD (#11) - "_SUB_" - "_SUB2
 . . D ADD
 . . ;
 . . S INDX=$S($L($P($G(^DIST(.403,B,40,SUB,40,SUB2,12)),U,1)):$P($G(^DIST(.403,B,40,SUB,40,SUB2,12)),U,1),1:";")
 . . S INDC=" ; "_INDL_" - POST ACTION FILE (#.4032) FIELD (#12) - "_SUB_" - "_SUB2
 . . D ADD
 . . ;
 . . S INDX=$S($L($P($G(^DIST(.403,B,40,SUB,40,SUB2,"COMP MUL")),U,1)):$P($G(^DIST(.403,B,40,SUB,40,SUB2,"COMP MUL")),U,1),1:";")
 . . S INDC=" ; "_INDL_" - COMPUTED MULTIPLE FILE (#.4032) FIELD (#98) - "_SUB_" - "_SUB2
 . . D ADD
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
 ;
 S INDX=$S($L($P($G(^DIC(9.2,B,10.2)),U,1)):$P($G(^DIC(9.2,B,10.2)),U,1),1:";")
 S INDC=" ; "_INDL_" - EXIT EXECUTE STATEMENT (#10.2)"
 D ADD
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
 ;
 S INDX=$S($L($G(^SD(409.61,B,"EXP"))):$G(^SD(409.61,B,"EXP")),1:";")
 S INDC=" ; "_INDL_" - EXPAND CODE (#102)"
 D ADD
 ;
 S INDX=$S($L($G(^SD(409.61,B,"HLP"))):$G(^SD(409.61,B,"HLP")),1:";")
 S INDC=" ; "_INDL_" - HELP CODE (#103)"
 D ADD
 ;
 S INDX=$S($L($G(^SD(409.61,B,"FNL"))):$G(^SD(409.61,B,"FNL")),1:";")
 S INDC=" ; "_INDL_" - EXIT CODE (#105)"
 D ADD
 ;
 S INDX=$S($L($G(^SD(409.61,B,"INIT"))):$G(^SD(409.61,B,"INIT")),1:";")
 S INDC=" ; "_INDL_" - ENTRY CODE (#106)"
 D ADD
 ;
 S INDX=$S($L($G(^SD(409.61,B,"ARRAY"))):"I $L("_$P($G(^SD(409.61,B,"ARRAY"))," ",2)_") Q",1:";")
 S INDC=" ; "_INDL_" - ARRAY NAME (#107)"
 D ADD
 Q
PROTOCOL ;Process Protocols
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; 101       15     EXIT ACTION                      ^ORD(101,D0,15) E1,245
 ; 101       20     ENTRY ACTION                     ^ORD(101,D0,20) E1,245
 ; 101       24     SCREEN                           ^ORD(101,D0,24) E1,245
 ; 101       26     HEADER                           ^ORD(101,D0,26) E1,245
 ; 101       27     MENU HELP                        ^ORD(101,D0,27) E1,245
 ; 101       100    ORDER PRINT ACTION               ^ORD(101,D0,100) E1,245
 ; 101       100.1  ORDER CANCEL ACTION              ^ORD(101,D0,100.1) E1,245
 ; 101       100.2  ORDER PURGE ACTION               ^ORD(101,D0,100.2) E1,245
 ; 101       771    PROCESSING ROUTINE               ^ORD(101,D0,771) E1,245
 ; 101       772    RESPONSE PROCESSING ROUTINE      ^ORD(101,D0,772) E1,245
 ; 101       774    ROUTING LOGIC                    ^ORD(101,D0,774) E1,245
 ; 101       21     REQUIRED VARIABLES               ^ORD(101,D0,21,D1,0)                 Required Variables sub file
 ; 101.05    .02    METHOD ACTION                    ^ORD(101,D0,101.05,D1,1) E1,245      Method sub file
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing Protocols",!
 S INDX=$S($L($E($G(^ORD(101,B,15)),1,245)):$E($G(^ORD(101,B,15)),1,245),1:";")
 S INDC=B_" ; "_INDL_" - EXIT ACTION (#15)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,20)),1,245)):$E($G(^ORD(101,B,20)),1,245),1:";")
 S INDC=" ; "_INDL_" - ENTRY ACTION (#20)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,24)),1,245)):$E($G(^ORD(101,B,24)),1,245),1:";")
 S INDC=" ; "_INDL_" - SCREEN (#24)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,26)),1,245)):$E($G(^ORD(101,B,26)),1,245),1:";")
 S INDC=" ; "_INDL_" - HEADER (#26)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,27)),1,245)):$E($G(^ORD(101,B,27)),1,245),1:";")
 S INDC=" ; "_INDL_" - MENU HELP (#27)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,100)),1,245)):$E($G(^ORD(101,B,100)),1,245),1:";")
 S INDC=" ; "_INDL_" - ORDER PRINT ACTION (#100)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,100.1)),1,245)):$E($G(^ORD(101,B,100.1)),1,245),1:";")
 S INDC=" ; "_INDL_" - ORDER CANCEL ACTION (#100.1)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,100.2)),1,245)):$E($G(^ORD(101,B,100.2)),1,245),1:";")
 S INDC=" ; "_INDL_" - ORDER PURGE ACTION (#100.2)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,771)),1,245)):$E($G(^ORD(101,B,771)),1,245),1:";")
 S INDC=" ; "_INDL_" - PROCESSING ROUTINE (#771)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,772)),1,245)):$E($G(^ORD(101,B,772)),1,245),1:";")
 S INDC=" ; "_INDL_" - ORDER PURGE ACTION (#772)"
 D ADD
 ;
 S INDX=$S($L($E($G(^ORD(101,B,774)),1,245)):$E($G(^ORD(101,B,774)),1,245),1:";")
 S INDC=" ; "_INDL_" - ROUTING LOGIC (#774)"
 D ADD
 ;
 N SUB
 S SUB=""
 F  S SUB=$O(^ORD(101,B,21,SUB)) Q:SUB=""  Q:SUB'=+SUB  D
 . S INDX=$S($L($E($G(^ORD(101,B,21,SUB,0)),1,17)):"$G("_$E($G(^HL(771,B,"MSG",SUB,"R")),1,17)_")",1:";")
 . I INDX="D Q" S INDX=";"
 . S INDC=B_"R"_SUB_" ; "_INDL_" - REQUIRED VARIABLES SUB FILE (#101.021) REQUIRED VARIABLES (#1) - "_SUB
 . D ADD
 ;
 S SUB=""
 F  S SUB=$O(^ORD(101,B,101.05,SUB)) Q:SUB=""  Q:SUB'=+SUB  D
 . S INDX=$S($L($E($G(^ORD(101,B,101.05,SUB,1)),1,245)):$E($G(^ORD(101,B,101.05,SUB,1)),1,245),1:";")
 . I INDX="D Q" S INDX=";"
 . S INDC=B_"M"_SUB_" ; "_INDL_" - METHOD SUB FILE (#101.05) METHOD ACTION (#.02) - "_SUB
 . D ADD
 ;
 Q
HL7AP ; Process HL7 Application Parameters
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; 771.06    1      PROCESSING ROUTINE               ^HL(771,D0,MSG,D1,R)
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing HL7 Application Parameters",!
 N SUB
 S SUB=""
 F  S SUB=$O(^HL(771,B,"MSG",SUB)) Q:SUB=""  Q:SUB'=+SUB  D
 . S INDX=$S($L($E($G(^HL(771,B,"MSG",SUB,"R")),1,17)):"D "_$E($G(^HL(771,B,"MSG",SUB,"R")),1,17),1:";")
 . I INDX="D Q" S INDX=";"
 . S INDC=B_"P"_SUB_" ; "_INDL_" - HL7 MESSAGE SUB FILE (#771.06) PROCESSING ROUTINE (#1) - "_SUB
 . D ADD
 Q
RPC ; Process Remote Procedures
 ; ========  =====  ===============================  ===================================  =============================================
 ; File      Field  Field Name                       Global Location                      Comments
 ; ========  =====  ===============================  ===================================  =============================================
 ; 8994      .02    TAG                              ^XWB(8994,D0,0) Piece 2              Needs to be concatenated with ROUTINE
 ; 8994      .03    ROUTINE                          ^XWB(8994,D0,0) Piece 3
 ; ========  =====  ===============================  ===================================  =============================================
 W !,"Processing Remote Procedures",!
 S INDX=$S($L($P($G(^XWB(8994,B,0)),U,2))&($L($P($G(^XWB(8994,B,0)),U,3))):"D "_$P($G(^XWB(8994,B,0)),U,2)_"^"_$P($G(^XWB(8994,B,0)),U,3),1:";")
 S INDC=B_" ; "_INDL_" - TAG ROUTINE (#.02 & .03)"
 D ADD
 Q
