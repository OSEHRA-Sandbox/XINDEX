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
 S INDFN="^ORD(101,",INDRN="|ptcl",INDD="Protocol",INDSB="PROTOCOL" D NAME
 S INDFN="^HL(771,",INDRN="|hlap",INDD="HL7 Application Parameter",INDSB="HL7AP" D NAME
 S INDFN="^XWB(8994,",INDRN="|rpc",INDD="Remote Procedure",INDSB="RPC" D NAME
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
NS ;Index based on a list of namespaces
 Q:'$D(@(INDFN_"""B"")"))  ; Don't run if there isn't a B cross reference
 D HDR ; Add Header in the style of |{component} ; '{Namespace}' {Filename as defined above}s. With a comment line below.
 N EXCLUDE,ISNOTEXCLUDED,PROCESSEDIENS
 F  S INDXN=$O(NAMESPACES($J,INDXN)) Q:INDXN=""  D
 . S INDL=$E(INDXN,1,$L(INDXN)-1)_$C($A(INDXN,$L(INDXN))-1)_"z" ; get the last letter of the prefix(INDXN) and get the previous letter (B=A), then append "z" to the end
 . F A=0:0 S INDL=$O(@(INDFN_"""B"",INDL)")) Q:$P(INDL,INDXN,1)]""!(INDL="")  D  ; Order through the B index of the given file. If it nolonger matches the prefix or we hit the end of the B index quit
 . . F B=0:0 S B=$O(@(INDFN_"""B"",INDL,B)")) Q:B=""  D  ; For each IEN in the B index
  . . . I $D(PROCESSEDIENS(B)) Q
 . . . S PROCESSEDIENS(B)=""
 . . . S ISNOTEXCLUDED=1 S EXCLUDE="" F  S EXCLUDE=$O(ENAMESPACES($J,EXCLUDE)) Q:EXCLUDE=""  I $P(INDL,$E(EXCLUDE,2,$L(EXCLUDE)))="" S ISNOTEXCLUDED=0 Q
 . . . D:ISNOTEXCLUDED @INDSB ; cross reference it
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN) Q  ; If there is only a header delete the faux routine
 S ^UTILITY($J,1,INDRN,0,0)=INDLC ; set the number of lines in the routine where the output will find it
 Q
NAME ; Index based on package file
 Q:'$D(@(INDFN_"""B"")"))  ; Don't run if there isn't a B cross reference
 D HDR ; Add Header in the style of |{component} ; '{Namespace}' {Filename as defined above}s. With a comment line below.
 S INDL=$E(INDXN,1,$L(INDXN)-1)_$C($A(INDXN,$L(INDXN))-1)_"z" ; get the last letter of the prefix and get the previous letter (B=A), then append "z" to the end
 F A=0:0 S INDL=$O(@(INDFN_"""B"",INDL)")) Q:$P(INDL,INDXN,1)]""!(INDL="")  D  ; Order through the B index of the given file. If it nolonger matches the prefix or we hit the end of the B index quit
 . F B=0:0 S B=$O(@(INDFN_"""B"",INDL,B)")) Q:B=""  D  ; For each IEN in the B index
 . . X INDF ; Make sure it isn't an excluded namespace
 . . D:C8 @INDSB ; If it isn't an excluded namesapce cross reference it
 I INDLC=2 K ^UTILITY($J,INDRN),^UTILITY($J,1,INDRN) Q  ; If there is only a header delete the faux routine
 S ^UTILITY($J,1,INDRN,0,0)=INDLC ; set the number of lines in the routine where the output will find it
 Q
NAMSP ; Setup processing for Indexing based on package file
 S INDXN=$P(^DIC(9.4,DA,0),"^",2) ; PREFIX (#1) from Package File
 S C9=0 ; Subscript for INDXN
 S INDXN(C9)="," ; 0th subscript is always ","
 F A=0:0 S A=$O(^DIC(9.4,DA,"EX",A)) Q:A'>0  D  ; For each excluded name space in the package file
 . I $D(^(A,0))#2 D  ; If there is an excluded namespace value
 . . S C9=C9+1 ; increment the counter
 . . S INDXN(C9)=$P(^(0),"^") ; set INDXN(COUNTER)=excluded namespace
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
 W !,"Processing Dialogs",!
 S INDX=$S($L($P($G(^DI(.84,B,6)),U,1)):$P($G(^DI(.84,B,6)),U,1),1:";")
 S INDC=B_" ; "_INDL_" - POST MESSAGE ACTION (#6)"
 D ADD
 Q
HELP ;Process Help Frames
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
 W !,"Processing Security Keys",!
 S INDX=$S($L($P($G(^DIC(19.1,B,4)),U,1)):$P($G(^DIC(19.1,B,4)),U,1),1:";")
 S INDC=B_" ; "_INDL_" - GRANTING CONDITION (#4)"
 D ADD
 Q
LIST ;Process List Templates
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
 W !,"Processing Remote Procedures",!
 S INDX=$S($L($P($G(^XWB(8994,B,0)),U,2))&($L($P($G(^XWB(8994,B,0)),U,3))):"D "_$P($G(^XWB(8994,B,0)),U,2)_"^"_$P($G(^XWB(8994,B,0)),U,3),1:";")
 S INDC=B_" ; "_INDL_" - TAG ROUTINE (#.02 & .03)"
 D ADD
 Q
