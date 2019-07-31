.. title: XT*7.3*10003

============
XT*7.3*10003
============

This document describes the changes in XT*7.3*10003 and contains instructions
for testing the patch. See the README.rst at the top of the repository for all
other information.

----------
Interfaces
----------
We don't change any existing internal or external interfaces to XINDEX in this
build. This is a purely bug fix/incomplete features remediation build.

-------
Changes
-------

* [1] XINDEX routine name printer when collecting routines still assumed that
  routines were 8 characters or less long. Now they are assumed to be 16 or
  less (DJW).
* [2] XINDX10 check for contents for data in M fields previously only identified
  M fields as those with K in the field specifier. Now the input transform is
  checked as well; and the field is considered an M field if the input
  transform contains a call to ^DIM (DJW).
* [3] XINDX9 always uppercased labels in remote routines. Non-VistA routines
  could have lowercase labels, so this falsely resulted in XINDEX claiming
  that the labels didn't exist when the lowercase labels actually existed.
  This is now fixed (SMH).

--------------------
Testing Instructions
--------------------

[1] When printing the list of routines selected by XINDEX, you will see that
they are more spaced apart now to allow for routines up to 16 characters long.
Example below for selecting VA* routines. Before (from FOIA VistA)::

  |                  V. A.  C R O S S  R E F E R E N C E R  7.3
  |                      [2008 VA Standards & Conventions]
  |                  UCI: VAH CPU: ROU    Jul 31, 2019@15:48:55
  Routines: 395  Faux Routines: 0
  
  VACPT     VADATE    VADPT     VADPT0    VADPT1    VADPT2    VADPT3    VADPT30   
  VADPT31   VADPT32   VADPT4    VADPT5    VADPT6    VADPT60   VADPT61   VADPT62   


After::

  |                  V. A.  C R O S S  R E F E R E N C E R  7.3
  |                    [5/5/2016 VA Standards & Conventions]
  |                  UCI: VAH CPU: ROU    Jul 31, 2019@15:46:18
  Routines: 395  Faux Routines: 0

  VACPT           VADATE          VADPT           VADPT0          VADPT1          
  VADPT2          VADPT3          VADPT30         VADPT31         VADPT32         

[2] It's rare to have fields that contain M but are not marked as M fields.
A `loop through the data dictionary <./M-fields-not-marked-with-K.txt>`_ reveals
that there are 22 fields that have this issue. 8 of these are in file .7; and
4 are in 124.25. Doing XINDEX against file .7 in the XT*7.3*10001 version vs
the 10003 version will show a different output due to the fields being missed
in 10001. Printing the warnings only will show this difference. 10001::

  |dd.7        * *  151 Lines,  5243 Bytes, Checksum:
           S Y=$ZB
     23DATA8+1    S - Non-standard $Z special variable used.
           S Y=$A($ZB)
     23DATA17+1   S - Non-standard $Z special variable used.
           S Y=$A($ZB),Y=$S(Y<32:Y,Y=127:Y,1:0)
     23DATA18+1   S - Non-standard $Z special variable used.
           S Y=$A($ZB)
     23DATA19+1   S - Non-standard $Z special variable used.
     2622DATA18+1 F - Reference to routine '^%RSET'. That isn't in this UCI.

10003::

  |dd.7        * *  241 Lines,  9305 Bytes, Checksum: 
           B X
     1DATA8+1     S - Break command used.
           B X
     1DATA9+1     S - Break command used.
           U @("$I:"_$P("NO",1,'X)_"CENABLE")
     1DATA16+1    F - Unmatched Quotation Marks.
     1DATA16+1    F - Unmatched Parenthesis.
           U @("$I:"_$P("NO",1,'X)_"CENABLE")
     1DATA17+1    F - Unmatched Quotation Marks.
     1DATA17+1    F - Unmatched Parenthesis.
           B X
     1DATA18+1    S - Break command used.
           U @("$I:"_$P("NO",1,'X)_"CENABLE")
     1DATA19+1    F - Unmatched Quotation Marks.
     1DATA19+1    F - Unmatched Parenthesis.
           D:$P($ZVER,"/",2)<4 ^%VARLOG X:$P($ZVER,"/",2)'<4 ^DD("$O")
     8DATA9+1     S - Non-standard $Z special variable used.
     8DATA9+1     S - Non-standard $Z special variable used.
           S Y=$ZB
     23DATA8+1    S - Non-standard $Z special variable used.
           S Y=$A($ZB)
     23DATA17+1   S - Non-standard $Z special variable used.
           S Y=$A($ZB),Y=$S(Y<32:Y,Y=127:Y,1:0)
     23DATA18+1   S - Non-standard $Z special variable used.
           S Y=$A($ZB)
     23DATA19+1   S - Non-standard $Z special variable used.
           I $D(^ (X))
     1820DATA8+1  F - UNDEFINED COMMAND (rest of line not checked).
     1820DATA8+1  F - Unmatched Parenthesis.
           I $ZRSTATUS(X)'=""
     1820DATA9+1  S - Non-standard $Z function used.
     1820DATA9+1  F - Undefined Function.
           ZR  X "S %Y=0 F  S %Y=$O(^UTILITY($J,0,%Y)) Q:%Y=""""  Q:'$D(^(%Y))  ZI
             ^(%Y)" ZS @X
     2619DATA8+1  F - Non-standard (Undefined) 'Z' command.
     2619DATA8+1  F - Non-standard (Undefined) 'Z' command.
           S %X="" X "S %Y=0 F  S %Y=$O(^UTILITY($J,0,%Y)) Q:%Y=""""  Q:'$D(^(%Y))
              S %X=%X_$C(10)_^(%Y)" ZS @X:$E(%X,2,999999)
     2619DATA9+1  F - Non-standard (Undefined) 'Z' command.
           ZR  X "S %Y=0 F  S %Y=$O(^UTILITY($J,0,%Y)) Q:%Y=""""  Q:'$D(^(%Y))  ZI
             ^(%Y)" ZS @X
     2619DATA16+1 F - Non-standard (Undefined) 'Z' command.
     2619DATA16+1 F - Non-standard (Undefined) 'Z' command.
           N %,%I,%F,%S S %I=$I,%F=$P($ZRO,",")_X_".m" O %F:(NEWVERSION) U %F X "S
             %S=0 F  S %S=$O(^UTILITY($J,0,%S)) Q:%S=""""  Q:'$D(^(%S))  S %=^UTIL
            ITY($J,0,%S) I $E(%)'="";"" W %,!" C %F U %I
     2619DATA17+1 S - Non-standard $Z special variable used.
     2619DATA17+1 S - 'OPEN' command should be invoked through ^%ZIS.
     2619DATA17+1 S - 'Close' command should be invoked through 'D ^%ZISC'.
           ZR  X "S %Y=0 F  S %Y=$O(^UTILITY($J,0,%Y)) Q:%Y=""""  Q:'$D(^(%Y))  ZI
             ^(%Y)" ZS @X
     2619DATA18+1 F - Non-standard (Undefined) 'Z' command.
     2619DATA18+1 F - Non-standard (Undefined) 'Z' command.
           N %,%I,%F,%S S %I=$I,%F=$P($P($P($ZRO,")"),"(",2)," ")_"/"_X_".m" O %F:
            (NEWVERSION) U %F X "S %S=0 F  S %S=$O(^UTILITY($J,0,%S)) Q:%S=""""  Q
            :'$D(^(%S))  S %=^UTILITY($J,0,%S) I $E(%)'="";"" W %,!" C %F U %I ZLI
            NK X
     2619DATA19+1 S - Non-standard $Z special variable used.
     2619DATA19+1 S - 'OPEN' command should be invoked through ^%ZIS.
     2619DATA19+1 S - 'Close' command should be invoked through 'D ^%ZISC'.
     2619DATA19+1 F - Non-standard (Undefined) 'Z' command.
           O @("DIO:"_DLP) F %=0:0 U DIO R % Q:$ZA=X&($ZB>Y)!($ZA>X)  U IO W:$A(%)
            '=12 ! W %
     190416DATA8+1S - 'OPEN' command should be invoked through ^%ZIS.
     190416DATA8+1S - Read command doesn't have a timeout.
     190416DATA8+1S - Non-standard $Z special variable used.
     190416DATA8+1S - Non-standard $Z special variable used.
     190416DATA8+1S - Non-standard $Z special variable used.
           O @("DIO:"_"(""R"":"_$P(DLP,":",2,9)) F %=0:0 U DIO R % Q:$ZIOS=3  U IO
             W:$A(%)'=12 ! W %
     190416DATA9+1S - 'OPEN' command should be invoked through ^%ZIS.
     190416DATA9+1S - Read command doesn't have a timeout.
     190416DATA9+1S - Non-standard $Z special variable used.
           O DIO U DIO:DISCONNECT F %=0:0 U DIO R % Q:%="#$#"  U IO W:$A(%)'=12 ! 
            W %
     190416DATA16+1
                  S - 'OPEN' command should be invoked through ^%ZIS.
     190416DATA16+1
                  S - Read command doesn't have a timeout.
           O DIO F  U DIO R % Q:%="#$#"  U IO W:$A(%)'=12 ! W %
     190416DATA17+1
                  S - 'OPEN' command should be invoked through ^%ZIS.
     190416DATA17+1
                  S - Read command doesn't have a timeout.
           C DIO O DIO F %=0:0 U DIO R % Q:%="#$#"  U IO W %
     190416DATA18+1
                  S - 'Close' command should be invoked through 'D ^%ZISC'.
     190416DATA18+1
                  S - 'OPEN' command should be invoked through ^%ZIS.
     190416DATA18+1
                  S - Read command doesn't have a timeout.
           O DIO F  U DIO R % Q:%="#$#"  U IO W:$A(%)'=12 ! W %
     190416DATA19+1
                  S - 'OPEN' command should be invoked through ^%ZIS.
     190416DATA19+1
                  S - Read command doesn't have a timeout.
           S X=$ZA,Y=$ZB
     190416.1DATA8+1
                  S - Non-standard $Z special variable used.
     190416.1DATA8+1
                  S - Non-standard $Z special variable used.
           W !,"#$#",! C IO
     190416.1DATA16+1
                  S - 'Close' command should be invoked through 'D ^%ZISC'.
           W !,"#$#",! C IO
     190416.1DATA17+1
                  S - 'Close' command should be invoked through 'D ^%ZISC'.
           W !,"#$#",! C IO
     190416.1DATA18+1
                  S - 'Close' command should be invoked through 'D ^%ZISC'.
           W !,"#$#",! C IO
     190416.1DATA19+1
                  S - 'Close' command should be invoked through 'D ^%ZISC'.
     2622DATA18+1 F - Reference to routine '^%RSET'. That isn't in this UCI.
     8DATA9+1     F - Reference to routine '^%VARLOG'. That isn't in this UCI.

[3] To demonstrate this issue, download
https://github.com/OSEHRA/VistA-FHIR-Data-Loader/releases/download/0.2/mash-graph-1p0.rsa
and import into your M environment using the Routine Input utility. On Cache,
you will need to run the extra step of mapping %wd* to the VistA namespace in
the manager portal. Run XINDEX on the routine %wd, and look at the warnings.
10001. Notice the MISSING LABEL warnings. These are incorrect and should be
gone after patch 10003.

::

  %wd        * *  95 Lines,  2590 Bytes, Checksum: B4105995
  %wd          ;ven/gpl - mash graph utilities ; 9/24/17 4:33pm
     %wd          S - Violates VA programming standards.
  file2ary(ary,dir,file) --

     file2ary     W - Null line (no commands or comment).
     %wd          S - Violates VA programming standards.
     addgraph     S - Violates VA programming standards.
     ary2file     S - Violates VA programming standards.
     beautify     S - Violates VA programming standards.
     csv2graph    S - Violates VA programming standards.
     delim        S - Violates VA programming standards.
     file2ary     S - Violates VA programming standards.
     fromCache    S - Violates VA programming standards.
     getThis      S - Violates VA programming standards.
     insert2graph S - Violates VA programming standards.
     nameThis     S - Violates VA programming standards.
     prune        S - Violates VA programming standards.
     purgegraph   S - Violates VA programming standards.
     queryContext S - Violates VA programming standards.
     queryTag     S - Violates VA programming standards.
     rootOf       S - Violates VA programming standards.
     setroot      S - Violates VA programming standards.
     toCache      S - Violates VA programming standards.
     wellformed   S - Violates VA programming standards.
                  F - Call to this MISSING LABEL $$DELIM^%wdcsv
                  F - Call to this MISSING LABEL $$PRUNE^%wdcsv
                  F - Call to this MISSING LABEL $$WELLFORMED^%wdcsv
                  F - Call to this MISSING LABEL $$NAMETHIS^%wdgraph
                  F - Call to this MISSING LABEL $$QUERYCONTEXT^%wdgraph
                  F - Call to this MISSING LABEL $$ROOTOF^%wdgraph
                  F - Call to this MISSING LABEL $$SETROOT^%wdgraph

10003::

  %wd        * *  95 Lines,  2590 Bytes, Checksum: B4105995
  %wd          ;ven/gpl - mash graph utilities ; 9/24/17 4:33pm
     %wd          S - Violates VA programming standards.
  file2ary(ary,dir,file) --

     file2ary     W - Null line (no commands or comment).
     %wd          S - Violates VA programming standards.
     addgraph     S - Violates VA programming standards.
     ary2file     S - Violates VA programming standards.
     beautify     S - Violates VA programming standards.
     csv2graph    S - Violates VA programming standards.
     delim        S - Violates VA programming standards.
     file2ary     S - Violates VA programming standards.
     fromCache    S - Violates VA programming standards.
     getThis      S - Violates VA programming standards.
     insert2graph S - Violates VA programming standards.
     nameThis     S - Violates VA programming standards.
     prune        S - Violates VA programming standards.
     purgegraph   S - Violates VA programming standards.
     queryContext S - Violates VA programming standards.
     queryTag     S - Violates VA programming standards.
     rootOf       S - Violates VA programming standards.
     setroot      S - Violates VA programming standards.
     toCache      S - Violates VA programming standards.
     wellformed   S - Violates VA programming standards.
