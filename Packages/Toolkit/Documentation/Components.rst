Components
==========

KIDS transports various components:

 * FILES (Data Dictionaries)
 * PRINT TEMPLATE
 * SORT TEMPLATE
 * INPUT TEMPLATE
 * FORM
 * FUNCTION
 * DIALOG
 * BULLETIN
 * MAIL GROUP
 * HELP FRAME
 * ROUTINE
 * OPTION
 * SECURITY KEY
 * PROTOCOL
 * LIST TEMPLATE
 * HL7 APPLICATION PARAMETER
 * HL LOWER LEVEL PROTOCOL
 * HL LOGICAL LINK
 * REMOTE PROCEDURE

Components already supported by XINDEX
--------------------------------------

XINDEX already supports various components:

 * FILES (Data Dictionaries) - Implemented in XINDX10
 * ROUTINES
 * OPTION - Implemented in XINDX11
 * FUNCTION - Implemented in XINDX11
 * COMPILED (INPUT & PRINT) TEMPLATES - Implemented in XINDX10

XINDEX supports these non-routine components by creating Faux routines (adding data to ^UTILITY($J,{dd|{IEN},opt|{IEN},func|{IEN}) - dd|, opt|, and func| are treated like routine names, each item in the DD/option/function is treated as a new line in the Faux routine) and using them as input to XINDEX.


Execution flow
--------------

Normal execution is by running D ^XINDEX from the top of the routine, this in-turn GOTOs the top of ^XINDX6, which asks all of the questions. It will initally ask for the list of routines, then ask for a build, install, or package to run against. START^XINDX10 will handle the package or build file components. The top of ^XINDX11 deals with getting all of the extra build components.

COMPILED (INPUT & PRINT) TEMPLATES
----------------------------------

Compiled templates are found using XINDX10 and removed from the selected routine list (REMCOMP). As it appears that XINDEX will always use the code in ^DIE and ^DIPT to be XINDEX'ed instead of the routine file (which makes sense).

Compiled Print templates are indicated by:

	^DIPT(IEN,"ROU")=ROUTINE

Compiled Input templates are indicated by:

	^DIE(IEN,"ROU")=ROUTINE

FILES (Data Dictionaries)
-------------------------

PRINT TEMPLATE
--------------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
.4        1815   ROUTINE INVOKED                  ^DIPT(D0,ROU)
========  =====  ===============================  ===================================  =============================================

SORT TEMPLATE
-------------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
.401      1815   ROUTINE INVOKED                  ^DIBT(D0,ROU)
.401      1816   PREVIOUS ROUTINE INVOKED ROUOLD  ^DIBT(D0,ROUOLD)
.4014     10     GET CODE                         ^DIBT(D0,2,D1,GET)                   Part of Sort Field Data Subfile
.4014     11     QUERY CONDITION                  ^DIBT(D0,2,D1,QCON)                  Part of Sort Field Data Subfile
.4014     16     COMPUTED FIELD CODE              ^DIBT(D0,2,D1,CM)                    Part of Sort Field Data Subfile
.4014     20     SUBHEADER OUTPUT                 ^DIBT(D0,2,D1,OUT)                   Part of Sort Field Data Subfile
.401418   5      RELATIONAL CODE                  ^DIBT(D0,2,D1,2,D2,RCOD)             Part of Relational Jump Field Data Subfile
.401419   2      OVERFLOW CODE                    ^DIBT(D0,2,D1,3,D2,OVF0)             Part of Overflow Data Subfile
.4011624  4      DISPAR(0,n,OUT)                  ^DIBT(D0,BY0D,D1,2)                  Part of Sort Range Data For BY(0)
========  =====  ===============================  ===================================  =============================================

INPUT TEMPLATE
--------------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
.402      1815    ROUTINE INVOKED                 ^DIE(D0,ROU)
.402      1816    PREVIOUS ROUTINE INVOKED        ^DIE(D0,ROUOLD)
========  =====  ===============================  ===================================  =============================================

FORM
----

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
.403      11     PRE ACTION                       ^DIST(.403,D0,11)
.403      12     POST ACTION                      ^DIST(.403,D0,12)
.403      14     POST SAVE                        ^DIST(.403,D0,14)
.403      20     DATA VALIDATION                  ^DIST(.403,D0,20)
.4031     11     PRE ACTION                       ^DIST(.403,D0,40,D1,11)
.4031     12     POST ACTION                      ^DIST(.403,D0,40,D1,12)
.4032     11     PRE ACTION                       ^DIST(.403,D0,40,D1,40,D2,11)
.4032     12     POST ACTION                      ^DIST(.403,D0,40,D1,40,D2,12)
.4032     98     COMPUTED MULTIPLE                ^DIST(.403,D0,40,D1,40,D2,COMP MUL)
========  =====  ===============================  ===================================  =============================================

FUNCTION
--------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
.5        .02    MUMPS CODE                       ^DD("FUNC",D0,1)
========  =====  ===============================  ===================================  =============================================

DIALOG
------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
.84       6      POST MESSAGE ACTION              ^DI(.84,D0,6)
========  =====  ===============================  ===================================  =============================================

BULLETIN
--------

There are no fields that directly take M code that should be Cross-Referenced.

MAIL GROUP
----------

There are no fields that directly take M code that should be Cross-Referenced.

HELP FRAME
----------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
9.2       10.1   ENTRY EXECUTE STATEMENT          ^DIC(9.2,D0,10.1)
9.2       10.2   EXIT EXECUTE STATEMENT           ^DIC(9.2,D0,10.2)
========  =====  ===============================  ===================================  =============================================

ROUTINE
-------

Referenced by Routine name. need to fill in.

OPTION
------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
19        15     EXIT ACTION                      ^DIC(19,D0,15)
19        20     ENTRY ACTION                     ^DIC(19,D0,20)
19        22     XQUIT EXECUTABLE                 ^DIC(19,D0,22)
19        25     ROUTINE                          ^DIC(19,D0,25)
19        26     HEADER                           ^DIC(19,D0,26)
19        34     DIC(S)                           ^DIC(19,D0,34)
19        35     DIC(W)                           ^DIC(19,D0,35)
19        54     *DIE(W)                          ^DIC(19,D0,54)
19        67     DHD                              ^DIC(19,D0,67)
19        69     DIS(0)                           ^DIC(19,D0,69)
19        69.1   DIS(1)                           ^DIC(19,D0,69.1)
19        69.2   DIS(2)                           ^DIC(19,D0,69.2)
19        69.3   DIS(3)                           ^DIC(19,D0,69.3)
19        71     DHIT                             ^DIC(19,D0,71)
19        72     DIOBEG                           ^DIC(19,D0,72)
19        73     DIOEND                           ^DIC(19,D0,73)
19        100    *ORDER PRINT ACTION              ^DIC(19,D0,100)
19        100.1  *ORDER CANCEL ACTION             ^DIC(19,D0,100.1)
19        100.2  *ORDER PURGE ACTION              ^DIC(19,D0,100.2)
19.04     3      SUBHEADER OUTPUT TRANSFORM       ^DIC(19,D0,SUB,D1,1)                 Part of the DISPAR(0,N) Subfile
19.05     2      RULES                            ^DIC(19,D0,RPC,D1,1)                 Part of the RPC Subfile
========  =====  ===============================  ===================================  =============================================

SECURITY KEY
------------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
19.1      4      GRANTING CONDITION               ^DIC(19.1,D0,4)
========  =====  ===============================  ===================================  =============================================

PROTOCOL
--------
TBD

LIST TEMPLATE
-------------

The following fields contain M code within this file:

========  =====  ===============================  ===================================  =============================================
File      Field  Field Name                       Global Location                      Comments
========  =====  ===============================  ===================================  =============================================
409.61    100    HEADER CODE                      ^SD(409.61,D0,HDR)
409.61    102    EXPAND CODE                      ^SD(409.61,D0,EXP)
409.61    103    HELP CODE                        ^SD(409.61,D0,HLP)
409.61    105    EXIT CODE                        ^SD(409.61,D0,FNL)
409.61    106    ENTRY CODE                       ^SD(409.61,D0,INIT)
409.61    107    ARRAY NAME                       ^SD(409.61,D0,ARRAY)                 Holds a variable name prefaced by a space
========  =====  ===============================  ===================================  =============================================

HL7 APPLICATION PARAMETER
-------------------------

There are no fields that directly take M code that should be Cross-Referenced.

HL LOWER LEVEL PROTOCOL
-----------------------

TBD

HL LOGICAL LINK
---------------

There are no fields that directly take M code that should be Cross-Referenced.

REMOTE PROCEDURE
----------------

There are no fields that directly take M code that should be Cross-Referenced.
There is a reference to a TAG (File 8994 Field #.02) and ROUTINE (File 8994 Field #.03).
Since RPCs should be namespaced into the package and the routines in which they run also
namespaced into the package there shouldn't be anything new to be added to XINDEX.


Data Dictionaries
=================

PRINT TEMPLATE
--------------

::

  STANDARD DATA DICTIONARY #.4 -- PRINT TEMPLATE FILE
  STORED IN ^DIPT(

  This file stores the PRINT FIELDS data and other information about print
  templates.  These templates are used in the Print, Filegram, Extract, and
  Export options.


                DD ACCESS: ^
                WR ACCESS: ^
  IDENTIFIED BY:
         "WRIT": I $P(^(0),U,8) N D1 S @("D1=$P($P($C(59)_$S($D(^DD(.4,8,0)):$P(^
                 (0),U,3),1:0)_$E("_DIC_"Y,0),0),$C(59)_$P(^(0),U,8)_"":"",2),$C(
                 59),1)") D EN^DDIOL("**"_D1_"**","","?0")
        "WRITE": N D,D1,D2 S D2=^(0) S:$X>30 D1(1,"F")="!" S D=$P(D2,U,2) S:D D1(
                 2)="("_$$DATE^DIUTL(D)_")",D1(2,"F")="?30" S D=$P(D2,U,5) S:D D1
                 (3)=" User #"_D,D1(3,"F")="?50" S D=$P(D2,U,4) S:D D1(4)=" File
                 #"_D,D1(4,"F")="?59" D EN^DDIOL(.D1)
       "WRITED": I $G(DZ)?1"???".E N % S %=0 F  S %=$O(^DIPT(Y,"%D",%)) Q:%'>0  I
                  $D(^(%,0))#2 D EN^DDIOL(^(0),"","!?5")

  POINTED TO BY: PRINT TEMPLATE field (#3) of the ARCHIVAL ACTIVITY File (#1.11)
                 FILEGRAM field (#.07) of the FILEGRAM HISTORY File (#1.12)


  CROSS
  REFERENCED BY: NAME(B), TEMPLATE TYPE(FG)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  .4,.01        NAME                   0;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)<2!($L(X)>30) X
                HELP-PROMPT:      2-30 CHARACTERS
                CROSS-REFERENCE:  .4^B
                                  1)= S @(DIC_"""B"",X,DA)=""""")
                                  2)= K @(DIC_"""B"",X,DA)")

                CROSS-REFERENCE:  ^^MUMPS
                                  1)= X "S %=$P("_DIC_"DA,0),U,4) S:$L(%) "_DIC_"
                                  ""F""_+%,X,DA)=1"

                                  2)= X "S %=$P("_DIC_"DA,0),U,4) K:$L(%) "_DIC_"
                                  ""F""_+%,X,DA)"

                CROSS-REFERENCE:  ^^MUMPS
                                  1)= Q
                                  2)= S X=-1 X "F  S X=$O("_DIC_"""AF"",X)) Q:X="
                                  """  K:'X ^(X,DA) S Y=0 F  S Y=$O("_DIC_"""AF""
                                  ,X,Y)) Q:Y'>0  K:$D(^(Y,DA)) ^(DA)" S X=-1 S:$G
                                  (Y)="" Y=-1


  .4,2          DATE CREATED           0;2 DATE

                INPUT TRANSFORM:  S %DT="ET" D ^%DT S X=Y K:Y<1 X

  .4,3          READ ACCESS            0;3 FREE TEXT

                INPUT TRANSFORM:  I DUZ(0)'="@" F I=1:1:$L(X) I DUZ(0)'[$E(X,I) K
                                   X Q

  .4,4          FILE                   0;4 POINTER TO FILE FILE (#1)

                                  UNEDITABLE
                CROSS-REFERENCE:  ^^^MUMPS
                                  1)= X "S %=$P("_DIC_"DA,0),U,1),"_DIC_"""F""_+X
                                  ,%,DA)=1"

                                  2)= Q


  .4,5          USER #                 0;5 NUMBER


  .4,6          WRITE ACCESS           0;6 FREE TEXT

                INPUT TRANSFORM:  I DUZ(0)'="@" F I=1:1:$L(X) I DUZ(0)'[$E(X,I) K
                                   X Q

  .4,7          DATE LAST USED         0;7 DATE

                INPUT TRANSFORM:  S %DT="EX" D ^%DT S X=Y K:Y<1 X

  .4,8          TEMPLATE TYPE          0;8 SET

                                  '1' FOR FILEGRAM;
                                  '2' FOR EXTRACT;
                                  '3' FOR EXPORT;
                                  '7' FOR SELECTED EXPORT FIELDS;
                LAST EDITED:      MAY 23, 1996
                HELP-PROMPT:      Enter a 1 if this is a FILEGRAM template, 2 if
                                  this is an EXTRACT template, 3 if an EXPORT
                                  template, 7 if a SELECTED FIELDS template, as
                                  opposed to a normal PRINT template.
                CROSS-REFERENCE:  .4^FG^MUMPS
                                  1)= S %=$S(X=1:"""FG""",1:"") I %]"" S A1=$P(@(
                                  DIC_"DA,0)"),U,1),@(DIC_%_",A1,DA)=""""") K %,A
                                  1

                                  2)= S %=$S(X=1:"""FG""",1:"") I %]"" S A1=$P(@(
                                  DIC_"DA,0)"),U,1) K @(DIC_%_",A1,DA)"),%,A1
                                  Used to do a quick lookup of FILEGRAM type of
                                  print templates.



  .4,10         DESCRIPTION            %D;0   WORD-PROCESSING #.4001


  .4,20         DESTINATION FILE       0;9 POINTER TO FILE FILE (#1)

                INPUT TRANSFORM:  S DIC("S")="I Y>1.99 S DIAC=""RD"" D ^DIAC I %"
                                   D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
                LAST EDITED:      SEP 09, 1995
                DESCRIPTION:      This field holds the number of the file that is
                                  designed to receive data from other files by
                                  using the Extract Tool.

                SCREEN:           S DIC("S")="I Y>1.99 S DIAC=""RD"" D ^DIAC I %"
                EXPLANATION:      Allow files to which user has READ access.

  .4,50         FILEGRAM/EXTR FILE     1;0 Multiple #.41
                                   (Add New Entry without Asking)

                LAST EDITED:      MAY 14, 1992

  .41,.001        ORDER                    NUMBER

                  INPUT TRANSFORM:  K:+X'=X!(X>9999)!(X<1)!(X?.E1"."1N.N) X
                  HELP-PROMPT:      Type a Number between 1 and 9999, 0 Decimal
                                    Digits

  .41,.01         FILEGRAM/EXTR FILE     0;1 NUMBER

                  INPUT TRANSFORM:  K:+X'=X!(X>99999999999)!(X<2)!(X?.E1"."5N.N)
                                    X
                  HELP-PROMPT:      Type a Number between 2 and 99999999999, 4
                                    Decimal Digits
                  CROSS-REFERENCE:  .41^B
                                    1)= S ^DIPT(DA(1),1,"B",$E(X,1,30),DA)=""
                                    2)= K ^DIPT(DA(1),1,"B",$E(X,1,30),DA)


  .41,.02         LEVEL                  0;2 NUMBER (Required)

                  INPUT TRANSFORM:  K:+X'=X!(X>99)!(X<1)!(X?.E1"."1N.N) X
                  HELP-PROMPT:      Type a Number between 1 and 99, 0 Decimal
                                    Digits

  .41,.03         PARENT                 0;3 NUMBER

                  INPUT TRANSFORM:  K:+X'=X!(X>999999999)!(X<2)!(X?.E1"."5N.N) X
                  HELP-PROMPT:      Type a Number between 2 and 999999999, 4
                                    Decimal Digits

  .41,.04         LINK TYPE              0;4 SET

                                    '1' FOR DINUM;
                                    '2' FOR DIRECT POINTER;
                                    '3' FOR MULTIPLE;
                                    '4' FOR BACKPOINTER;

  .41,.05         USER RESPONSE TO GET HERE 0;5 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>30!($L(X)<1) X
                  HELP-PROMPT:      Answer must be 1-30 characters in length.

  .41,.06         DATE LAST STORED       0;6 DATE

                  INPUT TRANSFORM:  S %DT="EX" D ^%DT S X=Y K:Y<1 X

  .41,.07         CROSS-REFERENCE        0;7 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>30!($L(X)<1) X
                  HELP-PROMPT:      Answer must be 1-30 characters in length.
                  DESCRIPTION:      This field holds the X-ref to use in a
                                    backpointer.


  .41,.08         ALL FIELDS IN FILE     0;8 SET

                                    '1' FOR YES;

  .41,10          FIELD NUMBER           F;0 Multiple #.411
                                     (Add New Entry without Asking)


  .411,.001         FIELD ORDER              NUMBER

                    INPUT TRANSFORM:  K:+X'=X!(X>99999999)!(X<1)!(X?.E1"."1N.N) X
                    HELP-PROMPT:      Type a Number between 1 and 99999999, 0
                                      Decimal Digits

  .411,.01          FIELD NUMBER           0;1 NUMBER

                    INPUT TRANSFORM:K:+X'=X!(X>999999999)!(X<.001)!(X?.E1"."5N.N)
                                   X
                    HELP-PROMPT:  Type a Number between .001 and 999999999, 4
                                  Decimal Digits

  .411,1            CAPTION             ;  COMPUTED

                    MUMPS CODE:   S %=+^DIPT(D0,1,D1,0),X=$S('%:"",$D(^DD(%,+^DIP
                                  T(D0,1,D1,"F",D2,0),0)):$P(^(0),U),1:"")
                    ALGORITHM:    S %=+^DIPT(D0,1,D1,0),X=$S('%:"",$D(^DD(%,+^DIP
                                  T(D0,1,D1,"F",D2,0),0)):$P(^(0),U),1:"")

  .411,3            DESTINATION FIELD NUMBER 0;3 NUMBER

                    INPUT TRANSFORM:K:+X'=X!(X>999999999)!(X<.001)!(X?.E1"."5N.N)
                                   X
                    HELP-PROMPT:  Type a Number between .001 and 999999999, 4
                                  Decimal Digits
                    DESCRIPTION:  This field holds the number of the field in the
                                  destination file that will contain the
                                  extracted data from FIELD NUMBER in the source
                                  file.


  .411,4            DESTINATION FIELD LOCATION 0;4 FREE TEXT

                    INPUT TRANSFORM:K:$L(X)>30!($L(X)<3) X
                    HELP-PROMPT:  Answer must be 3-30 characters in length.
                    DESCRIPTION:  This field holds the node and piece location of
                                  the DESTINATION FIELD NUMBER. This is used at
                                  the time extract data is moved to the
                                  destination file.


  .411,5             EXTERNAL FORMAT   0;5 SET

                                  '1' FOR MOVE EXTERNAL FORMAT TO DESTINATION FIL
                                  E;
                    HELP-PROMPT:  Enter 1 if external format of data should be
                                  moved to destination file.
                    DESCRIPTION:  This code is used to determine if the external
                                  form of the data in the source file should be
                                  moved to the destination file.  If null, the
                                  internal format of the data is moved.




  .41,11          DESTINATION FILE     0;9 NUMBER

                    INPUT TRANSFORM:K:+X'=X!(X>999999999)!(X<2)!(X?.E1"."7N.N) X
                    HELP-PROMPT:  Type a Number between 2 and 999999999, 6
                                  Decimal Digits
                    DESCRIPTION:  This field holds the number of the destination
                                  file or the destination subfile.


  .41,12          DESTINATION FILE PARENT 0;10 NUMBER

                    INPUT TRANSFORM:K:+X'=X!(X>999999999)!(X<2)!(X?.E1"."7N.N) X
                    HELP-PROMPT:  Type a Number between 2 and 999999999, 6
                                  Decimal Digits
                    DESCRIPTION:  This field holds the number of the parent file
                                  or subfile of the DESTINATION FILE.


  .41,13          DESTINATION FILE LOCATION 0;11 FREE TEXT

                    INPUT TRANSFORM:K:$L(X)>30!($L(X)<1) X
                    HELP-PROMPT:  Answer must be 1-30 characters in length.
                    DESCRIPTION:  This field holds the node and piece location of
                                  the DESTINATION FILE.




  .4,100        EXPORT FIELD           100;0 Multiple #.42
                                   (Add New Entry without Asking)

                DESCRIPTION:      This multiple holds information about each
                                  field being exported.


  .42,.01         FIELD ORDER            0;1 NUMBER (Required)

                  INPUT TRANSFORM:  K:+X'=X!(X>99)!(X<1)!(X?.E1"."1N.N) X
                  LAST EDITED:      SEP 03, 1992
                  HELP-PROMPT:      Type a Number between 1 and 99, 0 Decimal
                                    Digits
                  DESCRIPTION:      The integer in this field represents the
                                    order in which fields are exported.  The
                                    field order numbers are not always
                                    consecutive, but they do represent the
                                    sequence in which fields are sent.

                  CROSS-REFERENCE:  .42^B
                                    1)= S ^DIPT(DA(1),100,"B",$E(X,1,30),DA)=""
                                    2)= K ^DIPT(DA(1),100,"B",$E(X,1,30),DA)


  .42,1           DATA TYPE              0;2 POINTER TO DATA TYPE FILE (#.81)

                  INPUT TRANSFORM:S DIC("S")="N %IR S %IR=$P($G(^(0)),U,2) I (%IR
                                  =""D"")!(%IR=""N"")!(%IR=""F"")" D ^DIC K DIC S
                                   DIC=DIE,X=+Y K:Y<0 X
                  LAST EDITED:    OCT 13, 1992
                  DESCRIPTION:    The data type of the field as derived by the
                                  export tool or as input by the user is held in
                                  this field.  This data type may not correspond
                                  to the data type found in the data dictionary.

                  SCREEN:         S DIC("S")="N %IR S %IR=$P($G(^(0)),U,2) I (%IR
                                  =""D"")!(%IR=""N"")!(%IR=""F"")"
                  EXPLANATION:    Only data types of free text, date, and numeric
                                   are recognized for exported fields.

  .42,2           LENGTH FOR OUTPUT    0;3 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>10000)!(X<1)!(X?.E1"."1N.N) X
                  LAST EDITED:    SEP 03, 1992
                  HELP-PROMPT:    Type a Number between 1 and 10000, 0 Decimal
                                  Digits
                  DESCRIPTION:    The number of characters allotted to the field
                                  for fixed length export is stored here.


  .42,3           NAME OF FOREIGN FIELD 0;4 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>30!($L(X)<1) X
                  LAST EDITED:    NOV 23, 1992
                  HELP-PROMPT:    Answer must be 1-30 characters in length.
                  DESCRIPTION:    The name of the field as it is known in the
                                  importing application is stored here.  The user
                                  supplies this information.




  .4,105        EXPORT FORMAT          105;1 POINTER TO FOREIGN FORMAT FILE (#.44
                                  )

                LAST EDITED:      SEP 04, 1992
                DESCRIPTION:      This field contains the foreign format used to
                                  make the export template.


  .4,110        EXPORT TEMPLATE CREATED? 105;3 SET

                                  '1' FOR YES;
                                  '0' FOR NO;
                LAST EDITED:      SEP 04, 1992
                DESCRIPTION:      If YES, this Selected Fields for Export
                                  template has been used to create an Export
                                  template.


  .4,115        MULTIPLE PATH          105;4 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30!($L(X)<1) X
                LAST EDITED:      NOV 19, 1992
                HELP-PROMPT:      Answer must be 1-30 characters in length.
                DESCRIPTION:      This field holds a list of field numbers
                                  representing the deepest multiple contained in
                                  this Export template.


  .4,704        HEADER                  ;  COMPUTED

                MUMPS CODE:       S X=$S($D(^DIPT(D0,"H")):^("H"),1:"")

  .4,707        SUB-HEADER SUPPRESSED  SUB;1 SET

                                  '1' FOR YES;

  .4,709.1      LANGUAGE OF HEADING    HLANG;1 POINTER TO LANGUAGE FILE (#.85)

                HELP-PROMPT:      Enter a language from the Language File.
                DESCRIPTION:      The identified language is used when producing
                                  the Heading of prints using this template.


  .4,1620       PRINT FIELDS            ;  COMPUTED MULTIPLE

                MUMPS CODE:       N DIR,DIPT,DRK,D,C,J,L,DHD,DA S DIPT=D0  D GET^
                                  DIPTED("DIR") F D=0:0 S D=$O(DIR(D)) Q:'D  S X=
                                  DIR(D) X DICMX Q:'$D(D)
                ALGORITHM:
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .4,1815       ROUTINE INVOKED        ROU;E1,13 FREE TEXT

                WRITE AUTHORITY:  @
                CROSS-REFERENCE:  ^^^MUMPS
                                  1)= Q
                                  2)= D DELETROU^DIEZ($TR(X,U))


  .4,1816       PREVIOUS ROUTINE INVOKED ROUOLD;E1,13 FREE TEXT

                WRITE AUTHORITY:  @

  .4,1819       COMPILED                ;  COMPUTED

                MUMPS CODE:       S X=$S('$D(^DIPT(D0,"ROU"))#2:"NO",^("ROU")="":
                                  "NO",1:"YES")
                ALGORITHM:        S X=$S('$D(^DIPT(D0,"ROU"))#2:"NO",^("ROU")="":
                                  "NO",1:"YES")

  .4,1819.1     LANGUAGE IN WHICH COMPILED ROULANG;1 POINTER TO LANGUAGE FILE (#.
                                  85)

                HELP-PROMPT:      Enter a language from the Language File.
                DESCRIPTION:      The identified language is used when this Print
                                  Template is compiled.


  .4,21400      BUILD(S)                ;  COMPUTED MULTIPLE POINTER TO BUILD FIL
                                  E (#9.6)

                MUMPS CODE:       N DIPTNAME,D S DIPTNAME=$P($G(^DIPT(D0,0)),U)_"
                                      FILE #"_$P($G(^(0)),U,4) F D=0:0 S D=$O(^XP
                                  D(9.6,D)) Q:'D  I $D(^(D,"KRN",.4,"NM","B",DIPT
                                  NAME)) N D0 S D0=D,X=$P(^XPD(9.6,D,0),U) X DICM
                                  X Q:'$D(D)
                DESCRIPTION:      This computed field searches the Build
                                  File(#9.6) for Builds containing the Print
                                  Template.  A list of the identified Builds is
                                  created for display. Multiple Builds will be
                                  shown if appropriate.


  .4,21409      CANONIC FOR THIS FILE  CANONIC;1 SET

                                  '1' FOR YES;
                INPUT TRANSFORM:  I DA<1 K X
                DESCRIPTION:      The Print Template identified as CANONIC will
                                  always be presented to the user for selection
                                  at the First Print FIELD: prompt.

                EXECUTABLE HELP:  D HELP^DIUCANON
                CROSS-REFERENCE:  ^^^MUMPS
                                  1)= N F S F=$P(@(DIC_"DA,0)"),U,4) I F S @(DIC_
                                  """CANONIC"",F,DA)=""""")

                                  2)= N F S F=$P(@(DIC_"DA,0)"),U,4) I F K @(DIC_
                                  """CANONIC"",F,DA)")
                                  This cross-reference is used to identify files
                                  that have a Canonic Print Template assigned.
                                  The structure of the cross-reference is:
                                       ^DIPT("CANONIC", File#, IEN) where File#
                                  identifies the file which has a Canonic Print
                                  Template and IEN is the internal entry number
                                  of the Canonic Print Template assigned to that
                                  file.




        FILES POINTED TO                      FIELDS

  BUILD (#9.6)                      BUILD(S) (#21400)

  DATA TYPE (#.81)                  EXPORT FIELD:DATA TYPE (#1)

  FILE (#1)                         FILE (#4)
                                    DESTINATION FILE (#20)

  FOREIGN FORMAT (#.44)             EXPORT FORMAT (#105)

  LANGUAGE (#.85)                   LANGUAGE OF HEADING (#709.1)
                                    LANGUAGE IN WHICH COMPILED (#1819.1)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):
  ONCOLOGY PRINT TEMPLATE LIST  MAY 27, 1992@13:00  USER #0
                                                     ONCOLOGY PRINT TEMPLATE LIST
  RT PRINT TEMPLATES            NOV 18, 1986        USER #0
                                                  Record Tracking Print Templates

  SORT TEMPLATE(S):
  ONCOLOGY PRINT TEMPLATE LIST  MAY 29, 1992@10:13  USER #0
                        'ONCOLOGY PRINT TEMPLATE LIST' Print Template always used
  SORT BY: NAME//     From 'ONCO'  To 'ONCOZ^ONCOZ'

  RT PRINT TEMPLATES            NOV 18, 1986        USER #0
  SORT BY: FILE//     From '190'  To '195.99'
    WITHIN FILE, SORT BY: NAME//


  FORM(S)/BLOCK(S):
  DIPTED                        JUN 11, 1998@17:08  USER #0
    DIPTED                        DD #.4
    DIPTED2                       DD #.4

SORT TEMPLATE
-------------

::

  STANDARD DATA DICTIONARY #.401 -- SORT TEMPLATE FILE
  STORED IN ^DIBT(

  This file stores either SORT or SEARCH criteria. For SORT criteria, the SORT
  DATA multiple contains the sort parameters. For SEARCH criteria, the template
  also contains a list of record numbers selected as the result of running the
  search.


                DD ACCESS: ^
                WR ACCESS: ^
  IDENTIFIED BY:
        "WRITE": N D,D1,D2 S D2=^(0) S:$X>30 D1(1,"F")="!" S D=$P(D2,U,2) S:D D1(
                 2)="("_$$DATE^DIUTL(D)_")",D1(2,"F")="?30" S D=$P(D2,U,5) S:D D1
                 (3)=" User #"_D,D1(3,"F")="?50" S D=$P(D2,U,4) S:D D1(4)=" File
                 #"_D,D1(4,"F")="?59" D EN^DDIOL(.D1)
       "WRITE1": N D1 S D1=$S($D(^DIBT(+Y,2))!$D(^("BY0")):"SORT",$D(^("DIS")):"S
                 EARCH",$D(^(1)):"INQ",1:"") D EN^DDIOL(D1,"","?73")
       "WRITED": I $G(DZ)?1"???".E N % S %=0 F  S %=$O(^DIBT(Y,"%D",%)) Q:%'>0  I
                  $D(^(%,0))#2 D EN^DDIOL(^(0),"","!?5")

  POINTED TO BY: SEARCH TEMPLATE field (#2) of the ARCHIVAL ACTIVITY File (#1.11)
                 SORT TEMPLATE NAME field (#7) of the ADT TEMPLATE File (#43.7)
                 SEARCH TEMPLATE field (#.08) of the PTF ARCHIVE/PURGE HISTORY
                     FILE File (#45.62)
                 SEARCH TEMPLATE field (#2) of the LAB ARCHIVAL ACTIVITY File
                     (#95.11)


  CROSS
  REFERENCED BY: NAME(B)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  .401,.01      NAME                   0;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)<2!($L(X)>30) X
                HELP-PROMPT:      2-30 CHARACTERS
                CROSS-REFERENCE:  .401^B
                                  1)= S @(DIC_"""B"",X,DA)=""""")
                                  2)= K @(DIC_"""B"",X,DA)")

                CROSS-REFERENCE:  ^^MUMPS
                                  1)= X "S %=$P("_DIC_"DA,0),U,4) S:$L(%) "_DIC_"
                                  ""F""_+%,X,DA)=1"

                                  2)= X "S %=$P("_DIC_"DA,0),U,4) K:$L(%) "_DIC_"
                                  ""F""_+%,X,DA)"


  .401,2        DATE CREATED           0;2 DATE

                INPUT TRANSFORM:  S %DT="ET" D ^%DT S X=Y K:Y<1 X

  .401,3        READ ACCESS            0;3 FREE TEXT

                INPUT TRANSFORM:  I DUZ(0)'="@" F I=1:1:$L(X) I DUZ(0)'[$E(X,I) K
                                   X Q

  .401,4        FILE                   0;4 POINTER TO FILE FILE (#1)

                                  UNEDITABLE
                CROSS-REFERENCE:  ^^^MUMPS
                                  1)= X "S %=$P("_DIC_"DA,0),U,1),"_DIC_"""F""_+X
                                  ,%,DA)=1"

                                  2)= Q


  .401,5        USER #                 0;5 NUMBER


  .401,6        WRITE ACCESS           0;6 FREE TEXT

                INPUT TRANSFORM:  I DUZ(0)'="@" F I=1:1:$L(X) I DUZ(0)'[$E(X,I) K
                                   X Q

  .401,7        DATE LAST USED         0;7 DATE

                INPUT TRANSFORM:  S %DT="EX" D ^%DT S X=Y K:Y<1 X

  .401,8        TEMPLATE TYPE          0;8 SET

                                  '1' FOR ARCHIVING SEARCH;
                HELP-PROMPT:      Enter a 1 if this is an ARCHIVING SEARCH
                                  template (i.e., used to store lists of records
                                  to be archived) as opposed to a normal SEARCH
                                  or SORT template

  .401,9        SEARCH COMPLETE DATE   QR;1 DATE

                INPUT TRANSFORM:  S %DT="ESTXR" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      NOV 24, 1992
                HELP-PROMPT:      Enter the date/time that this search was run to
                                  completion.
                DESCRIPTION:        This field will be filled in automatically by
                                  the search option, but only if the search runs
                                  to completion.  It will contain the date/time
                                  that the search last ran.  If it was not
                                  allowed to run to completion, this field will
                                  be empty.

                TECHNICAL DESCR:  Filled in automatically by the FileMan search
                                  option.


  .401,10       DESCRIPTION            %D;0   WORD-PROCESSING #.4012


  .401,11       TOTAL RECORDS SELECTED QR;2 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>9999999999)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      NOV 25, 1992
                HELP-PROMPT:      Type a Number between 1 and 9999999999, 0
                                  Decimal Digits
                DESCRIPTION:        This field is filled in automatically by the
                                  FileMan search option.  If the search is
                                  allowed to run to completion, the total number
                                  of records that met the search criteria is
                                  stored in this field.  If the last search was
                                  not allowed to run to completion, this field
                                  will be null.

                TECHNICAL DESCR:  Filled in automatically by the FileMan search
                                  option.


  .401,15       SEARCH SPECIFICATIONS  O;0   WORD-PROCESSING #.4011   (NOWRAP)


  .401,1620     SORT FIELDS             ;  COMPUTED MULTIPLE

                MUMPS CODE:       N DPP D DIBT^DIPT

  .401,1621     SORT FIELD DATA        2;0 Multiple #.4014


  .4014,.01       FILE OR SUBFILE NO.    0;1 NUMBER (Required) (Multiply asked)

                  INPUT TRANSFORM:K:+X'=X!(X>9999999.99999)!(X<0)!(X?.E1"."6N.N)
                                  X
                  LAST EDITED:    JAN 25, 1993
                  HELP-PROMPT:    Type a Number between 0 and 9999999.99999, 5
                                  Decimal Digits.  File or subfile number on
                                  which sort field resides.
                  DESCRIPTION:    This is the number of the file or subfile on
                                  which the sort field resides.  It is created
                                  automatically during the SORT FIELDS dialogue
                                  with the user in the sort/print option.

                  TECHNICAL DESCR:This number is automatically assigned by the
                                  print routine DIP.

                  CROSS-REFERENCE:.4014^B
                                  1)= S ^DIBT(DA(1),2,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIBT(DA(1),2,"B",$E(X,1,30),DA)


  .4014,2         FIELD NO.            0;2 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>9999999.99999)!(X<0)!(X?.E1"."6N.N)
                                  X
                  LAST EDITED:    JAN 25, 1993
                  HELP-PROMPT:    Type a Number between 0 and 9999999.99999, 5
                                  Decimal Digits.  Sort field number, except for
                                  pointers, variable pointers and computed
                                  fields.
                  DESCRIPTION:    On most sort fields, this piece will contain
                                  the field number.  If sorting on a pointer,
                                  variable pointer or computed field, the piece
                                  will be null.  If sorting on the record number
                                  (NUMBER or .001), the piece will contain a 0.

                  TECHNICAL DESCR:Created by FileMan during the print option (in
                                  the DIP* routines).


  .4014,3         FIELD NAME           0;3 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>100!($L(X)<1) X
                  LAST EDITED:    JAN 25, 1993
                  HELP-PROMPT:    Answer must be 1-100 characters in length.
                  DESCRIPTION:    This piece contains the sort field name, or the
                                  user entry if sorting by an on-the-fly computed
                                  field.

                  TECHNICAL DESCR:Created by FileMan during the print option
                                  (DIP* routines).


  .4014,4         SORT QUALIFIERS BEFORE FIELD 0;4 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>20!($L(X)<1) X
                  LAST EDITED:    JAN 25, 1993
                  HELP-PROMPT:    Answer must be 1-20 characters in length.  Sort
                                  qualifiers that normally precede the field
                                  number in the user dialogue (like !,@,#,+)
                  DESCRIPTION:    This contains all of the sort qualifiers that
                                  normally precede the field number in the user
                                  dialogue during the sort option.  It includes
                                  things like # (Page break when sort value
                                  changes), @ (suppress printing of subheader).
                                  These qualifiers are listed out with no
                                  delimiters, as they are found during the user
                                  dialogue.  (So you might see something like
                                  #@).

                  TECHNICAL DESCR:This information is parsed from the user
                                  dialogue or from the BY input variable, by the
                                  FileMan print routines DIP*.


  .4014,4.1       SORT QUALIFIERS AFTER FIELD 0;5 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>70!($L(X)<1) X
                  LAST EDITED:    JAN 25, 1993
                  HELP-PROMPT:    Answer must be 1-70 characters in length.  Sort
                                  qualifiers that normally come after the field
                                  in the user dialogue (such as ;Cn, ;Ln,
                                  ;"Literal Subheader")
                  DESCRIPTION:    This contains all of the sort qualifiers that
                                  normally come after the field number in the
                                  user dialogue for the sort options.  It
                                  includes things like ;Cn (specify position of
                                  subheader) and ;"literal" to replace the
                                  caption of the subheader.  These qualifiers are
                                  listed with no delimiters, as they are found in
                                  the user dialogue.  (So you might see something
                                  like ;C10;"My Subheader").

                  TECHNICAL DESCR:This information is parsed from the user
                                  dialogue or from the BY input variable, by the
                                  FileMan print routines DIP*.


  .4014,4.2       COMPUTED FIELD TYPE  0;7 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>10!($L(X)<1) X
                  LAST EDITED:    OCT 22, 1993
                  HELP-PROMPT:    Answer must be 1-10 characters in length.  Set
                                  by the print routine to something that looks
                                  like second piece of 0 node of DD (data type
                                  information) for on-the-fly computed fields or
                                  .001 field.
                  DESCRIPTION:    This piece will contain a "D" if on-the-fly
                                  computed field results in a date.  It will be
                                  set to something like NJ6,0 if sorting by the
                                  .001 field. (These are the only values I have
                                  been able to find for this field.)

                  TECHNICAL DESCR:Set in C^DIP0 if DICOMP tells us that an
                                  on-the-fly computed field will result in a
                                  date, and in ^DIP is sorting by the .001 field
                                  on a file that has one.


  .4014,4.3       ASK FOR FROM AND TO  ASK;1 SET

                                  '1' FOR YES;
                  LAST EDITED:    FEB 01, 1993
                  HELP-PROMPT:    Enter 1 (YES) if user is to be prompted for
                                  FROM/TO values for this SORT FIELD.
                  DESCRIPTION:    If this node is defined: then when the PRINT
                                  Option is run, or during a call to the
                                  programmer print EN1^DIP, the user will be
                                  prompted for FROM and TO VALUES for this sort
                                  field.

                  TECHNICAL DESCR:This field is created automatically when a
                                  template is being created or edited, if the
                                  developer enters FROM/TO values, AND if the
                                  developer then answers YES to the question
                                  "SHOULD TEMPLATE USER BE ASKED 'FROM'-'TO'
                                  RANGE FOR field?"


  .4014,5         FROM VALUE INTERNAL  F;1 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>63!($L(X)<1) X
                  LAST EDITED:    JAN 19, 1993
                  HELP-PROMPT:    Answer must be 1-63 characters in length.  The
                                  starting point for the sort, derived by
                                  FileMan.
                  DESCRIPTION:    FileMan takes the FROM value entered by the
                                  user, and finds the first value that will sort
                                  just before this value in order to derive the
                                  starting point for the sort.

                  TECHNICAL DESCR:
                                  Calculated by the sort routine FRV^DIP1.


  .4014,6         FROM VALUE EXTERNAL  F;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>63!($L(X)<1) X
                  LAST EDITED:    JAN 19, 1993
                  HELP-PROMPT:    Answer must be 1-63 characters in length.  The
                                  starting point for the sort, as entered by the
                                  user.
                  DESCRIPTION:    The FROM value for the sort, as it was entered
                                  by the user.


  .4014,6.5       FROM VALUE PRINTABLE F;3 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>40!($L(X)<1) X
                  LAST EDITED:    FEB 16, 1993
                  HELP-PROMPT:    Answer must be 1-40 characters in length.  Used
                                  for storing printable form of date or set
                                  values.
                  DESCRIPTION:    This field is used to store a printable
                                  representation of the FROM value entered by the
                                  user during the sort/print dialogue.  Used for
                                  date and set-of-code data types.

                  TECHNICAL DESCR:
                                  Built in CK^DIP12.


  .4014,7         TO VALUE INTERNAL    T;1 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>63!($L(X)<1) X
                  LAST EDITED:    JAN 19, 1993
                  HELP-PROMPT:    Answer must be 1-63 characters in length.  The
                                  ending point for the sort, derived by FileMan.
                  DESCRIPTION:    FileMan usually uses the TO value as entered by
                                  the user, but in the case of dates and sets of
                                  codes, the internal value is used.  This field
                                  tells FileMan the ending point for the sort.


  .4014,8         TO VALUE EXTERNAL    T;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>63!($L(X)<1) X
                  LAST EDITED:    JAN 19, 1993
                  HELP-PROMPT:    Answer must be 1-63 characters in length.  The
                                  ending point for the sort, as entered by the
                                  user.
                  DESCRIPTION:    The ending value for the sort, as entered by
                                  the user.


  .4014,8.5       TO VALUE PRINTABLE   T;3 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>40!($L(X)<1) X
                  LAST EDITED:    FEB 16, 1993
                  HELP-PROMPT:    Answer must be 1-40 characters in length.  Used
                                  for storing printable form of date and set
                                  values.
                  DESCRIPTION:    This field is used to store a printable
                                  representation of the TO value entered by the
                                  user during the sort/print dialogue.  Used for
                                  date and set-of-code data types.

                  TECHNICAL DESCR:
                                  Created in CK^DIP12.


  .4014,9         CROSS REFERENCE DATA IX;E1,245 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>245!($L(X)<1) X
                  LAST EDITED:    JAN 15, 1993
                  HELP-PROMPT:    First ^ piece null, second piece=static part of
                                  cross-reference, third piece=global reference,
                                  4th piece=number of variable subscripts to get
                                  to (and including) record number.
                  DESCRIPTION:     Piece 1 is always null
                                   Piece 2 is the static part of the
                                  cross-reference: ex. DIZ(662001,"B",
                                   Piece 3 is the global reference: ex.
                                  DIZ(662001,
                                   Piece 4 tells FileMan how many variable
                                  subscripts must be sorted through to get to the
                                  record number, plus 1 for the record number
                                  itself.  ex. for a regular cross-reference,
                                  ^DIZ(662001,"B",X,DA), the number is 2.  One
                                  for the value of the X subscript, and one for
                                  the record number itself (DA).

                  TECHNICAL DESCR:The IX nodes are normally derived by FileMan
                                  during the entry of sort fields (in routine
                                  XR^DIP).  However, they can also be passed to
                                  the print (^DIP) in the BY(0) variable to cause
                                  FileMan to either use a MUMPS type
                                  cross-reference, or a previously sorted list of
                                  record numbers.  Fileman sometimes builds the
                                  IX node prior to calling the print, as in the
                                  INQUIRE option, where the user then goes on to
                                  print the records.


  .4014,9.5       POINT TO CROSS REFERENCE PTRIX;E1,245 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>245!($L(X)<1) X
                  LAST EDITED:    DEC 21, 1993
                  HELP-PROMPT:    Enter global reference for "B" index of .01
                                  field on pointed-to file.  Answer must be 1-245
                                  characters in length.
                  DESCRIPTION:    This node will exist only if the sort field is
                                  a pointer, if the sort field has a regular
                                  cross-reference, if the .01 field on the
                                  pointed-to file has a "B" index, and if the .01
                                  field on the pointed-to file is either a
                                  numeric, date, set-of-codes or free-text field,
                                  and does not have an output transform.  If this
                                  node exists, it will be set to the static part
                                  of the global reference of the "B" index on the
                                  pointed-to file. (ex.  ^DIZ(662001,"B",).


  .4014,10        GET CODE             GET;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  LAST EDITED:    JAN 15, 1993
                  HELP-PROMPT:    This is Standard MUMPS code used to extract the
                                  sort field from a record.
                  DESCRIPTION:    The GET CODE is MUMPS code that is executed
                                  after a record (or sub-record) has been
                                  selected.  The code extracts the SORT field
                                  from that record into a local variable.

                  TECHNICAL DESCR:GET CODE can be generated by a call to FileMan
                                  routine GET^DIOU.

                  WRITE AUTHORITY:@

  .4014,11        QUERY CONDITION      QCON;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  LAST EDITED:    JAN 15, 1993
                  HELP-PROMPT:    This is Standard MUMPS code used to test the
                                  field to see whether it meets the query
                                  condition (ex., whether it's within the from/to
                                  range specified by the user).
                  DESCRIPTION:    The QUERY CONDITION is MUMPS code that takes a
                                  field in a local variable, and executes some
                                  query condition.  The results of executing the
                                  code will return a truth value of TRUE if the
                                  field met the condition, or FALSE if not.  It
                                  is used, for example, to see whether a SORT
                                  FIELD falls within the FROM/TO range requested
                                  by the user.

                  TECHNICAL DESCR:The QUERY CONDITION code is generated by
                                  various calls to FileMan routines DIOC*.

                  WRITE AUTHORITY:@

  .4014,12        DESCRIPTION OF SORT  TXT;E1,200 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>200!($L(X)<1) X
                  LAST EDITED:    JAN 15, 1993
                  HELP-PROMPT:    Answer must be 1-200 characters in length.
                                  Text explaining the query condition (field name
                                  and what conditions must be met in order for
                                  the record to be selected).
                  DESCRIPTION:    This field contains a brief textual description
                                  of the SORT FIELD and the SORT CRITERIA used on
                                  it (i.e., the from/to values).  This
                                  description can be printed in the heading of a
                                  report, at the users request.

                  TECHNICAL DESCR:This text is build as the developer answers the
                                  FROM/TO questions during the SORT sequence.


  .4014,13        SEARCH EFFICIENCY RATING SER;1 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>9999.9999)!(X<0)!(X?.E1"."5N.N) X
                  LAST EDITED:    JAN 25, 1993
                  HELP-PROMPT:    Type a Number between 0 and 9999.9999, 4
                                  Decimal Digits.  Search efficiency number
                                  returned by Query Optimizer Routine.
                  DESCRIPTION:    Fields are assigned a search efficiency rating
                                  based on the number of hits found for the query
                                  (or sort) condition.  The fewer the hits, the
                                  higher the rating.  A high rating indicates the
                                  criteria will more quickly cut down the number
                                  of records to be processed.  The rating will be
                                  higher if the field has a cross-reference.  The
                                  field with the highest rating is used to do the
                                  initial loop through the file during the sort
                                  phase.

                  TECHNICAL DESCR:Calculated in the Query Optimizer routine
                                  ^DIOQ.


  .4014,14        PROBABILITY RATING   SER;2 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>9999.9999)!(X<0)!(X?.E1"."5N.N) X
                  LAST EDITED:    JAN 25, 1993
                  HELP-PROMPT:    Type a Number between 0 and 9999.9999, 4
                                  Decimal Digits.  Probability of field meeting
                                  the sort criteria--returned by Query Optimizer
                                  routine.
                  DESCRIPTION:    Fields are assigned a probability rating based
                                  on the number of hits found for the query (or
                                  sort) condition.  The probability rating is
                                  used to determine the order in which query
                                  conditions should be executed during the sort
                                  phase.  Fields with a higher probability rating
                                  are executed first to most quickly cut down the
                                  number of records that have to be processed.

                  TECHNICAL DESCR:Calculated by a call to the FileMan Query
                                  Optimizer routine ^DIOQ.


  .4014,15        DATA TYPE FOR SORTING 0;10 POINTER TO DATA TYPE FILE (#.81)

                  LAST EDITED:    MAY 14, 1993
                  DESCRIPTION:    This pointer to the FileMan DATA TYPE file is
                                  entered automatically by FileMan during the
                                  sort/print.  Note that if sorting by a pointer
                                  or a variable pointer, FileMan will follow the
                                  pointer chain until it gets to one of the other
                                  data types, in order to determine how to
                                  correctly set up the sort logic.

                  TECHNICAL DESCR:Pointer to DATA TYPE file, derived by FileMan
                                  in routine DTYP^DIP1.


  .4014,16        COMPUTED FIELD CODE  CM;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  LAST EDITED:    FEB 01, 1993
                  HELP-PROMPT:    This is Standard MUMPS code, generated for
                                  sorting by computed fields or pointer fields.
                  DESCRIPTION:    This field contains MUMPS code used to find the
                                  actual value of a field that is computed or a
                                  pointer.  The code is generated by DICOMP.
                                  This code may execute code in OVERFLOW nodes as
                                  well.

                  TECHNICAL DESCR:Generated by DICOMP.  Put into the DPP array in
                                  C^DIP0.

                  WRITE AUTHORITY:@

  .4014,17        MULTIPLE FIELD DATA  1;0 Multiple #.40141


  .40141,.01        MULT.FILE OR SUBFILE NO. 0;1 NUMBER (Multiply asked)

                    INPUT TRANSFORM:K:+X'=X!(X>9999999.99999)!(X<0)!(X?.E1"."6N.N
                                  ) X
                    LAST EDITED:  FEB 01, 1993
                    HELP-PROMPT:  Type a Number between 0 and 9999999.99999, 5
                                  Decimal Digits.  This is the file/subfile
                                  number when sorting by a multiple field.
                    DESCRIPTION:  All files or subfiles needed to get back up to
                                  the top level from a multiple field will be
                                  represented by an entry in this field.  The
                                  file or subfile number will be used as a
                                  subscript in the DPP array during the
                                  sort/print processing.

                    CROSS-REFERENCE:.40141^B
                                  1)= S ^DIBT(DA(2),2,DA(1),1,"B",$E(X,1,30),DA)=
                                  ""

                                  2)= K ^DIBT(DA(2),2,DA(1),1,"B",$E(X,1,30),DA)


  .40141,1          NODE               0;2 FREE TEXT

                    INPUT TRANSFORM:K:$L(X)>50!($L(X)<1) X
                    LAST EDITED:  FEB 01, 1993
                    HELP-PROMPT:  Answer must be 1-50 characters in length.  This
                                  is the node from which the data is descendant.
                    DESCRIPTION:  This field contains the node from which the
                                  multiple data is descendant.




  .4014,18        RELATIONAL JUMP FIELD DATA 2;0 Multiple #.401418


  .401418,.01       RELATIONAL START FILE NO. 0;1 NUMBER (Multiply asked)

                      INPUT TRANSFORM:K:+X'=X!(X>9999999.99999)!(X<0)!(X?.E1"."6N
                                  .N) X
                      LAST EDITED: FEB 01, 1993
                      HELP-PROMPT:Type a Number between 0 and 9999999.99999, 5
                                  Decimal Digits
                      DESCRIPTION:Data will appear here if sorting by a field
                                  that must be gotten to using a relational jump.
                                  This will be the file or subfile number from
                                  which the user is jumping (i.e., the starting
                                  point).

                      TECHNICAL DESCR:
                                  Built in COLON^DIP0 during the sort/print.

                      CROSS-REFERENCE:.401418^B
                                  1)= S ^DIBT(DA(2),2,DA(1),2,"B",$E(X,1,30),DA)=
                                  ""

                                  2)= K ^DIBT(DA(2),2,DA(1),2,"B",$E(X,1,30),DA)


  .401418,1         NEXT SUBSCRIPT     0;2 NUMBER (Required)

                      INPUT TRANSFORM:K:+X'=X!(X>9999999)!(X<0)!(X?.E1"."1N.N) X
                      LAST EDITED: FEB 01, 1993
                      HELP-PROMPT:Type a Number between 0 and 9999999, 0 Decimal
                                  Digits.  Subscript used in the DPP array during
                                  the sort/print option.
                      DESCRIPTION:This field contains a subscript used n the DPP
                                  array during the sort/print.  The subscript is
                                  generated by DICOMP (using the level number
                                  multiplied by 100 I think).  It results in
                                  building a node like DPP(DJ,file/subfile
                                  no.,subscript)=data.

                      TECHNICAL DESCR:
                                  Built by COLON^DIP0 routine.


  .401418,2         TO FILE OR SUBFILE 0;3 NUMBER

                      INPUT TRANSFORM:K:+X'=X!(X>9999999.99999)!(X<0)!(X?.E1"."6N
                                  .N) X
                      LAST EDITED: FEB 01, 1993
                      HELP-PROMPT:Type a Number between 0 and 9999999.99999, 5
                                  Decimal Digits.  The file or subfile number to
                                  which we are jumping using a relational jump.
                      DESCRIPTION:This field contains the file or subfile number
                                  to which we are making the relational jump
                                  (i.e., the destination file).

                      TECHNICAL DESCR:
                                  Built in COLON^DIP0 during the sort/print.


  .401418,3         GLOBAL REFERENCE   0;4 FREE TEXT

                      INPUT TRANSFORM:K:$L(X)>50!($L(X)<1) X
                      LAST EDITED: FEB 01, 1993
                      HELP-PROMPT:Answer must be 1-50 characters in length.
                                  Contains the global reference of the file to
                                  which we are jumping relationally.
                      DESCRIPTION:This field contains the global reference of the
                                  file to which we are jumping relationally
                                  (i.e., the destination file).

                      TECHNICAL DESCR:
                                  Built by COLON^DIP0 during the sort/print
                                  option.


  .401418,4         MULTIVALUED FLAG   0;5 SET

                                  '0' FOR NOT MULTI-VALUED;
                                  '1' FOR YES, MULTI-VALUED;
                      LAST EDITED: FEB 01, 1993
                      DESCRIPTION:This flag indicates whether the relational jump
                                  will result in going to a file that has a
                                  many-to-one relationship to the starting (home)
                                  file (i.e., a jump to a backwards pointer) or a
                                  one-to-one relationship (i.e., a forwards
                                  pointer jump).  The flag will be set to 1 to
                                  indicate that that there is a many-to-one or
                                  multi-valued relationship to the home file, or
                                  to 0 if not.

                      TECHNICAL DESCR:
                                  Set in COLON^DIP0 during the sort/print option.



  .401418,5         RELATIONAL CODE    RCOD;E1,245 MUMPS

                      INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                      LAST EDITED: FEB 01, 1993
                      HELP-PROMPT:This is Standard MUMPS code, used to make a
                                  relational jump.
                      DESCRIPTION:This is the MUMPS code needed to perform the
                                  relational jump during the sort part of the
                                  sort/print option.

                      TECHNICAL DESCR:
                                  Generated from COLON^DIP0 during the sort/print
                                  option.

                      WRITE AUTHORITY:@



  .4014,19        OVERFLOW DATA        3;0 Multiple #.401419

                      LAST EDITED: FEB 01, 1993
                      DESCRIPTION:This field contains the first subscript from
                                  the part of the DPP array that contains
                                  overflow code executed when sorting by a field
                                  that is gotten to relationally or a computed
                                  field.  Overflow code is generated when needed
                                  by DICOMP.  This field will typically look
                                  something like "OVF0".

                      TECHNICAL DESCR:
                                  Generated by DICOMP from DIP0 during the
                                  sort/print option.


  .401419,.01       FIRST SUBSCRIPT FOR OVERFLOW 0;1 FREE TEXT (Multiply asked)

                        INPUT TRANSFORM:K:$L(X)>20!($L(X)<1) X
                        LAST EDITED: FEB 01, 1993
                        HELP-PROMPT:Answer must be 1-20 characters in length.
                                    This multiple contains overflow code needed
                                    for sorting by relational or computed fields.
                        CROSS-REFERENCE:.401419^B
                                  1)= S ^DIBT(DA(2),2,DA(1),3,"B",$E(X,1,30),DA)=
                                  ""

                                  2)= K ^DIBT(DA(2),2,DA(1),3,"B",$E(X,1,30),DA)


  .401419,1         SECOND SUBSCRIPT FOR OVERFLOW 0;2 NUMBER

                        INPUT TRANSFORM:K:+X'=X!(X>99999.9999)!(X<0)!(X?.E1"."5N.
                                  N) X
                        LAST EDITED: FEB 01, 1993
                        HELP-PROMPT:Type a Number between 0 and 99999.9999, 4
                                  Decimal Digits
                        DESCRIPTION:
                                  This field contains the second subscript from
                                  the part of the DPP array that contains
                                  overflow code executed when sorting by a field
                                  that is gotten to relationally or a computed
                                  field.  Overflow code is generated when needed
                                  by DICOMP.  This field will typically look
                                  something like 9.2.

                        TECHNICAL DESCR:
                                  Generated by DICOMP from ^DIP0 during the
                                  sort/print option.


  .401419,2         OVERFLOW CODE      OVF0;E1,245 MUMPS

                        INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                        LAST EDITED: FEB 01, 1993
                        HELP-PROMPT:This is Standard MUMPS code.
                        DESCRIPTION:
                                  This is MUMPS code generated when needed by
                                  DICOMP, when sorting by a field that must be
                                  gotten to relationally, or a computed field.
                                  This will only be used if DICOMP generates
                                  overflow code in the X array.

                        TECHNICAL DESCR:
                                  Generated by DICOMP from ^DIP0 during the
                                  sort/print option.

                        WRITE AUTHORITY:@



  .4014,20        SUBHEADER OUTPUT TRANSFORM OUT;E1,245 MUMPS

                        INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                        LAST EDITED: FEB 04, 1993
                        HELP-PROMPT:This is Standard MUMPS code.  This is used
                                  only when sorting by a user-specified
                                  cross-reference in input variable BY(0).
                        DESCRIPTION:
                                  Defined only when using the BY(0) input
                                  variable to the FileMan print, EN1^DIP, which
                                  allows the user to specify a cross-reference to
                                  sort on.  The user is allowed to specify MUMPS
                                  code that can be used as an output transform
                                  for any of the subheaders (i.e., subscripts in
                                  the cross-reference) in the S input array.
                                  This output transform code is stored in this
                                  field.

                        TECHNICAL DESCR:
                                  Stores output transform code from the third
                                  piece of S(0,N) where N is the sort level.
                                  This is an input array used in conjunction with
                                  BY(0) when user specifies a specific
                                  cross-reference to use for the sort, in in the
                                  FileMan print routine EN1^DIP.

                        WRITE AUTHORITY:@

  .4014,21        TEXT SORT FLAG       SRTTXT;1 SET

                                  'SORT' FOR SORT LIKE TEXT;
                                  'RANGE' FOR TREAT RANGE LIKE TEXT;
                        LAST EDITED: DEC 21, 1993
                        DESCRIPTION:
                                  This flag will be set in one of two cases.
                                   1) If the user entered the ;TXT qualifier, the
                                  flag will be set to "SORT", and will cause a
                                  space to be inserted at the beginning of each
                                  sort value, causing even numeric fields to be
                                  sorted as if they were text.
                                   2) If the user entered a FROM or TO value that
                                  is a non-canonic number, the flag will be set
                                  to RANGE, and will cause sort values that are
                                  numeric to be treated as if they were text,
                                  when seeing whether they fall within the
                                  from/to range.  However, they will still sort
                                  like numbers (MUMPS sort sequence).

                                  The flag is set automatically when the user is
                                  entering the sort fields in ^DIP, and the
                                  from/to values in ^DIP1.


  .4014,21401     FROM VALUE COMPUTATION FCOMPUTED;E1,245 FREE TEXT

                        INPUT TRANSFORM:D ^DIM
                        HELP-PROMPT:Enter valid MUMPS code.
                        DESCRIPTION:
                                  MUMPS code indicating the start of the sort.


  .4014,21402     TO VALUE COMPUTATION TCOMPUTED;E1,245 FREE TEXT

                        INPUT TRANSFORM:D ^DIM
                        HELP-PROMPT:Enter valid MUMPS code.
                        DESCRIPTION:
                                  MUMPS code indicating the end of the sort.




  .401,1622     BY(0)                  BY0;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30!($L(X)<3)!'(X?1.ANP1"(".ANP) X
                LAST EDITED:      SEP 24, 1996
                HELP-PROMPT:      Enter the static part of a global.  The leading
                                  up-arrow can be omitted.
                DESCRIPTION:      Enter the static, unchanging part of an open
                                  global reference for either a global or a
                                  cross-reference that contains the list of
                                  record numbers to sort through on the first
                                  pass.  The leading up-arrow can be omitted.
                                  For example:  DIZ(662001,"A", or TMP("NMSP",$J,

                TECHNICAL DESCR:  Equivalent to the BY(0) input variable to
                                  programmer call EN1^DIP.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .401,1623     L(0)                   BY0;2 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>8)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      AUG 28, 1996
                HELP-PROMPT:      Type a Number between 1 and 8, 0 Decimal Digits
                DESCRIPTION:      Enter the total number of subscripts that must
                                  be sorted through on the global referenced by
                                  BY(0), including 1 for the record number.  Ex.,
                                  to sort through the "B" x-ref, we sort through
                                  the cross-referenced value itself, then the
                                  record number, so L(0)=2.

                TECHNICAL DESCR:  Equivalent to the L(0) input variable to
                                  programmer call EN1^DIP.


  .401,1624     SORT RANGE DATA FOR BY(0) BY0D;0 Multiple #.4011624


  .4011624,.01    SUBSCRIPT LEVEL        0;1 NUMBER (Multiply asked)

                  INPUT TRANSFORM:  K:+X'=X!(X>7)!(X<1)!(X?.E1"."1N.N) X
                  LAST EDITED:      AUG 28, 1996
                  HELP-PROMPT:      Enter a number, 1 or more.  L(0)-1 is the
                                    upper limit.
                  DESCRIPTION:      This field corresponds to a subscript in, and
                                    contains sort from/to ranges and/or subheader
                                    information for, any of the variable
                                    subscripts in the BY(0) global.  Any number
                                    here should never be greater than L(0)-1.
                                    This can represent a sparse array.

                  TECHNICAL DESCR:  Corresponds to subscript levels in the BY(0)
                                    global, and will be used to put sort from/to
                                    and subheader information into the DPP array
                                    when the sort data is being built.

                  CROSS-REFERENCE:  .4011624^B
                                    1)= S ^DIBT(DA(1),"BY0D","B",$E(X,1,30),DA)="
                                    "

                                    2)= K ^DIBT(DA(1),"BY0D","B",$E(X,1,30),DA)


  .4011624,1      FR(0,n)                0;2 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>62!($L(X)<1) X
                  LAST EDITED:      AUG 28, 1996
                  HELP-PROMPT:      Starting value for the sort on this
                                    subscript.  Answer must be 1-62 characters in
                                    length.
                  DESCRIPTION:      Use this field to define the FR(0,n) variable
                                    as you would in a call to EN1^DIP that
                                    included BY(0).  If defined, the value will
                                    be used as the starting point as FileMan
                                    sequences through the global array referenced
                                    by BY(0) at this subscript level (n).

                                    Values are not transformed, so enter the
                                    internal form just as it is stored in the
                                    global array.  A date, for example, would be
                                    2960829, not Aug 29, 1996.

                                    Don't attempt to use the at-sign (@) to
                                    include records with null values (as can be
                                    done in ordinary sorts).  Only use values
                                    that can be compared with actual data in this
                                    subscript of the global array referenced by
                                    BY(0).  (The only records that can be
                                    selected are ones that exist in this global
                                    array.  A record with a null value for this
                                    subscript would exist in the data file but
                                    not in this array and thus can't be
                                    selected.)

                  TECHNICAL DESCR:  Equivalent to the FR(0,n) input variable to
                                    the programmer call EN1^DIP.


  .4011624,2      TO(0,n)                0;3 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>62!($L(X)<1) X
                  LAST EDITED:      AUG 28, 1996
                  HELP-PROMPT:      Ending value for sort on this subscript.
                                    Answer must be 1-62 characters in length.
                  DESCRIPTION:      Use this field to define the TO(0,n) variable
                                    as you would in a call to EN1^DIP that
                                    included BY(0).  If defined, the value will
                                    be used as the ending point as FileMan
                                    sequences through the global array referenced
                                    by BY(0) at this subscript level (n).

                                    Values are not transformed, so enter the
                                    internal form just as it is stored in the
                                    global array.  An inverse date, for example,
                                    would be 7039268, not 7/31/96.  Do not
                                    attempt to use @ to select records with null
                                    values for this subscript.

                  TECHNICAL DESCR:  Equivalent to the TO(0,n) input variable to
                                    the programmer call EN1^DIP.


  .4011624,3.1    DISPAR(0,n) PIECE ONE  1;1 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>10!($L(X)<1)!("#!#"'[X) X
                  LAST EDITED:      SEP 10, 1996
                  HELP-PROMPT:      Answer with #, !, #!, or null.
                  DESCRIPTION:      Just as when setting the first piece of
                                    DISPAR(0,n) in a programmer call that
                                    includes BY(0) when calling EN1^DIP, this
                                    field can hold the sort qualifiers for page
                                    breaks (#) or rankings (!).

                                    The # and/or ! are the only qualifiers that
                                    can be used.  Others, such as + for
                                    subtotals, cannot be used.

                  TECHNICAL DESCR:  Equivalent to the 1st piece of DISPAR(0,n) in
                                    the EN1^DIP call.

                  NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .4011624,3.2    DISPAR(0,n) PIECE TWO  1;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>50!($L(X)<1)!'((X[";""")!(X[";L")!(X[";
                                  C")!(X[";S")) X
                  LAST EDITED:    SEP 11, 1996
                  HELP-PROMPT:    Answer with qualifiers like ;"" or
                                  ;S2;C10;L30;"VALUE: "
                  DESCRIPTION:    As when defining the second piece of
                                  DISPAR(0,n) in a programmer call that includes
                                  BY(0) when calling EN1^DIP, this field can hold
                                  the sort qualifiers that normally appear after
                                  a sort-by field in interactive mode.  The ones
                                  that can be used are as follows:

                                   ;""         to have the subheader appear
                                   ;"caption"  to give the subheader a caption
                                   ;Ln         to left-justify the subheader to n
                                  characters
                                   ;Cn         to start the display in the nth
                                  column
                                   ;Sn         to skip n lines before each
                                  subheader

                                  If this field is null, subheaders are supressed
                                  (@ is assumed).

                  TECHNICAL DESCR:Equivalent to the 2nd piece of DISPAR(0,n) in
                                  the EN1^DIP call.  Note that if DISPAR(0,n) is
                                  defined, subheaders will appear even if used
                                  with a print template that normally suppresses
                                  subheaders.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .4011624,4      DISPAR(0,n,OUT)      2;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  LAST EDITED:    AUG 29, 1996
                  HELP-PROMPT:    Enter code to transform subscript.  This is
                                  Standard M code.
                  DESCRIPTION:    As when defining DISPAR(0,n,"OUT") for a call
                                  to EN1^DIP that includes BY(0), enter M code
                                  that will transform the sort-by value for this
                                  subscript (n) when it is output (e.g. printed).
                                  At the time the code is executed the
                                  untransformed value of the subscript will be in
                                  Y.  The code should put the transformed value
                                  back into Y.

                                  For example, for an inverse date, S:Y
                                  Y=99999999-Y S Y=$$FMTE^XLFDT(Y)"

                  TECHNICAL DESCR:Equivalent to the DISPAR(0,n,"OUT") input
                                  variable to the programmer call EN1^DIP.

                  WRITE AUTHORITY:@



  .401,1815     ROUTINE INVOKED        ROU;E1,13 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>5!($L(X)<5) X
                LAST EDITED:      APR 16, 1993
                HELP-PROMPT:      Answer must be 5 characters in length.Must
                                  contain '^DISZ'.
                DESCRIPTION:        If this sort template is compiled, the first
                                  characters of the name of that compiled routine
                                  will appear on this node.  Compiled sort
                                  routines are re-created each time the
                                  sort/print runs.  These characters are
                                  concatenated with the next available number
                                  from the COMPILED ROUTINE file to create the
                                  routine name.
                                    If this node is present, a new compiled sort
                                  routine will be created during the FileMan
                                  sort/print.

                TECHNICAL DESCR:  A routine beginning with these characters is
                                  created during the FileMan sort/print.  The
                                  routine is then called from DIO2 to do the
                                  sort, rather than executing code from the local
                                  DY, DZ and P arrays.


  .401,1816     PREVIOUS ROUTINE INVOKED ROUOLD;E1,13 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>4!($L(X)<4)!'(X?1"DISZ") X
                LAST EDITED:      APR 16, 1993
                HELP-PROMPT:      Entry must be 'DISZ'.
                DESCRIPTION:      This node is present only to be consistant with
                                  other sort templates.  It's presence will
                                  indicate that at some time the SORT template
                                  was compiled and will contain the beginning
                                  characters used to create the name of the
                                  compiled routine.


  .401,1819     COMPILED                ;  COMPUTED

                MUMPS CODE:       S X=$S($G(^DIBT(D0,"ROU"))]"":"YES",1:"NO")
                ALGORITHM:        S X=$S($G(^DIBT(D0,"ROU"))]"":"YES",1:"NO")

  .401,6666     ENTRIES                 ;  COMPUTED MULTIPLE

                MUMPS CODE:       N FILE,DINAME,D S FILE=$P($G(^DIBT(D0,0)),U,4)
                                  I $D(^(1)) S DINAME=$G(^DIC(FILE,0,"GL"))_"D,0)
                                  " I DINAME[U F D=0:0 S D=$O(^DIBT(D0,1,D)) Q:'D
                                    I $D(@DINAME) S X=$$GET1^DIQ(FILE,D,.01) X DI
                                  CMX Q:'$D(D)
                DESCRIPTION:      For SEARCH Templates, the list of the entries
                                  found and stored when the Template was created
                                  is accessed. The value of the .01 Field for
                                  each entry is displayed.


  .401,21400    BUILD(S)                ;  COMPUTED MULTIPLE POINTER TO BUILD FIL
                                  E (#9.6)

                MUMPS CODE:       N DIBTNAME,D S DIBTNAME=$P($G(^DIBT(D0,0)),U)_"
                                      FILE #"_$P($G(^(0)),U,4) F D=0:0 S D=$O(^XP
                                  D(9.6,D)) Q:'D  I $D(^(D,"KRN",.401,"NM","B",DI
                                  BTNAME)) N D0 S D0=D,X=$P(^XPD(9.6,D,0),U) X DI
                                  CMX Q:'$D(D)
                DESCRIPTION:      The Build File (#9.6) is searched for Builds
                                  containing the Sort Template.  A list of the
                                  identified Builds is created for display.
                                  Multiple Builds will be shown if appropriate.


  .401,21409    CANONIC FOR THIS FILE  CANONIC;1 SET

                                  '1' FOR YES;
                DESCRIPTION:      The Sort Template identified as CANONIC will
                                  always be presented to the user for selection
                                  at the Sort By: prompt.

                EXECUTABLE HELP:  D HELP^DIUCANON
                CROSS-REFERENCE:  ^^^MUMPS
                                  1)= N F S F=$P(^DIBT(DA,0),U,4) I F S ^DIBT("CA
                                  NONIC",F,DA)=""

                                  2)= N F S F=$P(^DIBT(DA,0),U,4) I F K ^DIBT("CA
                                  NONIC",F,DA)
                                  This cross-reference is used to identify files
                                  that have a Canonic Sort Template assigned.
                                  The structure of the cross-reference is:
                                       ^DIBT("CANONIC", File#, IEN)
                                   where File# identifies the file which has a
                                  Canonic Sort Template and IEN is the internal
                                  entry number of the Canonic Sort Template
                                  assigned to that file.



  .401,491620   PRINT TEMPLATE         DIPT;1 FREE TEXT

                INPUT TRANSFORM:  K:'$D(^DIPT("B",X)) X
                EXECUTABLE HELP:  N D1 S D1(1)="If this Sort Template should alwa
                                  ys be used with a particular",D1(2)="Print Temp
                                  late, enter the name of that Print Template.",D
                                  1(3)="" D EN^DDIOL(.D1)


        FILES POINTED TO                      FIELDS

  BUILD (#9.6)                      BUILD(S) (#21400)

  DATA TYPE (#.81)                  SORT FIELD DATA:DATA TYPE FOR SORTING (#15)

  FILE (#1)                         FILE (#4)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):
  ONCOLOGY SORT TEMPLATE LIST   MAY 27, 1992@17:01  USER #0
                                                      ONCOLOGY SORT TEMPLATE LIST
  RT SORT TEMPLATES             NOV 18, 1986        USER #0
                                                   Record Tracking Sort Templates

  SORT TEMPLATE(S):
  ONCOLOGY SORT TEMPLATE LIST   MAY 28, 1992@19:04  USER #0
                         'ONCOLOGY SORT TEMPLATE LIST' Print Template always used
  SORT BY: NAME//     From 'ONCO'  To 'ONCOZ^ONCOZ'

  RT SORT TEMPLATES             NOV 18, 1986        USER #0
  SORT BY: FILE//     From '190'  To '195.99'
    WITHIN FILE, SORT BY: NAME//


  FORM(S)/BLOCK(S):
  DIBTED                        SEP 04, 1998@13:57  USER #0
    DIBTED                        DD #.401
    DIBTED2                       DD #.401

INPUT TEMPLATE
--------------

::

  STANDARD DATA DICTIONARY #.402 -- INPUT TEMPLATE FILE
  STORED IN ^DIE(

  This file stores the EDIT FIELDS data from an input template.


                DD ACCESS: ^
                WR ACCESS: ^
  IDENTIFIED BY:
        "WRITE": N D,D1,D2 S D2=^(0) S:$X>30 D1(1,"F")="!" S D=$P(D2,U,2) S:D D1(
                 2)="("_$$DATE^DIUTL(D)_")",D1(2,"F")="?30" S D=$P(D2,U,5) S:D D1
                 (3)=" User #"_D,D1(3,"F")="?50" S D=$P(D2,U,4) S:D D1(4)=" File
                 #"_D,D1(4,"F")="?59" D EN^DDIOL(.D1)
       "WRITED": I $G(DZ)?1"???".E N % S %=0 F  S %=$O(^DIE(Y,"%D",%)) Q:%'>0  I
                 $D(^(%,0))#2 D EN^DDIOL(^(0),"","!?5")

  POINTED TO BY: REGISTRATION TEMPLATE (LOCAL) field (#70) of the MAS PARAMETERS
                     File (#43)
                 EDIT TEMPLATE NAME field (#5) of the ADT TEMPLATE File (#43.7)
                 USER CHARACTERISTICS TEMPLATE field (#12) of the KERNEL SYSTEM
                     PARAMETERS File (#8989.3)


  CROSS
  REFERENCED BY: NAME(B)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  .402,.01      NAME                   0;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)<2!($L(X)>30) X
                HELP-PROMPT:      2-30 CHARACTERS
                CROSS-REFERENCE:  .402^B
                                  1)= S @(DIC_"""B"",X,DA)=""""")
                                  2)= K @(DIC_"""B"",X,DA)")

                CROSS-REFERENCE:  ^^MUMPS
                                  1)= X "S %=$P("_DIC_"DA,0),U,4) S:$L(%) "_DIC_"
                                  ""F""_+%,X,DA)=1"

                                  2)= X "S %=$P("_DIC_"DA,0),U,4) K:$L(%) "_DIC_"
                                  ""F""_+%,X,DA)"

                CROSS-REFERENCE:  ^^MUMPS
                                  1)= Q
                                  2)= S X=-1 X "F  S X=$O("_DIC_"""AF"",X)) Q:X="
                                  """  K:'X ^(X,DA) S Y=0 F  S Y=$O("_DIC_"""AF""
                                  ,X,Y)) Q:Y'>0  K:$D(^(Y,DA)) ^(DA)" S X=-1 S:$G
                                  (Y)="" Y=-1


  .402,2        DATE CREATED           0;2 DATE

                INPUT TRANSFORM:  S %DT="ET" D ^%DT S X=Y K:Y<1 X

  .402,3        READ ACCESS            0;3 FREE TEXT

                INPUT TRANSFORM:  I DUZ(0)'="@" F I=1:1:$L(X) I DUZ(0)'[$E(X,I) K
                                   X Q

  .402,4        FILE                   0;4 POINTER TO FILE FILE (#1)

                                  UNEDITABLE
                CROSS-REFERENCE:  ^^^MUMPS
                                  1)= X "S %=$P("_DIC_"DA,0),U,1),"_DIC_"""F""_+X
                                  ,%,DA)=1"

                                  2)= Q


  .402,5        USER #                 0;5 NUMBER


  .402,6        WRITE ACCESS           0;6 FREE TEXT

                INPUT TRANSFORM:  I DUZ(0)'="@" F I=1:1:$L(X) I DUZ(0)'[$E(X,I) K
                                   X Q

  .402,7        DATE LAST USED         0;7 DATE

                INPUT TRANSFORM:  S %DT="EX" D ^%DT S X=Y K:Y<1 X

  .402,10       DESCRIPTION            %D;0   WORD-PROCESSING #.4021


  .402,1620     EDIT FIELDS             ;  COMPUTED MULTIPLE

                MUMPS CODE:       D EN^DIET
                DESCRIPTION:      This multi-line field displays all the "EDIT"
                                  prompts of this Input Template

                TECHNICAL DESCR:  This Computed Multiple uses code in ^DIETED to
                                  build the entire displayable Input Template.
                                  Then it is output node-by-node.


  .402,1815     ROUTINE INVOKED        ROU;E1,13 FREE TEXT

                WRITE AUTHORITY:  @
                CROSS-REFERENCE:  ^^^MUMPS
                                  1)= Q
                                  2)= D DELETROU^DIEZ($TR(X,U))


  .402,1816     PREVIOUS ROUTINE INVOKED ROUOLD;E1,13 FREE TEXT

                WRITE AUTHORITY:  @

  .402,1819     COMPILED                ;  COMPUTED

                MUMPS CODE:       S X=$S('$D(^DIE(D0,"ROU"))#2:"NO",^("ROU")="":"
                                  NO",1:"YES")
                ALGORITHM:        S X=$S('$D(^DIE(D0,"ROU"))#2:"NO",^("ROU")="":"
                                  NO",1:"YES")

  .402,21400    BUILD(S)                ;  COMPUTED MULTIPLE POINTER TO BUILD FIL
                                  E (#9.6)

                MUMPS CODE:       N DIENAME,D S DIENAME=$P($G(^DIE(D0,0)),U)_"
                                   FILE #"_$P($G(^(0)),U,4) F D=0:0 S D=$O(^XPD(9
                                  .6,D)) Q:'D  I $D(^(D,"KRN",.402,"NM","B",DIENA
                                  ME)) N D0 S D0=D,X=$P(^XPD(9.6,D,0),U) X DICMX
                                  Q:'$D(D)
                DESCRIPTION:      This computed field searches the Build
                                  File(#9.6) for Builds containing the Edit
                                  Template.  A list of the identified Builds is
                                  created for display. Multiple Builds will be
                                  shown if appropriate.


  .402,21409    CANONIC FOR THIS FILE  CANONIC;1 SET

                                  '1' FOR YES;
                INPUT TRANSFORM:  I DA<1 K X
                DESCRIPTION:      The Input Template identified as CANONIC will
                                  always be presented to the user for selection
                                  at the EDIT WHICH FIELD: prompt.

                EXECUTABLE HELP:  D HELP^DIUCANON
                CROSS-REFERENCE:  ^^^MUMPS
                                  1)= N F S F=$P(@(DIC_"DA,0)"),U,4) I F S @(DIC_
                                  """CANONIC"",F,DA)=""""")

                                  2)= N F S F=$P(@(DIC_"DA,0)"),U,4) I F K @(DIC_
                                  """CANONIC"",F,DA)")
                                  This cross-reference is used to identify files
                                  that have a Canonic Edit Template assigned.
                                  The structure of the cross-reference is:
                                       ^DIE("CANONIC", File#, IEN)
                                   where File# identifies the file which has a
                                  Canonic Edit Template and IEN is the internal
                                  entry number of the Canonic Edit Template
                                  assigned to that file.




        FILES POINTED TO                      FIELDS

  BUILD (#9.6)                      BUILD(S) (#21400)

  FILE (#1)                         FILE (#4)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):
  ONCOLOGY INPUT TEMPLATE LIST  MAY 27, 1992@13:47  USER #0
                                                     ONCOLOGY INPUT TEMPLATE LIST
  RT INPUT TEMPLATES            NOV 18, 1986        USER #0
                                                  Record Tracking Input Templates
  XU TEMPLATE LIST              OCT 03, 1989@09:53  USER #0
                                                              INPUT TEMPLATE LIST

  SORT TEMPLATE(S):
  ONCOLOGY INPUT TEMPLATE LIST  MAY 28, 1992@19:03  USER #0
                        'ONCOLOGY INPUT TEMPLATE LIST' Print Template always used
  SORT BY: NAME//     From 'ONCO'  To 'ONCOZ^ONCOZ'

  RT INPUT TEMPLATES            NOV 18, 1986        USER #0
  SORT BY: FILE//     From '190'  To '195.99'
    WITHIN FILE, SORT BY: NAME//


  FORM(S)/BLOCK(S):
  DIETED                        AUG 01, 1998@07:40  USER #0
    DIETED                        DD #.402
    DIETED2                       DD #.402

FORM
----

::

  STANDARD DATA DICTIONARY #.403 -- FORM FILE
  STORED IN ^DIST(.403

  This file stores ScreenMan forms, which are composed of blocks.  The form's
  attributes that describe how information is presented on the screen are
  contained in this file.


                DD ACCESS: ^
                WR ACCESS: ^
               DEL ACCESS: ^
             LAYGO ACCESS: ^
  IDENTIFIED BY:
        "WRITE": N D,D1,D2 S D2=^(0) S:$X>30 D1(1,"F")="!" S D=$P(D2,U,5) S:D D1(
                 2)="("_$$DATE^DIUTL(D)_")",D1(2,"F")="?30" S D=$P(D2,U,4) S:D D1
                 (3)="User #"_D,D1(3,"F")="?50" S D=$P(D2,U,8) S:D D1(4)=" File #
                 "_D,D1(4,"F")="?59" D EN^DDIOL(.D1)
       "WRITED": I $G(DZ)?1"???".E N D S D=0 F  S D=$O(^DIST(.403,Y,15,D)) Q:D'>0
                   I $D(^(D,0))#2 D EN^DDIOL(^(0),"","!?5")

  CROSS
  REFERENCED BY: BLOCK NAME(AB), HEADER BLOCK(AC), NAME(AY), NAME(B),
                 TITLE(C), PRIMARY FILE(F), NAME(F1)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  .403,.01      NAME                   0;1 FREE TEXT (Required)

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)
                                  <3)!'(X'?1P.E)!(X=+$P(X,"E")) X
                LAST EDITED:      SEP 04, 1998
                HELP-PROMPT:      Answer must be 3-30 characters in length.
                DESCRIPTION:      Enter the name of the form, 3-30 characters in
                                  length.  The form name must be unique and
                                  cannot be numeric or start with a punctuation
                                  character.  It should also be namespaced.

                DELETE TEST:      1,0)= D EN^DDIOL($C(7)_"You must use the FileMa
                                  n option to delete forms.") I 1

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  .403^B
                                  1)= S ^DIST(.403,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIST(.403,"B",$E(X,1,30),DA)

                CROSS-REFERENCE:  .403^F1^MUMPS
                                  1)= X "S %=$P("_DIC_"DA,0),U,8) S:$L(%) "_DIC_"
                                  ""F""_%,X,DA)=1"

                                  2)= X "S %=$P("_DIC_"DA,0),U,8) K:$L(%) "_DIC_"
                                  ""F""_%,X,DA)"
                                  3)= Programmer only
                                  This cross-reference is used to quickly find
                                  all ScreenMan templates associated with a file.
                                  It has the form:

                                    ^DIST(.403,"F"_file#,"formname",DA)=1

                                  A comparable cross-reference also exists on the
                                  PRIMARY FILE field.


                CROSS-REFERENCE:  .403^AY^MUMPS
                                  1)= Q
                                  2)= Q
                                  3)= Programmer only
                                  This is a no-op cross reference defined merely
                                  to document the data stored under
                                  ^DIST(.403,form IEN,"AY").

                                  This global stores the compiled data for a
                                  Form. Form compilation occurs automatically
                                  whenever a Form is edited through the FileMan
                                  supplied options. The compiled data stored in
                                  this global is static information that is used
                                  whenever a Form is run.



  .403,1        READ ACCESS            0;2 FREE TEXT

                INPUT TRANSFORM:  I DUZ(0)'="@" N DDZ F DDZ=1:1:$L(X) K:DUZ(0)'[$
                                  E(X,DDZ) X
                LAST EDITED:      OCT 20, 1993
                HELP-PROMPT:      Enter VA FileMan access code(s) which control
                                  access to the form.
                DESCRIPTION:      Non-programmers can enter only their own VA
                                  FileMan access code(s).

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .403,2        WRITE ACCESS           0;3 FREE TEXT

                INPUT TRANSFORM:  I DUZ(0)'="@" N DDZ F DDZ=1:1:$L(X) K:DUZ(0)'[$
                                  E(X,DDZ) X
                LAST EDITED:      OCT 20, 1993
                HELP-PROMPT:      Enter VA FileMan access code(s) which control
                                  access to the form.
                DESCRIPTION:      Non-programmers can enter only their own VA
                                  FileMan access code(s).

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .403,3        CREATOR                0;4 NUMBER

                INPUT TRANSFORM:  K:X'?.N X
                HELP-PROMPT:      Enter the VA FileMan User Number of the form
                                  creator.
                DESCRIPTION:      This is the DUZ of the person who created the
                                  form.  The ScreenMan options to create the form
                                  automatically put a value into this field.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .403,4        DATE CREATED           0;5 DATE

                INPUT TRANSFORM:  S %DT="ETX" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      OCT 18, 1994
                HELP-PROMPT:      Enter the date the form was created.
                DESCRIPTION:      This is the date the form was created.  The
                                  ScreenMan options to create the form
                                  automatically put a value into this field.


  .403,5        DATE LAST USED         0;6 DATE

                INPUT TRANSFORM:  S %DT="ETX" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      OCT 18, 1994
                HELP-PROMPT:      Enter the date and time the form was last used.
                DESCRIPTION:      This is the date the form was last used.
                                  ScreenMan automatically puts a value into this
                                  field when the form is invoked.


  .403,6        TITLE                  0;7 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>50!($L(X)<1) X
                LAST EDITED:      SEP 08, 1994
                HELP-PROMPT:      Answer must be 1-50 characters in length.
                DESCRIPTION:      The TITLE property can be used by the form
                                  designer to help identify a form.  It is cross
                                  referenced and need not be unique.  ScreenMan
                                  does not automatically display the TITLE to the
                                  user, but the form designer can choose to
                                  define a caption-only field that displays the
                                  title to the user.

                CROSS-REFERENCE:  .403^C
                                  1)= S ^DIST(.403,"C",$E(X,1,30),DA)=""
                                  2)= K ^DIST(.403,"C",$E(X,1,30),DA)


  .403,7        PRIMARY FILE           0;8 FREE TEXT (Required)

                INPUT TRANSFORM:  K:X'=+$P(X,"E")!(X<2)!($L(X)>16)!'$D(^DIC(X)) X
                LAST EDITED:      APR 07, 1992
                HELP-PROMPT:      Answer must be 1-16 characters in length.
                DESCRIPTION:      Enter a file number, greater than or equal to
                                  2, which represents the data dictionary number
                                  of the primary file for this form.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  .403^F^MUMPS
                                  1)= X "S %=$P("_DIC_"DA,0),U) S "_DIC_"""F""_X,
                                  %,DA)=1"

                                  2)= X "S %=$P("_DIC_"DA,0),U) K "_DIC_"""F""_X,
                                  %,DA)"
                                  3)= Programmer only
                                  This cross-reference is used to quickly find
                                  all ScreenMan templates associated with a file.




  .403,8        DISPLAY ONLY           0;9 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      OCT 28, 1993
                DESCRIPTION:      This is a flag that indicates none of the
                                  blocks on the form are edit blocks.  This flag
                                  is set during form compilation.

                                  UNEDITABLE

  .403,9        FORM ONLY              0;10 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      OCT 28, 1993
                DESCRIPTION:      This is a flag that indicates none of the
                                  fields on the form are data dictionary fields.
                                  This flag is set during form compilation.

                                  UNEDITABLE

  .403,10       COMPILED               0;11 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      JUL 01, 1994
                DESCRIPTION:      This is a flag that indicates that the form is
                                  compiled.  This flag is set during form
                                  compilation.

                                  UNEDITABLE

  .403,11       PRE ACTION             11;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                HELP-PROMPT:      Enter standard MUMPS code which will be
                                  executed at the beginning of the form.
                DESCRIPTION:      This is MUMPS code that is executed when the
                                  form is first invoked, before any of the pages
                                  are loaded and displayed.

                WRITE AUTHORITY:  @

  .403,12       POST ACTION            12;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                HELP-PROMPT:      Enter standard MUMPS code which will be
                                  executed at the end of the form.
                DESCRIPTION:      This is MUMPS code that is executed before
                                  ScreenMan returns to the calling application.

                WRITE AUTHORITY:  @

  .403,14       POST SAVE              14;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      AUG 13, 1993
                HELP-PROMPT:      This is Standard MUMPS code.
                DESCRIPTION:      This is MUMPS code that is executed when the
                                  user saves changes.  It is executed only if all
                                  data is valid, and after all data has been
                                  filed.

                WRITE AUTHORITY:  @

  .403,15       DESCRIPTION            15;0   WORD-PROCESSING #.40315


  .403,20       DATA VALIDATION        20;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                HELP-PROMPT:      Enter standard MUMPS code.
                DESCRIPTION:      This is MUMPS code that is executed when the
                                  user attempts to save changes to the form.  If
                                  the code sets DDSERROR, the user is unable to
                                  save changes.  If the code sets DDSBR, the user
                                  is taken to the specified field.

                                  In addition to $$GET^DDSVAL, PUT^DDSVAL, and
                                  HLP^DDSUTL, you can use MSG^DDSUTL to print on
                                  a separate screen messages to the user about
                                  the validity of the data.

                WRITE AUTHORITY:  @

  .403,21       RECORD SELECTION PAGE  21;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>999.9)!(X<1)!(X?.E1"."2N.N) X
                HELP-PROMPT:      Type a Number between 1 and 999.9, 1 Decimal
                                  Digit
                DESCRIPTION:      Enter the page number of the page that is used
                                  for record selection.

                                  If you define a Record Selection Page, the user
                                  can select another entry in the file, and, if
                                  LAYGO is allowed, add another entry into the
                                  file without exiting the form.  The Record
                                  Selection Page should be a pop-up page that
                                  contains one form-only field that performs a
                                  pointer-type read into the Primary File of the
                                  form.  The Record Selection Page property
                                  should be set equal to the Page Number of the
                                  Record Selection Page.

                                  The user can open the Record Selection Page by
                                  pressing <PF1>L.  After the user selects a
                                  record and closes the Record Selection Page,
                                  the data for the selected record is displayed.


  .403,40       PAGE                   40;0 Multiple #.4031

                IDENTIFIED BY:
                      "WRITE":    D:$D(^(1))#2 EN^DDIOL($P(^(1),U),"","?12")

  .4031,.01       PAGE NUMBER            0;1 NUMBER (Multiply asked)

                  INPUT TRANSFORM:K:+X'=X!(X>999.9)!(X<1)!(X?.E1"."2N.N)!$D(^DIST
                                  (.403,DA(1),40,"B",X)) X
                  HELP-PROMPT:    Enter a number between 1 and 999.9, up to 1
                                  Decimal Digit, that identifies the page.
                  DESCRIPTION:    This is the unique page number of the page.
                                  You can use this number to refer to the page in
                                  ScreenMan functions and utilities.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:.4031^B
                                  1)= S ^DIST(.403,DA(1),40,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIST(.403,DA(1),40,"B",$E(X,1,30),DA)


  .4031,1         HEADER BLOCK         0;2 POINTER TO BLOCK FILE (#.404)

                  LAST EDITED:    JUL 02, 1993
                  HELP-PROMPT:    Enter the block which will be used as a header
                                  for this page.
                  DESCRIPTION:    The header block always appears at row 1,
                                  column 1 relative to the page on which it is
                                  defined.  It is for display purposes only --
                                  the user is unable to navigate to any of the
                                  fields on the header block.

                                  Starting with Version 21 of FileMan, there is
                                  no need to use header blocks.  Display-type
                                  blocks, with a coordinate of '1,1' relative to
                                  the page, provide the same functionality as
                                  header blocks.

                  CROSS-REFERENCE:.403^AC
                                  1)= S ^DIST(.403,"AC",$E(X,1,30),DA(1),DA)=""
                                  2)= K ^DIST(.403,"AC",$E(X,1,30),DA(1),DA)


  .4031,2         PAGE COORDINATE      0;3 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>7!($L(X)<1)!'(X?.N1",".N) X
                  LAST EDITED:    SEP 08, 1994
                  HELP-PROMPT:    Enter the coordinate of the upper left corner
                                  of the page.  Answer must be two positive
                                  integers separated by a comma (,), as follows:
                                  'Upper left row,Upper left column'.
                  DESCRIPTION:    The Page Coordinate property defines the
                                  location of the top left corner of the page on
                                  the screen.  The format of a coordinate is:
                                  Row,Column.  Regular pages normally have a Page
                                  Coordinate of  "1,1".  They do not have a Lower
                                  Right Coordinate.

                                  The Page Coordinate of pop-up pages defines the
                                  position of the top left corner of the border
                                  of the pop-up page.  Pop-up pages must have a
                                  Lower Right Coordinate, which defines the
                                  position of the bottom right corner of the
                                  border of the pop-up page.

                                  All blocks on the page are positioned relative
                                  to the page on which they are defined.  If a
                                  page is moved -- that is, if the Page
                                  Coordinate is changed -- all blocks and all
                                  fields on that page move with it.


  .4031,3         NEXT PAGE            0;4 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>999.9)!(X<1)!(X?.E1"."2N.N) X
                  HELP-PROMPT:    Answer must be a Number between 1 and 999.9, 1
                                  Decimal Digit.
                  DESCRIPTION:    Enter the page to go to when the user presses
                                  <PF1><Down> or selects the NEXT PAGE command
                                  from the Command Line.

                                  When the user attempts a Save, ScreenMan
                                  follows the Next Page links starting with the
                                  first page displayed to the user.  ScreenMan
                                  loads all those pages, including any defaults,
                                  and checks that all required fields have
                                  values.  If any of the required fields have
                                  null values, no Save occurs.  If all required
                                  field have values, Screenman Saves the data,
                                  including all defaults.


  .4031,4         PREVIOUS PAGE        0;5 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>999.9)!(X<1)!(X?.E1"."2N.N) X
                  HELP-PROMPT:    Answer must be a Number between 1 and 999.9, 1
                                  Decimal Digit.
                  DESCRIPTION:    Enter the page to go to when the user presses
                                  <PF1><Up>.


  .4031,5         IS THIS A POP UP PAGE? 0;6 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                  LAST EDITED:    JUN 27, 1994
                  DESCRIPTION:    If the page is a pop-up page rather than a
                                  regular page, set this property to 'YES'.

                                  ScreenMan displays pop-up pages with a border,
                                  on top of what is already on the screen.  The
                                  top left coordinate of the pop-up page defines
                                  the location of the top left corner of the
                                  border.  Pop-up pages must also have a lower
                                  right coordinate, which defines the location of
                                  the bottom left corner of the border.

                  CROSS-REFERENCE:.4031^AC^MUMPS
                                  1)= S:X $P(^DIST(.403,DA(1),40,DA,0),U,2)=""
                                  2)= Q
                                  3)= Programmer only
                                  If this is a pop up page, there can be no
                                  header block.



  .4031,6         LOWER RIGHT COORDINATE 0;7 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>7!($L(X)<1)!'(X?.N1",".N) X
                  LAST EDITED:    SEP 08, 1994
                  HELP-PROMPT:    Enter the coordinate of the bottom right corner
                                  of the pop up page.  Answer must be two
                                  positive integers separated by a comma (,), as
                                  follows:  'Lower right row,Lower right column'.
                  DESCRIPTION:    The existence of a lower right coordinate
                                  implies that the page is a pop-up page.  The
                                  lower right coordinate and the page coordinate
                                  define the position of the border ScreenMan
                                  displays when it paints a pop-up page.


  .4031,7         PAGE NAME            1;1 FREE TEXT

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)
                                  <3)!(X=+$P(X,"E")) X
                  LAST EDITED:    OCT 20, 1993
                  HELP-PROMPT:    Enter the name of the page, 3-30 characters in
                                  length.
                  DESCRIPTION:    Like the Page Number, you can use the Page Name
                                  to refer to a page in ScreenMan functions and
                                  utilities.  ScreenMan displays the Page Name to
                                  the user if, during an attempt to file data,
                                  ScreenMan finds required fields with null
                                  values.  ScreenMan uses the Caption of the
                                  field and the Page Name to inform the user of
                                  the location of the required field.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:.4031^C^MUMPS
                                  1)= S ^DIST(.403,DA(1),40,"C",$$UP^DILIBF(X),DA
                                  )=""

                                  2)= K ^DIST(.403,DA(1),40,"C",$$UP^DILIBF(X),DA
                                  )
                                  3)= Programmer only
                                  This cross reference is a regular index of the
                                  page name converted to all upper case
                                  characters.



  .4031,8         PARENT FIELD         1;2 FREE TEXT

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>92!($L(X)
                                  <5)!'(X?1.E1","1.E1","1.E) X I $D(X) D PFIELD^D
                                  DSIT
                  LAST EDITED:    DEC 01, 1993
                  HELP-PROMPT:    Answer must be 5-92 characters in length.
                  DESCRIPTION:    This property can be used instead of Subpage
                                  Link to link a subpage to a field.

                                  Parent Field has the following format:

                                         Field id,Block id,Page id

                                  where,

                                         Field id  =  Field Order number; or
                                                      Caption of the field; or
                                                      Unique Name of the field

                                         Block id  =  Block Order number; or
                                                      Block Name

                                         Page id   =  Page Number; or
                                                      Page Name

                                  For example:

                                         ZZFIELD 1,ZZBLOCK 1,ZZPAGE 1

                                  identifies the field with Caption or Unique
                                  Name "ZZFIELD 1," on the block named "ZZBLOCK
                                  1," on the page named "ZZPAGE 1".

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .4031,11        PRE ACTION           11;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  HELP-PROMPT:    Enter Standard MUMPS code that will be executed
                                  before the user reaches a page.
                  DESCRIPTION:    This MUMPS code is executed when the user
                                  reaches a page.

                  WRITE AUTHORITY:@

  .4031,12        POST ACTION          12;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  HELP-PROMPT:    Enter Standard MUMPS code that will be executed
                                  after the user leaves a page.
                  DESCRIPTION:    This MUMPS code is executed when the user
                                  leaves the page.

                  WRITE AUTHORITY:@

  .4031,15        DESCRIPTION          15;0   WORD-PROCESSING #.403115


  .4031,40        BLOCK                40;0 POINTER Multiple #.4032

                  IDENTIFIED BY:
                      "WRITE":    D EN^DDIOL("(Block Order "_$P(^(0),U,2)_")","",
                                  "?35")

  .4032,.01         BLOCK NAME           0;1 POINTER TO BLOCK FILE (#.404)
                                     (Multiply asked)

                    INPUT TRANSFORM:S:$D(X) DINUM=X
                    LAST EDITED:    MAY 21, 1993
                    DESCRIPTION:    Enter the name of the block to be placed on
                                    this page of the form.

                    NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                    CROSS-REFERENCE:.4032^B
                                  1)= S ^DIST(.403,DA(2),40,DA(1),40,"B",$E(X,1,3
                                  0),DA)=""

                                  2)= K ^DIST(.403,DA(2),40,DA(1),40,"B",$E(X,1,3
                                  0),DA)

                    CROSS-REFERENCE:.403^AB
                                  1)= S ^DIST(.403,"AB",$E(X,1,30),DA(2),DA(1),DA
                                  )=""

                                  2)= K ^DIST(.403,"AB",$E(X,1,30),DA(2),DA(1),DA
                                  )
                                  This cross reference provides an index that can
                                  be used to determine the forms on which a block
                                  is used.



  .4032,1           BLOCK ORDER        0;2 NUMBER (Required)

                    INPUT TRANSFORM:K:+X'=X!(X>99.9)!(X<1)!(X?.E1"."2N.N)!$D(^DIS
                                  T(.403,DA(2),40,DA(1),40,"AC",X)) X
                    HELP-PROMPT:  Enter a number between 1 and 99.9, 1 Decimal
                                  Digit, which represents the order in which the
                                  block will be processed within the page.  This
                                  number must be unique for the page.
                    DESCRIPTION:  The Block Order determines the order users
                                  traverse fields on a page when they press
                                  <PF1><PF4> to go to the next block, or press
                                  <RET> to move from the last field on one block
                                  to the first field on the next.  When the user
                                  first reaches a page, ScreenMan places the user
                                  on the block with the lowest Block Order
                                  number.

                    NOTES:        XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                    CROSS-REFERENCE:.4032^AC
                                  1)= S ^DIST(.403,DA(2),40,DA(1),40,"AC",$E(X,1,
                                  30),DA)=""

                                  2)= K ^DIST(.403,DA(2),40,DA(1),40,"AC",$E(X,1,
                                  30),DA)
                                  This cross-reference is used to ensure that
                                  order numbers are unique for the page.



  .4032,2           BLOCK COORDINATE   0;3 FREE TEXT

                    INPUT TRANSFORM:K:$L(X)>7!($L(X)<1)!'(X?.N1",".N) X
                    LAST EDITED:  SEP 08, 1994
                    HELP-PROMPT:  Enter the block coordinate relative to the page
                                  coordinate.  Answer must be two positive
                                  integers separated by a comma (,), as follows:
                                  'Upper left row,Upper left column.'
                    DESCRIPTION:  The block coordinate is relative to the page
                                  coordinate.  The first row and column on the
                                  block have a coordinate of 1,1.


  .4032,3           TYPE OF BLOCK      0;4 SET

                                  'e' FOR EDIT;
                                  'd' FOR DISPLAY;
                    LAST EDITED:  APR 13, 1994
                    DESCRIPTION:  Enter 'EDIT' if users can navigate to as well
                                  as edit fields in this block.  Enter 'DISPLAY'
                                  if users cannot edit any of the fields in this
                                  block.  User's can navigate to a DISPLAY block
                                  only if it contains multiple or word processing
                                  fields, in which case, the cursor stops at any
                                  of those two kinds of fields so that the user
                                  can press <RET> to view or edit the subfields
                                  in the multiple or invoke an editor to view the
                                  contents of the word processing field.


  .4032,4           POINTER LINK       1;1 FREE TEXT

                    INPUT TRANSFORM:K:$L(X)>245!($L(X)<1) X I $D(X) D PLINK^DDSIT
                    LAST EDITED:  DEC 01, 1993
                    HELP-PROMPT:  Answer must be 1-245 characters in length.
                    DESCRIPTION:  If the fields displayed in this block are
                                  reached through a relational jump from the
                                  primary file of the form, enter the relational
                                  expression that describes this jump.  Your
                                  frame of reference is the primary file of the
                                  form.

                                  For example, if the primary file has a field
                                  #999 called TEST that points to the file
                                  associated with this block, enter

                                       999 or TEST

                    NOTES:        XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  .4032,5           REPLICATION        2;1 NUMBER

                    INPUT TRANSFORM:K:+X'=X!(X>999)!(X<2)!(X?.E1"."1N.N) X
                    LAST EDITED:  MAY 03, 1994
                    HELP-PROMPT:  Type a Number between 2 and 999, 0 Decimal
                                  Digits
                    DESCRIPTION:  If this is a repeating block, enter the number
                                  of times the fields defined in this block
                                  should be replicated.  If used, this number
                                  must be greater than 1.


  .4032,6           INDEX              2;2 FREE TEXT

                    INPUT TRANSFORM:K:$L(X)>63!($L(X)<1) X
                    HELP-PROMPT:  Answer must be 1-63 characters in length.
                    DESCRIPTION:  Enter the name of the cross reference that
                                  should be used to pick up the subentries in the
                                  multiple.  ScreenMan will initially display the
                                  subentries to the user sorted in the order
                                  defined by this index.  The default INDEX is B.

                                  If the multiple has no index, or you wish to
                                  display the subentries in record number order,
                                  enter !IEN.


  .4032,7           INITIAL POSITION   2;3 SET

                                  'f' FOR FIRST;
                                  'l' FOR LAST;
                                  'n' FOR NEW;
                                  'u' FOR USER'S LAST;
                    LAST EDITED:  MAY 03, 1994
                    HELP-PROMPT:  Enter the initial position within the repeating
                                  block; f(FIRST), l(LAST), n(NEW), or u(USER'S
                                  LAST).
                    DESCRIPTION:  This is the position in the list where the
                                  cursor should initially rest when the user
                                  first navigates to the repeating block.  NEW
                                  indicates that the cursor should initially rest
                                  on the blank line at the end of the list.
                                  USER'S LAST is the last choice that the User
                                  has made for this file -- what  would be
                                  retrieved by the SPACE-BAR.  The default
                                  INITIAL POSITION is FIRST.


  .4032,8           DISALLOW LAYGO     2;4 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                    LAST EDITED:  MAY 05, 1994
                    DESCRIPTION:  If set to YES, this prohibits the user from
                                  entering new subentries into the multiple.  If
                                  null or set to NO, the setting in the data
                                  dictionary determines whether LAYGO is allowed.



  .4032,9           FIELD FOR SELECTION 2;5 FREE TEXT

                    INPUT TRANSFORM:K:$L(X)>30!($L(X)<1) X
                    LAST EDITED:  MAY 06, 1994
                    HELP-PROMPT:  Answer must be 1-30 characters in length.
                    DESCRIPTION:  This is the field order of the field that
                                  defines the column position of the blank line
                                  at the end of the list.  The default is the
                                  first editable field in the block.  This is
                                  also the field before which ScreenMan prints
                                  the plus sign (+) to indicate there are more
                                  entries above or below the displayed list.


  .4032,10          ASK 'OK'           2;6 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                    LAST EDITED:  APR 20, 1999
                    DESCRIPTION:  Answer 'YES' to ask the user whether the
                                  looked-up entry is 'OK'. If only one match is
                                  made to the user's lookup value, then ScreenMan
                                  will ask "OK?" instead of automatically
                                  selecting the found entry. This property
                                  corresponds to the "V" flag in the DIC(0) input
                                  variable to ^DIC and only pertains to
                                  multiple-valued fields.


  .4032,11          PRE ACTION         11;E1,245 MUMPS

                    INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                    LAST EDITED:  JUN 10, 1993
                    HELP-PROMPT:  This is Standard MUMPS code.
                    DESCRIPTION:  Enter MUMPS code that is executed whenever the
                                  user reaches this block.

                                  This pre-action is a characteristic of the
                                  block only as it is used on this form.  If you
                                  place this block on another form, you can
                                  define a different pre-action.

                    WRITE AUTHORITY:@

  .4032,12          POST ACTION        12;E1,245 MUMPS

                    INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                    LAST EDITED:  JUN 10, 1993
                    HELP-PROMPT:  This is Standard MUMPS code.
                    DESCRIPTION:  Enter MUMPS code that is executed whenever the
                                  user leaves this block.

                                  This post-action is a characteristic of the
                                  block only as it is used on this form.  If you
                                  place this block on another form, you can
                                  define a different post-action.

                    WRITE AUTHORITY:@

  .4032,98          COMPUTED MULTIPLE  COMP MUL;E1,999 MUMPS

                    INPUT TRANSFORM:D ^DIM
                    HELP-PROMPT:  Enter valid MUMPS code
                    DESCRIPTION:  This MUMPS code will display a list of the
                                  values of the .01 field of the File being
                                  edited.  The code must Xecute the DICMX
                                  variable with D0 set to the IEN of the entry to
                                  be displayed.  The code is automatically
                                  generated for a record selection page.


  .4032,98.1        COMPUTED MUL PTR   COMP MUL PTR;E1,999 NUMBER

                    INPUT TRANSFORM:K:+$P(X,"E")'=X X
                    HELP-PROMPT:  Enter a number with up to 13 digits and 9
                                  decimal places
                    DESCRIPTION:  The field contains the File# of the file from
                                  which the Computed Multiple values are
                                  retrieved (usually the file being edited by the
                                  Form).
  .403,21400    BUILD(S)                ;  COMPUTED MULTIPLE POINTER TO BUILD FIL
                                  E (#9.6)

                MUMPS CODE:       N DISNAME,D S DISNAME=$P($G(^DIST(.403,D0,0)),U
                                  )_"    FILE #"_$P($G(^(0)),U,8) F D=0:0 S D=$O(
                                  ^XPD(9.6,D)) Q:'D  I $D(^(D,"KRN",.403,"NM","B"
                                  ,DISNAME)) N D0 S D0=D,X=$P(^XPD(9.6,D,0),U) X
                                  DICMX Q:'$D(D)
                DESCRIPTION:      The Build File (#9.6) is searched for Builds
                                  containing the ScreenMan Form.  A list of the
                                  identified Builds is created for display.
                                  Multiple Builds will be shown if appropriate.



        FILES POINTED TO                      FIELDS

  BLOCK (#.404)                     PAGE:HEADER BLOCK (#1)
                                    BLOCK:BLOCK NAME (#.01)

  BUILD (#9.6)                      BUILD(S) (#21400)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):
  DDGF BLOCK EDIT               APR 13, 1993        USER #0
    DDGF BLOCK EDIT 1             DD #.4032
    DDGF BLOCK EDIT 2             DD #.404
    DDGF BLOCK EDIT OTHER         DD #.4032

  DDGF FORM EDIT                APR 27, 1993        USER #0
    DDGF FORM EDIT                DD #.403

  DDGF HEADER BLOCK EDIT        MAY 04, 1993        USER #0
    DDGF BLOCK EDIT 2             DD #.404
    DDGF HEADER BLOCK EDIT        DD #.4031

  DDGF PAGE ADD                 APR 19, 1993        USER #0
    DDGF PAGE ADD                 DD #.4031
    DDGF PAGE ADD ARE YOU SURE    DD #.4031

  DDGF PAGE EDIT                APR 19, 1993        USER #0
    DDGF PAGE EDIT                DD #.4031

  DDGF PAGE SELECT              APR 19, 1993        USER #0
    DDGF PAGE SELECT              DD #.4031

FUNCTION
--------

::

  STANDARD DATA DICTIONARY #.5 -- FUNCTION FILE
  STORED IN ^DD("FUNC",

  This file stores information about FUNCTIONS used by FileMan.  The first 100
  records in this file are reserved for functions brought in during the FileMan
  INIT process.  The rest of the file is available for other developers to enter
  their own functions.


                DD ACCESS: ^
                WR ACCESS: @
             LAYGO ACCESS: @

  CROSS
  REFERENCED BY: NAME(B)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  .5,.01        NAME                   0;1 FREE TEXT (Required)

                INPUT TRANSFORM:  K:$L(X)<2!($L(X)>30)!(X'?1U.ANP)!(X["$") X
                HELP-PROMPT:      Function Name must be 2-30 characters long,
                                  beginning with Alpha.
                DELETE TEST:      1,0)= I DA<100

                CROSS-REFERENCE:  .5^B
                                  1)= S @(DIC_"""B"",X,DA)=""""")
                                  2)= K @(DIC_"""B"",X,DA)")


  .5,.02        MUMPS CODE             1;E1,255 FREE TEXT (Required)

                INPUT TRANSFORM:  D ^DIM I $D(X),'$D(DIQUIET),'$D(DDS) W "  ..OK"
                HELP-PROMPT:      Enter MUMPS code that sets a value into 'X'.
                EXECUTABLE HELP:  N D1 S D1(1)="For a 1-argument function, use 'X
                                  ' as the argument.",D1(2)="For a 2-argument fun
                                  ction, use 'X1' and 'X'.",D1(3)="Avoid FORs, IF
                                  s, and single-character scratch variables.",D1(
                                  4)="" D EN^DDIOL(.D1)
                WRITE AUTHORITY:  @

  .5,1          EXPLANATION            9;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245 X

  .5,2          DATE-VALUED            2;1 SET

                                  'D' FOR YES;
                                  'X' FOR NO;
                                  'O' FOR OPTIONAL (DEPENDS ON VALUE OF ARGUMENT)
                                  ;

  .5,9          NUMBER OF ARGUMENTS    3;1 NUMBER

                INPUT TRANSFORM:  K:X\1'=X!(X>8) X

  .5,10         WORD-PROCESSING        10;1 SET

                                  'W' FOR MEANINGFUL ONLY FOR W-P;


  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):

DIALOG
------

::

  STANDARD DATA DICTIONARY #.84 -- DIALOG FILE
  STORED IN ^DI(.84,

  This file stores the dialog used to 'talk' to a user (error messages, help
  text, and other prompts.) Entry points in the ^DIALOG routine retrieve text
  from this file.  Variable parameters can be passed to these calls.  The
  parameters are inserted into windows within the text as it is built.  The text
  is returned in an array.  This file and associated calls can be used by any
  package to pass information in arrays rather than writing to the current
  device.  Record numbers 1 through 10000 are reserved for VA FileMan.


                DD ACCESS: ^
                WR ACCESS: ^
               DEL ACCESS: ^
             LAYGO ACCESS: ^
  IDENTIFIED BY:
        "WRITE": N DIALID S DIALID(1)=$P($G(^(0)),U,5) S:DIALID(1)="" DIALID=+$O(
                 ^(2,0)),DIALID(1)=$E($G(^(DIALID,0)),1,42) S DIALID(1,"F")="?10"
                  D EN^DDIOL(.DIALID)

  POINTED TO BY: FILEMAN_ERROR field (#4) of the SQLI_ERROR_LOG File (#1.52192)


  CROSS
  REFERENCED BY: DIALOG NUMBER(B), PACKAGE(C), SHORT DESCRIPTION(D)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  .84,.01       DIALOG NUMBER          0;1 NUMBER (Required)

                INPUT TRANSFORM:  K:+X'=X!(X>9999999999.999)!(('$G(DIFROM))&(X<10
                                  000.001))!(X?.E1"."4N.N) X S:$G(X) DINUM=X
                LAST EDITED:      JUN 23, 1994
                HELP-PROMPT:      Type a Number between 10000.001 and
                                  9999999999.999, up to 3 Decimal Digits
                DESCRIPTION:      The dialogue number is used to uniquely
                                  identify a message.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  .84^B
                                  1)= S ^DI(.84,"B",$E(X,1,30),DA)=""
                                  2)= K ^DI(.84,"B",$E(X,1,30),DA)


  .84,1         TYPE                   0;2 SET (Required)

                                  '1' FOR ERROR;
                                  '2' FOR GENERAL MESSAGE;
                                  '3' FOR HELP;
                LAST EDITED:      MAY 23, 1994
                HELP-PROMPT:      Enter code that reflects how this dialogue is
                                  used when talking to the users.
                DESCRIPTION:      This code is used to group the entries in the
                                  FileMan DIALOG file, according to how they are
                                  used when interacting with the user.

                TECHNICAL DESCR:  This field is used to tell the DIALOG routines
                                  what array to use in returning the dialogue.
                                  It is also used for grouping the dialogue for
                                  reporting purposes.


  .84,1.2       PACKAGE                0;4 POINTER TO PACKAGE FILE (#9.4)

                LAST EDITED:      JUN 23, 1994
                HELP-PROMPT:      Enter the name of the Package that owns and
                                  distributes this entry.
                DESCRIPTION:      This is a pointer to the Package file.  Each
                                  entry in this file belongs to, and is
                                  distributed by, a certain package.  The Package
                                  field should be filled in for each entry on
                                  this file.

                CROSS-REFERENCE:  .84^C
                                  1)= S ^DI(.84,"C",$E(X,1,30),DA)=""
                                  2)= K ^DI(.84,"C",$E(X,1,30),DA)
                                  Cross-reference on Package file.  Used for
                                  identifying DIALOG entries by the package that
                                  owns the entry, and for populating the BUILD
                                  file during package distribution.



  .84,1.3       SHORT DESCRIPTION      0;5 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>42!($L(X)<1) X
                LAST EDITED:      APR 26, 1996
                HELP-PROMPT:      Description used to identify entry on lookup.
                                  Answer must be 1-42 characters in length.
                DESCRIPTION:      Short description is used to identify an entry
                                  on lookup.  The "WRITE" identifier will display
                                  this description if it is not null.

                CROSS-REFERENCE:  .84^D
                                  1)= S ^DI(.84,"D",$E(X,1,30),DA)=""
                                  2)= K ^DI(.84,"D",$E(X,1,30),DA)


  .84,2         DESCRIPTION            1;0   WORD-PROCESSING #.842

                DESCRIPTION:
                                    Used for internal documentation purposes.


  .84,3         INTERNAL PARAMETERS NEEDED 0;3 SET

                                  'y' FOR YES;
                LAST EDITED:      NOV 05, 1993
                DESCRIPTION:        Some dialogue is built by inserting variable
                                  text (internal parameters) into windows in the
                                  word-processing TEXT field.  The insertable
                                  text might be, for example, File or Field
                                  names.  This field should be set to YES if any
                                  internal parameters need to be inserted into
                                  the TEXT.  If the field is not set to YES, the
                                  DIALOG routine will not go through the part of
                                  the code that stuffs the internal parameters
                                  into the text.


  .84,4         TEXT                   2;0   WORD-PROCESSING #.844   (NOWRAP)

                DESCRIPTION:      Actual text of the message.  If parameters
                                  (variable pieces of text) are to be inserted
                                  into the dialogue when the message is built,
                                  the parameter will appear as a 'window' in this
                                  TEXT field, surrounded by vertical bars.  The
                                  data within the 'window' will represent a
                                  subscript of the input parameter list that is
                                  passed to BLD^DIALOG or $$EZBLD^DIALOG when
                                  building the message. This same subscript
                                  should be used as the .01 of the PARAMETER
                                  field in this file to document the parameter.


  .84,5         PARAMETER              3;0 Multiple #.845
                                   (Add New Entry without Asking)

                DESCRIPTION:      This multiple is used for documentation
                                  purposes only.  It documents the parameters
                                  passed to the BLD^DIALOG and $$EZBLD^DIALOG
                                  message building calls.  The parameters are
                                  identified and their purpose described.


  .845,.01        PARAMETER SUBSCRIPT    0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:  K:$L(X)>20!($L(X)<1) X
                  LAST EDITED:      NOV 05, 1993
                  HELP-PROMPT:      This entry corresponds to the subscript of an
                                    entry in either the text or output parameter
                                    list to the BLD^DIALOG and $$EZBLD^DIALOG
                                    routine.  Answer must be 1-20 characters in
                                    length.
                  DESCRIPTION:      This multiple is used for documentation
                                    purposes only.  The entry in the .01 field of
                                    this multiple will correspond to a subscript
                                    in either the text or output parameter list,
                                    that are passed to the routines that build
                                    dialogue messages, BLD^DIALOG and
                                    $$EZBLD^DIALOG. This routine will insert into
                                    each 'window' from the TEXT field, the
                                    corresponding entry out of the text parameter
                                    list.  For errors only, it passes any entries
                                    from the output parameter list back to the
                                    user as entries in its output array.

                  CROSS-REFERENCE:  .845^B
                                    1)= S ^DI(.84,DA(1),3,"B",$E(X,1,30),DA)=""
                                    2)= K ^DI(.84,DA(1),3,"B",$E(X,1,30),DA)


  .845,1          PARAMETER DESCRIPTION  0;2 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>230!($L(X)<1) X
                  LAST EDITED:      JUN 14, 1993
                  HELP-PROMPT:      Describe the Parameter for documentation
                                    purposes.  Answer must be 1-230 characters in
                                    length.
                  DESCRIPTION:      This field is used for documentation purposes
                                    only.  It describes the text and/or output
                                    parameter(s) that are passed to BLD^DIALOG
                                    and $$EZBLD^DIALOG. The same parameter can be
                                    used both as a text parameter (i.e., inserted
                                    into the text when it is built), and as an
                                    output parameter (i.e., a parameter passed
                                    back in a list to the user)




  .84,6         POST MESSAGE ACTION    6;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      MAY 20, 1994
                HELP-PROMPT:      This is Standard MUMPS code.  This code will be
                                  executed whenever this message is retrieved
                                  through a call to BLD^DIALOG or $$EZBLD^DIALOG.
                DESCRIPTION:      If some special action should be taken whenever
                                  this message is built, MUMPS code can be
                                  entered here.  This code will be executed by
                                  the BLD^DIALOG or $$EZBLD^DIALOG routines,
                                  immediately after the message text has been
                                  built in the output array.  For example, the
                                  code could set a special flag into a global or
                                  local variable to notify the calling routine
                                  that some extra action needed to be taken.

                TECHNICAL DESCR:  At the time of executing this code
                                   D0 = IEN for the entry in the DIALOG file
                                   DIPI(n) = (for sequential number n) parameters
                                  incorporated in the text.
                                   DIPE(n) = parameters output back to the user

                                  All other variables used in this code should
                                  use your packages namespace, and should be
                                  NEWed.

                WRITE AUTHORITY:  @

  .84,7         TRANSLATION            4;0 POINTER Multiple #.847
                                   (Add New Entry without Asking)

                DESCRIPTION:      This multiple holds the translations of Dialog
                                  file entries.  The language into which the
                                  entry is translated and the text of the
                                  translation are recorded.


  .847,.01        LANGUAGE               0;1 POINTER TO LANGUAGE FILE (#.85)

                  INPUT TRANSFORM:S DIC("S")="I Y>1,$P(^(0),U,7)=""L""" D ^DIC K
                                  DIC S DIC=DIE,X=+Y K:Y<0 X S:$G(X) DINUM=X
                  LAST EDITED:    MAY 24, 1994
                  HELP-PROMPT:    Enter the number or name for a non-English,
                                  Living language.
                  DESCRIPTION:    Pointer to the LANGUAGE file. If FileMan system
                                  variable DUZ("LANG") is set to an integer
                                  greater than 1, we use that number to extract
                                  dialogue text for the specified language from
                                  this multiple.

                  SCREEN:         S DIC("S")="I Y>1,$P(^(0),U,7)=""L"""
                  EXPLANATION:    English language and non-Living languages canno
                                  t be selected.
                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:.847^B
                                  1)= S ^DI(.84,DA(1),4,"B",$E(X,1,30),DA)=""
                                  2)= K ^DI(.84,DA(1),4,"B",$E(X,1,30),DA)


  .847,1          FOREIGN TEXT         1;0   WORD-PROCESSING #.8471   (NOWRAP)

                  DESCRIPTION:    Insert here the non-English equivalent for this
                                  language to the text in the TEXT field for this
                                  entry.  This field may contain windows for
                                  variable parameters the same as the TEXT field.

  .84,8         CALLED FROM ENTRY POINTS 5;0 Multiple #.841
                                   (Add New Entry without Asking)

                DESCRIPTION:      This multiple is used for documentation only.
                                  Entries are made to this multiple ONLY for
                                  ERROR type text.  The routine and tag
                                  combinations that generate the error are
                                  identified.


  .841,.01        ROUTINE NAME           0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:  K:$L(X)>8!($L(X)<1) X
                  LAST EDITED:      APR 11, 1994
                  HELP-PROMPT:      Answer must be 1-8 characters in length.
                  DESCRIPTION:      This multiple is used for documentation only.
                                    Entries are made to this subfile ONLY for
                                    ERROR type text.  Enter the routine name of
                                    an entry point that may generate this error
                                    message.  You only need to enter the names of
                                    routines that directly generate the error
                                    through a call to ^DIALOG, and not when the
                                    error is generated by some other utility
                                    called from your routine.

                  CROSS-REFERENCE:  .841^B
                                    1)= S ^DI(.84,DA(1),5,"B",$E(X,1,30),DA)=""
                                    2)= K ^DI(.84,DA(1),5,"B",$E(X,1,30),DA)


  .841,.05        LINE TAG               0;2 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>10!($L(X)<1) X
                  LAST EDITED:      APR 11, 1994
                  HELP-PROMPT:      Answer must be 1-10 characters in length.
                  DESCRIPTION:      This multiple is used for documentation only.
                                    Entries are made to this subfile ONLY for
                                    ERROR type text.  Enter the line tag of an
                                    entry point that may generate this error
                                    message.  You only need to enter the names of
                                    routines that directly generate the error
                                    through a call to ^DIALOG, and not when the
                                    error is generated by some other utility
                                    called from your routine.





        FILES POINTED TO                      FIELDS

  LANGUAGE (#.85)                   TRANSLATION:LANGUAGE (#.01)

  PACKAGE (#9.4)                    PACKAGE (#1.2)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):

BULLETIN
--------

::

  STANDARD DATA DICTIONARY #3.6 -- BULLETIN FILE
  STORED IN ^XMB(3.6,

  Bulletins are 'Super' messages.  Each Bulletin has a text and a subject just
  like a normal message.  But embedded within either the subject or the text can
  be variable fields that can be filled in with parameters.  There is also a
  standard set of recipients in the form of a Mail Group that is associated with
  the bulletin.

  Bulletins are processed by MailMan either because of a special cross reference
  type of FileMan or because of a direct call in a routine.  The interface for
  the direct call is described in the documentation on programmer entry points.
  FileMan sets up code that will issue a bulletin automatically when the special
  cross reference type is created.  In either case the parameters that go into
  the text and/or the subject make each bulletin unique.


                DD ACCESS: #
                WR ACCESS: #
               DEL ACCESS: #

  POINTED TO BY: SERVER BULLETIN field (#220) of the OPTION File (#19)


  CROSS
  REFERENCED BY: NAME(B)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  3.6,.01       NAME                   0;1 FREE TEXT (Required)

                A Unique name of bulletin, beginning with the package prefix
                INPUT TRANSFORM:  D CHKNAME^XQ5 K:$L(X)>30!(X["""")!(+X=X)!($L(X)
                                  <3)!'(X'?1P.E)!(X'?.ANP) X
                LAST EDITED:      JUL 07, 1988
                HELP-PROMPT:      NAME MUST BE 3-30 CHARACTERS, NOT NUMERIC OR
                                  STARTING WITH PUNCTUATION
                DESCRIPTION:      This field is the name of the bulletin, in the
                                  standard format of a two character package
                                  prefix, followed by a descriptive name.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  3.6^B
                                  1)= S ^XMB(3.6,"B",$E(X,1,30),DA)=""
                                  2)= K ^XMB(3.6,"B",$E(X,1,30),DA)


  3.6,2         SUBJECT                0;2 FREE TEXT (Required)

                The subject of the message generated, as it will appear on the mes
  sage
                INPUT TRANSFORM:  K:$L(X)>65!($L(X)<3) X
                LAST EDITED:      SEP 22, 1983
                HELP-PROMPT:      ANSWER MUST BE 3-65 CHARACTERS IN LENGTH
                DESCRIPTION:      This is the subject of the bulletin, as it will
                                  appear to the recipient.  Note that it may
                                  contain windows, just as in the "MESSAGE"
                                  field.


  3.6,4         MAIL GROUP             2;0 POINTER Multiple #3.62

                DESCRIPTION:      This is a list of the mail groups to which this
                                  bulletin will be directed when triggered.  If
                                  no mail groups are defined, or they point to no
                                  users, then the bulletin is ignored.


  3.62,.01        MAIL GROUP             0;1 POINTER TO MAIL GROUP FILE (#3.8)
                                     (Multiply asked)

                  The list of Mail Group(s) to which this bulletin will be sent
                  LAST EDITED:      OCT 02, 1990
                  HELP-PROMPT:      To which mail group should this bulletin be
                                    sent?
                  DESCRIPTION:      This is the name of a mail group to which
                                    this bulletin will be directed when
                                    triggered.

                  CROSS-REFERENCE:  3.62^B
                                    1)= S ^XMB(3.6,DA(1),2,"B",$E(X,1,30),DA)=""
                                    2)= K ^XMB(3.6,DA(1),2,"B",$E(X,1,30),DA)




  3.6,5         RETENTION DAYS         0;3 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>365)!(X<0)!(X?.E1"."1N.N) X
                LAST EDITED:      MAR 25, 2002
                HELP-PROMPT:      Type a Number between 0 and 365, 0 Decimal
                                  Digits
                DESCRIPTION:      After this number of days, if the bulletin
                                  hasn't already been purged, it will be purged
                                  by the XMAUTOPURGE option.  If zero or null,
                                  the bulletin will not have a purge date, and
                                  will not be purged by XMAUTOPURGE.


  3.6,6         DESCRIPTION            3;0   WORD-PROCESSING #3.63

                DESCRIPTION:      This field is a description of the bulletin,
                                  for documentation purposes.  It is not used by
                                  MailMan for any automatic processing.


  3.6,10        MESSAGE                1;0   WORD-PROCESSING #3.61

                DESCRIPTION:      This holds the "canned" text of the bulletin
                                  which will be sent when the bulletin is fired.

                                  Variable text may be stored in parameters at
                                  the time of firing, then inserted in the
                                  message text.  Parameter windows are defined by
                                  putting them within vertical bars, with the
                                  parameter number inside.  For example,
                                  "Appointment for |1| on |2| has been
                                  cancelled."  with parameter 1 set to "Jones",
                                  and parameter 2 set to "Monday" would generate
                                  a bulletin of "Appointment for Jones on Monday
                                  has been cancelled."

                                  Parameters may be set with fileman (in the
                                  Bulletin cross reference) or by programmers
                                  from within programs.


  3.6,11        PARAMETER              4;0 Multiple #3.64
                                   (Add New Entry without Asking)

                DESCRIPTION:      This defines the parameters, which will be used
                                  to set information into the bulletin.

                IDENTIFIED BY:
                          "X":    W:$D(^(1,1))#2 "   ",^(1),"..."

  3.64,.01        PARAMETER              0;1 NUMBER (Multiply asked)

                  INPUT TRANSFORM:S DINUM=X K:+X'=X!(X>100)!(X<0)!(X?.E1"."1N.N)
                                  X,DINUM
                  LAST EDITED:    OCT 12, 1983
                  HELP-PROMPT:    TYPE A WHOLE NUMBER BETWEEN 0 AND 100
                  DESCRIPTION:    This defines a parameter which will be used to
                                  set information into the bulletin.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  3.64,1          DESCRIPTION          1;0   WORD-PROCESSING #3.65

                  DESCRIPTION:    This is a description of the parameter, to be
                                  inserted into the bulletin.  It is purely for
                                  documentation purposes.




  3.6,12        PRIORITY?              0;4 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      JUN 11, 1997
                HELP-PROMPT:      Should this bulletin be a priority message?
                DESCRIPTION:      If you want this bulletin to appear to the
                                  recipients as a priority message, enter 'yes';
                                  if not, enter 'no'.



        FILES POINTED TO                      FIELDS

  MAIL GROUP (#3.8)                 MAIL GROUP:MAIL GROUP (#.01)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):

MAIL GROUP
----------

::

  STANDARD DATA DICTIONARY #3.8 -- MAIL GROUP FILE
  STORED IN ^XMB(3.8,

  This file holds the names of all groups known to MailMan, and their members.


                DD ACCESS: #
                WR ACCESS: #
               DEL ACCESS: #

  POINTED TO BY: MAIL GROUP field (#.01) of the MAIL GROUP sub-field (#3.62) of
                     the BULLETIN File (#3.6)
                 MEMBER GROUP NAME field (#.01) of the MEMBER GROUPS sub-field
                     (#3.811) of the MAIL GROUP File (#3.8)
                 MAIL GROUP field (#.06) of the MASTER FILE PARAMETERS File
                     (#4.001)
                 MAIL GROUP field (#1938) of the PACKAGE File (#9.4)
                 MAIL GROUPS field (#.01) of the MAIL GROUPS sub-field (#9.951)
                     of the PATCH MONITOR PARAMETER File (#9.95)
                 DUPLICATE MANAGER MAIL GROUP field (#.11) of the DUPLICATE
                     RESOLUTION File (#15.1)
                 VERIFIED DUPLICATE MAIL GROUP field (#.16) of the DUPLICATE
                     RESOLUTION File (#15.1)
                 MERGE MAIL GROUP field (#.29) of the DUPLICATE RESOLUTION File
                     (#15.1)
                 MAIL GROUP field (#.02) of the ANCILLARY SERVICE sub-field
                     (#15.12) of the DUPLICATE RESOLUTION File (#15.1)
                 SERVER MAIL GROUP field (#222) of the OPTION File (#19)
                 REVIEW MAIL GROUP field (#.06) of the PRF LOCAL FLAG File
                     (#26.11)
                 REVIEW MAIL GROUP field (#.06) of the PRF NATIONAL FLAG File
                     (#26.15)
                 APPT. UPDATE MAIL GROUP field (#215) of the MAS PARAMETERS File
                     (#43)
                 NPCDB MAIL GROUP field (#216) of the MAS PARAMETERS File (#43)
                 LATE ACTIVITY MAIL GROUP field (#217) of the MAS PARAMETERS File
                     (#43)
                 API ERRORS MAIL GROUP field (#226) of the MAS PARAMETERS File
                     (#43)
                 DEATH GROUP field (#500) of the MAS PARAMETERS File (#43)
                 NEW PATIENT GROUP field (#501) of the MAS PARAMETERS File (#43)
                 NAME CHANGE GROUP field (#502) of the MAS PARAMETERS File (#43)
                 SSN CHANGE GROUP field (#503) of the MAS PARAMETERS File (#43)
                 UNVERIFIED ADMIT GROUP field (#504) of the MAS PARAMETERS File
                     (#43)
                 INCONSISTENCY EDIT GROUP field (#505) of the MAS PARAMETERS File
                     (#43)
                 NON-VETERAN ADMIT GROUP field (#506) of the MAS PARAMETERS File
                     (#43)
                 OVERDUE ABSENCES GROUP field (#507) of the MAS PARAMETERS File
                     (#43)
                 PATIENT DELETED GROUP field (#508) of the MAS PARAMETERS File
                     (#43)
                 SENSITIVE REC ACCESSED GROUP field (#509) of the MAS PARAMETERS
                     File (#43)
                 SENSITIVITY REMOVED GROUP field (#510) of the MAS PARAMETERS
                     File (#43)
                 AUTO RECALC GROUP field (#511) of the MAS PARAMETERS File (#43)
                 MEANS TEST REQUIRED GROUP field (#512) of the MAS PARAMETERS
                     File (#43)
                 IRT SHORT FORM LIST GROUP field (#513) of the MAS PARAMETERS
                     File (#43)
                 *UB82 CANCELLATION MAILGROUP field (#906) of the MAS PARAMETERS
                     File (#43)
                 *UB82 DISAPPROVED MAILGROUP field (#908) of the MAS PARAMETERS
                     File (#43)
                 DWO ENTITY MAIL GROUP field (#.01) of the DWO ENTITY MAIL GROUP
                     sub-field (#58.60141) of the DWO MESSAGE ENTITY sub-field
                     (#58.6014) of the PADE INVENTORY SYSTEM File (#58.601)
                 CONFIG ERRORS MAIL GROUPS field (#.01) of the CONFIG ERRORS MAIL
                     GROUP sub-field (#58.6015) of the PADE INVENTORY SYSTEM File
                     (#58.601)
                 DATA ERRORS MAIL GROUPS field (#.01) of the DATA ERRORS MAIL
                     GROUP sub-field (#58.6016) of the PADE INVENTORY SYSTEM File
                     (#58.601)
                 MAIL GROUP FOR NOTIFICATION field (#5) of the DIVISION sub-field
                     (#58.74) of the PADE SYSTEM SETUP File (#58.7)
                 ADJUSTMENT MAIL GROUP field (#32) of the DRUG ACCOUNTABILITY
                     STATS File (#58.8)
                 STAT NOW MAIL GROUP field (#5) of the INPATIENT WARD PARAMETERS
                     File (#59.6)
                 MAIL GROUP field (#.02) of the ALERT CONDITION sub-field
                     (#62.481) of the LA7 MESSAGE PARAMETER File (#62.48)
                 Report Mail Group field (#1) of the LAB SEARCH/EXTRACT PROTOCOL
                     File (#69.4)
                 Receive Alerts field (#.01) of the Receive Alerts sub-field
                     (#69.45) of the LAB SEARCH/EXTRACT PROTOCOL File (#69.4)
                 RADIOLOGY NTRT MAIL GROUP field (#6) of the MASTER RADIOLOGY
                     SITE File (#71.98)
                 CODE ISSUE MAIL GROUP field (#43) of the SURGERY SITE PARAMETERS
                     File (#133)
                 ERROR MESSAGE RECIPIENT field (#.06) of the HEALTH SUMMARY
                     PARAMETERS File (#142.99)
                 SCI NOTIFICATION MAIL GROUP field (#7) of the SCD SITE
                     PARAMETERS File (#154.91)
                 MS NOTIFICATION MAIL GROUP field (#8) of the SCD SITE PARAMETERS
                     File (#154.91)
                 MISSING RECORD MAIL GROUP field (#12) of the RECORD TRACKING
                     APPLICATION File (#195.1)
                 CLINIC REQUESTS MAIL GROUP field (#14) of the RECORD TRACKING
                     APPLICATION File (#195.1)
                 CANCELATION MAIL GROUP field (#22) of the RECORD TRACKING
                     APPLICATION File (#195.1)
                 IVM MESSAGES MAIL GROUP field (#.02) of the IVM SITE PARAMETER
                     File (#301.9)
                 ENROLLMENT ALERT MAIL GROUP field (#.09) of the IVM SITE
                     PARAMETER File (#301.9)
                 MAIL GROUP field (#20.02) of the AR SITE PARAMETER File (#342)
                 LOCAL MAILGROUP field (#23) of the AR TRANSMISSION RECORDS File
                     (#349)
                 LOCAL MAILGROUP field (#.01) of the LOCAL MAILGROUP sub-field
                     (#349.12) of the AR TRANSMISSION TYPE File (#349.1)
                 COPAY BACKGROUND ERROR GROUP field (#.09) of the IB SITE
                     PARAMETERS File (#350.9)
                 MEANS TEST BILLING MAIL GROUP field (#.11) of the IB SITE
                     PARAMETERS File (#350.9)
                 COPAY EXEMPTION MAIL GROUP field (#.13) of the IB SITE
                     PARAMETERS File (#350.9)
                 BILL CANCELLATION MAILGROUP field (#1.07) of the IB SITE
                     PARAMETERS File (#350.9)
                 BILL DISAPPROVED MAILGROUP field (#1.09) of the IB SITE
                     PARAMETERS File (#350.9)
                 NEW INSURANCE MAIL GROUP field (#4.04) of the IB SITE PARAMETERS
                     File (#350.9)
                 UNBILLED MAIL GROUP field (#6.25) of the IB SITE PARAMETERS File
                     (#350.9)
                 GENERAL ERROR MSG MAIL GROUP field (#50.03) of the IB SITE
                     PARAMETERS File (#350.9)
                 COMM ERR MSG MAIL GROUP field (#50.04) of the IB SITE PARAMETERS
                     File (#350.9)
                 MESSAGES MAILGROUP field (#51.04) of the IB SITE PARAMETERS File
                     (#350.9)
                 RECIPIENT GROUPS field (#.01) of the RECIPIENT GROUPS sub-field
                     (#354.52) of the BILLING ALERT DEFINITION File (#354.5)
                 PURGE NOTIFICATION MAIL GROUP field (#1.01) of the ENCOUNTER
                     FORM PARAMETERS File (#357.09)
                 MAILGROUP TO NOTIFY field (#.02) of the IB MESSAGE ROUTER File
                     (#364.3)
                 MAIL GROUP FOR SERVICE MASTER field (#.05) of the PFSS SITE
                     PARAMETERS File (#372)
                 MAIL GROUP FOR CHARGE field (#.06) of the PFSS SITE PARAMETERS
                     File (#372)
                 HINQ MAIL GROUP field (#.01) of the HINQ MAIL GROUP sub-field
                     (#395.015) of the DVB PARAMETERS File (#395)
                 RECIPIENT field (#2) of the HINQ SUSPENSE File (#395.5)
                 REASSIGNMENT MAIL GROUP field (#804) of the SCHEDULING PARAMETER
                     File (#404.91)
                 MAILGROUP field (#1) of the PRC IFCAP MESSAGE ROUTER File
                     (#423.5)
                 WORKLOAD MAIL GROUP field (#.01) of the WORKLOAD MAIL GROUP
                     sub-field (#690.17) of the MEDICINE PACKAGE PARAMETERS File
                     (#690.1)
                 MAIL GROUP FOR ERRORS field (#.03) of the Instrument HL7 Coding
                     File (#690.7)
                 NOTIFICATION MAILGROUP field (#.02) of the CP INSTRUMENT File
                     (#702.09)
                 EWS LOCAL MAIL GROUP field (#740.05) of the QUALITY ASSURANCE
                     SITE PARAMETERS File (#740)
                 MAIL GROUP (IRM) field (#740.06) of the QUALITY ASSURANCE SITE
                     PARAMETERS File (#740)
                 MAIL GROUP (QAN) field (#742.01) of the QUALITY ASSURANCE SITE
                     PARAMETERS File (#740)
                 BULLETIN MAIL GROUP field (#62) of the QA MONITOR File (#743)
                 MAIL GROUP field (#10) of the HL7 NON-DHCP APPLICATION PARAMETER
                     File (#770)
                 MAIL GROUP field (#4) of the HL7 APPLICATION PARAMETER File
                     (#771)
                 MAIL GROUPS field (#.01) of the MAIL GROUPS sub-field (#776.106)
                     of the HL7 MONITOR File (#776.1)
                 MAIL GROUP field (#.03) of the FUNCTIONAL INDEPENDENCE
                     MEASUREMENT PARAMETER File (#783.9)
                 REMINDER MANAGEMENT MAILGROUP field (#3) of the CLINICAL
                     REMINDER PARAMETERS File (#800)
                 MANAGEMENT MAIL GROUP field (#650) of the PCE PARAMETERS File
                     (#815)
                 MAIL GROUP field (#100.01) of the HL LOWER LEVEL PROTOCOL
                     PARAMETER File (#869.2)
                 MAIL GROUP field (#.05) of the HL COMMUNICATION SERVER
                     PARAMETERS File (#869.3)
                 MAIL GROUP field (#100.01) of the HL LOGICAL LINK File (#870)
                 FACILITY REVIEWER MAIL GROUP field (#.01) of the WII PARAMETERS
                     File (#987.6)
                 PACKAGE MANAGER MAIL GROUP field (#.5) of the CIRN REPOSITORY
                     SITE PARAMETER File (#990.8)
                 MAIL GROUP field (#6) of the CIRN HL7 EXCEPTION TYPE File
                     (#991.11)
                 NEW REQUEST MAILGROUP field (#.03) of the CIRN SITE PARAMETER
                     File (#991.8)
                 Mail Group field (#.01) of the Mail Group sub-field (#2006.1662)
                     of the BP MAIL MESSAGE sub-field (#2006.166) of the IMAGING
                     SITE PARAMETERS File (#2006.1)
                 VBECS MAIL GROUP field (#.07) of the VBECS SITE PARAMETERS File
                     (#6000)
                 MAIL GROUP FOR ALERTS field (#2) of the RPC BROKER SITE
                     PARAMETERS File (#8994.1)
                 *WORKLOAD MAIL GROUP field (#.02) of the A&SP SITE PARAMETERS
                     File (#509850.8)


  CROSS
  REFERENCED BY: MEMBER(AB), COORDINATOR(AC), MEMBER GROUP NAME(AD), NAME(B)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  3.8,.01       NAME                   0;1 FREE TEXT (Required)

                MAIL GROUP NAME
                INPUT TRANSFORM:  S:X?1"G.".E!(X?1"g.".E) X=$E(X,3,99) K:$L(X)>30
                                  !($L(X)<3)!'(X'?1P.E)!(X'?.ANP) X
                LAST EDITED:      APR 25, 2002
                HELP-PROMPT:      ANSWER MUST BE 3-30 CHARACTERS IN LENGTH
                DESCRIPTION:      The name of a mail group, i.e. a list of
                                  recipients who can all be addressed at once by
                                  reference to this name.

                LAYGO TEST:       1,0)= I $$LAYGO^XMVGROUP(X)

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  3.8^B
                                  1)= S ^XMB(3.8,"B",$E(X,1,30),DA)=""
                                  2)= K ^XMB(3.8,"B",$E(X,1,30),DA)

                CROSS-REFERENCE:  ^^TRIGGER^3.8^5
                                  1)= X ^DD(3.8,.01,1,2,1.3) I X S X=DIV S Y(1)=$
                                  S($D(^XMB(3.8,D0,3)):^(3),1:"") S X=$P(Y(1),U,1
                                  ),X=X S DIU=X K Y S X=DIV S X=$G(XMDUZ,DUZ) S D
                                  IH=$G(^XMB(3.8,DIV(0),3)),DIV=X S $P(^(3),U,1)=
                                  DIV,DIH=3.8,DIG=5 D ^DICR

                                  1.3)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S
                                  Y(1)=$S($D(^XMB(3.8,D0,3)):^(3),1:"") S X=$S('$
                                  D(^VA(200,+$P(Y(1),U,1),0)):"",1:$P(^(0),U,1))=
                                  ""

                                  2)= Q

                                  CREATE CONDITION)= ORGANIZER=""
                                  CREATE VALUE)= S X=$G(XMDUZ,DUZ)
                                  DELETE VALUE)= NO EFFECT
                                  FIELD)= ORGANIZER
                                  When a user creates a mail group, this trigger
                                  makes that user the organizer of the group.
                                  The user is free to change that field.



  3.8,2         MEMBER                 1;0 POINTER Multiple #3.81

                LAST EDITED:      NOV 26, 1991
                DESCRIPTION:      A member of a Mail Group is a user to whom
                                  messages will be sent when the message is
                                  addressed to this mail group.


                PRIMARY KEY:      A (#1)
                Uniqueness Index: B (#1)
                     File, Field: 1) MEMBER (3.81,.01)

                INDEXED BY:       MEMBER (AC), MEMBER (B)

  3.81,.01        MEMBER                 0;1 POINTER TO NEW PERSON FILE (#200)
                                     (Multiply asked) (Key field)

                  Local Member
                  INPUT TRANSFORM:S DIC("S")="I $L($P(^(0),U,3)),$D(^XMB(3.7,+Y,0
                                  ))" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
                  LAST EDITED:    FEB 12, 2001
                  HELP-PROMPT:    Enter a local user who should receive mail
                                  addressed to this group.
                  DESCRIPTION:    The local user who is a member of this mail
                                  group.  The user must have an access code and a
                                  mailbox.

                  SCREEN:         S DIC("S")="I $L($P(^(0),U,3)),$D(^XMB(3.7,+Y,0
                                  ))"
                  EXPLANATION:    User must have an access code and a mailbox.
                  CROSS-REFERENCE:3.8^AB
                                  1)= S ^XMB(3.8,"AB",$E(X,1,30),DA(1),DA)=""
                                  2)= K ^XMB(3.8,"AB",$E(X,1,30),DA(1),DA)

                  FIELD INDEX:    B (#1)    REGULAR    IR    LOOKUP & SORTING
                     Unique for:  Key A (#1), File #3.81
                    Short Descr:  Uniqueness Index for Key 'A' of Subfile #3.81
                      Set Logic:  S ^XMB(3.8,DA(1),1,"B",X,DA)=""
                     Kill Logic:  K ^XMB(3.8,DA(1),1,"B",X,DA)
                     Whole Kill:  K ^XMB(3.8,DA(1),1,"B")
                           X(1):  MEMBER  (3.81,.01)  (Subscr 1)

                  FIELD INDEX:    AC (#54)    MUMPS        ACTION
                    Short Descr:  Set a local variable when a new member is
                                  added.
                    Description:  This xref only works while under control of one
                                  of the MailMan options to edit mail groups.
                                  Variable XMTRKNEW is set to activate the xref.

                                  When a new member is added, this xref adds that
                                  member to a local array.  Once the user is
                                  finished editing this mail group, and if new
                                  members have been added, MailMan may use the
                                  local array to find and forward previous mail
                                  group messages to the new members, depending on
                                  what the user wants.
                      Set Logic:  S XMNEWMBR(X2(1))=""
                       Set Cond:  S X=$S('$G(XMTRKNEW):0,X1(1)="":1,1:0)
                     Kill Logic:  Q
                           X(1):  MEMBER  (3.81,.01)  (forwards)


  3.81,1          TYPE                 0;2 SET

                                  'C' FOR CC;
                                  'I' FOR INFO;
                  LAST EDITED:    FEB 25, 1999
                  DESCRIPTION:    This field indicates what type of recipient
                                  this is.

                                  If this field has nothing in it, it indicates
                                  that this recipient is a primary recipient, and
                                  may reply.

                                  CC:  indicates that the recipient is being sent
                                  a copy, but is not the primary recipient.  The
                                  recipient may reply.

                                  INFO: indicates that the recipient may not
                                  reply to the message; the message is being
                                  transmitted to the recipient for information
                                  purposes only.




  3.8,3         DESCRIPTION            2;0   WORD-PROCESSING #3.801

                DESCRIPTION:      The definition and/or purpose of this mail
                                  group.


  3.8,4         TYPE                   0;2 SET (Required)

                                  'PU' FOR public;
                                  'PR' FOR private;
                LAST EDITED:      FEB 07, 2001
                DESCRIPTION:      The type of mail group determines who can send
                                  mail to it.  Provided there are no AUTHORIZED
                                  SENDERS specified, anyone can send mail to a
                                  public group and only its members can send mail
                                  to a private group.  If there are AUTHORIZED
                                  SENDERS specified, only those users can address
                                  the group.

                CROSS-REFERENCE:  ^^TRIGGER^3.8^10
                                  1)= Q
                                  2)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y(
                                  1)=$C(59)_$P($G(^DD(3.8,4,0)),U,3) S X=$P($P(Y(
                                  1),$C(59)_X_":",2),$C(59),1)="private" I X S X=
                                  DIV S Y(1)=$S($D(^XMB(3.8,D0,0)):^(0),1:"") S X
                                  =$P(Y(1),U,6),X=X S DIU=X K Y S X="" X ^DD(3.8,
                                  4,1,1,2.4)

                                  2.4)= S DIH=$G(^XMB(3.8,DIV(0),0)),DIV=X S $P(^
                                  (0),U,6)=DIV,DIH=3.8,DIG=10 D ^DICR

                                  CREATE VALUE)= NO EFFECT
                                  DELETE CONDITION)= OLD TYPE="private"
                                  DELETE VALUE)= @
                                  FIELD)= RESTRICTIONS
                                  When changing the TYPE from 'private' to
                                  'public', delete the RESTRICTIONS field,
                                  because it no longer applies.


                CROSS-REFERENCE:  ^^TRIGGER^3.8^7
                                  1)= Q
                                  2)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y(
                                  1)=$C(59)_$P($G(^DD(3.8,4,0)),U,3) S X=$P($P(Y(
                                  1),$C(59)_X_":",2),$C(59),1)="public" I X S X=D
                                  IV S Y(1)=$S($D(^XMB(3.8,D0,0)):^(0),1:"") S X=
                                  $P(Y(1),U,3),X=X S DIU=X K Y S X="" X ^DD(3.8,4
                                  ,1,2,2.4)

                                  2.4)= S DIH=$G(^XMB(3.8,DIV(0),0)),DIV=X S $P(^
                                  (0),U,3)=DIV,DIH=3.8,DIG=7 D ^DICR

                                  CREATE VALUE)= NO EFFECT
                                  DELETE CONDITION)= OLD TYPE="public"
                                  DELETE VALUE)= @
                                  FIELD)= ALLOW SELF ENROLLMENT?
                                  When changing the TYPE from 'public' to
                                  'private', delete the ALLOW SELF ENROLLMENT?
                                  field, because it no longer applies.



  3.8,5         ORGANIZER              3;1 POINTER TO NEW PERSON FILE (#200)

                The user who has organizer's privileges for the group.
                LAST EDITED:      JUN 18, 1991
                DESCRIPTION:      The user who has the privileges of an
                                  "Organizer" for the mail group. For example, an
                                  organizer can add new members to a "Private"
                                  mail group.

                NOTES:            TRIGGERED by the NAME field of the MAIL GROUP
                                  File


  3.8,5.1       COORDINATOR            0;7 POINTER TO NEW PERSON FILE (#200)

                LAST EDITED:      APR 25, 2002
                HELP-PROMPT:      The person responsible for maintaining the
                                  membership of the mail group.
                DESCRIPTION:      This field is used as a screen when a user
                                  tries to edit a mail group that he is a
                                  coordinator of.  If the screen fails and the
                                  user does not hold the XMMGR key, he cannot
                                  edit the mail group.

                                  Even if the coordinator is REMOVED from the
                                  Mail System, this field will remain to indicate
                                  who created the Mail Group if others can use
                                  it.  If it is a Personal Group, it will be
                                  deleted.

                CROSS-REFERENCE:  3.8^AC
                                  1)= S ^XMB(3.8,"AC",$E(X,1,30),DA)=""
                                  2)= K ^XMB(3.8,"AC",$E(X,1,30),DA)
                                  This cross reference is to be used for listing
                                  mail groups for coordinators.



  3.8,6         AUTHORIZED SENDER      4;0 POINTER Multiple #3.802

                DESCRIPTION:      If you wish to restrict this mail group to only
                                  a limited set of senders, name them in this
                                  field.  If no names are entered here, then it
                                  is assumed that anyone may send mail to this
                                  group (if public), or only members may send to
                                  it (if private).

                                  If a user attempts to send mail to a group
                                  which has one or more authorized senders, but
                                  is not an authorized sender, then he is shown a
                                  list of authorized senders.  He may send the
                                  message to them, and they may forward it, if
                                  desired.

                                  NOTE:  Remote users may not send mail to any
                                  local group which has authorized senders


  3.802,.01       AUTHORIZED SENDER      0;1 POINTER TO NEW PERSON FILE (#200)
                                     (Multiply asked)

                  LAST EDITED:      JUN 18, 1991
                  HELP-PROMPT:      Enter name of user who may address this
                                    group, if it is to be limited
                  DESCRIPTION:      This subfile records user numbers of those
                                    users who have the exclusive privilege of
                                    addressing the mail group.  Messages sent by
                                    other users will reach the group only if
                                    forwarded by an authorized sender.  The
                                    authorized senders receive all mail addressed
                                    to the group.

                                    WARNING:  If a group has authorized senders,
                                    then remote users will not be able to send
                                    messages to it.  Any messages sent by a
                                    remote user to a group with authorized
                                    senders will be rejected.

                  CROSS-REFERENCE:  3.802^B
                                    1)= S ^XMB(3.8,DA(1),4,"B",$E(X,1,30),DA)=""
                                    2)= K ^XMB(3.8,DA(1),4,"B",$E(X,1,30),DA)




  3.8,7         ALLOW SELF ENROLLMENT? 0;3 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                LAST EDITED:      OCT 28, 1985
                HELP-PROMPT:      If users may join this group by themselves, say
                                  "YES"
                DESCRIPTION:      If this field is set to "YES", then users may
                                  use the JOIN option to make themselves members
                                  of the group, or to drop their names from the
                                  group.  This option is only operative with
                                  public groups.

                NOTES:            TRIGGERED by the TYPE field of the MAIL GROUP
                                  File


  3.8,8         REFERENCE COUNT        0;4 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>999999)!(X<0)!(X?.E1"."1N.N) X
                LAST EDITED:      FEB 12, 1986
                HELP-PROMPT:      TYPE A WHOLE NUMBER BETWEEN 0 AND 999999
                DESCRIPTION:      This is a count of the number of times this
                                  mailgroup has been used as a recipient of a
                                  message.  This will help site managers monitor
                                  the activity of mail groups.


  3.8,9         LAST REFERENCED        0;5 DATE

                INPUT TRANSFORM:  S %DT="E" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      APR 22, 2002
                DESCRIPTION:      This is the date on which this mail group was
                                  last referenced.


  3.8,10        RESTRICTIONS           0;6 SET

                                  '0' FOR UNRESTRICTED;
                                  '1' FOR ORGANIZER ONLY;
                LAST EDITED:      FEB 06, 2001
                HELP-PROMPT:      Enter restriction code for private group.
                DESCRIPTION:      This field is only applicable for PRIVATE mail
                                  groups.  It is ignored for PUBLIC mail groups.

                                  This field controls who may address (send
                                  messages to) this PRIVATE mail group.

                                  If 0 (zero) or null, then the group is
                                  unrestricted, and all members may address the
                                  group.

                                  If 1, then only the organizer may address the
                                  group.  The group is a personal group.

                                  Note that non-members cannot address private
                                  mail groups.

                NOTES:            TRIGGERED by the TYPE field of the MAIL GROUP
                                  File


  3.8,11        MEMBER GROUPS          5;0 POINTER Multiple #3.811

                LAST EDITED:      JUL 16, 1992
                DESCRIPTION:      Member Groups are mail groups that are members
                                  of this mail group.  When a Mail Group is made
                                  a member of another in this fashion, the
                                  individuals of it are added to the mailing list
                                  at delivery time.


  3.811,.01       MEMBER GROUP NAME      0;1 POINTER TO MAIL GROUP FILE (#3.8)
                                     (Multiply asked)

                  INPUT TRANSFORM:S DIC("S")="I Y'=DA" D ^DIC K DIC S DIC=DIE,X=+
                                  Y K:Y<0 X
                  LAST EDITED:    APR 22, 2002
                  HELP-PROMPT:    If you would like another mail group to be a
                                  member of this one enter a partial match to its
                                  name.
                  DESCRIPTION:    This is a pointer to another entry in this Mail
                                  Group file.  See the description of the
                                  multiple for more information.

                  SCREEN:         S DIC("S")="I Y'=DA"
                  EXPLANATION:    A mail group may not be a member of itself.
                  CROSS-REFERENCE:3.811^B
                                  1)= S ^XMB(3.8,DA(1),5,"B",$E(X,1,30),DA)=""
                                  2)= K ^XMB(3.8,DA(1),5,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:3.8^AD
                                  1)= S ^XMB(3.8,"AD",$E(X,1,30),DA(1),DA)=""
                                  2)= K ^XMB(3.8,"AD",$E(X,1,30),DA(1),DA)
                                  Shows groups to which a group belongs.



  3.811,1         TYPE                 0;2 SET

                                  'C' FOR CC;
                                  'I' FOR INFO;
                  LAST EDITED:    FEB 25, 1999
                  DESCRIPTION:    This field indicates what type of recipient
                                  this is.

                                  If this field has nothing in it, it indicates
                                  that this recipient is a primary recipient, and
                                  may reply.

                                  CC:  indicates that the recipient is being sent
                                  a copy, but is not the primary recipient.  The
                                  recipient may reply.

                                  INFO: indicates that the recipient may not
                                  reply to the message; the message is being
                                  transmitted to the recipient for information
                                  purposes only.




  3.8,12        MEMBERS - REMOTE       6;0 Multiple #3.812

                LAST EDITED:      AUG 11, 1994
                DESCRIPTION:      This multiple contains remote addresses or
                                  local devices or local servers.  The input to
                                  the field is checked for validity at the time
                                  it is entered.  If the address BECOMES
                                  INCORRECT MailMan will try to inform a
                                  responsible person of the non-delivery of a
                                  message.


  3.812,.01       REMOTE MEMBER          0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:D REMOTE^XMVGROUP(.X,$G(XMIA)) I $D(X) K:$L(X)>
                                  99 X
                  LAST EDITED:    APR 22, 2002
                  HELP-PROMPT:    Enter a remote address (name@domain) or local
                                  device (D.device or H.device) or local server
                                  (S.server).
                  DESCRIPTION:    This is a free text, validated (at the time you
                                  enter it) remote address or local device or
                                  local server.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:3.812^B
                                  1)= S ^XMB(3.8,DA(1),6,"B",$E(X,1,30),DA)=""
                                  2)= K ^XMB(3.8,DA(1),6,"B",$E(X,1,30),DA)




  3.8,13        DISTRIBUTION LIST      7;0 POINTER Multiple #3.813

                DESCRIPTION:      This field will allow distribution lists to be
                                  included in Mail Groups.  In this way a message
                                  that must be sent to the same name at many
                                  domains may easily be included in the recipient
                                  chain of a message.


  3.813,.01       DISTRIBUTION LIST      0;1 POINTER TO DISTRIBUTION LIST FILE (#
                                    3.816) (Multiply asked)

                  LAST EDITED:      OCT 26, 1990
                  CROSS-REFERENCE:  3.813^B
                                    1)= S ^XMB(3.8,DA(1),7,"B",$E(X,1,30),DA)=""
                                    2)= K ^XMB(3.8,DA(1),7,"B",$E(X,1,30),DA)




  3.8,14        FAX RECIPIENT          8;0 POINTER Multiple #3.814

                LAST EDITED:      FEB 11, 1997

  3.814,.01       FAX RECIPIENT          0;1 POINTER
                                    ***** TO AN UNDEFINED FILE (#589499), STORED
                                  IN ^AKF("FAXR") ******* (Multiply asked)

                  LAST EDITED:    FEB 11, 1997
                  HELP-PROMPT:    Enter the fax recipient who should receive
                                  faxes sent to this mail group.
                  DESCRIPTION:    This is a list of individual recipients who
                                  will receive by fax any mail sent to this mail
                                  group.  They receive the original message only.
                                  They do not receive responses.

                  CROSS-REFERENCE:3.814^B
                                  1)= S ^XMB(3.8,DA(1),8,"B",$E(X,1,30),DA)=""
                                  2)= K ^XMB(3.8,DA(1),8,"B",$E(X,1,30),DA)




  3.8,15        FAX GROUP              9;0 POINTER Multiple #3.815

                LAST EDITED:      FEB 11, 1997

  3.815,.01       FAX GROUP              0;1 POINTER
                                    ***** TO AN UNDEFINED FILE (#589498), STORED
                                  IN ^AKF("FAXG") ******* (Multiply asked)

                  INPUT TRANSFORM:S DIC("S")="N XM S XM=$G(^(3)) I $P(XM,U,2)!($G
                                  (XMDUZ,DUZ)=+XM)" D ^DIC K DIC S DIC=DIE,X=+Y K
                                  :Y<0 X
                  LAST EDITED:    FEB 11, 1997
                  HELP-PROMPT:    Enter the fax group which should receive faxes
                                  sent to this mail group.
                  DESCRIPTION:    Each member of the fax group will receive by
                                  fax any message sent to this mail group.  Only
                                  the original message will be faxed.  Responses
                                  will not be faxed.

                  SCREEN:         S DIC("S")="N XM S XM=$G(^(3)) I $P(XM,U,2)!($G
                                  (XMDUZ,DUZ)=+XM)"
                  EXPLANATION:    Group must be public or user must be (surrogate
                                   of) creator of group.
                  CROSS-REFERENCE:3.815^B
                                  1)= S ^XMB(3.8,DA(1),9,"B",$E(X,1,30),DA)=""
                                  2)= K ^XMB(3.8,DA(1),9,"B",$E(X,1,30),DA)





        FILES POINTED TO                      FIELDS

  DISTRIBUTION LIST (#3.816)        DISTRIBUTION LIST:DISTRIBUTION LIST (#.01)

  MAIL GROUP (#3.8)                 MEMBER GROUPS:MEMBER GROUP NAME (#.01)

  NEW PERSON (#200)                 ORGANIZER (#5)
                                    COORDINATOR (#5.1)
                                    AUTHORIZED SENDER:AUTHORIZED SENDER (#.01)
                                    MEMBER:MEMBER (#.01)

  }UNDEFINED FILE (#589498)         FAX GROUP:FAX GROUP (#.01)

  }UNDEFINED FILE (#589499)         FAX RECIPIENT:FAX RECIPIENT (#.01)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):

HELP FRAME
----------

::

  STANDARD DATA DICTIONARY #9.2 -- HELP FRAME FILE
  STORED IN ^DIC(9.2,

  This file contains the text of help frames created via the Help Processor
  (XQH).  Help frames may be associated with options or with data dictionary
  fields to provide on-line instruction.  The file is cross-referenced by name,
  header, date entered, author, and editor.


                DD ACCESS: #
               DEL ACCESS: #
             AUDIT ACCESS: #
  IDENTIFIED BY: HEADER (#1)

  POINTED TO BY: RELATED FRAME field (#1) of the RELATED FRAME sub-field (#9.22)
                     of the HELP FRAME File (#9.2)
                 HELP FRAME field (#3.7) of the OPTION File (#19)


  CROSS
  REFERENCED BY: AUTHOR(AC), EDITOR(AD), RELATED FRAME(AE), NAME(B),
                 HEADER(C), DATE ENTERED(D), INVOKED BY ROUTINE(D)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  9.2,.001      NUMBER                     NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>1000000)!(X<1)!(X?.E1"."1N.N) X
                HELP-PROMPT:      TYPE A WHOLE NUMBER BETWEEN 1 AND 1000000
                DESCRIPTION:
                                  This field uniquely identifies a help frame.


  9.2,.01       NAME                   0;1 (Required)

                SHORT DESCRIPTION OF THE FRAME
                INPUT TRANSFORM:  D CHKNAME^XQ5 K:$L(X)>30!(X?.N)!($L(X)<3)!'(X'?
                                  1P.E)!(X'?.ANP) X
                LAST EDITED:      FEB 02, 1994
                HELP-PROMPT:      NAME MUST BE 3-30 CHARACTERS, NOT NUMERIC OR
                                  STARTING WITH PUNCTUATION
                DESCRIPTION:      The unique name of the frame, preceded with the
                                  package prefix name, similar to option names.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  9.2^B
                                  1)= S ^DIC(9.2,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.2,"B",$E(X,1,30),DA)

                CROSS-REFERENCE:  ^^TRIGGER^9.2^4
                                  1)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S Y(
                                  1)=$S($D(^DIC(9.2,D0,0)):^(0),1:"") S X=$P(Y(1)
                                  ,U,3)="" I X S X=DIV S Y(1)=$S($D(^DIC(9.2,D0,0
                                  )):^(0),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y
                                  X ^DD(9.2,.01,1,2,1.1) X ^DD(9.2,.01,1,2,1.4)

                                  1.1)= S X=DIV N %I,%H,% D NOW^%DTC S X=%

                                  1.4)= S DIH=$S($D(^DIC(9.2,DIV(0),0)):^(0),1:""
                                  ),DIV=X S $P(^(0),U,3)=DIV,DIH=9.2,DIG=4 D ^DIC
                                  R:$O(^DD(DIH,DIG,1,0))>0

                                  2)= Q

                                  CREATE CONDITION)= DATE ENTERED=""
                                  CREATE VALUE)= NOW
                                  DELETE VALUE)= NO EFFECT
                                  FIELD)= DATE ENTERED
                                  This trigger sets the 'DATE ENTERED' field to
                                  the date and time when the help frame is
                                  created.


                CROSS-REFERENCE:  ^^TRIGGER^9.2^6
                                  1)= X ^DD(9.2,.01,1,3,1.3) I X S X=DIV S Y(1)=$
                                  S($D(^DIC(9.2,D0,0)):^(0),1:"") S X=$P(Y(1),U,4
                                  ),X=X S DIU=X K Y X ^DD(9.2,.01,1,3,1.1) X ^DD(
                                  9.2,.01,1,3,1.4)

                                  1.1)= S X=DIV X ^DD(9.2,.01,1,3,49.2) S %=$S($D
                                  (^VA(200,+DUZ,0)):^(0),1:""),X=$S('DUZ:"??",X="
                                  #":DUZ,X="N":$P(%,U,1),X="I":$P(%,U,2),X="T":$S
                                  ($D(^DIC(3.1,+$P(%,U,9),0)):$P(^(0),U,1),1:""),
                                  X="NN":$S($D(^VA(200,+DUZ,.1)):$P(^(.1),U,4),1:
                                  ""),1:"??") K %

                                  1.3)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S
                                  Y(1)=$S($D(^DIC(9.2,D0,0)):^(0),1:"") S X=$S('$
                                  D(^VA(200,+$P(Y(1),U,4),0)):"",1:$P(^(0),U,1))=
                                  ""

                                  1.4)= S DIH=$S($D(^DIC(9.2,DIV(0),0)):^(0),1:""
                                  ),DIV=X S $P(^(0),U,4)=DIV,DIH=9.2,DIG=6 D ^DIC
                                  R:$O(^DD(DIH,DIG,1,0))>0

                                  2)= Q

                                  49.2)= S X="#"

                                  CREATE CONDITION)= AUTHOR=""
                                  CREATE VALUE)= USER("#")
                                  DELETE VALUE)= NO EFFECT
                                  FIELD)= author
                                  This cross reference marks Help Frames with the
                                  creater in the Author field.



  9.2,1         HEADER                 0;2 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>65!($L(X)
                                  <2) X
                HELP-PROMPT:      ANSWER MUST BE 2-65 CHARACTERS IN LENGTH
                DESCRIPTION:      A short description of the frame, succinctly
                                  describing the content of the frame

                CROSS-REFERENCE:  9.2^C^KWIC
                                  1)= F %=1:1 Q:$P(X," ",%,99)=""  S I=$P(X," ",%
                                  ) I $L(I)>2,$L(I)<31,^DD("KWIC")'[I S ^DIC(9.2,
                                  "C",I,DA)=""

                                  2)= F %=1:1 Q:$P(X," ",%,99)=""  S I=$P(X," ",%
                                  ) I $L(I)>2,$L(I)<31 K ^DIC(9.2,"C",I,DA)


  9.2,2         TEXT                   1;0   WORD-PROCESSING #9.21

                DESCRIPTION:      The actual text of the help frame, which will
                                  be displayed when the user presses question
                                  mark.  Screen breaks are indicated by a line
                                  terminating with "..".


  9.2,3         RELATED FRAME          2;0 Multiple #9.22
                                   (Add New Entry without Asking)

                DESCRIPTION:      This is a multiple field which contains
                                  information on the other help frames which are
                                  related to the current help frame through
                                  specific keywords.  The keywords may be
                                  selected to obtain additional information about
                                  the topic through the related help frame(s).


  9.22,.01        RELATED FRAME KEYWORD  0;1 FREE TEXT (Multiply asked)

                  FRAMES WHICH MAY BE CHOSEN FOR GREATER DETAIL, AT THE USER'S DISCRETION
                  INPUT TRANSFORM:  K:$L(X)>30!($L(X)<1)!'(X?.PNU) X
                  LAST EDITED:      AUG 01, 1991
                  HELP-PROMPT:      Answer must be 1-30 characters in length.
                  DESCRIPTION:      A keyword appears in the text surrounded by
                                    brackets.  When the user enters the keyword,
                                    a related frame will be displayed with more
                                    detailed information on the topic suggested
                                    by the keyword.

                  EXECUTABLE HELP:Q  ;S Y=22 D EN^XQH ;Unknow what this was to do
                                  .
                  CROSS-REFERENCE:9.22^B
                                  1)= S ^DIC(9.2,DA(1),2,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.2,DA(1),2,"B",$E(X,1,30),DA)


  9.22,1          RELATED FRAME        0;2 POINTER TO HELP FRAME FILE (#9.2)

                  LAST EDITED:    MAR 15, 1995
                  DESCRIPTION:    The internal name of another help-frame which
                                  can be invoked by the keyword to obtain more
                                  detailed information on a sub-topic.

                  CROSS-REFERENCE:9.2^AE
                                  1)= S ^DIC(9.2,"AE",$E(X,1,30),DA(1),DA)=""
                                  2)= K ^DIC(9.2,"AE",$E(X,1,30),DA(1),DA)
                                  3)= For clean-up tools




  9.2,3.5       Want to LOAD KEYWORDS (Y/N)? 0;5 FREE TEXT

                INPUT TRANSFORM:  D LOADKW^XQH2
                LAST EDITED:      JUL 24, 1986
                HELP-PROMPT:      Enter 'Y' if you wish to make all bracketed
                                  words appearing in the text into keywords.
                DESCRIPTION:      This field is designed for internal use.  Its
                                  input transform will invoke a routine to
                                  associate keywords with related help frames.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  9.2,4         DATE ENTERED           0;3 DATE

                INPUT TRANSFORM:  S %DT="ET" D ^%DT S X=Y K:Y<1 X
                DESCRIPTION:      Date/time that this frame was entered into the
                                  system, which is used to track new Help frame
                                  activity.

                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the NAME field of the HELP FRAME
                                  File
                                  TRIGGERED by the NAME field of the HELP FRAME
                                  File

                CROSS-REFERENCE:  9.2^D
                                  1)= S ^DIC(9.2,"D",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.2,"D",$E(X,1,30),DA)


  9.2,5         INVOKED BY ROUTINE     3;0 Multiple #9.23
                                   (Add New Entry without Asking)

                DESCRIPTION:      This field is for documentation purposes.  It
                                  serves as a record of which routines reference
                                  a particular help frame.


  9.23,.01        INVOKED BY ROUTINE     0;1 FREE TEXT

                  NOT USED AT THE MOMENT
                  INPUT TRANSFORM:  K:$L(X)>30!($L(X)<3) X
                  LAST EDITED:      JUN 10, 1985
                  HELP-PROMPT:      ANSWER MUST BE 3-30 CHARACTERS IN LENGTH
                  DESCRIPTION:      This field is for documentation purposes.  It
                                    serves as a record of which routines
                                    reference a particular help frame.

                  CROSS-REFERENCE:  9.2^D
                                    1)= S ^XHLP("D",$E(X,1,30),DA(1),DA)=""
                                    2)= K ^XHLP("D",$E(X,1,30),DA(1),DA)




  9.2,6         AUTHOR                 0;4 POINTER TO NEW PERSON FILE (#200)

                LAST EDITED:      SEP 08, 1989
                DESCRIPTION:      The person who created the entry for this help
                                  frame.  This is a triggered field, it's value
                                  determined by the creator of the .01 entry.

                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the NAME field of the HELP FRAME
                                  File
                                  TRIGGERED by the NAME field of the HELP FRAME
                                  File

                CROSS-REFERENCE:  9.2^AC
                                  1)= S ^DIC(9.2,"AC",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.2,"AC",$E(X,1,30),DA)


  9.2,7         EDITOR                 4;0 POINTER Multiple #9.24

                DESCRIPTION:      Users who are allowed to edit this help frame,
                                  as determined by the author.


  9.24,.01        EDITOR                 0;1 POINTER TO NEW PERSON FILE (#200)
                                     (Multiply asked)

                  A LIST OF FRAMES WHICH SHOULD BE SEQUENTIALLY SCANNED AFTER THIS ONE.
                  LAST EDITED:      SEP 08, 1989
                  DESCRIPTION:      Users who are allowed to edit this help
                                    frame, as determined by the author.

                  EXECUTABLE HELP:  Q
                  CROSS-REFERENCE:  9.24^AB
                                    1)= S ^DIC(9.2,DA(1),4,"AB",$E(X,1,30),DA)=""
                                    2)= K ^DIC(9.2,DA(1),4,"AB",$E(X,1,30),DA)

                  CROSS-REFERENCE:  9.2^AD
                                    1)= S ^DIC(9.2,"AD",$E(X,1,30),DA(1),DA)=""
                                    2)= K ^DIC(9.2,"AD",$E(X,1,30),DA(1),DA)




  9.2,8         DATE LAST UPDATED       ;  COMPUTED DATE

                MUMPS CODE:       S Y(9.2,8,1)=$S($D(^DIC(9.2,D0,1,0)):^(0),1:"")
                                   S X=$P(Y(9.2,8,1),U,5)
                ALGORITHM:        S Y(9.2,8,1)=$S($D(^DIC(9.2,D0,1,0)):^(0),1:"")
                                   S X=$P(Y(9.2,8,1),U,5)
                LAST EDITED:      OCT 13, 1985
                DESCRIPTION:      This field is used to maintain an indication of
                                  the date on which the help frame was last
                                  modified or updated.


  9.2,10.1      ENTRY EXECUTE STATEMENT 10.1;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      JAN 16, 1991
                HELP-PROMPT:      This is Standard MUMPS code which will be
                                  executed as the user enters this Help Frame
                DESCRIPTION:      This field is used to include an M code
                                  statement which is executed as the user enters
                                  this help frame.

                WRITE AUTHORITY:  "@"

  9.2,10.2      EXIT EXECUTE STATEMENT 10.2;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      JAN 16, 1991
                HELP-PROMPT:      This is Standard MUMPS code which will be
                                  executed as the user leaves the current Help
                                  Frame.
                DESCRIPTION:      This field is used to provide an M code
                                  statement which is to be executed as the user
                                  exits the current help frame (whether moving
                                  into another help frame or back out of the
                                  current help frame).

                WRITE AUTHORITY:  "@"


        FILES POINTED TO                      FIELDS

  HELP FRAME (#9.2)                 RELATED FRAME:RELATED FRAME (#1)

  NEW PERSON (#200)                 AUTHOR (#6)
                                    EDITOR:EDITOR (#.01)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):
  XQHNEW/REVISED FRAMES         DEC 06, 1985        USER #0
                                                          NEW/REVISED HELP FRAMES

  SORT TEMPLATE(S):
  XQHNEW/REVISED FRAMES         OCT 13, 1985        USER #0
  SORT BY: ]'NAME//    (User is asked range)
    WITHIN NAME, SORT BY: DATE LAST UPDATED//    (User is asked range)

  XUZ DOC                       MAR 19, 1989@17:18  USER #0
  SORT BY: @#NAME//    (User is asked range)


  FORM(S)/BLOCK(S):

ROUTINE
-------

::

  STANDARD DATA DICTIONARY #9.8 -- ROUTINE FILE
  STORED IN ^DIC(9.8,

  This file is used to document system routines.  Parameters and entry points may
  be described.  When running %INDEX, some fields will be given values as the
  %INDEX verification tool locates variables, globals, and routine references.
  When using the %Z editor, the Edit History multiple will be filled in with
  date, device, user, and UCI.  The %ZOSF("TEST") node may be executed, checking
  $T, to determine whether a routine listed in this file exists in the current
  account.  This file is cross-referenced by name.


                DD ACCESS: #
                WR ACCESS: #
               DEL ACCESS: #
             LAYGO ACCESS: #

  CROSS
  REFERENCED BY: NAME(B)

      LAST MODIFIED: AUG 19,2017@20:23:16

  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  9.8,.01       NAME                   0;1 (Required)

                INPUT TRANSFORM:  D CHKNAME^XQ5 K:$L(X)>16!($L(X)<1)!'(X?.UN!(X?1
                                  "%".UN)) X
                LAST EDITED:      OCT 03, 1985
                HELP-PROMPT:      Please enter the NAME (1-16 characters), e.g.
                                  DIC, XM, ...
                DESCRIPTION:      The name of the PACKAGE, ROUTINE, or PROGRAM
                                  being documented.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  9.8^B
                                  1)= S ^DIC(9.8,"B",X,DA)=""
                                  2)= K ^DIC(9.8,"B",X,DA)


  9.8,1         TYPE                   0;2 SET

                                  'PK' FOR PACKAGE;
                                  'R' FOR ROUTINE;
                LAST EDITED:      AUG 22, 1994
                DESCRIPTION:      This defines whether an entire PACKAGE of
                                  programs is being documented, or a single
                                  pecific ROUTINE.


  9.8,1.2       SIZE (BYTES)           0;3 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>30000)!(X<0)!(X?.E1"."1.N) X
                LAST EDITED:      MAY 20, 2008
                HELP-PROMPT:      This field is filled in by XINDEX (0 - 30000)
                DESCRIPTION:      When XINDEX is run, the size of the routine is
                                  calculated and entered into this field.


  9.8,1.4       DATE OF %INDEX RUN     0;4 DATE

                INPUT TRANSFORM:  S %DT="ETX" D ^%DT S X=Y K:3000000<X!(2000000>X
                                  ) X
                LAST EDITED:      FEB 04, 1986
                HELP-PROMPT:      This field is set by %INDEX (Enter a date)
                DESCRIPTION:
                                  This field holds the date when %INDEX was run.


  9.8,1.5       RSUM VALUE             0;5 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>99999999999)!(X<0)!(X?.E1"."1N.N) X
                LAST EDITED:      AUG 22, 1994
                HELP-PROMPT:      Type a Number between 0 and 99999999999, 0
                                  Decimal Digits
                DESCRIPTION:      This field is used by the Routine monitor
                                  program to store a check sum of the routine.


  9.8,1.6       RSUM DATE              0;6 DATE

                INPUT TRANSFORM:  S %DT="EX" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      AUG 22, 1994
                DESCRIPTION:      This field holds the date of the last change in
                                  the RSUM value.


  9.8,2         DESCRIPTION            1;0   WORD-PROCESSING #9.81

                DESCRIPTION:      This is a description of the PACKAGE, ROUTINE,
                                  or PROGRAM being documented.


  9.8,2.1       BRIEF DESCRIPTION      2;0   WORD-PROCESSING #9.808

                DESCRIPTION:      This field holds a short description of the
                                  routine.


  9.8,4         PARAMETERS (IN/OUT)    3;0 Multiple #9.83
                                   (Add New Entry without Asking)

                DESCRIPTION:      Any essential or useful parameters are
                                  documented here.


  9.83,.01        PARAMETERS (IN/OUT)    0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>40!($L(X)
                                  <1) X
                  LAST EDITED:    MAR 14, 1989
                  HELP-PROMPT:    Please enter the name of the parameter being
                                  documented (1-40 characters).
                  DESCRIPTION:    The name of a parameter required by, or useful
                                  to, this routine.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:9.83^B
                                  1)= S ^DIC(9.8,DA(1),3,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.8,DA(1),3,"B",$E(X,1,30),DA)


  9.83,1          DESCRIPTION          0;2 FREE TEXT (Required)

                  INPUT TRANSFORM:K:$L(X)>72!($L(X)<2) X
                  HELP-PROMPT:    Please enter a brief description of the
                                  parameter (2-72 characters).
                  DESCRIPTION:    This is a brief description of the parameter
                                  and its function.


  9.83,2          DETAILED DESCRIPTION 1;0   WORD-PROCESSING #9.831

                  DESCRIPTION:    This is a complete and detailed description of
                                  the parameter, its options, functions, and
                                  requirements.


  9.83,3          FOUND BY %INDEX      0;3 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                  LAST EDITED:    FEB 04, 1986
                  HELP-PROMPT:    This field set by %INDEX
                  DESCRIPTION:    This field is set to 'YES' if %INDEX finds this
                                  parameter.




  9.8,5         TAG                    T;0 Multiple #9.801

                DESCRIPTION:      Any important TAGs or ENTRY POINTs in the
                                  program are documented here.


  9.801,.01       TAG                    0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>16!($L(X)
                                  <1) X
                  LAST EDITED:    DEC 14, 2015
                  HELP-PROMPT:    Please enter the name of a line in the program
                                  (1-16 characters).
                  DESCRIPTION:    The name of an important Line Label ("TAG") or
                                  Entry Point in this routine.

                  CROSS-REFERENCE:9.801^B
                                  1)= S ^DIC(9.8,DA(1),"T","B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.8,DA(1),"T","B",$E(X,1,30),DA)


  9.801,1         EXPLANATION          1;0   WORD-PROCESSING #9.802

                  DESCRIPTION:    This is a complete and detailed description of
                                  what this line or part of the program does.


  9.801,2         SUPPORTED ENTRY POINT 0;2 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                  LAST EDITED:    FEB 21, 1989

  9.801,3         FOUND BY %INDEX      0;3 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                  LAST EDITED:    FEB 04, 1986
                  HELP-PROMPT:    This field set by %INDEX
                  DESCRIPTION:    This field is set to 'YES' if %INDEX has
                                  located the tag.




  9.8,6         CHECKSUM REPORT        6;1 SET

                                  '0' FOR Local - don't report;
                                  '1' FOR Local - report;
                                  '2' FOR National - report;
                                  '3' FOR National - Deleted or NOT tracked;
                LAST EDITED:      OCT 17, 2006
                DESCRIPTION:      Entries flagged with "National - report" should
                                  not be changed, with "FOR National - Deleted or
                                  NOT tracked" for routines that do not exist in
                                  the system. Sites may determine if they want
                                  reports on checksum differences for local
                                  routines by selecting "Local - report".


  9.8,6.1       LOCALLY MODIFIED       6;2 SET

                                  '1' FOR YES;
                LAST EDITED:      AUG 24, 2005
                HELP-PROMPT:      Enter ?? to read field description.
                DESCRIPTION:      This field was introduced by the VISTA
                                  Auto-patch Utility v2.0 for the purpose of not
                                  installing patches that contain routines with
                                  local mods. If the value is set to YES for a
                                  given routine VAPU will not install a patch or
                                  any of the routines contained in the patch.


  9.8,6.2       DELETED BY PATCH       6;3 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>15!($L(X)<2) X
                LAST EDITED:      SEP 21, 2005
                HELP-PROMPT:      Answer must be 2-15 characters in length.
                DESCRIPTION:      This field is set by KIDS during an Install
                                  when the routine is sent with the 'delete at
                                  site'.  It holds the patch name.


  9.8,7.1       CHECKSUM DATE          4;1 DATE

                INPUT TRANSFORM:  S %DT="ESTX" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      DEC 30, 1996
                DESCRIPTION:      This field holds the date the Checksum was last
                                  saved.


  9.8,7.2       CHECKSUM VALUE         4;2 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>15!($L(X)<2)!'(X?1A1.N) X
                LAST EDITED:      SEP 22, 2005
                HELP-PROMPT:      Answer must be 1 Alpha 1-14 Numerics in length.
                DESCRIPTION:      This is the saved Checksum value.  The letter
                                  at the front tells us what checksum algorithm
                                  was used.  It is loaded from the KIDS build on
                                  FORUM and sent to the sites.  The only
                                  application that should load date into this
                                  field are on FORUM and the Master File Update
                                  routines in the field.


  9.8,7.3       PATCH LIST AT CHECKSUM TIME 4;3 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>200!($L(X)<2) X
                LAST EDITED:      DEC 17, 2002
                HELP-PROMPT:      Answer must be 2-200 characters in length.
                DESCRIPTION:      This field holds the patch list from the second
                                  line of the routine at the time the checksum
                                  was updated by the XTRUTL routine.


  9.8,7.4       KIDS INSTALL DATE      4.1;1 DATE

                INPUT TRANSFORM:  S %DT="ESTX" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      DEC 17, 2002
                DESCRIPTION:      This field will be updated by KIDS when a
                                  package is installed.




  9.8,8         PATCH                  8;0 Multiple #9.818


  9.818,.01       PATCH                  0;1 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>50!($L(X)<2) X
                  LAST EDITED:      MAY 09, 2006
                  HELP-PROMPT:      Answer must be 2-20 characters in length
                  DESCRIPTION:      This field holds a Package or Patch name that
                                    included this routine.

                  CROSS-REFERENCE:  9.818^B
                                    1)= S ^DIC(9.8,DA(1),8,"B",$E(X,1,30),DA)=""
                                    2)= K ^DIC(9.8,DA(1),8,"B",$E(X,1,30),DA)


  9.818,2         CHECKSUM               0;2 FREE TEXT

                  CheckSum
                  INPUT TRANSFORM:  K:$L(X)>15!($L(X)<2)!'(X?1A1.N) X
                  LAST EDITED:      SEP 22, 2005
                  HELP-PROMPT:      Answer must be 1 Alpha 1-14 Numerics in
                                    length.
                  DESCRIPTION:      This field holds the checksum (based on
                                    $$SUMB^XPDRSUM(routine)) calculated for Class
                                    I release loaded by KIDS.


  9.818,3         PATCH LIST             0;3 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>200!($L(X)<2) X
                  LAST EDITED:      MAY 09, 2006
                  HELP-PROMPT:      Answer must be 2-200 characters in length
                  DESCRIPTION:      This field holds the patch list at the time
                                    of the patch.




  9.8,9         DEV PATCH              9;0 Multiple #9.819
                                   (Add New Entry without Asking)


  9.819,.01       Dev Patch              0;1 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>15!($L(X)<2) X
                  LAST EDITED:      MAY 04, 2006
                  HELP-PROMPT:      Answer must be 2-15 characters in length.
                  DESCRIPTION:      This field holds the patch number.  This is
                                    were KIDS will put the Checksum for the
                                    routine at the time the the routine is
                                    exported from the account.  The PATCH (#8)
                                    field is synced with the FORUM gold account.

                  CROSS-REFERENCE:  9.819^B
                                    1)= S ^DIC(9.8,DA(1),9,"B",$E(X,1,30),DA)=""
                                    2)= K ^DIC(9.8,DA(1),9,"B",$E(X,1,30),DA)


  9.819,2         Dev Checksum           0;2 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>20!($L(X)<2) X
                  LAST EDITED:      MAY 04, 2006
                  HELP-PROMPT:      Answer must be 2-20 characters in length.
                  DESCRIPTION:      This is the Checksum value for the routine at
                                    the time of export.


  9.819,3         Dev Patch List         0;3 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>200!($L(X)<2) X
                  LAST EDITED:      MAY 04, 2006
                  HELP-PROMPT:      Answer must be 2-200 characters in length.
                  DESCRIPTION:      This is the patch list at the time the patch
                                    was exported from this account.




  9.8,19        ROUTINE INVOKED        19;0 Multiple #9.803
                                   (Add New Entry without Asking)

                DESCRIPTION:      The names of the routines which this routine
                                  uses.


  9.803,.01       ROUTINE INVOKED        0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>20!($L(X)
                                  <1) X
                  OUTPUT TRANSFORM:S Y=$P(Y," ",2)_"^"_$P(Y," ",1)
                  LAST EDITED:    FEB 04, 1986
                  HELP-PROMPT:    Please enter the name of the routine this
                                  program invokes (1-20 characters).
                  DESCRIPTION:
                                  The name of a routine which this routine uses.

                  CROSS-REFERENCE:9.803^B
                                  1)= S ^DIC(9.8,DA(1),19,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.8,DA(1),19,"B",$E(X,1,30),DA)


  9.803,3         FOUND BY %INDEX      0;3 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                  LAST EDITED:    FEB 04, 1986
                  HELP-PROMPT:    This field set by %INDEX
                  DESCRIPTION:    This field is set to 'YES' if the routine
                                  invoked is found by %INDEX.




  9.8,20        INVOKED BY             20;0 Multiple #9.804

                DESCRIPTION:      The names of the routines which use this
                                  routine.


  9.804,.01       INVOKED BY             0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>20!($L(X)
                                  <1)!'(X?1"%".UN!(X?.UN)) X
                  LAST EDITED:    FEB 04, 1986
                  HELP-PROMPT:    Please enter the name of a routine which
                                  invokes this one (1-20 characters).
                  DESCRIPTION:    The name of a routine which uses this routine.
                                  This is the name of the routine which invokes
                                  this one.

                  CROSS-REFERENCE:9.804^B
                                  1)= S ^DIC(9.8,DA(1),20,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.8,DA(1),20,"B",$E(X,1,30),DA)


  9.804,3         FOUND BY %INDEX      0;3 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                  LAST EDITED:    FEB 04, 1986
                  HELP-PROMPT:    This field set by %INDEX.
                  DESCRIPTION:    This field is set to 'YES' if %INDEX finds the
                                  invoked-by routine.




  9.8,21        VARIABLES              21;0 Multiple #9.805

                DESCRIPTION:      This subfile holds a list of the variables used
                                  in the routine.


  9.805,.01       VARIABLES              0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>8!($L(X)<
                                  1) X
                  LAST EDITED:    FEB 05, 1986
                  HELP-PROMPT:    ANSWER MUST BE 1-8 CHARACTERS IN LENGTH
                  DESCRIPTION:    This field holds the name of a variable used in
                                  the routine.

                  CROSS-REFERENCE:9.805^B
                                  1)= S ^DIC(9.8,DA(1),21,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.8,DA(1),21,"B",$E(X,1,30),DA)


  9.805,2         CHANGED OR KILLED    0;2 SET

                                  '*' FOR CHANGED;
                                  '!' FOR KILLED;
                                  '*!' FOR CHANGED and KILLED;
                  LAST EDITED:    FEB 28, 1986
                  DESCRIPTION:    This field indicates whether the variable is
                                  changed and/or killed within the routine.


  9.805,3         FOUND BY %INDEX      0;3 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                  LAST EDITED:    FEB 05, 1986
                  DESCRIPTION:    This field is set to 'YES' if %INDEX finds this
                                  variable.




  9.8,22        GLOBALS                22;0 Multiple #9.806

                DESCRIPTION:      This subfile lists the globals that are
                                  referenced in this routine.


  9.806,.01       GLOBALS                0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>20!($L(X)
                                  <1)!'((X?1U.UN."(".E)!(X?1"%".UN."(".E)) X
                  LAST EDITED:    JAN 26, 1988
                  HELP-PROMPT:    ANSWER MUST BE 1-20 CHARACTERS IN LENGTH
                  DESCRIPTION:    This field holds the name of a global which is
                                  referenced in this routine.

                  CROSS-REFERENCE:9.806^B
                                  1)= S ^DIC(9.8,DA(1),22,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(9.8,DA(1),22,"B",$E(X,1,30),DA)


  9.806,1         EXPLANATION          1;0   WORD-PROCESSING #9.807

                  DESCRIPTION:
                                  This field may be used to describe the global.


  9.806,3         FOUND BY %INDEX      0;3 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                  LAST EDITED:    FEB 05, 1986
                  DESCRIPTION:    This field is set to 'YES' if %INDEX finds this
                                  global reference.




  9.8,23        EDIT HISTORY           23;0 DATE Multiple #9.823
                                   (Add New Entry without Asking)

                DESCRIPTION:      This subfile provides an edit history of this
                                  routine according to the date that the %Z
                                  editor was used to modify the routine.


  9.823,.01       EDIT HISTORY           0;1 DATE

                  INPUT TRANSFORM:  S %DT="ETX" D ^%DT S X=Y K:Y<1 X
                  LAST EDITED:      APR 01, 1987
                  DESCRIPTION:      This field holds the date when the %Z editor
                                    was used to modify the routine.


  9.823,1         DEVICE                 0;2 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>6!($L(X)<1) X
                  LAST EDITED:      APR 01, 1987
                  HELP-PROMPT:      ANSWER MUST BE 1-6 CHARACTERS IN LENGTH
                  DESCRIPTION:      This field holds an indication of the device
                                    used with the %Z editor to modify this
                                    routine.


  9.823,2         UCI                    0;3 FREE TEXT

                  INPUT TRANSFORM:  K:$L(X)>10!($L(X)<1) X
                  LAST EDITED:      APR 01, 1987
                  HELP-PROMPT:      ANSWER MUST BE 1-10 CHARACTERS IN LENGTH
                  DESCRIPTION:      This field indicates the UCI account area
                                    where the %Z editor was used to modify this
                                    routine.


  9.823,3         USER                   0;4 POINTER TO NEW PERSON FILE (#200)

                  LAST EDITED:      SEP 08, 1989
                  DESCRIPTION:      This field indicates the user number
                                    associated with the use of the %Z editor when
                                    the routine was modified.


  9.823,11        EDIT COMMENT           1;0   WORD-PROCESSING #9.82311




  9.8,6000      SIZE (BYTES)            ;  COMPUTED

                MUMPS CODE:       S Y=0,X=$P(^DIC(9.8,D0,0),"^",1) X:$D(^%ZOSF("S
                                  IZE"))&$D(^("TEST")) ^("TEST"),"ZL @X X ^%ZOSF(
                                  ""SIZE"")":$T S:Y X=Y
                ALGORITHM:        S Y=0,X=$P(^DIC(9.8,D0,0),"^",1) X:$D(^%ZOSF("S
                                  IZE"))&$D(^("TEST")) ^("TEST"),"ZL @X X ^%ZOSF(
                                  ""SIZE"")":$T S:Y X=Y
                LAST EDITED:      FEB 04, 1985
                DESCRIPTION:      This field may be used to calculate the size of
                                  the routine as an alternative to the %INDEX
                                  calculation stored in Field 1.2 of this file.



        FILES POINTED TO                      FIELDS

  NEW PERSON (#200)                 EDIT HISTORY:USER (#3)



  INPUT TEMPLATE(S):
  XU ROUTINE DOC                MAR 08, 1989        USER #0

  PRINT TEMPLATE(S):
  ONCOLOGY ROUTINE LIST         MAY 28, 1992@18:52  USER #0
                                                            ONCOLOGY ROUTINE LIST
  XUDOC COMPLETE                MAR 14, 1989@15:47  USER #0
                                    ROUTINE PARAMETERS AND SUPPORTED ENTRY POINTS
  XUDOC ENTRY POINTS            MAY 29, 1989@11:23  USER #0
                                           ROUTINE LIST (*SUPPORTED ENTRY POINTS)
  XUPRG-ROUTINE EDIT            MAY 09, 1988        USER #0
                                                              EDITED ROUTINE LIST

  SORT TEMPLATE(S):
  ONCOLOGY ROUTINE LIST         MAY 28, 1992@18:51  USER #0
                               'ONCOLOGY ROUTINE LIST' Print Template always used
  SORT BY: NAME//     From 'ONCO'  To 'ONCOZ^ONCOZ'

  XUDOC SUPPORTED EP            MAY 29, 1989@11:27  USER #0
  SORT BY: @TAG//
  TAG SUB-FIELD: SUPPORTED ENTRY POINT//     From 'y'

  XUDOC SYSTEM ROUTINES         JUL 24, 1991@11:04  USER #0
  SORT BY: NAME//     From 'XL'  To 'ZUZ^ZUZ'
    WITHIN NAME, SORT BY: @XTRTEST(NAME)=1;L1//     From '0'  To '1'

  XUPRG-ROUTINE EDIT            MAY 09, 1988        USER #0
  SORT BY: NAME//    (User is asked range)
    WITHIN NAME, SORT BY: EDIT HISTORY//
    EDIT HISTORY SUB-FIELD: EDIT HISTORY//    (User is asked range)


  FORM(S)/BLOCK(S):

OPTION
------

::

  STANDARD DATA DICTIONARY #19 -- OPTION FILE
  STORED IN ^DIC(19,

  Information in this file is used to drive the menu system.  Options are
  created, associated with others on menus, locked, set out-of-order, assigned
  prohibited times or devices, or given entry/exit actions.  The Edit Options of
  Menu Management should be used (instead of VA FileMan) so that the global root
  (DIC) and other such fields are given the correct values.  Options may be
  tailored by setting FileMan variables via this file. The Order Enter/Results
  Reporting package is accessed by using the appropriate option type.  It is
  cross-referenced by name, menu text, uppercase menu text, type, item, synonym,
  help frame, out-of-order message, lock, prohibited times, restricted devices,
  and priority.


                DD ACCESS: #
                WR ACCESS: #
               DEL ACCESS: #
             LAYGO ACCESS: #
  IDENTIFIED BY: MENU TEXT (#1)[R]

  POINTED TO BY: MENU OPTION USED field (#4.1) of the AUDIT File (#1.1)
                 PROTOCOL or OPTION USED field (#4.2) of the AUDIT File (#1.1)
                 OPTION USED field (#12) of the ERROR EVENTS sub-field (#3.07701)
                     of the ERROR TRAP SUMMARY File (#3.077)
                 PRIMARY MENU OPTION field (#201) of the DEVICE File (#3.5)
                 OPTION field (#.02) of the *MENU sub-field (#9.495) of the
                     PACKAGE File (#9.4)
                 ITEM field (#.01) of the MENU sub-field (#19.01) of the OPTION
                     File (#19)
                 OPTION field (#.01) of the AUDIT LOG FOR OPTIONS File (#19.081)
                 NAME field (#.01) of the OPTION SCHEDULING File (#19.2)
                 DHCP OPTION field (#.05) of the ADT/HL7 TRANSMISSION File
                     (#39.4)
                 DIALOG field (#2) of the ORDER File (#100)
                 ITEM ORDERED field (#7) of the ORDER File (#100)
                 NAME field (#.01) of the ORDER STATISTICS File (#100.1)
                 NON-MENU TYPE OPTION ACTION field (#1) of the OE/RR
                     NOTIFICATIONS File (#100.9)
                 ADD MENU DEFAULT field (#4) of the ORDER PARAMETERS File
                     (#100.99)
                 FILE LINK field (#6) of the PROTOCOL File (#101)
                 SERVICE UPDATE OPTION field (#123.011) of the REQUEST SERVICES
                     File (#123.5)
                 PRIMARY MENU OPTION field (#201) of the NEW PERSON File (#200)
                 PRIMARY WINDOW field (#201.1) of the NEW PERSON File (#200)
                 LAST OPTION ACCESSED field (#202.1) of the NEW PERSON File
                     (#200)
                 SECONDARY MENU OPTIONS field (#.01) of the SECONDARY MENU
                     OPTIONS sub-field (#200.03) of the NEW PERSON File (#200)
                 DELEGATED OPTIONS field (#.01) of the DELEGATED OPTIONS
                     sub-field (#200.19) of the NEW PERSON File (#200)
                 DHCP OPTION field (#.07) of the IVM FINANCIAL QUERY LOG File
                     (#301.62)
                 ALPHA,BETA TEST OPTION field (#.01) of the ALPHA,BETA TEST
                     OPTION sub-field (#8989.333) of the KERNEL SYSTEM PARAMETERS
                     File (#8989.3)
                 OPTION TO AUDIT field (#.01) of the OPTION TO AUDIT sub-field
                     (#8989.36) of the KERNEL SYSTEM PARAMETERS File (#8989.3)
                 CONTEXTOPTION field (#.02) of the REMOTE APPLICATION File
                     (#8994.5)
                 OPTION FILE MENU field (#.03) of the ROES MENU File (#791810.5)
                 OPTION USED TO CREATE field (#.24) of the VISIT File (#9000010)


  CROSS
  REFERENCED BY: HELP FRAME(AC), ITEM(AD), MENU TEXT(AE),
                 E ACTION PRESENT(AF), X ACTION PRESENT(AG), MENU TEXT(AOA),
                 OUT OF ORDER MESSAGE(AOB), LOCK(AOC), PROHIBITED TIMES(AOD),
                 ITEM(AOE), SYNONYM(AOF), HELP FRAME(AOG), TYPE(AOH),
                 PRIORITY(AOI), RESTRICT DEVICES?(AOJ), TYPE(AOR),
                 MENU TEXT(AORK), REVERSE/NEGATIVE LOCK(AREDO),
                 *SPECIAL QUEUEING(ASTARTUP),
                 *QUEUED TO RUN AT WHAT TIME(AZT),
                 *DEVICE FOR QUEUED JOB OUTPUT(AZTIO),
                 *QUEUED TO RUN ON VOLUME SET(AZTVOL), NAME(B),
                 UPPERCASE MENU TEXT(C)

      LAST MODIFIED: AUG 19,2017@20:23:16

  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  19,.01        NAME                   0;1 FREE TEXT (Required)

                A unique name, which is preceded by the package abbreviation
                INPUT TRANSFORM:  D CHKNAME^XQ5 K:$L(X)>30!(+X=X)!($L(X)<3)!'(X'?
                                  1P.E)!(X'?.ANP) X
                LAST EDITED:      JUL 21, 2012
                HELP-PROMPT:      NAME MUST BE 3-30 CHARACTERS, NOT NUMERIC OR
                                  STARTING WITH PUNCTUATION
                DESCRIPTION:      The formal name of an option, prefaced with the
                                  package name.

                                  Each option must be preceded by its package
                                  prefix (a 2-4 character) code specified in the
                                  PACKAGE file, or the letter "Z" or "A".

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  19^B
                                  1)= S ^DIC(19,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,"B",$E(X,1,30),DA)

                CROSS-REFERENCE:  ^^TRIGGER^19^3.6
                                  1)= X ^DD(19,.01,1,2,1.3) I X S X=DIV S Y(1)=$S
                                  ($D(^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,5),
                                  X=X S DIU=X K Y S X=DIV S X=DUZ X ^DD(19,.01,1,
                                  2,1.4)

                                  1.3)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S
                                  Y(1)=$S($D(^DIC(19,D0,0)):^(0),1:"") S X=$S('$D
                                  (^VA(200,+$P(Y(1),U,5),0)):"",1:$P(^(0),U,1))="
                                  "

                                  1.4)= S DIH=$S($D(^DIC(19,DIV(0),0)):^(0),1:"")
                                  ,DIV=X X "F %=0:0 Q:$L($P(DIH,U,4,99))  S DIH=D
                                  IH_U" S %=$P(DIH,U,6,999),DIU=$P(DIH,U,5),^(0)=
                                  $P(DIH,U,1,4)_U_DIV_$S(%]"":U_%,1:""),DIH=19,DI
                                  G=3.6 D ^DICR:$O(^DD(DIH,DIG,1,0))>0

                                  2)= Q
                                  3)= This trigger is used to record the user who
                                   created this option.

                                  CREATE CONDITION)= CREATOR=""
                                  CREATE VALUE)= S X=DUZ
                                  DELETE VALUE)= NO EFFECT
                                  FIELD)= CREATOR
                                  This trigger is used to record the user who
                                  created this option at the time that the name
                                  was created.



  19,.15        X ACTION PRESENT       0;15 SET

                                  '1' FOR YES;
                LAST EDITED:      FEB 13, 1991
                HELP-PROMPT:      This flag indicates if there is an exit action
                                  for this option
                DESCRIPTION:       This field will be set to '1' if the option
                                  has an entry action.

                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the EXIT ACTION field of the
                                  OPTION File

                CROSS-REFERENCE:  19^AG^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,.16        REV KEY PRESENT        0;16 SET

                                  '1' FOR YES;
                LAST EDITED:      JAN 25, 1990
                HELP-PROMPT:      This flag indicates whether a reverse or
                                  negative lock has been defined for this option
                DESCRIPTION:       This field will be set to '1' if this option
                                  has a reverse key assigned to it.

                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the REVERSE/NEGATIVE LOCK field of
                                  the OPTION File


  19,.26        HEADER PRESENT?        0;17 SET

                                  '1' FOR YES;
                LAST EDITED:      DEC 03, 1990
                DESCRIPTION:      This field is set to 1 by a trigger on field
                                  #26 when MUMPS code is entered into it.

                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the HEADER field of the OPTION
                                  File


  19,1          MENU TEXT              0;2 FREE TEXT (Required)

                The option's text, as it appears on the menu
                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>50!($L(X)
                                  <3) X
                LAST EDITED:      JUL 21, 1994
                HELP-PROMPT:      ANSWER MUST BE 3-50 CHARACTERS IN LENGTH
                DESCRIPTION:      The name as the option as it will be displayed
                                  to the user within the menu system.  ** The 'C'
                                  X-ref has been moved to the uppercase field. **

                CROSS-REFERENCE:  19^AE^MUMPS
                                  1)= Q  ;The C X-ref has been moved to field 1.1
                                  2)= Q
                                  3)= This is a null cross-reference used to over
                                  write the previous x-ref which set the uppercas
                                  e text.
                                   This is a null cross-reference used to
                                  over-write the previous x-ref.


                CROSS-REFERENCE:  19^AORK^MUMPS
                                  1)= I $P(^DIC(19,DA,0),U,4)="O"!($P(^(0),U,4)="
                                  Q") S ^DIC(19,"AOR",X,DA)=""

                                  2)= K ^DIC(19,"AOR",X,DA)
                                  This sets the "AORK" cross-reference on the
                                  file if the option type is either a protocol or
                                  a protocol menu.


                CROSS-REFERENCE:  19^AOA^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.


                CROSS-REFERENCE:  ^^TRIGGER^19^1.1
                                  1)= K DIV S DIV=X,D0=DA,DIV(0)=D0,DIU=$P($G(^DI
                                  C(19,D0,"U")),U) K Y X ^DD(19,1,1,4,1.1) X ^DD(
                                  19,1,1,4,1.4)

                                  1.1)= S X=$E(DIV,1,30),X=$TR(X,"abcdefghijklmno
                                  pqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ"),Y(1)
                                  =X

                                  1.4)= S DIH=$S($D(^DIC(19,DIV(0),"U")):^("U"),1
                                  :""),DIV=X S $P(^("U"),U,1)=DIV,DIH=19,DIG=1.1
                                  D ^DICR:$O(^DD(DIH,DIG,1,0))>0

                                  2)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,"U")):^("U"),1:"") S X=$P(Y(1),U,1),
                                  X=X S DIU=X K Y S X="" X ^DD(19,1,1,4,2.4)

                                  2.4)= S DIH=$S($D(^DIC(19,DIV(0),"U")):^("U"),1
                                  :""),DIV=X S $P(^("U"),U,1)=DIV,DIH=19,DIG=1.1
                                  D ^DICR:$O(^DD(DIH,DIG,1,0))>0
                                  3)= This X-ref Triggers the UPPERCASE MENU TEXT
                                   field.

                                  CREATE VALUE)= $E(UPPERCASE(MENU TEXT),1,30)
                                  DELETE VALUE)= @
                                  FIELD)= UPPERCASE
                                  This X-ref triggers the UPPERCASE MENU TEXT
                                  field that builds the C cross-reference. It is
                                  also used by the menu system to build the
                                  compiled menus.



  19,1.1        UPPERCASE MENU TEXT    U;1 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)
                                  <3) X
                LAST EDITED:      JUL 21, 1994
                HELP-PROMPT:      Answer must be 3-30 characters in length.
                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the MENU TEXT field of the OPTION
                                  File

                CROSS-REFERENCE:  19^C
                                  1)= S ^DIC(19,"C",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,"C",$E(X,1,30),DA)
                                  3)= Used by the Menu system
                                  This field builds the UPPERCASE menu text C
                                  X-ref.



  19,2          OUT OF ORDER MESSAGE   0;3 FREE TEXT

                If there is a message here, the option is out of order
                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>50!($L(X)
                                  <0) X
                LAST EDITED:      DEC 03, 1990
                HELP-PROMPT:      Answer must be 0-50 characters in length.
                DESCRIPTION:      This field is used to temporarily disable an
                                  option. If it is filled in, the message here
                                  will be displayed whenever the user attempts to
                                  select the option.

                CROSS-REFERENCE:  19^AOB^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,3          LOCK                   0;6 FREE TEXT

                The name of the key required of the user to access this option
                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)
                                  <1) X I $D(X) Q:$D(^DIC(19.1,"B",X))  W !,*7,"K
                                  ey name must match exactly with a key in SECURI
                                  TY KEY file." K X
                LAST EDITED:      SEP 12, 1985
                HELP-PROMPT:      Enter the exact name of the key required to
                                  access this option.
                DESCRIPTION:      This field is used to deny access to users
                                  which have this option as part of their menu.
                                  If an option has a lock, then only users which
                                  hold the matching key can access it.

                EXECUTABLE HELP:  S X="??",DIC=19.1,DIC(0)="E" I $D(^DIC(19.1,0))
                                  ,$P(^(0),U,3) W "CURRENT LOCKS:" D ^DIC W !
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  19^AOC^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,3.01       REVERSE/NEGATIVE LOCK  3;1 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>27!($L(X)
                                  <3) X I $D(X) Q:$D(^DIC(19.1,"B",X))  W !!,"Mus
                                  t match exactly an entry in the KEY file.",! K
                                  X
                LAST EDITED:      AUG 07, 1991
                HELP-PROMPT:      Answer must match EXACTLY a name which has been
                                  entered in the KEY file.
                DESCRIPTION:       This field may contain a pointer to the Key
                                  File.  If it does, the user may not access this
                                  option if he or she holds that key.

                EXECUTABLE HELP:  S X="??",DIC(0)="E",DIC=19.1 I $D(^DIC(19.1,0))
                                  ,$P(^(0),U,3) D ^DIC W !
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  ^^TRIGGER^19^.16
                                  1)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,16),X=X
                                   S DIU=X K Y S X=DIV S X="1" X ^DD(19,3.01,1,1,
                                  1.4)

                                  1.4)= S DIH=$S($D(^DIC(19,DIV(0),0)):^(0),1:"")
                                  ,DIV=X S $P(^(0),U,16)=DIV,DIH=19,DIG=.16 D ^DI
                                  CR:$O(^DD(DIH,DIG,1,0))>0

                                  2)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,16),X=X
                                   S DIU=X K Y S X="" S DIH=$S($D(^DIC(19,DIV(0),
                                  0)):^(0),1:""),DIV=X S $P(^(0),U,16)=DIV,DIH=19
                                  ,DIG=.16 D ^DICR:$O(^DD(DIH,DIG,1,0))>0

                                  CREATE VALUE)= "1"
                                  DELETE VALUE)= @
                                  FIELD)= REV KEY PRESENT
                                  Trigger to set a value of 1 into field .16 if a
                                  reverse key is present on this option.


                CROSS-REFERENCE:  19^AREDO^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,3.5        DESCRIPTION            1;0   WORD-PROCESSING #19.06

                DESCRIPTION:      This field contains a brief explanation of the
                                  particular option.  It will be displayed in the
                                  menu system to the user when '???' are entered
                                  to the selection choice of the parent menu.


  19,3.6        CREATOR                0;5 POINTER TO NEW PERSON FILE (#200)

                The user who created this option
                LAST EDITED:      OCT 28, 1992
                DESCRIPTION:      This field defaults to the DUZ of the user who
                                  originally set up this option.

                NOTES:            TRIGGERED by the NAME field of the OPTION File


  19,3.7        HELP FRAME             0;7 POINTER TO HELP FRAME FILE (#9.2)

                LAST EDITED:      SEP 24, 1985
                HELP-PROMPT:      Enter the name of a help frame to be displayed
                                  when the user types ?<optionname>
                DESCRIPTION:      This field contains a pointer to the help text
                                  which describes this option.  The help text is
                                  displayed to the user on entering '?OPTION'.

                CROSS-REFERENCE:  19^AC
                                  1)= S ^DIC(19,"AC",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,"AC",$E(X,1,30),DA)
                                  This regular cross-reference provides a look-up
                                  by Help Frame internal entry number for those
                                  options referencing the desired help frame.


                CROSS-REFERENCE:  19^AOG^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,3.8        PRIORITY               0;8 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>10)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JAN 27, 1986
                HELP-PROMPT:      TYPE A WHOLE NUMBER BETWEEN 1 AND 10
                DESCRIPTION:      If this field is null, the option will run at
                                  the current priority, otherwise, priorities
                                  range from 1-10, a low number indicating lower
                                  priority. The priority is in effect while the
                                  current option is being executed.

                CROSS-REFERENCE:  19^AOI^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,3.9        PROHIBITED TIMES       0;9 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>9!($L(X)<
                                  9)!'(X?4N1"-"4N) X
                LAST EDITED:      OCT 13, 1985
                HELP-PROMPT:      ANSWER MUST BE 9 CHARACTERS IN LENGTH
                DESCRIPTION:      This specifies a time range during which this
                                  option cannot be accessed.  The time should be
                                  entered in military format. For example, to
                                  prohibit an option from running between 9 AM
                                  and 2 PM, enter 0900-1400.

                CROSS-REFERENCE:  19^AOD^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,3.91       TIMES/DAYS PROHIBITED  3.91;0 Multiple #19.391

                DESCRIPTION:       This subfile may contain dasy and time during
                                  which this option may not be envoked.  This
                                  subfile replaces field 3.9, Prohibited Times,
                                  in the 0th node of the Option File.


  19.391,.01      TIMES PROHIBITED       0;1 FREE TEXT (Multiply asked)

                  PROHIBITED TIME RANGE ON DAYS OF WEEK
                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>14!($L(X)
                                  <9)!'(X?4N1"-"4N) X
                  LAST EDITED:    MAR 14, 1989
                  HELP-PROMPT:    Enter Time Range in format NNNN-NNNN, e.g.,
                                  0800-1630 for 8:00 am to 4:30 pm.
                  DESCRIPTION:    This field may be used to set prohibited times
                                  for specific days of the week.  The PROHIBITED
                                  TIME RANGE may be specified alone to apply to
                                  all days as 0800-1630 to prohibit use between
                                  8:00 am and 4:30 pm.

                                  The time range specified may be prohibited on
                                  one or more specific days of the week by entry
                                  of the desired prohibited days in the next
                                  field of this subfield.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:19.391^B
                                  1)= S ^DIC(19,DA(1),3.91,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,DA(1),3.91,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:19.391^AOD1^MUMPS
                                  1)= S %XQDA=DA,DA=DA(1) D REDO^XQ7 S DA=%XQDA K
                                   %XQDA

                                  2)= S %XQDA=DA,DA=DA(1) D REDO^XQ7 S DA=%XQDA K
                                   %XQDA
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19.391,.02      DAYS PROHIBITED      0;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>20!($L(X)<2) X
                  LAST EDITED:    JUL 06, 1988
                  HELP-PROMPT:    Enter Days as first two letters, e.g., FR  or
                                  MO,WE,FR  or  MO-FR
                  DESCRIPTION:    This field may be used to prohibit use of the
                                  option on particular days of the week.




  19,3.92       QUEUING REQUIRED       3.92;0 Multiple #19.392
                                   (Add New Entry without Asking)

                LAST EDITED:      APR 23, 1992
                DESCRIPTION:      By entering days and times in the subfile the
                                  option's output can be restricted to days and
                                  times not included in this file.  The Menu
                                  System passes a flag to the Device Handler
                                  causing it to force queuing during the days and
                                  times included in this file.


  19.392,.01      TIME PERIOD            0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:  K:$L(X)>9!($L(X)<9)!'(X?4N1"-"4N) X
                  LAST EDITED:      DEC 03, 1990
                  HELP-PROMPT:      Enter time period as NNNN-NNNN (e.g.,
                                    0800-1630)
                  DESCRIPTION:      This field is used to specify a time period
                                    for the days of the week specified in field
                                    .02 during which the option may be run, but
                                    output must be queued to a time outside the
                                    dates and times specified.

                  CROSS-REFERENCE:  19.392^B
                                    1)= S ^DIC(19,DA(1),3.92,"B",$E(X,1,30),DA)="
                                    "

                                    2)= K ^DIC(19,DA(1),3.92,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:  ^^TRIGGER^19^3.93
                                  1)= K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA S Y(
                                  1)=$S($D(^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),
                                  U,18),X=X S DIU=X K Y S X=DIV S X="1" X ^DD(19.
                                  392,.01,1,2,1.4)

                                  1.4)= S DIH=$S($D(^DIC(19,DIV(0),0)):^(0),1:"")
                                  ,DIV=X S $P(^(0),U,18)=DIV,DIH=19,DIG=3.93 D ^D
                                  ICR:$O(^DD(DIH,DIG,1,0))>0

                                  2)= K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA S Y(
                                  0)=X I $O(^DIC(19,DA(1),3.92,0))=DA,$O(^(DA))'>
                                  0 I X S X=DIV S Y(1)=$S($D(^DIC(19,D0,0)):^(0),
                                  1:"") S X=$P(Y(1),U,18),X=X S DIU=X K Y S X=""
                                  X ^DD(19.392,.01,1,2,2.4)

                                  2.4)= S DIH=$S($D(^DIC(19,DIV(0),0)):^(0),1:"")
                                  ,DIV=X S $P(^(0),U,18)=DIV,DIH=19,DIG=3.93 D ^D
                                  ICR:$O(^DD(DIH,DIG,1,0))>0
                                  3)= Output restrictions won't work if deleted.
                                  CREATE VALUE)= "1"
                                  DELETE CONDITION)= I $O(^DIC(19,DA(1),3.92,0))=
                                  DA,$O(^(DA))'>0
                                  DELETE VALUE)= ""
                                  DIC)=
                                  FIELD)= OUTPUT
                                  This cross-reference sets a flag in the 0th
                                  node of the option when output restrictions are
                                  in effect.  $P(XQY0,U,18) will be 1 if there
                                  are restrictions, and null if there are not.
                                  This flag is used by TaskMan to see if queueing
                                  is required in ^%ZTLOAD.



  19.392,.02      DAY(S) FOR TIME PERIOD 0;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>20!($L(X)<2) X
                  LAST EDITED:    JAN 25, 1990
                  HELP-PROMPT:    No Entry indicates all days, or enter 2 letter
                                  day, MO, or days separated by commas MO,WE,FR
                                  or range of days MO-FR for inclusive range
                                  (Monday through Friday)
                  DESCRIPTION:    This field is used to specify one or more
                                  specific days of the week when the option must
                                  be queued to a time outside those specified in
                                  the .01 field.




  19,3.93       OUTPUT RESTRICTED?     0;18 SET

                                  '1' FOR YES;
                LAST EDITED:      DEC 03, 1990
                DESCRIPTION:       This field will contain a '1' if output from
                                  this option is restricted to certain days and
                                  times.

                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the TIME PERIOD field of the
                                  QUEUING REQUIRED sub-field of the OPTION File


  19,3.95       RESTRICT DEVICES?      0;10 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                LAST EDITED:      DEC 05, 1986
                DESCRIPTION:      This indicates whether the option is allowed to
                                  run on selected devices only.  If this field
                                  contains a 'y', the option will be enabled only
                                  for the devices entered in the field 'PERMITTED
                                  DEVICE.'

                CROSS-REFERENCE:  19^AOJ^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,3.96       PERMITTED DEVICE       3.96;0 POINTER Multiple #19.396

                DESCRIPTION:       This subfile may contain a list of devices
                                  upon which this option is permitted to run.


  19.396,.01      PERMITTED DEVICE       0;1 POINTER TO DEVICE FILE (#3.5)
                                     (Multiply asked)

                  LAST EDITED:      OCT 22, 1987
                  DESCRIPTION:       This field should contain a pointer to the
                                    Device File.

                  CROSS-REFERENCE:  19.396^B
                                    1)= S ^DIC(19,DA(1),3.96,"B",$E(X,1,30),DA)="
                                    "

                                    2)= K ^DIC(19,DA(1),3.96,"B",$E(X,1,30),DA)




  19,4          TYPE                   0;4 SET (Required)

                THE TYPE OF OPTION
                                  'A' FOR action;
                                  'E' FOR edit;
                                  'I' FOR inquire;
                                  'M' FOR menu;
                                  'P' FOR print;
                                  'R' FOR run routine;
                                  'O' FOR protocol;
                                  'Q' FOR protocol menu;
                                  'X' FOR extended action;
                                  'S' FOR server;
                                  'L' FOR limited;
                                  'C' FOR ScreenMan;
                                  'W' FOR Window;
                                  'Z' FOR Window Suite;
                                  'B' FOR Broker (Client/Server);
                LAST EDITED:      DEC 12, 1995
                DESCRIPTION:          This field indicates the 'category' or type
                                  of option. A print-type option, for instance,
                                  will call FileMan to print something. Menu-type
                                  options point to other options in the
                                  tree-structured menu system. The other fields
                                  in the options file are filled in depending on
                                  the type.  There are several fields that will
                                  tell a print-type option what to print and how
                                  to print it, for example.  These same fields
                                  may be meaningless to another options type.

                CROSS-REFERENCE:  19^AOR^MUMPS
                                  1)= I X="O"!(X="Q") S ^DIC(19,"AOR",$P(^DIC(19,
                                  DA,0),U,2),DA)=""

                                  2)= K ^DIC(19,"AOR",$P(^DIC(19,DA,0),U,2),DA)
                                  This sets the "AOR" cross-reference on the file
                                  if the option type is either a protocol or a
                                  protocol menu.


                CROSS-REFERENCE:  19^AOH^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,10         MENU                   10;0 POINTER Multiple #19.01

                DESCRIPTION:      This field points to the descendent options of
                                  this menu.

                IDENTIFIED BY:    SYNONYM(#2)

  19.01,.01       ITEM                   0;1 POINTER TO OPTION FILE (#19)
                                     (Multiply asked)

                  The items which will appear on this menu
                  INPUT TRANSFORM:S DIC("S")="D CK^XQ7" D ^DIC K DIC S DIC=DIE,X=
                                  +Y K:Y<0 X
                  LAST EDITED:    AUG 10, 1987
                  DESCRIPTION:    The name of an Option which will appear on this
                                  menu.

                  SCREEN:         S DIC("S")="D CK^XQ7"
                  EXPLANATION:    A USER CAN ASSIGN A 'LOCKED' MENU ONLY IF HE HA
                                  S THAT LOCK
                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:19.01^B
                                  1)= S ^DIC(19,DA(1),10,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,DA(1),10,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:19^AD
                                  1)= S ^DIC(19,"AD",$E(X,1,30),DA(1),DA)=""
                                  2)= K ^DIC(19,"AD",$E(X,1,30),DA(1),DA)

                  CROSS-REFERENCE:19^AOE^MUMPS
                                  1)= D REDOXI^XQ7
                                  2)= D REDOXD^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19.01,2         SYNONYM              0;2 FREE TEXT

                  INPUT TRANSFORM:K:X[""""!($A(X)=45)!(X="0") X I $D(X) K:$L(X)>4
                                  !($L(X)<1) X
                  LAST EDITED:    DEC 19, 1986
                  HELP-PROMPT:    ANSWER MUST BE 1-4 CHARACTERS IN LENGTH
                  DESCRIPTION:    An abbreviation which will appear to the left
                                  of the menu text on the display of a menu.
                                  Options are selectable by synonyms as well as
                                  menu text.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:19.01^C
                                  1)= S ^DIC(19,DA(1),10,"C",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,DA(1),10,"C",$E(X,1,30),DA)

                  CROSS-REFERENCE:19^AOF^MUMPS
                                  1)= D REDOXS^XQ7
                                  2)= D REDOXS^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19.01,3         DISPLAY ORDER        0;3 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>99)!(X<1)!(X?.E1"."3N.N) X
                  LAST EDITED:    JAN 31, 1986
                  HELP-PROMPT:    TYPE A NUMBER BETWEEN 1 AND 99
                  DESCRIPTION:    The field determines the order in which the
                                  items of a menu appear when displayed. If this
                                  field is entered, it takes precedence over the
                                  order determined by the synonyms.

                  CROSS-REFERENCE:19.01^AOK^MUMPS
                                  1)= D REDOXZ^XQ7
                                  2)= D REDOXZ^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.





  19,10.1       Short Menu Text        10.1;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30!($L(X)<3) X
                LAST EDITED:      OCT 22, 1992
                HELP-PROMPT:      Enter a short (less than 30 characters) of the
                                  Menu Text field.
                DESCRIPTION:       This field contains a short version of the
                                  Menu Text field (field # 1) for use with
                                  multi-column displays.  It is a mandatory
                                  field.


  19,11         DISPLAY OPTION?        0;11 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                LAST EDITED:      OCT 13, 1987
                DESCRIPTION:      This field controls the action of the Menu
                                  system if the user has automenu turned on.  If
                                  this field is set then the menu system will
                                  stop and ask 'Press return to continue'. before
                                  showing the menu again.


  19,12         PACKAGE                0;12 POINTER TO PACKAGE FILE (#9.4)

                LAST EDITED:      DEC 04, 1987
                DESCRIPTION:      This field indicates the package with which
                                  this option is associated.


  19,13         DELEGABLE              0;13 SET

                                  'n' FOR NO;
                                  'y' FOR YES;
                LAST EDITED:      JAN 25, 1988
                DESCRIPTION:      If this field is marked 'no' in the option file
                                  then the XQSMD software will not delegate this
                                  option to a user.


  19,14         E ACTION PRESENT       0;14 SET

                                  '1' FOR YES;
                LAST EDITED:      FEB 13, 1991
                HELP-PROMPT:      THIS FLAG INDICATES IF AN ENTRY ACTION IS
                                  PRESENT FOR THIS OPTION
                DESCRIPTION:       This field will contain a '1' if the option
                                  has an entry action in field #20.

                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the ENTRY ACTION field of the
                                  OPTION File

                CROSS-REFERENCE:  19^AF^MUMPS
                                  1)= D REDO^XQ7
                                  2)= D REDO^XQ7
                                  This cross-reference causes the option to be
                                  flagged for updating in the menu trees so that
                                  the changes effecting display and/or access to
                                  the option are correctly updated.



  19,15         EXIT ACTION            15;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      JAN 09, 1991
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      This field contains mumps code which will be
                                  executed on leaving this option.  It is
                                  applicable to all option types.

                WRITE AUTHORITY:  @
                CROSS-REFERENCE:  ^^TRIGGER^19^.15
                                  1)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,15),X=X
                                   S DIU=X K Y S X=DIV S X="1" X ^DD(19,15,1,1,1.
                                  4)

                                  1.4)= S DIH=$S($D(^DIC(19,DIV(0),0)):^(0),1:"")
                                  ,DIV=X S $P(^(0),U,15)=DIV,DIH=19,DIG=.15 D ^DI
                                  CR:$O(^DD(DIH,DIG,1,0))>0

                                  2)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,15),X=X
                                   S DIU=X K Y S X="" S DIH=$S($D(^DIC(19,DIV(0),
                                  0)):^(0),1:""),DIV=X S $P(^(0),U,15)=DIV,DIH=19
                                  ,DIG=.15 D ^DICR:$O(^DD(DIH,DIG,1,0))>0

                                  CREATE VALUE)= "1"
                                  DELETE VALUE)= @
                                  FIELD)= X AC
                                  This trigger sets the value 1 into field .15
                                  when a value is entered on the current field.
                                  This permits identification of the presence of
                                  an exit action without having to determine
                                  whether a node 15 exists or not.



  19,20         ENTRY ACTION           20;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      JAN 09, 1991
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      MUMPS code that is executed upon entry to this
                                  option for all option types.  When an option is
                                  first envoked this code is executed, but if you
                                  drop back into the option from a higher-level
                                  option (with a simple [RETURN]), for instance,
                                  it is NOT executed.  See Header field (field #
                                  26).

                WRITE AUTHORITY:  @
                CROSS-REFERENCE:  ^^TRIGGER^19^14
                                  1)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,14),X=X
                                   S DIU=X K Y S X=DIV S X="1" X ^DD(19,20,1,1,1.
                                  4)

                                  1.4)= S DIH=$S($D(^DIC(19,DIV(0),0)):^(0),1:"")
                                  ,DIV=X S $P(^(0),U,14)=DIV,DIH=19,DIG=14 D ^DIC
                                  R:$O(^DD(DIH,DIG,1,0))>0

                                  2)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,14),X=X
                                   S DIU=X K Y S X="" S DIH=$S($D(^DIC(19,DIV(0),
                                  0)):^(0),1:""),DIV=X S $P(^(0),U,14)=DIV,DIH=19
                                  ,DIG=14 D ^DICR:$O(^DD(DIH,DIG,1,0))>0

                                  CREATE VALUE)= "1"
                                  DELETE VALUE)= @
                                  FIELD)= E ACT
                                  This trigger sets the value 1 into field 14
                                  when a value is entered on the current field.
                                  This permits identification of the presence of
                                  an entry action without having to determine
                                  whether a node 20 exists or not.



  19,21         XQUIT MESSAGE          21;0   WORD-PROCESSING #19.021


  19,22         XQUIT EXECUTABLE       22;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      OCT 14, 1997
                HELP-PROMPT:      M code executed when XQUIT is encountered
                DESCRIPTION:           This field contains code which is executed
                                  by the menu system when an XQUIT variable is
                                  detected after the execution of this option's
                                  ENTRY ACTION.  If the execution of this field
                                  produces the variable XQNOBACK the Menu System
                                  will not attempt to return the user to their
                                  previous option, but leave the user at the
                                  present stack location.  In the case of jumps,
                                  the user may be returned to an option that is
                                  quite far away if XQNOBACK is not defined.
                                  Obviously, the problem that resulted in an
                                  XQUIT should first be solved before XQNOBACK is
                                  set.
                                       If there is no code in this field the
                                  default is to return the user to their previous
                                  option.

                WRITE AUTHORITY:  @

  19,25         ROUTINE                25;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>53!(X'?.1ANP.15AN.1"^"1ANP.15AN.1"[".1"
                                  (".E) X I $D(X),X["[",'$D(^XUSEC("XUMGR",DUZ))
                                  K X
                MAXIMUM LENGTH:   53
                LAST EDITED:      MAR 30, 2016
                HELP-PROMPT:      Answer must be [TAG^]ROUTINE[(parameters)] to
                                  run, 1-53 characters.
                DESCRIPTION:      Indicate the name of the tag, routine, and
                                  parameters. e.g. ROUTINE, or
                                  TAG^ROUTINE(parameters).


                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,26         HEADER                 26;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      JAN 08, 1991
                HELP-PROMPT:      This is Standard MUMPS code executed upon entry
                                  of the option.
                DESCRIPTION:      This field of MUMPS code is executed each time
                                  the option is envoked, whether the user is
                                  moving down through the tree of options, or
                                  backing up through the options already envoked;
                                  unlike the entry action which is only executed
                                  when envoking an option from above, and not
                                  when backing up into it.

                CROSS-REFERENCE:  ^^TRIGGER^19^.26
                                  1)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,17),X=X
                                   S DIU=X K Y S X=DIV S X="1" X ^DD(19,26,1,1,1.
                                  4)

                                  1.4)= S DIH=$S($D(^DIC(19,DIV(0),0)):^(0),1:"")
                                  ,DIV=X S $P(^(0),U,17)=DIV,DIH=19,DIG=.26 D ^DI
                                  CR:$O(^DD(DIH,DIG,1,0))>0

                                  2)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^DIC(19,D0,0)):^(0),1:"") S X=$P(Y(1),U,17),X=X
                                   S DIU=X K Y S X="" S DIH=$S($D(^DIC(19,DIV(0),
                                  0)):^(0),1:""),DIV=X S $P(^(0),U,17)=DIV,DIH=19
                                  ,DIG=.26 D ^DICR:$O(^DD(DIH,DIG,1,0))>0

                                  CREATE VALUE)= "1"
                                  DELETE VALUE)= @
                                  FIELD)= #.26
                                  This trigger sets the field HEADER PRESENT to
                                  '1' when there is mumps code in the field
                                  HEADER.  HEADER PRESENT is carried as a flag in
                                  the 0th node of each option.



  19,30         DIC {DIC}              30;E1,64 FREE TEXT

                SELECT FILE IN DIC
                INPUT TRANSFORM:  K:$L(X)>30!(X'?.1"%"1A.6AN1"(".ANP) X
                LAST EDITED:      MAR 19, 1991
                HELP-PROMPT:      Enter the global reference for DIC, WITHOUT the
                                  "^".
                DESCRIPTION:      Used in conjunction with EDIT and INQUIRE type
                                  options to lookup an entry.  for use.  The
                                  global reference of the file to be used in
                                  lookup (without the '^').  For example: DPT(

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,31         DIC(0)                 31;E1,9 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>9!($L(X)<1) X
                HELP-PROMPT:      ANSWER MUST BE 1-9 CHARACTERS IN LENGTH
                DESCRIPTION:      Used in conjunction with the EDIT and INQUIRE
                                  type options for finding an entry.  Enter the
                                  parameters used in file-lookups.
                                   A = Ask and reask entry
                                   C = Cross reference suppression is turned off
                                   E = Echo back the entry
                                   F = Forget storing the lookup value (for space
                                  bar recall)
                                   I = Ignore any special lookup program
                                   L = Learning (LAYGO - adding a new entry)
                                  allowed
                                   M = Look up entry using all available indexes
                                   N = Allow internal entry number as input
                                   O = Look up an entry in the old way
                                   Q = Question input if match not found
                                   X = Exact match of input required
                                   Z = Zero entry node returned in variable Y(0)
                                  and
                                       the external value of the .01 field in
                                  Y(0,0)


  19,32         DIC(A)                 32;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 14, 1987
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS IN LENGTH
                DESCRIPTION:      Used in conjunction with the EDIT and INQUIRE
                                  type option for finding an entry.  Enter the
                                  prompt to be displayed instead of the usual
                                  'Select FILENAME NAME' format.
                                   Example:     DIC(A)="Please enter patient
                                  name: "
                                                Would display to user -  Please
                                  enter patient name:
                                                Rather than the usual -  Select
                                  PATIENT NAME:


  19,33         DIC(B)                 33;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 14, 1987
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS IN LENGTH
                DESCRIPTION:      Used in conjunction with the EDIT and INQUIRE
                                  type options for finding an entry.  Enter the
                                  default value you want displayed to user when
                                  selecting the entry to use.
                                   Example:   DIC(B)="JONES,JOHN"
                                   Would produce the display - Select PATIENT
                                  NAME: JONES,JOHN//
                                   Rather than the usual display - Select PATIENT
                                  NAME:


  19,34         DIC(S)                 34;E1,245 MUMPS

                INPUT TRANSFORM:  D ^DIM
                LAST EDITED:      DEC 10, 1987
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      Used in conjunction with INQUIRE and EDIT type
                                  options for screening entry selection.  Enter
                                  executable MUMPS code that will screen out
                                  entries that should NOT be selected.  An entry
                                  is only selectable when the executable code
                                  produces a truth value of 1.  For example:

                                     DIC(S)=I $P(^(0),U,2)="M" allows only males
                                  to be selected if the second piece of the
                                  entry's zero node contained an 'M' for Male or
                                  'F' for Female.

                WRITE AUTHORITY:  @

  19,35         DIC(W)                 35;E1,245 MUMPS

                INPUT TRANSFORM:  D ^DIM
                LAST EDITED:      DEC 10, 1987
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      Used in conjunction with the EDIT and INQUIRE
                                  type options for matching user input.  Enter
                                  MUMPS code that will be executed each time a
                                  match (matches) is found for user input.

                                  Example:  DIC(W)=W:$D(^(.1)) "Patient is
                                  currently on ward ",^(.1)
                                         produces the display - JONES,JOHN
                                  Patient is currently on ward 2SE

                                  NOTE:  This will override identifier displays.

                WRITE AUTHORITY:  @

  19,36         D.                     36;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 14, 1987
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS IN LENGTH
                DESCRIPTION:      Used in conjunction with the INQUIRE and EDIT
                                  type options for selecting an entry.  Enter the
                                  subscript of the cross reference to be used for
                                  entry look-up.
                                   example:  D.=C Would only check for user input
                                  against the "C" cross-reference.  If DIC(0)
                                  contains an "M" meaning multi-index look-up,
                                  then this value will be used as a starting
                                  point for the multi-index look-up.  To restrict
                                  the look-up only to a single index then DIC(0)
                                  must NOT contain an "M".


  19,40         DR{DDS}                40;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      OCT 20, 1993
                HELP-PROMPT:      Enter the name of a form from the Form File
                                  enclosed in square brackets, e.g."[MYFORM]".
                DESCRIPTION:      This field contains the name of the form from
                                  the Form File enclosed in square brackets,
                                  e.g., "[MYFORM]".


  19,41         DDSFILE                41;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>64!($L(X)<1) X
                LAST EDITED:      OCT 20, 1993
                HELP-PROMPT:      Enter the file number or the global root of the
                                  file being displayed or edited.
                DESCRIPTION:      This is the root of the file being edited or
                                  displayed entered without the up-arrow, e.g.,
                                  "DIC(19,".


  19,42         DDSFILE(1)             42;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>64!($L(X)<1) X
                LAST EDITED:      OCT 20, 1993
                HELP-PROMPT:      Enter the subfile number or the global root of
                                  the subfile.
                DESCRIPTION:      This is the global root of the subfile being
                                  edited or displayed.


  19,43         DDSPAGE                43;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>999.9)!(X<1)!(X?.E1"."2N.N) X
                LAST EDITED:      OCT 21, 1993
                HELP-PROMPT:      Enter a Page Number between 1 and 999.9, 1
                                  Decimal Digit
                DESCRIPTION:      This optional variable contains the page number
                                  of the first page to display to the user when
                                  the ScreenMan form is invoked.  If this
                                  variable is not defined, then by default the
                                  first page the user sees is Page 1.


  19,44         DDSPARM                43;2 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>9!($L(X)<1) X
                LAST EDITED:      OCT 21, 1993
                HELP-PROMPT:      Answer must be 1-9 characters in length.
                DESCRIPTION:      This optional variable contains a string of
                                  alphabetic characters that controls ScreenMan's
                                  behavior.  The acceptable characters are:

                                   C   Return the variable DDSCHANG=1 if
                                  ScreenMan detects that the user
                                       saved a Change to the database.

                                   E   Return Error messages in ^TMP("DIERR",$J)
                                  and return DIERR if
                                       ScreenMan encounters problems when
                                  initially trying to load the form.
                                       If DDSPARM does not contain an "E",
                                  ScreenMan prints messages
                                       directly on the screen, and returns the
                                  variable DIMSG equal to null.

                                   S   Return the variable DDSSAVE=1 if the user
                                  pressed <PF1>S or <PF1>E,
                                       or entered an "Exit" or "Save" command
                                  from the Command Line, whether
                                       or not any changes were actually made on
                                  the form.


  19,50         DIE                    50;E1,64 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30 X
                LAST EDITED:      JAN 23, 1984
                HELP-PROMPT:      Enter the File number, or the global reference
                                  for DIE, WITHOUT the "^".
                DESCRIPTION:      Used in the EDIT type option. The global
                                  reference of the file to be used in the edit.
                                   example:  DPT(

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,51         DR {DIE}               51;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      FEB 17, 1988
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS IN LENGTH, CODE
                                  FOR DR.
                DESCRIPTION:      Used in the EDIT type option.  Enter the string
                                  of field numbers (delimited by semi-colons) to
                                  be edited or a bracketed input template name.
                                   example:
                                           .01;.03;3;.351
                                           or
                                           [INPUT TEMPLATE NAME]


  19,52         *DR()                  52;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      FEB 17, 1988
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS IN LENGTH

  19,53         NO UP-ARROW            53;1 SET

                                  'N' FOR NO UP-ARROWING ALLOWED;
                                  'OUTOK' FOR UP-ARROW OUT OK, NO BRANCHING;
                                  'BACK' FOR BACK JUMPING OK, NO EXIT;
                                  'BACKOUTOK' FOR EXIT AND BACK JUMPING OK;
                LAST EDITED:      APR 10, 1990
                DESCRIPTION:      Used in the EDIT type option.  If an 'N' is
                                  entered, no up-arrowing (^) is allowed while
                                  editing either for exiting the edit entirely or
                                  branching to other fields.  If an 'OUTOK' is
                                  entered, you may up-arrow (^) entirely out of
                                  the edit but not be allowed to jump to other
                                  fields.  If an 'BACK' is entered, you may jump
                                  to a previously edited field but not entirely
                                  out.  If an 'BACKOUTOK' is entered, you may
                                  jump back to previously edited fields and
                                  up-arrow (^) to exit.  If no entry is in this
                                  field, you may jump to other fields or up-arrow
                                  (^) out of the entire edit process.


  19,54         *DIE(W)                54;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      MAR 21, 1991
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      Enter a WRITE statement in this field and the
                                  WRITE statement will be used instead of VA
                                  FileMan's regular prompt for the field being
                                  edited.

                WRITE AUTHORITY:  @

  19,60         DIC {DIP}              60;E1,64 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30!(X'["(") X
                LAST EDITED:      AUG 17, 1987
                HELP-PROMPT:      ENTER THE GLOBAL REFERENCE FOR 'DIP', WITHOUT
                                  THE "^".
                DESCRIPTION:      The global reference of the file to be used in
                                  PRINT type option.
                                   example: DPT(

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,61         PG                     61;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>9999)!(X<0)!(X?.E1"."1N.N) X
                HELP-PROMPT:      TYPE A WHOLE NUMBER BETWEEN 0 AND 9999
                DESCRIPTION:      Used in the PRINT type option.  The page number
                                  that should appear on first page of report.
                                  (This number ONLY effects page numbering, NOT
                                  at which entry the report should begin
                                  printing).  If this field is left blank, then
                                  page 1 is assumed.


  19,62         L.                     62;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 14, 1987
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS IN LENGTH
                DESCRIPTION:      Used in the PRINT type option.  This entry
                                  should always contain a 0.  If a 1 is entered
                                  for this field, all predetermined ranges of
                                  sorts (fields TO and FR), print fields (field
                                  FLDS) and header (DHD) are overriden and the
                                  user will be asked for sort ranges, print
                                  fields and header.

                EXECUTABLE HELP:  W !?4,"SHOULD ALWAYS CONTAIN '0'.  IF A '1' IS
                                  ENTERED",!?4,"THE USER WILL BE ASKED FOR FLDS,F
                                  R,TO AND DHD"

  19,63         FLDS                   63;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 14, 1987
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS IN LENGTH
                DESCRIPTION:      Used in the PRINT type option.  Enter the
                                  fields to be printed (delimited by commas) or
                                  the bracketed print template name.  Fileman
                                  formatting criteria can also be entered.
                                   example:
                                          .01;"PATIENT NAME";C1,.02,.1
                                           or
                                           [PRINT TEMPLATE NAME]

                EXECUTABLE HELP:  W !?4,"FIELD FORMAT '.01;"_""""_"PATIENT NAME"_
                                  """"_";C1,.02,.1'",!?4,"OR A '[PRINT TEMPLATE N
                                  AME]'"

  19,64         BY                     64;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 14, 1987
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS IN LENGTH
                DESCRIPTION:      Used in the PRINT type option. Enter the fields
                                  to be sorted by (delimited by commas) or a
                                  bracketed sort template name.
                                   Example:
                                          '.1,.01
                                          or
                                          [SORT TEMPLATE NAME]

                EXECUTABLE HELP:  W !?4,"SORT BY FORMAT '.1,.01' OR A [SORT TEMPL
                                  ATE NAME]"

  19,65         FR                     65;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 15, 1987
                HELP-PROMPT:      ANSWER MUST BE IN 'START WITH' VALUES SEPARATED
                                  BY COMMAS
                DESCRIPTION:      Used in the PRINT type option. Enter the 'start
                                  with' values (delimited by commas) used in
                                  sorting.
                                   Example:
                                            2NE,SMITH
                                    (if sort fields were ward & name, start with
                                  ward 2NE and patient SMITH)

                EXECUTABLE HELP:  W !?4,"START WITH '2NE,SMITH' (WARD AND NAME)"
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,66         TO                     66;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 15, 1987
                HELP-PROMPT:      ANSWER MUST BE IN 'GO TO' VALUES SEPARATED BY
                                  COMMAS
                DESCRIPTION:      Used in the PRINT type option. The 'go to'
                                  values (delimited by commas) used in sorting.
                                   example:
                                            2NE,SMITH
                                    (If sort fields were ward & name, end sort
                                  after ward  2NE and patient SMITH)

                EXECUTABLE HELP:  W !?4,"GO TO '2NE,SMITH' (WARD AND NAME)"
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,67         DHD                    67;E1,245 FREE TEXT

                INPUT TRANSFORM:  D:X?1"W ".ANP ^DIM I $D(X) K:X[""""&(X'?1"W ".A
                                  NP) X I $D(X),X?1"W ".ANP S Q="""" F %=1:2 Q:'$
                                  D(X)  Q:$P(X,Q,%,999)=""  K:$P($E(3,999),Q,%)["
                                   " X
                LAST EDITED:      JAN 24, 1984
                HELP-PROMPT:      ANSWER MUST BE 1-245 CHARACTERS OR A MUMPS
                                  STATEMENT STARTING WITH 'W '.
                DESCRIPTION:      Used in the PRINT type option.  Enter the free
                                  text heading you want printed as the header of
                                  your output.  (Do not include quotes in your
                                  header)

                EXECUTABLE HELP:  W !?5,"Quotes are valid only within a MUMPS wri
                                  te statement",!
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,68         DCOPIES                68;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>99999)!(X<0)!(X?.E1"."1N.N) X
                HELP-PROMPT:      TYPE A WHOLE NUMBER BETWEEN 0 AND 99999
                DESCRIPTION:      Used in the PRINT type option. The number of
                                  copies desired.  SDP space must be available on
                                  your system for this option.


  19,69         DIS(0)                 69;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      MAR 21, 1991
                HELP-PROMPT:      Enter standard M code which sets $T.
                DESCRIPTION:      Used in the PRINT type option. This is
                                  executable M code which sets $T to select
                                  desired entries for the sort process. If the
                                  code produces a truth value of 1, the entry
                                  will be printed. (A truth value of 0 will not
                                  allow the entry to be printed.) At the time the
                                  code is executed, the internal entry number
                                  (IEN) of the entry is stored in the variable
                                  D0.

                                  For example, the following would print patients
                                  who were NOT born in the 1970's:

                                  DIS(0)=I
                                  $P(^DPT(D0,0),U,3)<2700101!($P(^(0),U,3)>2791231
  )
                                  If used in conjunction with fields DIS(1),
                                  DIS(2), and DIS(3), the entry will print if
                                  DIS(0) and DIS(1) are true, OR if DIS(0) and
                                  DIS(2) are true, OR if DIS(0) and DIS(3) are
                                  true.

                                  Note: You may have DIS(0) only, or DIS(0) in
                                  combination with DIS(1) only, or DIS(1) and
                                  DIS(2), or DIS(1), DIS(2), and DIS(3).


                WRITE AUTHORITY:  @

  19,69.1       DIS(1)                 69.1;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      MAR 21, 1991
                HELP-PROMPT:      Enter standard M code which sets $T.
                DESCRIPTION:      This field may be used in PRINT options along
                                  with DIS(0) and the other DIS(n) fields. Each
                                  DIS field is examined in order (beginning with
                                  0) for M code that will produce a $T value to
                                  determine whether or not the data pointed to by
                                  D0 should be printed. See the description of
                                  D(0) (field #69) for more information.


                WRITE AUTHORITY:  @

  19,69.2       DIS(2)                 69.2;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      MAR 21, 1991
                HELP-PROMPT:      Enter standard M code which sets $T.
                DESCRIPTION:      This field may be used in PRINT options along
                                  with DIS(0) and the other DIS(n) fields. Each
                                  DIS field is examined in order (beginning with
                                  0) for M code that will produce a $T value to
                                  determine whether or not the data pointed to by
                                  D0 should be printed. See the description of
                                  D(0) (field #69) for more information.


                WRITE AUTHORITY:  @

  19,69.3       DIS(3)                 69.3;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      MAR 21, 1991
                HELP-PROMPT:      Enter standard M code which sets $T.
                DESCRIPTION:      This field may be used in PRINT options along
                                  with DIS(0) and the other DIS(n) fields. Each
                                  DIS field is examined in order (beginning with
                                  0) for M code that will produce a $T value to
                                  determine whether or not the data pointed to by
                                  D0 should be printed. See the description of
                                  D(0) (field #69) for more information.


                WRITE AUTHORITY:  @

  19,70         IOP                    70;1 FREE TEXT

                INPUT TRANSFORM:  Q:X="HOME"  S DIC="^%ZIS(1,",DIC(0)="EMQ" D ^DI
                                  C K DIC S X=$P(Y,U,2),DIC=DIE K:Y<0 X
                LAST EDITED:      DEC 13, 1990
                HELP-PROMPT:      THIS IS THE DEFAULT OUTPUT DEVICE
                DESCRIPTION:      The default output device.  Enter a valid
                                  Device Name or "HOME" to mean output will
                                  always go to the home device.

                EXECUTABLE HELP:  S DIC="^%ZIS(1,",DIC(0)="M",D="B" D DQ^DICQ K D
                                  IC S DIC=DIE
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,71         DHIT                   71;E1,245 MUMPS

                INPUT TRANSFORM:  D ^DIM
                LAST EDITED:      AUG 13, 1987
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      Used in the PRINT type option.  Enter a string
                                  of MUMPS code that will be executed for every
                                  entry after all the fields specified in FLDS
                                  have been printed.

                WRITE AUTHORITY:  @

  19,72         DIOBEG                 72;E1,245 MUMPS

                INPUT TRANSFORM:  D ^DIM
                LAST EDITED:      AUG 13, 1987
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      Used in the PRINT type option.  Enter a string
                                  of MUMPS code that will be executed before the
                                  printout starts.

                WRITE AUTHORITY:  @

  19,73         DIOEND                 73;E1,245 MUMPS

                INPUT TRANSFORM:  D ^DIM
                LAST EDITED:      AUG 13, 1987
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      Used in the PRINT type option.  Enter a string
                                  of MUMPS code that will be executed after the
                                  printout has finished but before returning to
                                  the calling program.

                WRITE AUTHORITY:  @

  19,76         BY(0)                  76;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>200!($L(X)<1) X
                LAST EDITED:      OCT 20, 1993
                HELP-PROMPT:      Enter the 'static' part of a cross-reference or
                                  an open global reference, or the name of a
                                  search template enclosed in square brackets.
                                  Answer must be 1-200 characters in length.
                DESCRIPTION:      This variable can be set when you want to sort
                                  using a specified cross-reference (even MUMPS),
                                  or a list of record numbers in any global, or a
                                  list of results on a search template.  The only
                                  criteria is that the last subscript to sort
                                  through is an internal entry number (record
                                  number) for the file being printed.  This
                                  variable should contain the static part of a
                                  cross-reference or an open global reference,
                                  without the leading up-arrow.  Or, if printing
                                  from a list of search results, the variable
                                  should contain the name of a search template
                                  surrounded by square brackets.  Ex.:
                                    BY(0) = TMP("ZZTEST",$J,
                                    BY(0) = DIZ(662001,"AC",
                                    BY(0) = [ZZSEARCH]

                TECHNICAL DESCR:  If this field is not null, set BY(0) equal to
                                  its contents before calling EN1^DIP.  If it is
                                  not null, field L(0) should also be set.

                WRITE AUTHORITY:  ^
                GROUP:            V21X

  19,76.1       L(0)                   79;5 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>7)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      OCT 19, 1993
                HELP-PROMPT:      Enter the total number of subscripts that must
                                  be sorted through to get to the record number,
                                  PLUS 1 for the record number.  Type a Number
                                  between 1 and 7, 0 Decimal Digits
                DESCRIPTION:      This variable should ONLY be set if BY(0) is
                                  set, and is REQUIRED if BY(0) is set.  It
                                  should be equal to the total number of variable
                                  subscripts that FileMan needs to sort through
                                  in order to reach the record number, PLUS 1 for
                                  the record number itself.  For example, if
                                  BY(0) defines a regular cross-reference, L(0)=2
                                  (1 for the cross-referenced field value, and 1
                                  for the record number, D0).  If sorting through
                                  a list of record numbers in ^TMP($J,D0), L(0)=1
                                  (1 for the record number, D0).

                TECHNICAL DESCR:  This field is checked ONLY if BY(0) is set, and
                                  is REQUIRED if BY(0) is set.  If this field is
                                  not null, set L(0) equal to the contents before
                                  calling EN1^DIP.

                WRITE AUTHORITY:  ^
                GROUP:            V21

  19,76.2       FR(0,N)                FROM;0 Multiple #19.02

                DESCRIPTION:      Sort FROM criteria associated with the
                                  subscripts defined by the BY(0) input variable.


                WRITE AUTHORITY:  ^
                GROUP:            V21

  19.02,.01       SUBSCRIPT LEVEL NUMBER 0;1 NUMBER (Multiply asked)

                  INPUT TRANSFORM:K:+X'=X!(X>6)!(X<1)!(X?.E1"."1N.N) X S:$G(X) DI
                                  NUM=X
                  LAST EDITED:    OCT 20, 1993
                  HELP-PROMPT:    Enter the subscript level number 'N',
                                  associated with the 'Nth' subscript in the
                                  BY(0) cross-reference or global.  Used to set
                                  up FR(0,N) input variable to the print routine
                                  EN1^DIP
                  DESCRIPTION:    Number equal to one of the "N" subscripts that
                                  FileMan must sort through on the global or
                                  cross-reference defined by the BY(0) input
                                  variable to the FileMan print routine, EN1^DIP.
                                  Used to set an entry into the FR(0,N) input
                                  array (sort FROM value for the Nth subscript).

                  TECHNICAL DESCR:This field should only be filled out if BY(0)
                                  exists, but is not required.
                                   If the field is filled in, then it should be
                                  used as the second subscript, "N", when setting
                                  up the FR(0,N) variable before a call to
                                  EN1^DIP.  FR(0,N) will be set to the second
                                  piece of this node (the FROM VALUE).  Since the
                                  .01 field of this multiple is DINUMED, the
                                  record number will be equal to this .01 field.

                  GROUP:          V21
                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:19.02^B
                                  1)= S ^DIC(19,DA(1),"FROM","B",$E(X,1,30),DA)="
                                  "

                                  2)= K ^DIC(19,DA(1),"FROM","B",$E(X,1,30),DA)


  19.02,1         FROM VALUE           0;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>62!($L(X)<1) X
                  LAST EDITED:    OCT 13, 1993
                  HELP-PROMPT:    Enter the value that you want to START WITH
                                  when sorting through this subscript.  Answer
                                  must be 1-62 characters in length.
                  DESCRIPTION:    This optional field can be filled out for any
                                  of the "N" subscripts that FileMan must sort
                                  through on the global defined in BY(0).  This
                                  field only has meaning when something has been
                                  defined in BY(0), and it indicates the "START
                                  WITH" value for subscript "N".  For example,
                                  when FileMan builds the code for sorting
                                  through a cross-reference defined in BY(0), if
                                  an entry exists in the first multiple for this
                                  field, the value of this field will be used as
                                  the starting point for sorting on the first
                                  variable subscript in the cross-reference.

                  TECHNICAL DESCR:This field should only be filled out if BY(0)
                                  exists, but is not required.  If a record
                                  exists, for example, in record 1 of this
                                  multiple, then FR(0,1) should be set to the
                                  contents of this field before calling EN1^DIP.

                  GROUP:          V21



  19,76.3       TO(0,N)                TO;0 Multiple #19.03

                DESCRIPTION:      Sort TO criteria associated with the subscripts
                                  defined by the BY(0) input variable.

                WRITE AUTHORITY:  ^
                GROUP:            V21

  19.03,.01       SUBSCRIPT LEVEL NUMBER 0;1 NUMBER (Multiply asked)

                  INPUT TRANSFORM:K:+X'=X!(X>6)!(X<1)!(X?.E1"."1N.N) X S:$G(X) DI
                                  NUM=X
                  LAST EDITED:    OCT 20, 1993
                  HELP-PROMPT:    Enter the subscript level number 'N',
                                  associated with the 'Nth' subscript in the
                                  BY(0) cross-reference or global.  Used to set
                                  up TO(0,N) input variable to the print routine
                                  EN1^DIP
                  DESCRIPTION:    Number equal to one of the "N" subscripts that
                                  FileMan must sort through on the global or
                                  cross-reference defined by the BY(0) input
                                  variable to the FileMan print routine, EN1^DIP.
                                  Used to set an entry into the TO(0,N) input
                                  array (sort TO value for the Nth subscript).

                  TECHNICAL DESCR:This field should only be filled out if BY(0)
                                  exists, but is not required.
                                   If the field is filled in, then it should be
                                  used as the second subscript, "N", when setting
                                  up the TO(0,N) variable before a call to
                                  EN1^DIP.  TO(0,N) will be set to the second
                                  piece of this node (the TO VALUE).  Since the
                                  .01 field of this multiple is DINUMED, the
                                  record number will be equal to this .01 field.

                  GROUP:          V21
                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:19.03^B
                                  1)= S ^DIC(19,DA(1),"TO","B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,DA(1),"TO","B",$E(X,1,30),DA)


  19.03,1         TO VALUE             0;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>62!($L(X)<1) X
                  LAST EDITED:    OCT 13, 1993
                  HELP-PROMPT:    Enter the value that you want to GO TO when
                                  sorting through this subscript.  Answer must be
                                  1-62 characters in length.
                  DESCRIPTION:    This optional field can be filled out for any
                                  of the "N" subscripts that FileMan must sort
                                  through on the global defined in BY(0).  This
                                  field only has meaning when something has been
                                  defined in BY(0), and it indicates the "GO TO"
                                  value for subscript "N".  For example, when
                                  FileMan builds the code for sorting through a
                                  cross-reference defined in BY(0), if an entry
                                  exists in the first multiple for this field,
                                  the value of this field will be used as the
                                  ending point for sorting on the first variable
                                  subscript in the cross-reference.

                  TECHNICAL DESCR:This field should only be filled out if BY(0)
                                  exists, but is not required.  If a record
                                  exists, for example, in record 1 of this
                                  multiple, then TO(0,1) should be set to the
                                  contents of this field before calling EN1^DIP.

                  GROUP:          V21



  19,76.4       DISPAR(0,N)            SUB;0 Multiple #19.04

                LAST EDITED:      OCT 15, 1993
                WRITE AUTHORITY:  ^
                GROUP:            V21

  19.04,.01       SUBSCRIPT LEVEL NUMBER 0;1 NUMBER (Multiply asked)

                  INPUT TRANSFORM:K:+X'=X!(X>6)!(X<1)!(X?.E1"."1N.N) X S:$G(X) DI
                                  NUM=X
                  LAST EDITED:    OCT 20, 1993
                  HELP-PROMPT:    Enter the subscript level number 'N',
                                  associated with the 'Nth' subscript in the
                                  BY(0) cross-reference or global.  Used to set
                                  up DISPAR(0,N) input variables to the print
                                  routine EN1^DIP
                  DESCRIPTION:    Number equal to one of the "N" subscripts that
                                  FileMan must sort through on the global or
                                  cross-reference defined by the BY(0) input
                                  variable to the FileMan print routine, EN1^DIP.
                                  Used to set entries into the DIAPAR(0,N) and
                                  DIAPAR(0,N,"OUT") input arrays (subheader
                                  control for the Nth subscript).

                  TECHNICAL DESCR:This field should only be filled out if BY(0)
                                  exists, but is not required.
                                   If the field is filled in, then it should be
                                  used as the second subscript, "N", when setting
                                  up the DISPAR(0,N) variables before a call to
                                  EN1^DIP.  DISPAR(0,N) will be set to the second
                                  and third pieces of this node (STATICTICAL
                                  CONTROL CHARACTERS and SUBHEADER FORMAT
                                  CHARACTERS fields), DISPAR(0,N,"OUT") will be
                                  set to the SUBHEADER OUTPUT TRANSFORM field.
                                  Since the .01 field of this multiple is
                                  DINUMED, the record number will be equal to
                                  this .01 field.

                  GROUP:          V21
                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:19.04^B
                                  1)= S ^DIC(19,DA(1),"SUB","B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,DA(1),"SUB","B",$E(X,1,30),DA)


  19.04,1         STATISTICAL CONTROL CHARACTERS 0;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>10!($L(X)<1) X
                  LAST EDITED:    OCT 13, 1993
                  HELP-PROMPT:    Enter control characters normally entered
                                  BEFORE a sort field when doing a FileMan print.
                                   NOTE: only !, #, + or @ are allowed.
                  DESCRIPTION:    Statistical control characters for printing the
                                  "Nth" subscript from the BY(0)
                                  global/cross-reference.  Used to set first
                                  piece of DISPAR(0,N) input variable to the
                                  FileMan print, EN1^DIP. If defined, it should
                                  contain any of the three statistical control
                                  characters !, #, or + that are normally entered
                                  BEFORE a sort field in the FileMan interactive
                                  mode for printing data.  See the FileMan User's
                                  manual section on How to Display and Print File
                                  Data for more information.

                  TECHNICAL DESCR:This field should only be filled out if BY(0)
                                  exists, but is not required.  If a record
                                  exists, for example, in record 1 of this
                                  multiple, then the first piece of DISPAR(0,1)
                                  should be set to the contents of this field
                                  before calling EN1^DIP.

                  GROUP:          V21

  19.04,2         SUBHEADER FORMAT CHARACTERS 0;3 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>120!($L(X)<1) X
                  LAST EDITED:    OCT 20, 1993
                  HELP-PROMPT:    Enter control fields normally entered AFTER a
                                  sort field when doing a FileMan print.  These
                                  control fields control printing of the
                                  subheader.  Answer must be 1-120 characters in
                                  length.
                  DESCRIPTION:    Subheader formatting characters for printing
                                  the "Nth" subscript from the BY(0)
                                  global/cross-reference.  Used to set second
                                  piece of DISPAR(0,N) input variable to the
                                  FileMan print, EN1^DIP. If defined, it should
                                  contain any subheader formatting characters
                                  that are normally entered AFTER a sort field in
                                  the FileMan interactive mode for printing data.
                                  See the FileMan User's manual section on How to
                                  Display and Print File Data for more
                                  information. (ex. ;C3;"SUBHEADER TITLE:" to
                                  begin printing subheader in column 3, with a
                                  literal caption.)

                  TECHNICAL DESCR:This field should only be filled out if BY(0)
                                  exists, but is not required.
                                   If a record exists, for example, in record 1
                                  of this multiple, then the second piece of
                                  DISPAR(0,1) should be set to the contents of
                                  this field before calling EN1^DIP.

                  GROUP:          V21

  19.04,3         SUBHEADER OUTPUT TRANSFORM 1;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  LAST EDITED:    OCT 13, 1993
                  HELP-PROMPT:    Enter Standard MUMPS code that takes
                                  untransformed subscript Y from the BY(0)
                                  cross-reference, and puts the printable value
                                  into Y.
                  DESCRIPTION:    Output transform code for printing the "Nth"
                                  subscript subheader from the BY(0)
                                  global/cross-reference.  Used to set
                                  DISPAR(0,N,"OUT") input variable to the FileMan
                                  print, EN1^DIP. For instance, it could
                                  transform an inverse date into a printable
                                  date.  If defined, it should contain MUMPS code
                                  that transforms the internal value of the
                                  subscript "Y", into it's external form, also in
                                  variable "Y".

                  TECHNICAL DESCR:This field should only be filled out if BY(0)
                                  exists, but is not required.
                                   If a record exists, for example, in record 1
                                  of this multiple, then DISPAR(0,1,"OUT") should
                                  be set to the contents of this field before
                                  calling EN1^DIP.

                  WRITE AUTHORITY:@
                  GROUP:          V21



  19,77         DISUPNO                79;2 SET

                                  '1' FOR SUPPRESS HEADER IF NO RECORDS;
                LAST EDITED:      OCT 13, 1993
                HELP-PROMPT:      Enter 1 to suppress printing the HEADER and the
                                  'NO MATCHES' or 'No Records to Print' message,
                                  when no entries meet SEARCH or SORT criteria.
                DESCRIPTION:      If there are no matches found in a SEARCH, or
                                  if there are no records to print in a PRINT, VA
                                  FileMan still prints a header and a message
                                  informing the user that there were 0 matches,
                                  or no records to print.  If this input variable
                                  is set to 1, that print of the header will be
                                  suppressed and nothing will print.

                TECHNICAL DESCR:  Set DISUPNO to the contents of this field
                                  before calling either EN1^DIP or ENS^DIS. It is
                                  OK to set DISUPNO to this field even if it is
                                  null.

                GROUP:            V21

  19,78         DIPCRIT                79;3 SET

                                  '1' FOR PRINT SEARCH/SORT CRITERIA;
                LAST EDITED:      OCT 13, 1993
                HELP-PROMPT:      Print SEARCH and/or SORT criteria in the
                                  heading of the first page when using the
                                  standard FileMan header on a SEARCH or PRINT.
                DESCRIPTION:      When set to 1, causes SEARCH or SORT criteria
                                  to print in the heading of the first page of a
                                  report, along with the standard header.  If
                                  called from SEARCH option, both SEARCH and SORT
                                  criteria print.

                TECHNICAL DESCR:  Set DIPCRIT to the contents of this field
                                  before calling EN1^DIP.  It is OK to set
                                  DIPCRIT to this field, even if it is null.

                GROUP:            V21

  19,79         DIASKHD                79;1 SET

                                  '0' FOR Do not ask user for a header;
                                  '1' FOR Ask user for a header;
                LAST EDITED:      MAR 20, 1991
                HELP-PROMPT:      Entering a 1 will cause a user to be prompted
                                  for a print header.
                DESCRIPTION:       If this field is set to '1' then the variable
                                  DIASKHDR will be defined when FileMan is called
                                  to print.  The user will then be prompted for a
                                  header for the report.


  19,79.5       DISTEMP                79;4 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>32!($L(X)<1) X
                LAST EDITED:      OCT 13, 1993
                HELP-PROMPT:      Enter the name of a SEARCH template with
                                  criteria, to RE-DO the search.  Can be enclosed
                                  in brackets.  Answer must be 1-32 characters in
                                  length.
                DESCRIPTION:      This field MUST be defined in order to call the
                                  FileMan routine to RE-DO a search using the
                                  search criteria from an existing SEARCH
                                  TEMPLATE (routine ENS^DIS).  The field must
                                  contain the name of a SEARCH TEMPLATE.  This
                                  template name can be enclosed in square
                                  brackets but the brackets are not required.
                                  Note that if there are already search results
                                  on the template, they will be replaced by a new
                                  list of search results when this option is run.


                TECHNICAL DESCR:  This field is only used, and is REQUIRED, for a
                                  call to ENS^DIS, the option to re-do a search.
                                  If the field is defined, set DISTEMP equal to
                                  the contents of the field before the call.  You
                                  then must set up the other variables that would
                                  be set up if doing a normal FileMan PRINT.

                GROUP:            V21

  19,80         DIC {DIQ}              80;E1,64 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>64!($L(X)<1) X
                HELP-PROMPT:      Enter the global reference for DIQ, WITHOUT the
                                  "^".
                DESCRIPTION:      Used in the INQUIRY type option.  The global
                                  reference of the file to be used in the
                                  inquiry.
                                   example: DPT(


  19,81         DR {DIQ}               81;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>250!($L(X)<1) X
                HELP-PROMPT:      ANSWER MUST BE 1-250 CHARACTERS IN LENGTH
                DESCRIPTION:      Used in the INQUIRY type option.  Enter the
                                  GLOBAL SUBSCRIPTS that you want displayed on
                                  the inquiry.  Any fields residing in these
                                  global nodes will be displayed in standard
                                  captioned output format.  Multiple subscripts
                                  can be delimited by a semi-colon or a range of
                                  subscripts may be used delimiting the starting
                                  subscript and ending subscript with a colon.
                                   NOTE: Field security is not matched against
                                  user access for this option.  Data will be
                                  displayed regardless of user READ access to
                                  those fields.
                                   example:  DR {DIQ}=0;.1
                                   Would display any fields whose global location
                                  was in either global node 0 or global node .1


  19,82         DIQ(0)                 82;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>2!($L(X)<1) X I $D(X) F %=1:1:$L(X) I "
                                  C"'[$E(X,%) K X Q
                LAST EDITED:      DEC 15, 1987
                HELP-PROMPT:      Set this field to 'C' to display computed
                                  fields.
                DESCRIPTION:      If this field is set to "C", computed fields
                                  will be displayed.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,83         SUPRESS DEVICE PROMPT  83;1 SET

                                  'Y' FOR YES;
                                  'N' FOR NO;
                LAST EDITED:      AUG 25, 1992
                HELP-PROMPT:      Enter Yes or No.  With [CAPTIONED] template Yes
                                  forces output to the screen.

  19,99         TIMESTAMP              99;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>15!($L(X)<1) X
                LAST EDITED:      OCT 13, 1985
                HELP-PROMPT:      ANSWER MUST BE 1-15 CHARACTERS IN LENGTH
                DESCRIPTION:       This field contains the timestamp for when the
                                  option was created.

                WRITE AUTHORITY:  ^

  19,99.1       TIMESTAMP OF PRIMARY MENU 99.1;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>15!($L(X)<1) X
                HELP-PROMPT:      ANSWER MUST BE 1-15 CHARACTERS IN LENGTH
                DESCRIPTION:       This field contains the timestamp of when this
                                  primary menu tree was rebuilt.

                WRITE AUTHORITY:  ^

  19,100        *ORDER PRINT ACTION    100;E1,245 MUMPS

                INPUT TRANSFORM:  D ^DIM
                LAST EDITED:      JUN 03, 1987
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                WRITE AUTHORITY:  @

  19,100.1      *ORDER CANCEL ACTION   100.1;E1,245 MUMPS

                INPUT TRANSFORM:  D ^DIM
                LAST EDITED:      JUN 03, 1987
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                WRITE AUTHORITY:  @

  19,100.2      *ORDER PURGE ACTION    100.2;E1,245 MUMPS

                INPUT TRANSFORM:  D ^DIM
                LAST EDITED:      JUN 03, 1987
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                WRITE AUTHORITY:  @

  19,110        INDEPENDENTLY INVOCABLE 2;1 SET

                Independently Invocable
                                  'n' FOR NO;
                                  'y' FOR YES;
                LAST EDITED:      FEB 10, 1989
                HELP-PROMPT:      Enter NO if this option requires the action of
                                  another option first
                DESCRIPTION:      This field is only to document those options
                                  that the site can't randomly add to other
                                  options.

                                  If this field is NO then this option requires
                                  that some option or action has been done before
                                  it can be called.  If this field is YES then
                                  this option can be invoked at any time.  It is
                                  up to the developer to set this field.

                                  The MENU system doesn't look at this at any
                                  time.


  19,200        *QUEUED TO RUN AT WHAT TIME 200;1 DATE

                TIME AT WHICH TASKMAN WILL AUTOMATICALLY START UP THIS OPTION
                INPUT TRANSFORM:  K X
                LAST EDITED:      JUL 14, 1994
                HELP-PROMPT:      Time must be at least 2 minutes in the future
                                  and type run, action, print
                DESCRIPTION:      This field is OBSOLETE,  Please use the new
                                  Option scheduling File.

                EXECUTABLE HELP:  N % S %(1)="Changing or deleting this date/time
                                   field will re-queue",%(2)="or un-queue the Opt
                                  ion." D EN^DDIOL(.%)
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  19^AZT^MUMPS
                                  1)= Q
                                  2)= Q
                                  This field and X-ref are beening replaced part
                                  of a package install) to set or remove the
                                  option as a task queued for the specified time.




  19,201        *DEVICE FOR QUEUED JOB OUTPUT 200;2 FREE TEXT

                INPUT TRANSFORM:  K X
                LAST EDITED:      JUL 14, 1994
                HELP-PROMPT:      MUST BE NAME OF DEVICE ON WHICH THE QUEUED
                                  OPTION WILL PRINT
                DESCRIPTION:      This field is OBSOLETE,  Please use the new
                                  Option scheduling File.

                EXECUTABLE HELP:  N % S %(1)="If TASKMAN cannot identify a DEVICE
                                   by this name",%(2)="at the time of dequeueing,
                                   job will not run, " D EN^DDIOL(.%)
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  19^AZTIO^MUMPS
                                  1)= Q
                                  2)= Q


  19,202        *RESCHEDULING FREQUENCY 200;3 FREE TEXT

                FREQUENCY WITH WHICH THIS OPTION WILL BE AUTOMATICALLY RESCHEDULED
   TO RUN
                INPUT TRANSFORM:  K X
                LAST EDITED:      MAR 09, 1994
                HELP-PROMPT:      FOR AUTOMATIC RE-QUEUING, ANSWER WITH INCREMENT
                                  OF HOURS, DAYS, OR MONTHS
                DESCRIPTION:      This field is OBSOLETE,  Please use the new
                                  Option scheduling File.

                EXECUTABLE HELP:  N % S %(1)="Examples:",%(2)=" 120S = job will b
                                  e re-run every two minutes",%(3)="   1H = job w
                                  ill be rerun every hour",%(4)="   7D = job will
                                   be re-run every week",%(5)="   3M = job will b
                                  e run once a quarter" D EN^DDIOL(.%)
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,203        *QUEUED TO RUN ON VOLUME SET 200;4 FREE TEXT

                INPUT TRANSFORM:  K X
                LAST EDITED:      JUL 14, 1994
                HELP-PROMPT:      Answer must be the (2-15 char) volume set (CPU)
                                  name that the option should run on.
                DESCRIPTION:      This field is OBSOLETE,  Please use the new
                                  Option scheduling File.

                EXECUTABLE HELP:  D EN^DDIOL("The volume set name must also be in
                                   the Kernel site parameters as a volume set.")
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  19^AZTVOL^MUMPS
                                  1)= Q
                                  2)= Q
                                  This field and X-ref beening replaced.  part of
                                  a package install) for the option as a queued
                                  task.



  19,209        SCHEDULING RECOMMENDED 200.9;1 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                                  's' FOR STARTUP;
                LAST EDITED:      AUG 09, 1994
                DESCRIPTION:      This field should be filled in by developers to
                                  allow reports of options that a site should
                                  consider seting up for background scheduling.


  19,209.2      KEEP FROM DELETING     200.9;2 SET

                                  'y' FOR Yes;
                LAST EDITED:      JAN 17, 1997
                HELP-PROMPT:      Set if this is option shouldn't be purged.
                DESCRIPTION:      This field is to keep the DELETE UNREFERENCED
                                  OPTIONS routine from selecting this option for
                                  deletion even if it isn't referenced in the
                                  normal ways.  Like "Parent of Queuable Options"
                                  (ZTMQUEUABLE OPTIONS) or XUCOMMAD. Normal
                                  options don't need to set this field.


  19,220        SERVER BULLETIN        220;1 POINTER TO BULLETIN FILE (#3.6)

                LAST EDITED:      JUL 07, 1989
                HELP-PROMPT:      Enter the bulletin you would like sent to
                                  notify users of a server request
                DESCRIPTION:       This field may contain a pointer to the
                                  bulletin which will override the default
                                  bulletin XQSERVER for a server-type option.
                                  This bulletin will be usedto notify the users
                                  in the event of a security breach, etc.


  19,221        SERVER ACTION          220;2 SET

                                  'R' FOR RUN IMMEDIATELY;
                                  'Q' FOR QUEUE SERVER ROUTINE;
                                  'N' FOR NOTIFY MAIL GROUP (DO NOT RUN);
                                  'I' FOR IGNORE REQUESTS;
                LAST EDITED:      JUL 07, 1989
                HELP-PROMPT:      What do you want the menu system to do when a
                                  request for this server option is received from
                                  the mail system.
                DESCRIPTION:      A set of codes which tell the menu system what
                                  to do when a request for this server option is
                                  received from the mail system.


  19,222        SERVER MAIL GROUP      220;3 POINTER TO MAIL GROUP FILE (#3.8)

                LAST EDITED:      JUL 07, 1989
                HELP-PROMPT:      Who should be notified in the event of a server
                                  request if 'N' is specified in Server Action
                                  codes (field #221).
                DESCRIPTION:       This field amy contain a pointer to the Mail
                                  Group file.  This mail group will be notified
                                  in the even of a security breach etc. when a
                                  server-type option is envoked.


  19,223        SERVER AUDIT           220;4 SET

                                  'Y' FOR YES;
                                  'N' FOR NO;
                LAST EDITED:      JUL 07, 1989
                HELP-PROMPT:      Do you want all requests for this server, and
                                  results of those requests logged?
                DESCRIPTION:      This set of codes will determine whethere or
                                  not auditing will take place.  If auditing is
                                  turned on with a 'Y' (YES) response the menu
                                  system will record: 1. The server option
                                  requested, 2. Date/time of the request, 3.
                                  User (Postmaster), 4. Device (none), 5. Job #,
                                  6. Date/time of exit from the option, 7. CPU,
                                  8. Request result (error message, "task
                                  completed normally", etc.


  19,224        SUPRESS BULLETIN       220;5 SET

                SUPRESS SERVER REQUEST BULLETIN
                                  'Y' FOR YES, SUPRESS IT;
                                  'N' FOR NO (DEFAULT) SEND A BULLETIN;
                LAST EDITED:      NOV 30, 1989
                HELP-PROMPT:      ENTER 'Y' TO SUPRESS THE SENDING OF A BULLETIN
                DESCRIPTION:      If this field contains a 'Y' no bulletin will
                                  be fired when a server request is recieved.
                                  The default is to send a bulletin.  If there is
                                  no bulletin in field #220 (SERVER BULLETIN)
                                  then the default bulletin XQSERVER is fired
                                  off.


  19,225        SERVER REPLY           220;6 SET

                                  'N' FOR NO REPLY (DEFAULT);
                                  'E' FOR REPLY ON ERROR ONLY;
                                  'R' FOR SEND REPLY IN ALL CASES;
                LAST EDITED:      NOV 30, 1989
                HELP-PROMPT:      N=NO REPLY, E=REPLY ON ERROR ONLY, R=SEND REPLY
                DESCRIPTION:      This field controls the transmission of replies
                                  to server requests via network mail.  If the
                                  field contains 'R' a reply will be transmitted
                                  to the sender of the server request.  If the
                                  field contains an 'E' a network reply will be
                                  transmitted only in the event that an error was
                                  trapped during the attemp to run a server
                                  option, Entry or Exit Actions, or the routine
                                  associated with a server option.


  19,226        SAVE REQUEST           220;7 SET

                                  '0' FOR Do not save request;
                                  '1' FOR Save request in Postmaster basket;
                LAST EDITED:      FEB 04, 1992
                HELP-PROMPT:      A '1' in this field will cause the message to
                                  be entered in mail basket for long-term
                                  storage.
                DESCRIPTION:      If there is a 1 in this field or if this field
                                  is null, then the server request message is
                                  saved in a mailbox for the Postmaster that is
                                  named "S."option_name.


  19,227        SERVER DEVICE          220;8 POINTER TO DEVICE FILE (#3.5)

                LAST EDITED:      NOV 16, 1993
                HELP-PROMPT:      Enter the name of a resource in the Device File

  19,228        ZTSK RETENTION DAYS    220;9 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>365)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      OCT 15, 1996
                HELP-PROMPT:      Number of days (1 to 365) task will be retained
                                  in ^ZTSK (default = 14 days).
                DESCRIPTION:      This is a number between 1 and 365 to incicate
                                  the number of days that a server task should be
                                  retained by Task Manager in ^ZTSK.  The default
                                  is 14 days if nothing is entered in this field.
                                  For long-term retention see field 226 which
                                  allows you to save the server message in a
                                  Postmaster mailbox.


  19,300        ICON                   W;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30!($L(X)<3) X
                LAST EDITED:      JUL 13, 1994
                HELP-PROMPT:      Enter the name of a file containing the icon
                                  for this window option.

  19,301        TITLE                  W;2 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>25!($L(X)<3) X
                LAST EDITED:      AUG 05, 1994
                HELP-PROMPT:      Answer must be 3-25 characters in length.

  19,320        RPC                    RPC;0 POINTER Multiple #19.05

                TECHNICAL DESCR:  This field contains a pointer to the Remote
                                  Procedure file for an RPC registered to this
                                  option.


  19.05,.01       RPC                    0;1 POINTER TO REMOTE PROCEDURE FILE (#8
                                    994) (Multiply asked)

                  LAST EDITED:      DEC 12, 1995
                  HELP-PROMPT:      Enter a Remote Procedure registered to this
                                    option.
                  DESCRIPTION:      This subfile is used to register the Remote
                                    Procedures registered to a particular
                                    Broker-type option.  It is a pointer to the
                                    Remote Procedure File.

                  CROSS-REFERENCE:  19.05^B
                                  1)= S ^DIC(19,DA(1),"RPC","B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19,DA(1),"RPC","B",$E(X,1,30),DA)


  19.05,1         RPCKEY               0;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>30!($L(X)<1) X I $D(X) Q:$D(^DIC(19.1,"
                                  B",X))  W !,*7,"Key name must match exactly wit
                                  h a key in the Security Key File." K X
                  LAST EDITED:    JAN 08, 1996
                  HELP-PROMPT:    Answer must be the name of an existing key 1-30
                                  characters in length.
                  DESCRIPTION:    This field is the free-text name from the
                                  Security Key File that will be checked when
                                  this remote procedure call is requested to the
                                  broker.  If the user does not hold this key
                                  then the request will be denied.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19.05,2         RULES                1;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  LAST EDITED:    DEC 12, 1995
                  HELP-PROMPT:    This is Standard MUMPS code.
                  DESCRIPTION:    This field contains standard M code that will
                                  be executed when this remote procedure call is
                                  requested from the broker.  The variable
                                  XQRPCOK is set to 1 and the code is executed.
                                  If the value of that variable is reset to 0 by
                                  the RULES code, then the request is denied.

                  WRITE AUTHORITY:@



  19,1613       PRIMARY MENU           1613;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>77!($L(X)<3)!($P(^DIC(19,DA,0),U,4)'="M
                                  ") X
                LAST EDITED:      FEB 25, 1985
                HELP-PROMPT:      Answer with a User description, if this menu
                                  could be assigned as a 'Primary Menu Option'
                DESCRIPTION:      This field will have a value only if the Option
                                  is a 'high-level' menu Option, which could be
                                  assigned to a typical user.  For example, the
                                  value of this field might be "PHARMACIST", or
                                  "ADMISSIONS CLERK"

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,1840       PROTECTED VARIABLES    NOKILL;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1)!(X[" ") X S X="N "_X D ^D
                                  IM S:$D(X) X=$E(X,3,999)
                LAST EDITED:      FEB 15, 1995
                HELP-PROMPT:      Answer must be a list of variables. Limit 245
                                  char.
                DESCRIPTION:      This field holds a list of variables that need
                                  to be protected when another package call
                                  KILL^XUSCLEAN.  These should all be documented
                                  package wide variables.  The format is that of
                                  a list of variable names separated by commas.
                                  i.e. DUZ,DTIME,DT

                TECHNICAL DESCR:  This list is used as the indirect argument to a
                                  NEW command.

                EXECUTABLE HELP:  W !,"Like:",!,"DUZ,DTIME,DT"
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  19,1916       *SPECIAL QUEUEING      1916;1 SET

                                  'S' FOR STARTUP;
                INPUT TRANSFORM:  D IT1916^XUTMG19
                LAST EDITED:      JUL 14, 1994
                HELP-PROMPT:      SHOULD NOT BE ANSWERED UNLESS THIS IS A STARTUP
                                  (BOOT-TIME) ROUTINE!!
                DESCRIPTION:      This field is OBSOLETE,  Please use the new
                                  Option scheduling File.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  19^ASTARTUP^MUMPS
                                  1)= Q
                                  2)= Q
                                  This cross-reference causes the updating of the
                                  option as a startup option to be started when
                                  the system is started.




        FILES POINTED TO                      FIELDS

  BULLETIN (#3.6)                   SERVER BULLETIN (#220)

  DEVICE (#3.5)                     SERVER DEVICE (#227)
                                    PERMITTED DEVICE:PERMITTED DEVICE (#.01)

  HELP FRAME (#9.2)                 HELP FRAME (#3.7)

  MAIL GROUP (#3.8)                 SERVER MAIL GROUP (#222)

  NEW PERSON (#200)                 CREATOR (#3.6)

  OPTION (#19)                      MENU:ITEM (#.01)
                                    QUEUING REQUIRED:TIME PERIOD (#.01)

  PACKAGE (#9.4)                    PACKAGE (#12)

  REMOTE PROCEDURE (#8994)          RPC:RPC (#.01)



  INPUT TEMPLATE(S):
  XU-ZTMSCHEDULE                FEB 18, 1988        USER #0
  XUEDITOPT                     FEB 15, 2000@11:02  USER #0

  PRINT TEMPLATE(S):
  BPS TECH - OPTIONS            FEB 05, 2001@07:36  USER #0           BPS OPTIONS
  CAPTIONED                                         USER #0
  ONCOLOGY OPTION LIST          MAY 28, 1992@18:49  USER #0
                                                             ONCOLOGY OPTION LIST
  XQ-BACKGROUND RECOMMENDED     APR 22, 1994@16:04  USER #0
                                                   Recommended Background Options
  XUMENULIST                    JUL 01, 1984        USER #0
                                            Menu list by display terms [MENULIST]

  SORT TEMPLATE(S):
  ONCOLOGY OPTION LIST          MAY 28, 1992@18:50  USER #0
                                'ONCOLOGY OPTION LIST' Print Template always used
  SORT BY: TYPE//    (User is asked range)
    WITHIN TYPE, SORT BY: NAME//     From 'ONCO'  To 'ONCOZ^ONCOZ'

  XQ-BACKGROUND RECOMMENDED     MAR 24, 1994@07:58  USER #0
  SORT BY: SCHEDULING RECOMMENDED// (SCHEDULING RECOMMENDED not null)

  XQTYPEERRORS                  FEB 04, 1994@09:31  USER #0


  FORM(S)/BLOCK(S):
  XQEDTOPT                      NOV 04, 1997@12:03  USER #0
    MAIN                          DD #19
    MAIN TITLE                    DD #19
    Restrictions                  DD #19
    Executable 1                  DD #19
    EXECUTABLES header            DD #19
    Menu Multiple                 DD #19.01
    XQEDTOPT DISP1                DD #19
    EDIT header                   DD #19
    EDIT edit block               DD #19
    PRINT header                  DD #19
    PRINT edit                    DD #19
    PRINT2 header                 DD #19
    PRINT2 edit                   DD #19
    INQUIRE header                DD #19
    INQUIRE edit                  DD #19
    ROUTINE header                DD #19
    ROUTINE edit                  DD #19
    SERVER header                 DD #19
    SERVER edit                   DD #19
    SCREEN header                 DD #19
    SCREEN edit                   DD #19
    BROKER header                 DD #19
    BROKER edit                   DD #19.05
    WINDOW header                 DD #19
    WINDOW edit                   DD #19
    SUITE header                  DD #19
    SUITE menu                    DD #19.01
    DAYS/TIMES header             DD #19
    DAYS/TIMES edit               DD #19.391
    DEVICE header                 DD #19
    DEVICES edit                  DD #19.396
    QUEUING header                DD #19
    QUEUING edit                  DD #19.392
    ACTION header                 DD #19
    ACTION edit                   DD #19
    PRINT3 edit 2                 DD #19.02
    PRINT3 header 1               DD #19
    PRINT3 edit 1                 DD #19.02
    PRINT3 header 2               DD #19
    PRINT3 header 3               DD #19
    SELECTION edit                DD #19
    DIC Edit                      DD #19
    DIC Header                    DD #19
    choice                        DD #19
    choice2                       DD #19
    BROKER OPTIONS                DD #19
    CONTEXT                       DD #19.01
          The form XQEDTOPT is the screen-based Option Editor.

SECURITY KEY
------------

::

  STANDARD DATA DICTIONARY #19.1 -- SECURITY KEY FILE
  STORED IN ^DIC(19.1,

  This file holds the names of security keys that are used to lock options.  To
  lock an option, the name of the key is entered in the Lock field of the Option
  File.  To permit a user to unlock the option, the user's name is entered in the
  Holder field of this file.  It is cross-referenced by name and holder.


                DD ACCESS: #
                RD ACCESS: #
                WR ACCESS: #
               DEL ACCESS: #
             LAYGO ACCESS: #

  POINTED TO BY: SUBORDINATE KEY field (#.01) of the SUBORDINATE KEY sub-field
                     (#19.13) of the SECURITY KEY File (#19.1)
                 MUTUALLY EXCLUSIVE KEYS field (#.01) of the MUTUALLY EXCLUSIVE
                     KEYS sub-field (#19.15) of the SECURITY KEY File (#19.1)
                 USER ACCESS AUTHORIZATION field (#.9) of the ACCESSION File
                     (#68)
                 USER ACCESS AUTHORIZATION field (#51) of the LOAD/WORK LIST File
                     (#68.2)
                 USER KEY NEEDED field (#4) of the EXAMINATION STATUS File (#72)
                 ACCESS field (#.01) of the ACCESS sub-field (#101.03) of the
                     PROTOCOL File (#101)
                 KEY field (#.01) of the KEYS sub-field (#200.051) of the NEW
                     PERSON File (#200)
                 DELEGATED KEY field (#.01) of the DELEGATED KEYS sub-field
                     (#200.052) of the NEW PERSON File (#200)
                 KEY field (#6) of the RECALL REMINDERS PROVIDERS File (#403.54)
                 A PRIVILEGE field (#8) of the MH TESTS AND SURVEYS File
                     (#601.71)
                 SECURITY KEY field (#.01) of the SECURITY KEY sub-field
                     (#991.112) of the CIRN HL7 EXCEPTION TYPE File (#991.11)
                 SECURITY KEYS field (#.01) of the SECURITY KEYS sub-field
                     (#2006.1665) of the BP MAIL MESSAGE sub-field (#2006.166) of
                     the IMAGING SITE PARAMETERS File (#2006.1)

  CROSS
  REFERENCED BY: NAME(AC), NAME(B), DESCRIPTIVE NAME(E)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  19.1,.01      NAME                   0;1 FREE TEXT (Required)

                This is the name of the key, beginning with the package prefix
                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) D CHKNAME^XQ5 K:$
                                  L(X)>27!($L(X)<3)!'(X'?1P.E)!(X'?.ANP) X
                LAST EDITED:      JAN 22, 1992
                HELP-PROMPT:      Enter the name of the key, prefixed with the
                                  package code
                DESCRIPTION:      Each entry in this File is the name of a key
                                  that defines some characteristic or capability
                                  for individual specified users.  The capability
                                  might be access to some OPTION (file 19) which
                                  is permited with the authorization.  Other
                                  functionalities (such as allowing scheduling
                                  overbook) might also be allowed only if the key
                                  is held.

                                  Keys are named with the standard package prefix
                                  formats; a 2-4 character package prefix for
                                  standard names or Z.

                DELETE TEST:      200,0)= I $D(^VA(200,"AB",DA)) W "  Can't delet
                                  e"

                                  UNEDITABLE
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  19.1^B
                                  1)= S ^DIC(19.1,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19.1,"B",$E(X,1,30),DA)

                CROSS-REFERENCE:  19.1^AC^MUMPS
                                  1)= Q
                                  2)= K ^XUSEC(X),^VA(200,"AK."_X)
                                  3)= Cleanup
                                  This X-ref will clean-up the XUSEC global if a
                                  key is removed by an app calling DIK directly.
                                  If the UNEDITABLE flag was removed and the KEY
                                  name changed it would clean-up the old name
                                  from XUSEC BUT would not set in the new name.
                                  to do that the MUMPS X-ref on the KEY sub-file
                                  of the NEW PERSON file.  will need to be
                                  re-indexed.



  19.1,.02      DESCRIPTIVE NAME       0;2 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)
                                  <2) X
                LAST EDITED:      SEP 29, 1989
                HELP-PROMPT:      Answer must be 2-30 characters in length.
                DESCRIPTION:      This is a more descriptive name for the KEY
                                  than allowed in the namespaced name field.

                CROSS-REFERENCE:  19.1^E^MUMPS
                                  1)= S %X=X X "F %=1:1:$L(%X) I $E(%X,%)?1L S %X
                                  =$E(%X,1,%-1)_$C($A(%X,%)-32)_$E(%X,%+1,99)" S
                                  ^DIC(19.1,"E",%X,DA)=""

                                  2)= S %X=X X "F %=1:1:$L(%X) I $E(%X,%)?1L S %X
                                  =$E(%X,1,%-1)_$C($A(%X,%)-32)_$E(%X,%+1,99)" K
                                  ^DIC(19.1,"E",%X,DA)
                                  3)= This is a uppercase only X-ref of the field
                                  .
                                  This is a normal X-ref that has the special
                                  code to see that the X-ref is in all uppercase
                                  for easy lookup.



  19.1,.03      PERSON LOOKUP          0;3 SET

                                  'l' FOR LOOKUP;
                LAST EDITED:      SEP 27, 1989
                HELP-PROMPT:      Should a X-ref of holders of this key be made
                                  for person lookup.
                DESCRIPTION:      This field when set to 'lookup' will build a
                                  X-ref on the NEW PERSON file of all holders of
                                  the key.  This will be under a X-ref of
                                  'AK.'_<keyname> so that a package can lookup
                                  members of a group.

                                  There is a standard SECURITY KEY that will be
                                  sent out of 'PROVIDER' with the lookup flag
                                  set. Then a package can do a lookup of
                                  PROVIDER's with the following code: S
                                  DIC="^VA(200,",D="AK.PROVIDER",DIC(0)="AEQ" D
                                  IX^DIC


  19.1,.04      KEEP AT TERMINATE      0;4 SET

                                  'y' FOR YES;
                                  'n' FOR NO;
                LAST EDITED:      SEP 24, 1991
                HELP-PROMPT:      Does the user need to keep this key when
                                  terminated.
                DESCRIPTION:      If this field is set to YES (1) then this key
                                  will not be removed from a user in the New
                                  Person file when they are terminated.

                                  One example is the 'PROVIDER' key.


  19.1,.05      SEND TO J2EE           0;5 SET

                                  '0' FOR No;
                                  '1' FOR Yes;
                LAST EDITED:      FEB 22, 2005
                DESCRIPTION:      This field controls if this is a Security Key
                                  that should be sent to the J2EE application
                                  server for temporary role assignment.

                                  If this field is set to 'Yes' then this
                                  Security Key can be sent to the application
                                  server.


  19.1,1        DESCRIPTION            1;0   WORD-PROCESSING #19.11

                DESCRIPTION:      This is a short description of the security
                                  key, indicating what the key locks out, and
                                  what class of users should be assigned the key.



  19.1,3        SUBORDINATE KEY        3;0 POINTER Multiple #19.13

                DESCRIPTION:      Subordinate authorization are "given" when the
                                  "master" authorization is given.  This allows
                                  easier and more efficient delegation of
                                  authorizations.


  19.13,.01       SUBORDINATE KEY        0;1 POINTER TO SECURITY KEY FILE (#19.1)
                                     (Multiply asked)

                  INPUT TRANSFORM:S DIC("S")="I $D(^XUSEC(""XUMGR"",DUZ))!$S($D(^
                                  VA(200,DUZ,52,+Y,0)):$P(^(0),U,4),1:0)" D ^DIC
                                  K DIC S DIC=DIE,X=+Y K:Y<0 X
                  LAST EDITED:    SEP 30, 1992
                  HELP-PROMPT:    A cluster of keys to allow easier key
                                  assignment.
                  DESCRIPTION:    Subordinate authorization is "given" at the
                                  same time the "master" authorization is
                                  "given".  This permits more efficient and
                                  easier delegation of authority.

                  SCREEN:         S DIC("S")="I $D(^XUSEC(""XUMGR"",DUZ))!$S($D(^
                                  VA(200,DUZ,52,+Y,0)):$P(^(0),U,4),1:0)"
                  EXPLANATION:    The person clustering authorizations must have
                                  the authority not only to delegate but also the
                                   authority to give others the authority to dele
                                  gate.
                  CROSS-REFERENCE:19.13^B
                                  1)= S ^DIC(19.1,DA(1),3,"B",$E(X,1,30),DA)=""
                                  2)= K ^DIC(19.1,DA(1),3,"B",$E(X,1,30),DA)




  19.1,4        GRANTING CONDITION     4;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      SEP 27, 1989
                HELP-PROMPT:      This is Standard MUMPS code.
                DESCRIPTION:      This is MUMPS code that set $T true if its OK
                                  for the person to be granted this key.

                WRITE AUTHORITY:  @

  19.1,5        MUTUALLY EXCLUSIVE KEYS 5;0 POINTER Multiple #19.15


  19.15,.01       MUTUALLY EXCLUSIVE KEYS 0;1 POINTER TO SECURITY KEY FILE (#19.1
                                    ) (Multiply asked)

                  LAST EDITED:      MAY 20, 1994
                  HELP-PROMPT:      Enter the name of a key that may not be held
                                    jointly with this one.
                  CROSS-REFERENCE:  19.15^B
                                    1)= S ^DIC(19.1,DA(1),5,"B",$E(X,1,30),DA)=""
                                    2)= K ^DIC(19.1,DA(1),5,"B",$E(X,1,30),DA)





        FILES POINTED TO                      FIELDS

  SECURITY KEY (#19.1)              SUBORDINATE KEY:SUBORDINATE KEY (#.01)
                                    MUTUALLY EXCLUSIVE KEYS:MUTUALLY EXCLUSIVE KEY
  S (#.01)



  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):

PROTOCOL
--------

::

  STANDARD DATA DICTIONARY #101 -- PROTOCOL FILE
  STORED IN ^ORD(101,

  This file contains the orderables and methods for accomplishing orders
  (protocols) within OE/RR.


  COMPILED CROSS-REFERENCE ROUTINE:
                           XQORC
  IDENTIFIED BY: ITEM TEXT (#1), IDENTIFIER (#44)

  POINTED TO BY: PROTOCOL or OPTION USED field (#4.2) of the AUDIT File (#1.1)
                 PROTOCOL field (#1) of the PHARMACY QUICK ORDER File (#57.1)
                 PROTOCOL field (#.01) of the LAB SEARCH/EXTRACT PROTOCOL File
                     (#69.4)
                 DIALOG field (#2) of the ORDER File (#100)
                 NAME field (#.01) of the ORDER STATISTICS File (#100.1)
                 ADD MENU DEFAULT field (#4) of the ORDER PARAMETERS File
                     (#100.99)
                 PROTOCOL field (#.01) of the CONVERTED PROTOCOLS sub-field
                     (#100.99101) of the ORDER PARAMETERS File (#100.99)
                 PROTOCOL field (#.01) of the UNSUCCESSFUL DIALOGS sub-field
                     (#100.99141) of the ORDER PARAMETERS File (#100.99)
                 PROTOCOL TO EXPORT field (#.01) of the PROTOCOL TO EXPORT
                     sub-field (#100.9951) of the PACKAGE PARAMETERS sub-field
                     (#100.995) of the ORDER PARAMETERS File (#100.99)
                 MENU field (#.01) of the MENU sub-field (#100.99511) of the
                     PROTOCOL TO EXPORT sub-field (#100.9951) of the PACKAGE
                     PARAMETERS sub-field (#100.995) of the ORDER PARAMETERS File
                     (#100.99)
                 DEFAULT PROTOCOL field (#.03) of the PROTOCOL SET sub-field
                     (#100.9955) of the PACKAGE PARAMETERS sub-field (#100.995)
                     of the ORDER PARAMETERS File (#100.99)
                 ITEM field (#.01) of the ITEM sub-field (#101.01) of the
                     PROTOCOL File (#101)
                 MODIFYING ACTION field (#4) of the ITEM sub-field (#101.01) of
                     the PROTOCOL File (#101)
                 SUBSCRIBERS field (#.01) of the SUBSCRIBERS sub-field
                     (#101.0775) of the PROTOCOL File (#101)
                 PROCEDURE/REQUEST TYPE field (#4) of the REQUEST/CONSULTATION
                     File (#123)
                 URGENCY field (#5) of the REQUEST/CONSULTATION File (#123)
                 PLACE OF CONSULTATION field (#6) of the REQUEST/CONSULTATION
                     File (#123)
                 PROTOCOL MENU OF REQUEST ITEMS field (#123.02) of the REQUEST
                     SERVICES File (#123.5)
                 PROTOCOL ACTION MENU BY USERS field (#123.03) of the REQUEST
                     SERVICES File (#123.5)
                 PROTOCOL ACTION MENU BY OPTION field (#123.04) of the REQUEST
                     SERVICES File (#123.5)
                 PROCEDURE TYPE field (#.01) of the PROCEDURE TYPE sub-field
                     (#123.5101) of the REQUEST SERVICES File (#123.5)
                 GMRCR PROTOCOL field (#.01) of the GMRCR PROTOCOL sub-field
                     (#123.99) of the CONSULTS PARAMETERS FILE File (#123.9)
                 VISTA HL7 PROTOCOL field (#.07) of the VDEF EVENT DESCRIPTION
                     File (#577)
                 SUBSCRIBER field (#.01) of the CP_PROTOCOL_LOCATION File
                     (#704.006)
                 RELATED EVENT PROTOCOL field (#10) of the HL7 MESSAGE TEXT File
                     (#772)
                 SUBSCRIBER PROTOCOL field (#8) of the HL7 MESSAGE ADMINISTRATION
                     File (#773)
                 PROTOCOL field (#13) of the ROR REGISTRY PARAMETERS File
                     (#798.1)
                 HL7 EVENT PROTOCOL field (#1) of the CIRN EVENT ASSOCIATION File
                     (#995)
                 ASSOCIATED PROTOCOL field (#.04) of the USR ACTION File
                     (#8930.8)
                 PROTOCOL field (#.25) of the VISIT File (#9000010)


  CROSS
  REFERENCED BY: SUBSCRIBERS(AB), ITEM(AD), FILE LINK(AE),
                 SENDING APPLICATION(AHL1), TRANSACTION MESSAGE TYPE(AHL1A),
                 EVENT TYPE(AHL1B), VERSION ID(AHL1C),
                 RECEIVING APPLICATION(AHL2), SENDING APPLICATION(AHL21),
                 TRANSACTION MESSAGE TYPE(AHL21A), VERSION ID(AHL21C),
                 TIMESTAMP(AM), ITEM TEXT(AM1), COLUMN WIDTH(AM41), NAME(B),
                 SYNONYM(B), ITEM TEXT(C), ITEM TEXT(K1), SYNONYM(K2),
                 SET MEMBERSHIP(S)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  101,.01       NAME                   0;1 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) D CHKNAME^XQORD10
                                  1 I $D(X) K:$L(X)>63!($L(X)<3) X
                LAST EDITED:      JUN 17, 1992
                HELP-PROMPT:      Enter a name that is preceded by the package
                                  namespace.
                DESCRIPTION:      A unique name, which is preceded by the package
                                  namespace.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  101^B
                                  1)= S ^ORD(101,"B",$E(X,1,63),DA)=""
                                  2)= K ^ORD(101,"B",$E(X,1,63),DA)

                CROSS-REFERENCE:  ^^TRIGGER^101^5
                                  1)= K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(
                                  ^ORD(101,D0,0)):^(0),1:"") S X=$P(Y(1),U,5),X=X
                                   S DIU=X K Y S X=DIV S X=DUZ X ^DD(101,.01,1,2,
                                  1.4)

                                  1.4)= S DIH=$S($D(^ORD(101,DIV(0),0)):^(0),1:""
                                  ),DIV=X S $P(^(0),U,5)=DIV,DIH=101,DIG=5 D ^DIC
                                  R:$N(^DD(DIH,DIG,1,0))>0

                                  2)= Q

                                  CREATE VALUE)= S X=DUZ
                                  DELETE VALUE)= NO EFFECT
                                  FIELD)= CREATOR


  101,1         ITEM TEXT              0;2 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>63!($L(X)
                                  <3) X
                LAST EDITED:      MAR 03, 1989
                HELP-PROMPT:      ANSWER MUST BE 3-63 CHARACTERS IN LENGTH
                DESCRIPTION:      The protocol's text as it appears to the user
                                  on the menu or subheader.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  101^C
                                  1)= S ORKX=X D UP^XQORDD1 S ^ORD(101,"C",$E(X,1
                                  ,63),DA)="",X=ORKX K ORKX

                                  2)= S ORKX=X D UP^XQORDD1 K ^ORD(101,"C",$E(X,1
                                  ,63),DA) S X=ORKX K ORKX

                CROSS-REFERENCE:  101^AM1^MUMPS
                                  1)= D REDO^XQORD101
                                  2)= D REDO^XQORD101

                CROSS-REFERENCE:  101^K1^MUMPS
                                  1)= D K11^XQORDD1
                                  2)= D K12^XQORDD1


  101,1.1       SYNONYM                2;0 Multiple #101.02
                                   (Add New Entry without Asking)

                HELP-PROMPT:      Enter a synonym for this protocol
                DESCRIPTION:      This is another name for the protocol that may
                                  be used on lookup.


  101.02,.01      SYNONYM                0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>65!($L(X)
                                  <1) X
                  LAST EDITED:    OCT 31, 1991
                  HELP-PROMPT:    Enter a synonym for this protocol (1-65
                                  characters)
                  CROSS-REFERENCE:101.02^B
                                  1)= S ^ORD(101,DA(1),2,"B",$E(X,1,30),DA)=""
                                  2)= K ^ORD(101,DA(1),2,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:101^B^MNEMONIC
                                  1)= S:'$D(^ORD(101,"B",$E(X,1,30),DA(1),DA)) ^(
                                  DA)=1

                                  2)= I $D(^ORD(101,"B",$E(X,1,30),DA(1),DA)),^(D
                                  A) K ^(DA)

                  CROSS-REFERENCE:101^K2^MUMPS
                                  1)= D K21^XQORDD1
                                  2)= D K22^XQORDD1

                  CROSS-REFERENCE:101.02^AM1V1^MUMPS
                                  1)= D REDOM^XQORD101
                                  2)= D REDOM^XQORD101
                                  Updates timestamps on menus containing this
                                  item.





  101,1.11      PRINT NAME             .1;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>7!($L(X)<1) X
                LAST EDITED:      AUG 08, 1991
                HELP-PROMPT:      Answer must be 1-7 characters in length.
                DESCRIPTION:      This is a shortened version of the item text to
                                  be used on print-outs where the name must be
                                  abbreviated.


  101,2         DISABLE                0;3 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>40!($L(X)<1) X
                LAST EDITED:      DEC 07, 1988
                HELP-PROMPT:      Enter text to disable this protocol (1-40
                                  characters).
                DESCRIPTION:      This field disables use of the protocol when
                                  there is text in it.  The text should be a
                                  short message explaining why use of the
                                  protocol has been disabled, as it will be
                                  displayed if the protocol is selected.


  101,3         LOCK                   0;6 FREE TEXT

                The name of the key required of the user to access this option
                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)
                                  <1) X I $D(X) Q:$D(^DIC(19.1,"B",X))  W !,*7,"K
                                  ey name must match exactly with a key in SECURI
                                  TY KEY file." K X
                LAST EDITED:      MAR 27, 1990
                HELP-PROMPT:      Enter the exact name of the key required to
                                  access this option.
                DESCRIPTION:      This field is used to deny access to users who
                                  have this option as part of their menu. If an
                                  option has a lock, then only users who hold the
                                  matching key can access it.

                EXECUTABLE HELP:  S X="??",DIC=19.1,DIC(0)="E" I $D(^DIC(19.1,0))
                                  ,$P(^(0),U,3) W "CURRENT LOCKS:" D ^DIC W !
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  101,3.5       DESCRIPTION            1;0   WORD-PROCESSING #101.06

                HELP-PROMPT:      Enter a description for this protocol
                DESCRIPTION:      This field contains a brief explanation of the
                                  protocol.


  101,3.9       PROHIBITED TIMES       0;9 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>9!($L(X)<
                                  9)!'(X?4N1"-"4N) X
                LAST EDITED:      MAR 27, 1990
                HELP-PROMPT:      Enter the times in military format that this
                                  protocol cannot be used.
                DESCRIPTION:      This specifies a time range during which this
                                  option cannot be accessed.  The time should be
                                  entered in military format. For example, to
                                  prohibit an option from running between 9 AM
                                  and 2 PM, enter 0900-1400.


  101,4         TYPE                   0;4 SET (Required)

                                  'A' FOR action;
                                  'M' FOR menu;
                                  'O' FOR protocol;
                                  'Q' FOR protocol menu;
                                  'L' FOR limited protocol;
                                  'X' FOR extended action;
                                  'D' FOR dialog;
                                  'T' FOR term;
                                  'E' FOR event driver;
                                  'S' FOR subscriber;
                LAST EDITED:      JUL 22, 1994
                HELP-PROMPT:      Specify a type for this protocol.
                DESCRIPTION:      This field defines the type of protocol to be
                                  executed.  Types Q, O, and L are strictly
                                  related to the 'Add orders' function.
                                    Q = Protocol menu - used for displaying and
                                  selecting orderable items during the add
                                  sequence. When this type of protocol is
                                  encountered OE/RR will ask the 'Select
                                  PATIENT:,' 'LOCATION:,' 'Provider:' prompts and
                                  execute the transaction logic for the new
                                  orders screen.  This is also true for type O
                                  and L.  O = Protocol - same as Q but the
                                  protocol is the item selected.  Protocols are
                                  directly executed when encountered.  L =
                                  Limited protocol - same as O but any existing
                                  sub-items are not executed.  M = Menu - used
                                  for displaying and selecting items.  X =
                                  Extended action - protocols of this type
                                  execute the entry action plus all sub-items.
                                    A = Action - same as X but any existing
                                  sub-items are not executed.


  101,5         CREATOR                0;5 POINTER TO NEW PERSON FILE (#200)
                                   (Required)

                LAST EDITED:      AUG 20, 1990
                HELP-PROMPT:      Enter the creator of this protocol.
                DESCRIPTION:
                                  This field identifies who created the protocol.


                WRITE AUTHORITY:  ^
                NOTES:            TRIGGERED by the NAME field of the PROTOCOL
                                  File


  101,6         FILE LINK              5;1          VARIABLE POINTER

                FILE  ORDER  PREFIX    LAYGO  MESSAGE
                   19   1    OPT          n   OPTION
                   60   2    LAB          n   LAB
                   62   3    SAM          n   SAMPLE
                   61   4    SPEC         n   SPECIMEN
                   71   5    RAD          n   RADIOLOGY PROCEDURE
               62.05    6    URG          n   URGENCY
               62.07    7    EXE          n   EXECUTE CODE
               123.5    8    S            n   SERVICE
               123.1    9    A            n   ACTION TYPES

                LAST EDITED:      APR 19, 1991
                HELP-PROMPT:      Enter the file, if any, that this protocol is
                                  linked to.
                DESCRIPTION:      This field is a variable pointer which may
                                  point to the entry in a file to which a
                                  protocol is linked.

                CROSS-REFERENCE:  101^AE
                                  1)= S ^ORD(101,"AE",$E(X,1,30),DA)=""
                                  2)= K ^ORD(101,"AE",$E(X,1,30),DA)


  101,8         COST                   5;2 NUMBER

                INPUT TRANSFORM:  S:X["$" X=$P(X,"$",2) K:X'?.N.1".".2N!(X>999999
                                  9)!(X<0) X
                LAST EDITED:      APR 26, 1989
                HELP-PROMPT:      Type a Dollar Amount between 0 and 9999999, 2
                                  Decimal Digits
                DESCRIPTION:      This is the cost of filling the order
                                  associated with this protocol.


  101,10        ITEM                   10;0 POINTER Multiple #101.01
                                   (Add New Entry without Asking)

                HELP-PROMPT:      Enter items for this protocol.
                DESCRIPTION:
                                  This is the item multiple for a protocol


  101.01,.01      ITEM                   0;1 POINTER TO PROTOCOL FILE (#101)
                                     (Multiply asked)

                  INPUT TRANSFORM:  S ORDDF=101 D TREE^XQORD101
                  LAST EDITED:      SEP 11, 1991
                  HELP-PROMPT:      Enter a protocol.  A protocol that is an
                                    ancestor may not also be a sub-item.
                  DESCRIPTION:      This points to a protocol which is
                                    subordinate to this protocol.  NOTE:  The
                                    parent protocol or one of its ancestors may
                                    not be entered as an item.

                  NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:  101.01^B
                                    1)= S ^ORD(101,DA(1),10,"B",$E(X,1,30),DA)=""
                                    2)= K ^ORD(101,DA(1),10,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:  101.01^AMM^MUMPS
                                    1)= D REDOX^XQORD101
                                    2)= D REDOX^XQORD101

                  CROSS-REFERENCE:  101^AD
                                    1)= S ^ORD(101,"AD",$E(X,1,30),DA(1),DA)=""
                                    2)= K ^ORD(101,"AD",$E(X,1,30),DA(1),DA)

                  CROSS-REFERENCE:  ^^TRIGGER^101.01^11
                                  1)= X ^DD(101.01,.01,1,4,1.3) I X S X=DIV S Y(1
                                  )=$S($D(^ORD(101,D0,10,D1,1)):^(1),1:"") S X=$P
                                  (Y(1),U,1),X=X S DIU=X K Y X ^DD(101.01,.01,1,4
                                  ,1.1) X ^DD(101.01,.01,1,4,1.4)

                                  1.1)= S X=DIV S I(1,0)=$S($D(D1):D1,1:""),I(0,0
                                  )=$S($D(D0):D0,1:""),D0=DIV S:'$D(^ORD(101,+D0,
                                  0)) D0=-1 S Y(101)=$S($D(^ORD(101,D0,101.04)):^
                                  (101.04),1:"") S X=$P(Y(101),U,2) S D0=I(0,0) S
                                   D1=I(1,0)

                                  1.3)= K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DI
                                  V(1)=D1 S Y(0)=X X ^DD(101.01,.01,1,4,69.3) S Y
                                  (101)=$S($D(^ORD(101,D0,0)):^(0),1:"") S X=$P(Y
                                  (101),U,4),X=X S X=X="T",Y=X,X=Y(5),X=X&Y S D0=
                                  I(0,0) S D1=I(1,0)

                                  1.4)= S DIH=$S($D(^ORD(101,DIV(0),10,DIV(1),1))
                                  :^(1),1:""),DIV=X S $P(^(1),U,1)=DIV,DIH=101.01
                                  ,DIG=11 D ^DICR:$N(^DD(DIH,DIG,1,0))>0

                                  2)= Q

                                  69.2)= S I(1,0)=$S($D(D1):D1,1:""),I(0,0)=$S($D
                                  (D0):D0,1:""),Y(4)=$S($D(^ORD(101,D0,0)):^(0),1
                                  :""),Y(1)=$S($D(^ORD(101,D0,10,D1,1)):^(1),1:""
                                  ) S X=$P(Y(1),U,1)

                                  69.3)= X ^DD(101.01,.01,1,4,69.2) S X=X="",Y(2)
                                  =X,Y(3)=X S X=$P(Y(4),U,4),X=X S X=X="D",Y=X,X=
                                  Y(2),X=X&Y,Y(5)=X,Y(6)=X,D0=Y(0) S:'$D(^ORD(101
                                  ,+D0,0)) D0=-1

                                  CREATE CONDITION)= (PROMPT="")&(INTERNAL(TYPE)=
                                  "D")&(INTERNAL(ITEM:TYPE)="T")
                                  CREATE VALUE)= ITEM:DEFAULT PROMPT
                                  DELETE VALUE)= NO EFFECT
                                  FIELD)= PROMPT
                                  On adding an item initially, stuff the prompt
                                  field with the default prompt if the item is a
                                  term.


                  CROSS-REFERENCE:^^TRIGGER^101.01^12
                                  1)= X ^DD(101.01,.01,1,5,1.3) I X S X=DIV S Y(1
                                  )=$S($D(^ORD(101,D0,10,D1,1)):^(1),1:"") S X=$P
                                  (Y(1),U,2),X=X S DIU=X K Y X ^DD(101.01,.01,1,5
                                  ,1.1) X ^DD(101.01,.01,1,5,1.4)

                                  1.1)= S X=DIV S I(1,0)=$S($D(D1):D1,1:""),I(0,0
                                  )=$S($D(D0):D0,1:""),D0=DIV S:'$D(^ORD(101,+D0,
                                  0)) D0=-1 S Y(101)=$S($D(^ORD(101,D0,101.04)):^
                                  (101.04),1:"") S X=$P(Y(101),U,3) S D0=I(0,0) S
                                   D1=I(1,0)

                                  1.3)= K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DI
                                  V(1)=D1 S Y(0)=X X ^DD(101.01,.01,1,5,69.3) S Y
                                  (101)=$S($D(^ORD(101,D0,0)):^(0),1:"") S X=$P(Y
                                  (101),U,4),X=X S X=X="T",Y=X,X=Y(5),X=X&Y S D0=
                                  I(0,0) S D1=I(1,0)

                                  1.4)= S DIH=$S($D(^ORD(101,DIV(0),10,DIV(1),1))
                                  :^(1),1:""),DIV=X S $P(^(1),U,2)=DIV,DIH=101.01
                                  ,DIG=12 D ^DICR:$N(^DD(DIH,DIG,1,0))>0

                                  2)= Q

                                  69.2)= S I(1,0)=$S($D(D1):D1,1:""),I(0,0)=$S($D
                                  (D0):D0,1:""),Y(4)=$S($D(^ORD(101,D0,0)):^(0),1
                                  :""),Y(1)=$S($D(^ORD(101,D0,10,D1,1)):^(1),1:""
                                  ) S X=$P(Y(1),U,2)

                                  69.3)= X ^DD(101.01,.01,1,5,69.2) S X=X="",Y(2)
                                  =X,Y(3)=X S X=$P(Y(4),U,4),X=X S X=X="D",Y=X,X=
                                  Y(2),X=X&Y,Y(5)=X,Y(6)=X,D0=Y(0) S:'$D(^ORD(101
                                  ,+D0,0)) D0=-1

                                  CREATE CONDITION)= (DEFAULT="")&(INTERNAL(TYPE)
                                  ="D")&(INTERNAL(ITEM:TYPE)="T")
                                  CREATE VALUE)= ITEM:DEFAULT ANSWER
                                  DELETE VALUE)= NO EFFECT
                                  FIELD)= DEFAULT
                                  On adding an item initially, stuff the default
                                  field with the default answer if the item is a
                                  term.


                  CROSS-REFERENCE:^^TRIGGER^101.01^13
                                  1)= X ^DD(101.01,.01,1,6,1.3) I X S X=DIV S Y(1
                                  )=$S($D(^ORD(101,D0,10,D1,1)):^(1),1:"") S X=$P
                                  (Y(1),U,3),X=X S DIU=X K Y X ^DD(101.01,.01,1,6
                                  ,1.1) X ^DD(101.01,.01,1,6,1.4)

                                  1.1)= S X=DIV S I(1,0)=$S($D(D1):D1,1:""),I(0,0
                                  )=$S($D(D0):D0,1:""),D0=DIV S:'$D(^ORD(101,+D0,
                                  0)) D0=-1 S Y(101)=$S($D(^ORD(101,D0,101.04)):^
                                  (101.04),1:"") S X=$P(Y(101),U,4) S D0=I(0,0) S
                                   D1=I(1,0)

                                  1.3)= K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DI
                                  V(1)=D1 S Y(0)=X X ^DD(101.01,.01,1,6,69.3) S Y
                                  (101)=$S($D(^ORD(101,D0,0)):^(0),1:"") S X=$P(Y
                                  (101),U,4),X=X S X=X="T",Y=X,X=Y(5),X=X&Y S D0=
                                  I(0,0) S D1=I(1,0)

                                  1.4)= S DIH=$S($D(^ORD(101,DIV(0),10,DIV(1),1))
                                  :^(1),1:""),DIV=X S $P(^(1),U,3)=DIV,DIH=101.01
                                  ,DIG=13 D ^DICR:$N(^DD(DIH,DIG,1,0))>0

                                  2)= Q

                                  69.2)= S I(1,0)=$S($D(D1):D1,1:""),I(0,0)=$S($D
                                  (D0):D0,1:""),Y(4)=$S($D(^ORD(101,D0,0)):^(0),1
                                  :""),Y(1)=$S($D(^ORD(101,D0,10,D1,1)):^(1),1:""
                                  ) S X=$P(Y(1),U,3)

                                  69.3)= X ^DD(101.01,.01,1,6,69.2) S X=X="",Y(2)
                                  =X,Y(3)=X S X=$P(Y(4),U,4),X=X S X=X="D",Y=X,X=
                                  Y(2),X=X&Y,Y(5)=X,Y(6)=X,D0=Y(0) S:'$D(^ORD(101
                                  ,+D0,0)) D0=-1

                                  CREATE CONDITION)= (HELP="")&(INTERNAL(TYPE)="D
                                  ")&(INTERNAL(ITEM:TYPE)="T")
                                  CREATE VALUE)= ITEM:DEFAULT HELP
                                  DELETE VALUE)= NO EFFECT
                                  FIELD)= HELP
                                  On adding an item initially, stuff the help
                                  field with the default help if the item is a
                                  term.



  101.01,2        MNEMONIC             0;2 FREE TEXT

                  INPUT TRANSFORM:I $D(X) K:$L(X)>4!($L(X)<1) X
                  LAST EDITED:    JAN 04, 1989
                  HELP-PROMPT:    Enter a Mnemonic to be used when this protocol
                                  is displayed for selection (1-4 characters).
                  DESCRIPTION:
                                  This is a short abbreviation for the item.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:101.01^AMM2^MUMPS
                                  1)= D REDOX^XQORD101
                                  2)= D REDOX^XQORD101


  101.01,3        SEQUENCE             0;3 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>999)!(X<1)!(X?.E1"."3N.N) X
                  LAST EDITED:    SEP 11, 1991
                  HELP-PROMPT:    Enter a number for sequencing this item with
                                  other items when displayed.
                  DESCRIPTION:    This is the order in which items in the list
                                  should be processed.  In the case of menus, the
                                  items are displayed in the order derived from
                                  this field.  In the case of protocols and
                                  extended actions, the items are executed in the
                                  order derived from this field.

                  CROSS-REFERENCE:101.01^AMM3^MUMPS
                                  1)= D REDOX^XQORD101
                                  2)= D REDOX^XQORD101


  101.01,4        MODIFYING ACTION     0;4 POINTER TO PROTOCOL FILE (#101)

                  INPUT TRANSFORM:S ORDDF=101 D TREE^XQORD101
                  LAST EDITED:    MAY 02, 1989
                  DESCRIPTION:    This points to a protocol which is executed
                                  before the item for this same entry is
                                  executed.  This allows the possibility of
                                  creating protocols which set up special
                                  variables, etc., according to the context of
                                  the protocol.  It also allows screens at the
                                  item level if the variables ORQUIT or ORABORT
                                  are used to prevent execution of the item.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  101.01,5        FORMAT CODE          0;5 SET

                                  'O' FOR output only;
                                  'H' FOR header;
                  LAST EDITED:    SEP 11, 1991
                  HELP-PROMPT:    Enter OUTPUT ONLY if this item should be
                                  displayed only, HEADER if this item should
                                  start printing over the mnemonic.
                  DESCRIPTION:    This allows items used on menus for formatting
                                  purposes to be made unselectable (sub-headers,
                                  blank lines, etc.).

                  CROSS-REFERENCE:101.01^AMM5^MUMPS
                                  1)= D REDOX^XQORD101
                                  2)= D REDOX^XQORD101
                                  Update protocol timestamp when FORMAT CODE
                                  changed.



  101.01,6        DISPLAY NAME         0;6 FREE TEXT

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>40!($L(X)
                                  <1) X
                  LAST EDITED:    SEP 11, 1991
                  HELP-PROMPT:    Answer must be 1-40 characters in length.
                  DESCRIPTION:    This allows the item text that normally appears
                                  on the menu to be displayed.  For example, this
                                  field may be used to set up menus so that items
                                  are displayed in mixed case, even though the
                                  item text may all be in upper case.

                  CROSS-REFERENCE:101.01^AMM6^MUMPS
                                  1)= D REDOX^XQORD101
                                  2)= D REDOX^XQORD101
                                  Update protocol timestamp whenever DISPLAY NAME
                                  is changed.



  101.01,11       PROMPT               1;1 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>30!($L(X)<1) X
                  LAST EDITED:    AUG 19, 1991
                  HELP-PROMPT:    Answer must be 1-30 characters in length.
                  DESCRIPTION:    This is the actual prompt displayed for this
                                  item in the dialog.

                  NOTES:          TRIGGERED by the ITEM field of the ITEM
                                  sub-field of the PROTOCOL File


  101.01,12       DEFAULT              1;2 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>80!($L(X)<1) X
                  LAST EDITED:    AUG 19, 1991
                  HELP-PROMPT:    Answer must be 1-80 characters in length.
                  DESCRIPTION:    This is the default response for this item in
                                  the dialog.

                  NOTES:          TRIGGERED by the ITEM field of the ITEM
                                  sub-field of the PROTOCOL File


  101.01,13       HELP                 1;3 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>80!($L(X)<1) X
                  LAST EDITED:    AUG 19, 1991
                  HELP-PROMPT:    Answer must be 1-80 characters in length.
                  DESCRIPTION:    This is the help text displayed for this item
                                  in the dialog.

                  NOTES:          TRIGGERED by the ITEM field of the ITEM
                                  sub-field of the PROTOCOL File


  101.01,14       MODE                 1;4 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>5!($L(X)<1) X
                  LAST EDITED:    SEP 06, 1991
                  HELP-PROMPT:    Answer must be 1-5 characters in length.
                  DESCRIPTION:    This tells how this item should be treated when
                                  processing the dialog.
                                    S - suppresses inclusion of the prompt when
                                  creating the text generated
                                        by the dialog.
                                    E - allows the item to only be presented when
                                  editing an existing
                                        response.
                                    R - identifies the field as required.




  101,12        PACKAGE                0;12 POINTER TO PACKAGE FILE (#9.4)

                LAST EDITED:      NOV 28, 1988
                HELP-PROMPT:      Enter the package for this protocol.
                DESCRIPTION:
                                  Pointer to Package File (#9.4).


  101,15        EXIT ACTION            15;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      NOV 21, 1988
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      This field contains MUMPS code which will be
                                  executed on leaving this option.  It is only
                                  applicable to Menu types.

                DELETE AUTHORITY: @
                WRITE AUTHORITY:  @

  101,20        ENTRY ACTION           20;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      NOV 21, 1988
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      This field contains MUMPS code which will be
                                  executed on entering this option.  It is
                                  applicable to Menu and Action types.

                DELETE AUTHORITY: @
                WRITE AUTHORITY:  @

  101,21        REQUIRED VARIABLES     21;0 Multiple #101.021
                                   (Add New Entry without Asking)

                HELP-PROMPT:      Enter the required variables for this protocol.
                DESCRIPTION:      This lists the variables that must be defined
                                  for the proper execution of this protocol.
                                  This aids in documenting the protocol.  Also,
                                  in the case of ';' jumping, the variables
                                  defined as required may be newed before
                                  jumping, thus preserving the context when
                                  returning from the jump.


  101.021,.01     REQUIRED VARIABLES     0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:  K:$L(X)>30!($L(X)<1)!'(X?1A.E) X
                  LAST EDITED:      DEC 09, 1988
                  HELP-PROMPT:      Enter the required variable.
                  CROSS-REFERENCE:  101.021^B
                                    1)= S ^ORD(101,DA(1),21,"B",$E(X,1,30),DA)=""
                                    2)= K ^ORD(101,DA(1),21,"B",$E(X,1,30),DA)




  101,24        SCREEN                 24;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      APR 26, 1989
                HELP-PROMPT:      This is standard MUMPS code to screen an item
                                  from processing.
                DESCRIPTION:      This field contains MUMPS code that screens out
                                  menu items or the execution of particular items
                                  in a protocol.  Before each item is displayed
                                  or executed, the screen is executed and the
                                  item is only processed if $T is true.

                DELETE AUTHORITY: @
                WRITE AUTHORITY:  @

  101,26        HEADER                 26;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      DEC 05, 1988
                HELP-PROMPT:      Enter standard MUMPS code that will used to
                                  replace the header on the menu.
                DESCRIPTION:      In the case of menus (type M or Q), this
                                  contains MUMPS code that is executed to display
                                  a header for the menu.

                WRITE AUTHORITY:  @

  101,27        MENU HELP              27;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      DEC 07, 1988
                HELP-PROMPT:      Enter standard MUMPS code that will be used to
                                  supplement the standard help prompt for this
                                  entry.
                DESCRIPTION:      This contains MUMPS code that displays
                                  additional help to that already given with the
                                  menu.

                WRITE AUTHORITY:  @

  101,28        MENU PROMPT            28;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      DEC 07, 1988
                HELP-PROMPT:      Enter a replacement prompt for selecting items
                                  on this menu.
                DESCRIPTION:      This contains text to replace the standard
                                  "Select Item: " prompt normally given with a
                                  menu.


  101,29        MENU DEFAULT           29;E1,245 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>245!($L(X)<1) X
                LAST EDITED:      FEB 10, 1992
                HELP-PROMPT:      Enter a default for the menu prompt.
                DESCRIPTION:      This field contains a default response (i.e.,
                                  default selection from the menu), if desired.


  101,30        DIC {DIC}              30;E1,64 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>64!($L(X)<1) X
                LAST EDITED:      MAR 12, 1991
                HELP-PROMPT:      Answer must be 1-64 characters in length.
                DESCRIPTION:      This field is used as the global reference
                                  passed to ^DIC for a file look-up.  The entry
                                  should be in the regular format for a call to
                                  ^DIC i.e. ^GL(41,


  101,41        COLUMN WIDTH           4;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>132)!(X<25)!(X?.E1"."1N.N) X
                LAST EDITED:      DEC 07, 1988
                HELP-PROMPT:      Type a Number between 25 and 132, 0 Decimal
                                  Digits
                DESCRIPTION:      This is the width, in characters, for each
                                  column on a menu.  For example, to have 3
                                  columns on an 80 character device, enter a
                                  column width of 26.

                CROSS-REFERENCE:  101^AM41^MUMPS
                                  1)= D REDO^XQORD101
                                  2)= D REDO^XQORD101


  101,42        MNEMONIC WIDTH         4;2 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>9)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      FEB 11, 1989
                HELP-PROMPT:      Type a Number between 1 and 9, 0 Decimal Digits
                DESCRIPTION:      This field allows the width allowed for
                                  mnemonics to be varied.  The default width is
                                  5.


  101,43        PATH SWITCH            4;3 SET

                                  'Y' FOR YES;
                                  'N' FOR NO;
                LAST EDITED:      DEC 07, 1988
                HELP-PROMPT:      Enter Y for YES, N for NO, ?? for detailed
                                  description.
                DESCRIPTION:      This allows the user, when traversing back UP
                                  the tree of protocols, to select a new path
                                  back down the tree.  In other words, the menu
                                  is redisplayed when returning to that menu's
                                  level in the tree, and processing back down the
                                  tree is possible from that point.  If nothing
                                  is selected from the menu, the path continues
                                  back up the tree.


  101,44        IDENTIFIER             4;4 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>63!($L(X)<1) X
                LAST EDITED:      NOV 30, 1989
                HELP-PROMPT:      Answer must be 1-63 characters in length.
                DESCRIPTION:      Entries into this file can be given identifiers
                                  to show context, function and/or relationships.
                                  For example, Digoxin may exist in the file as
                                  three different entries with identifiers of
                                  SERUM, PLASMA and Drug.


  101,99        TIMESTAMP              99;1 FREE TEXT

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>15!($L(X)
                                  <1) X
                LAST EDITED:      NOV 22, 1988
                HELP-PROMPT:      ANSWER MUST BE 1-15 CHARACTERS IN LENGTH
                DESCRIPTION:      This contains the $H time that fields which are
                                  necessary to menu display were last changed.

                CROSS-REFERENCE:  101^AM^MUMPS
                                  1)= D SET^XQORD101
                                  2)= D KILL^XQORD101


  101,100       *ORDER PRINT ACTION    100;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      DEC 09, 1988
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      ***NOTICE- THIS FIELD WILL BE REMOVED IN A
                                  FUTURE VERSION*** Package action when a
                                  detailed listing of an order is requested.
                                  Included in this file for backward
                                  compatability with earlier versions of OE/RR.

                WRITE AUTHORITY:  @

  101,100.1     *ORDER CANCEL ACTION   100.1;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      DEC 09, 1988
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      ***NOTICE- THIS FIELD WILL BE REMOVED IN A
                                  FUTURE VERSION*** Package action when an order
                                  is cancelled or discontinued.  Included in this
                                  file for backward compatability with earlier
                                  versions of OE/RR.

                WRITE AUTHORITY:  @

  101,100.2     *ORDER PURGE ACTION    100.2;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      DEC 09, 1988
                HELP-PROMPT:      ENTER STANDARD MUMPS CODE
                DESCRIPTION:      ***NOTICE- THIS FIELD WILL BE REMOVED IN A
                                  FUTURE VERSION*** Package action when an order
                                  is to be purged from file 100.  Included in
                                  this file for backward compatability with
                                  earlier versions of OE/RR.

                WRITE AUTHORITY:  @

  101,100.3     ACCESS                 3;0 POINTER Multiple #101.03

                HELP-PROMPT:      Enter a security key to limit access to this
                                  protocol.
                DESCRIPTION:      This multiple contains the list of security
                                  keys which allow access to the protocol.  If
                                  there are no keys, all users have access.


  101.03,.01      ACCESS                 0;1 POINTER TO SECURITY KEY FILE (#19.1)
                                     (Multiply asked)

                  LAST EDITED:      MAR 27, 1990
                  HELP-PROMPT:      Enter a security key to limit access to this
                                    protocol.
                  CROSS-REFERENCE:  101.03^B
                                    1)= S ^ORD(101,DA(1),3,"B",$E(X,1,30),DA)=""
                                    2)= K ^ORD(101,DA(1),3,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:  101.03^K^MUMPS
                                    1)= D K31^XQORDD1
                                    2)= D K32^XQORDD1




  101,101.01    REQUIRES SIGNATURE     101.01;1 SET

                                  '0' FOR PHYSICIAN SIGNATURE;
                                  '1' FOR NO SIGNATURE REQUIRED;
                LAST EDITED:      AUG 09, 1991
                HELP-PROMPT:      Enter a '1' if this protocol does not require a
                                  physician signature.
                DESCRIPTION:      This field is used to specify an
                                  orderable/protocol that does not require a
                                  physician signature in OE/RR.  Some of the
                                  things entered in OE/RR are considered
                                  instructions and don't require physician
                                  signature.  An example of this might be an
                                  entry for an Early/Late tray.


  101,101.041   DOMAIN (DATA TYPE)     101.04;1 SET

                                  'D' FOR date/time;
                                  'F' FOR free text;
                                  'L' FOR list or range;
                                  'N' FOR numeric;
                                  'S' FOR set of codes;
                                  'Y' FOR yes/no;
                                  'P' FOR pointer;
                                  'M' FOR menu;
                                  'W' FOR word processing;
                LAST EDITED:      AUG 19, 1991
                HELP-PROMPT:      Enter the appropriate type for this prompt.
                DESCRIPTION:      This is the data type of a term (i.e. protocol
                                  of type term) used in a dialog.


  101,101.042   DEFAULT PROMPT         101.04;2 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30!($L(X)<1) X
                LAST EDITED:      AUG 19, 1991
                HELP-PROMPT:      Answer must be 1-30 characters in length.
                DESCRIPTION:      For this term, this is the prompt that is
                                  automatically used when the term is used as an
                                  item in a dialog.  The prompt may be modified
                                  at the item level.


  101,101.043   DEFAULT ANSWER         101.04;3 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>80!($L(X)<1) X
                LAST EDITED:      AUG 19, 1991
                HELP-PROMPT:      Answer must be 1-80 characters in length.
                DESCRIPTION:      For a term protocol, this is the default answer
                                  that is automatically used when the term is
                                  used as an item in a dialog.  The default may
                                  be modified at the item level.


  101,101.0431  DEFAULT WORD PROCESSING ANSWER 101.0431;0
                       WORD-PROCESSING #101.0431   (NOWRAP)

                DESCRIPTION:      This is text used as a template for an item in
                                  a dialog that is a word processing type.


  101,101.044   DEFAULT HELP           101.04;4 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>80!($L(X)<1) X
                LAST EDITED:      AUG 19, 1991
                HELP-PROMPT:      Answer must be 1-80 characters in length.
                DESCRIPTION:      For a term protocol, this is the help text that
                                  is automatically used when the term is used as
                                  an item in a dialog.  The help text may be
                                  replaced at the item level.


  101,101.045   DOMAIN PARAMETER       101.04;5 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>56!($L(X)<1) X
                LAST EDITED:      NOV 26, 1991
                HELP-PROMPT:      Answer must be 1-56 characters in length.
                DESCRIPTION:      This is a parameter that may be used to further
                                  specify the data type (i.e. input transform)
                                  for a term protocol.  The parameter is what
                                  would be placed in the second up-arrow piece of
                                  DIR(0) when calling the reader.


  101,101.05    METHOD                 101.05;0 Multiple #101.05

                DESCRIPTION:      This number identifies individual methods
                                  (actions) that may be invoked for this
                                  protocol.

                TECHNICAL DESCR:
                                  Method numbers correspond to ORACTION numbers.

                IDENTIFIED BY:    METHOD ACTION(#.02)

  101.05,.01      METHOD                 0;1 NUMBER (Multiply asked)

                  INPUT TRANSFORM:K:+X'=X!(X>20)!(X<1)!(X?.E1"."1N.N) X S:$D(X) D
                                  INUM=X
                  LAST EDITED:    JUN 14, 1991
                  HELP-PROMPT:    Type a Number between 1 and 20, 0 Decimal
                                  Digits
                  DESCRIPTION:    This is reserved for future use.  The numeric
                                  values of this field currently correspond to
                                  OE/RR actions.

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  101.05,.02      METHOD ACTION        1;E1,245 MUMPS

                  INPUT TRANSFORM:K:$L(X)>245 X D:$D(X) ^DIM
                  LAST EDITED:    APR 01, 1991
                  HELP-PROMPT:    This is Standard MUMPS code.
                  DESCRIPTION:    This is the code necessary to implement the
                                  method.




  101,101.07    SET MEMBERSHIP         101.07;0 Multiple #101.07

                DESCRIPTION:      This is a namespaced name of a set.  If this is
                                  entered, a cross reference of the format "S.set
                                  membership" is created.  This allows rapid
                                  lookups on subsets of the Protocol file.


  101.07,.01      SET MEMBERSHIP         0;1 FREE TEXT

                  INPUT TRANSFORM:K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>8!($L(X)<
                                  2) X
                  LAST EDITED:    APR 01, 1991
                  HELP-PROMPT:    Answer must be 2-8 characters in length.
                  CROSS-REFERENCE:101.07^B
                                  1)= S ^ORD(101,DA(1),101.07,"B",$E(X,1,30),DA)=
                                  ""

                                  2)= K ^ORD(101,DA(1),101.07,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:101^S^MUMPS
                                  1)= I $L($P(^ORD(101,DA(1),0),"^",2)) S ^ORD(10
                                  1,"S."_X,$P(^ORD(101,DA(1),0),"^",2),DA(1))=""

                                  2)= I $L($P(^ORD(101,DA(1),0),"^",2)) K ^ORD(10
                                  1,"S."_X,$P(^ORD(101,DA(1),0),"^",2),DA(1))




  101,770.1     SENDING APPLICATION    770;1 POINTER TO HL7 APPLICATION PARAMETER
                                   FILE (#771)

                LAST EDITED:      JUL 14, 1999
                HELP-PROMPT:      Enter the application that initiates the
                                  transaction.
                DESCRIPTION:      Enter the name of the application that
                                  initiates a transaction. It is required only
                                  when defining an EVENT POINT protocol.

                CROSS-REFERENCE:  101^AHL1^MUMPS
                                  1)= N HL770 S HL770=$G(^ORD(101,DA,770)) S:$P(H
                                  L770,"^",3)&($P(HL770,"^",4))&($P(HL770,"^",10)
                                  ) ^ORD(101,"AHL1",X,$P(HL770,"^",3),$P(HL770,"^
                                  ",4),$P(HL770,"^",10),DA)=""

                                  2)= N HL770 S HL770=$G(^ORD(101,DA,770)) K:$P(H
                                  L770,"^",3)&($P(HL770,"^",4))&($P(HL770,"^",10)
                                  ) ^ORD(101,"AHL1",X,$P(HL770,"^",3),$P(HL770,"^
                                  ",4),$P(HL770,"^",10),DA)
                                  3)= This cross reference is required to look up
                                   the protocol related to an incoming message.
                                  This cross reference is used to look up the
                                  protocol related to an incoming message at the
                                  time the incoming message is received.  This
                                  cross reference is composed of values from the
                                  Server Application, Message Type, Event Type
                                  and Version ID fields. This cross reference
                                  works in conjunction with the AHL1A, AHL1B and
                                  AHL1C cross references.


                CROSS-REFERENCE:  101^AHL21^MUMPS
                                  1)= N HL770 S HL770=$G(^ORD(101,DA,770)) S:$P(H
                                  L770,"^",3)&($P(HL770,"^",10)) ^ORD(101,"AHL21"
                                  ,X,$P(HL770,"^",3),$P(HL770,"^",10),DA)=""

                                  2)= N HL770 S HL770=$G(^ORD(101,DA,770)) K:$P(H
                                  L770,"^",3)&($P(HL770,"^",10)) ^ORD(101,"AHL21"
                                  ,X,$P(HL770,"^",3),$P(HL770,"^",10),DA)
                                  3)= This cross reference is required to look up
                                   the protocol related to an incoming message wi
                                  thout an event type.
                                  This cross reference is used to look up the
                                  protocol related to an incoming message without
                                  an event type at the time the incoming message
                                  is received.  This cross reference is composed
                                  of values from the Server Application, Message
                                  Type, and Version ID fields.  This cross
                                  reference works in conjunction with the AHL21A
                                  and AHL21C cross references.



  101,770.11    RESPONSE MESSAGE TYPE  770;11 POINTER TO HL7 MESSAGE TYPE FILE (#
                                  771.2)

                LAST EDITED:      JUN 17, 1999
                HELP-PROMPT:      Enter the message type of the expected
                                  response.
                DESCRIPTION:      Enter the message type of the expected
                                  RESPONSE. It should only be defined on a
                                  SUBSCRIBER PROTOCOL.

                                  NOTE: In a contract between the initiating
                                  system and the responding system, the Event
                                  Driver protocol defines the characteristics of
                                  the INITIATING SYSTEM. The Initiating System
                                  initiates either queries or unsolicited update
                                  messages. A Subscriber Protocol defines the
                                  characteristics of the RESPONDING SYSTEM. The
                                  responding system completes a transaction by
                                  returning either an acknowledgement and/or a
                                  response to the specific query message.


  101,770.14    BATCH/FILE MESSAGE COMMIT ACK 770;14 SET

                                  '1' FOR YES;
                                  '0' FOR NO;
                LAST EDITED:      JUL 28, 1998
                DESCRIPTION:      In a bi-directional interface, this field will
                                  be used to determine whether or not a Batch or
                                  File message should send or receive a Commit
                                  Acknowledgement.  A Batch or File message will
                                  always send/receive an Application Ack. This
                                  feature is non-standard according to HL7.  It
                                  is needed to insure the receipt of a message.


  101,770.2     RECEIVING APPLICATION  770;2 POINTER TO HL7 APPLICATION PARAMETER
                                   FILE (#771)

                LAST EDITED:      JUL 13, 1999
                HELP-PROMPT:      The application that will receive the message.
                DESCRIPTION:      This is the application that receives a
                                  message. It is otherwise known as the
                                  "responding" application when a transaction
                                  takes place. This information is required for
                                  SUBSCRIBER protocols only.

                CROSS-REFERENCE:  101^AHL2
                                  1)= S ^ORD(101,"AHL2",$E(X,1,30),DA)=""
                                  2)= K ^ORD(101,"AHL2",$E(X,1,30),DA)
                                  3)= This cross reference is needed to provide a
                                   list of Client (Subscriber) protocols.
                                  This cross reference is used to provide a list
                                  of Client (Subscriber) protocols.



  101,770.3     TRANSACTION MESSAGE TYPE 770;3 POINTER TO HL7 MESSAGE TYPE FILE (
                                  #771.2)

                LAST EDITED:      JUL 14, 1999
                HELP-PROMPT:      Enter the HL7 MESSAGE TYPE that is sent by the
                                  initiating system.
                DESCRIPTION:      Enter the name of the message type for the the
                                  message that is sent from the initiating
                                  system. When initiating a new transaction, this
                                  field is referenced when generating the header
                                  for the outbound message.

                                  NOTE: In a contract between the initiating
                                  system and the responding system, the Event
                                  Driver protocol defines the characteristics of
                                  the INITIATING SYSTEM. The Initiating System
                                  initiates either queries or unsolicited update
                                  messages. A Subscriber Protocol defines the
                                  characteristics of the RESPONDING SYSTEM. The
                                  responding system completes a transaction by
                                  returning either an acknowledgement and/or a
                                  response to the specific query message.

                CROSS-REFERENCE:  101^AHL1A^MUMPS
                                  1)= N HL770 S HL770=$G(^ORD(101,DA,770)) S:$P(H
                                  L770,"^")&($P(HL770,"^",4))&($P(HL770,"^",10))
                                  ^ORD(101,"AHL1",$P(HL770,"^"),X,$P(HL770,"^",4)
                                  ,$P(HL770,"^",10),DA)=""

                                  2)= N HL770 S HL770=$G(^ORD(101,DA,770)) K:$P(H
                                  L770,"^")&($P(HL770,"^",4))&($P(HL770,"^",10))
                                  ^ORD(101,"AHL1",$P(HL770,"^"),X,$P(HL770,"^",4)
                                  ,$P(HL770,"^",10),DA)
                                  3)= This cross reference is required to look up
                                   the protocol related to an incoming message.
                                  This cross reference is used to look up the
                                  protocol related to an incoming message at the
                                  time the incoming message is received.  This
                                  cross reference is composed of values from the
                                  Server Application, Message Type, Event Type
                                  and Version ID fields. This cross reference
                                  works in conjunction with the AHL1, AHL1B and
                                  AHL1C cross references.


                CROSS-REFERENCE:  101^AHL21A^MUMPS
                                  1)= N HL770 S HL770=$G(^ORD(101,DA,770)) S:$P(H
                                  L770,"^")&($P(HL770,"^",10)) ^ORD(101,"AHL21",$
                                  P(HL770,"^"),X,$P(HL770,"^",10),DA)=""

                                  2)= N HL770 S HL770=$G(^ORD(101,DA,770)) K:$P(H
                                  L770,"^")&($P(HL770,"^",10)) ^ORD(101,"AHL21",$
                                  P(HL770,"^"),X,$P(HL770,"^",10),DA)
                                  3)= This cross reference is required to look up
                                   the protocol related to an incoming message wi
                                  thout an event type.
                                  This cross reference is used to look up the
                                  protocol related to an incoming message without
                                  an event type at the time the incoming message
                                  is received.  This cross reference is composed
                                  of values from the Server Application, Message
                                  Type and Version ID fields. This cross
                                  reference works in conjunction with the AHL21
                                  and AHL21C cross references.



  101,770.4     EVENT TYPE             770;4 POINTER TO HL7 EVENT TYPE CODE FILE
                                  (#779.001)

                LAST EDITED:      JUL 14, 1999
                HELP-PROMPT:      The event type associated with the message to
                                  be generated.
                DESCRIPTION:      This is the HL7 Event Type code for the message
                                  represented by this protocol. In HL7, the
                                  message type and event type of an application
                                  response message may be different from the
                                  original message.

                                  If this is an event point protocol, enter the
                                  event type corresponding to the initial message
                                  generated by the SENDING APPLICATION.


                                  If this is a subscriber protocol, then enter
                                  the event type corresponding to the RECEIVING
                                  APPLICATION response. Note that an event type
                                  is not required when responding with a general
                                  acknowledgement (ACK) and the receiving
                                  application does not always need to generate a
                                  response.

                                  NOTE:

                                  1. In "original acknowledgement mode" the
                                  receiving application always generates the
                                  response.  2. In "enhanced acknowledgement
                                  mode" the HL7 package may be configured to
                                  produce a "commit ack" before the application
                                  receives the message. If the receiving
                                  application does not need to generate a
                                  response in addition to the ack, then the event
                                  type is the same as the original message (and
                                  the message type would be ACK) 3. In "enhanced
                                  acknowledgement mode with two-phase commit" the
                                  HL7 package generates a commit ack, and passes
                                  the message to the application.  The second
                                  phase of the transaction occurs when the
                                  application is ready to initiate a response.
                                  This is interpreted as the start of a new
                                  transaction and may require a commit ack
                                  itself.

                CROSS-REFERENCE:  101^AHL1B^MUMPS
                                  1)= N HL770 S HL770=$G(^ORD(101,DA,770)) S:$P(H
                                  L770,"^")&($P(HL770,"^",3))&($P(HL770,"^",10))
                                  ^ORD(101,"AHL1",$P(HL770,"^"),$P(HL770,"^",3),X
                                  ,$P(HL770,"^",10),DA)=""

                                  2)= N HL770 S HL770=$G(^ORD(101,DA,770)) K:$P(H
                                  L770,"^")&($P(HL770,"^",3))&($P(HL770,"^",10))
                                  ^ORD(101,"AHL1",$P(HL770,"^"),$P(HL770,"^",3),X
                                  ,$P(HL770,"^",10),DA)
                                  3)= This cross reference is required to look up
                                   the protocol related to an incoming message.
                                  This cross reference is used to look up the
                                  protocol related to an incoming message at the
                                  time the incoming message is received.  This
                                  cross reference is composed of values from the
                                  Server Application, Message Type, Event Type,
                                  and Version ID fields.  This cross reference
                                  works in conjunction with the AHL1, AHL1A, and
                                  AHL1C cross references.



  101,770.5     MESSAGE STRUCTURE      770;5 POINTER TO HL7 MESSAGE STRUCTURE COD
                                  E FILE (#779.005)

                LAST EDITED:      JAN 19, 2000
                HELP-PROMPT:      Enter the HL7 message structure code.
                DESCRIPTION:      The message structure is associated with the
                                  message type and event type defined by HL7
                                  v2.3.1 and beyond.


  101,770.6     PROCESSING ID          770;6 SET

                                  'D' FOR debug;
                LAST EDITED:      MAY 09, 2000
                HELP-PROMPT:      Set this only for DEBUG MODE. Use HL7 site
                                  params for Test or Production
                DESCRIPTION:      This field describes how a message should be
                                  processed once it is handed off to the
                                  receiving application.

                                  PROCESSING ID is a required field in the HL7
                                  message header. However, the Event Driver
                                  protocol entry is only used whenset to DEBUG.
                                  Data for the header is normally derived from
                                  the HL COMMUNICATION SERVER FILE. If testing a
                                  transaction in Debug mode, make sure it is
                                  changed on both the sending and receiving
                                  system.


                                  The receiving application developer should
                                  consider checking this portion of the header
                                  before filing data on a production system.
                                  Training and Debug messages may not be suitable
                                  for filing.


  101,770.7     LOGICAL LINK           770;7 POINTER TO HL LOGICAL LINK FILE (#87
                                  0)

                LAST EDITED:      OCT 17, 1994
                HELP-PROMPT:      This field should be left blank for internal
                                  DHCP to DHCP communications.  Otherwise, this
                                  field associates the event protocol with the
                                  communication information needed to transmit a
                                  message.
                DESCRIPTION:      This field is used with a SUBSCRIBER PROTOCOL
                                  to describe the network path to the subscriber.
                                  It is most often used with a fixed
                                  point-to-point interface between Vista and
                                  another system, e.g., a local COTS application
                                  or another Vista facility. See the
                                  documentation on use of the ROUTING LOGIC field
                                  and "dynamic addressing" for more complex
                                  routing scenarios.


  101,770.8     ACCEPT ACK CODE        770;8 POINTER TO HL7 ACCEPT/APPLICATION AC
                                  K CONDITION FILE (#779.003)

                LAST EDITED:      SEP 28, 1994
                HELP-PROMPT:      This field specifies the method for handling
                                  accept acknowledgements to a message.
                DESCRIPTION:      This field defines whether or not a COMMIT ACK
                                  will be generated by the HL7 package. This only
                                  applies to transactions using version 2.2 and
                                  higher of the HL7 Standard. See Chapter 2 of
                                  the HL7 Standard for details of Enhanced Mode
                                  Acknowledgements.


  101,770.9     APPLICATION ACK TYPE   770;9 POINTER TO HL7 ACCEPT/APPLICATION AC
                                  K CONDITION FILE (#779.003)

                LAST EDITED:      SEP 28, 1994
                HELP-PROMPT:      This field specifies the method for handling
                                  application acknowledgements to a message.
                DESCRIPTION:      For transactions using versions 2.2 and higher
                                  of the HL7 standard, this field defines whether
                                  or not the receiving application is expected to
                                  return an acknowledgement. Enhanced Mode
                                  Application Acks are always initiated as a new
                                  transaction. The following is an example of a
                                  2-phased acknowledgement over a tcp connection.


                                  (A)INITIATING SYSTEM         (B)RESPONDING
                                  SYSTEM

                                  PHASE I Open connection to B send
                                  ADT/A04----------------->receive ADT/A04
                                                                validate header
                                                                commit to safe
                                  storage receive CA<-------------------send CA
                                  to A Close connection

                                  PHASE II
                                                                handoff to
                                  receiving Application
                                                                parse and
                                  validate message content
                                                                generate
                                  APPLICATION ACCEPT ACK
                                                                Open connection
                                  to A receive AA<-------------------send AA
                                  validate header commit to safe storage send CA
                                  to B------------------>receive CA
                                                                 close connection


  101,770.95    VERSION ID             770;10 POINTER TO HL7 VERSION FILE (#771.5
                                  )

                LAST EDITED:      AUG 24, 1999
                HELP-PROMPT:      Enter the version of the HL7 Standard used to
                                  implement this transaction
                DESCRIPTION:      Enter the version of the HL7 standard used to
                                  implement this transaction.

                                  Note that a screen has been added to insure
                                  that the version selected corresponds to the
                                  appropriate version of the Message Type
                                  defined.

                SCREEN:           S DIC("S")="N HLX S HLX=+$P(^ORD(101,DA,770),U,
                                  3) I $S('HLX:0,'$O(^HL(771.2,HLX,""V"",0)):0,1:
                                  $D(^HL(771.2,HLX,""V"",""B"",+$O(^HL(771.5,""B"
                                  ",X,0)))))"
                EXPLANATION:      Only version IDs assigned to the Message Type s
                                  elected are applicable.
                CROSS-REFERENCE:  101^AHL1C^MUMPS
                                  1)= N HL770 S HL770=$G(^ORD(101,DA,770)) S:$P(H
                                  L770,"^")&($P(HL770,"^",3))&($P(HL770,"^",4)) ^
                                  ORD(101,"AHL1",$P(HL770,"^"),$P(HL770,"^",3),$P
                                  (HL770,"^",4),X,DA)=""

                                  2)= N HL770 S HL770=$G(^ORD(101,DA,770)) K:$P(H
                                  L770,"^")&($P(HL770,"^",3))&($P(HL770,"^",4)) ^
                                  ORD(101,"AHL1",$P(HL770,"^"),$P(HL770,"^",3),$P
                                  (HL770,"^",4),X,DA)
                                  3)= This cross reference is required to look up
                                   the protocol related to an incoming message.
                                  This cross reference is used to look up the
                                  protocol related to an incoming message at the
                                  time the incoming message is received.  This
                                  cross reference is composed of values from the
                                  Server Application, Message Type, Event Type,
                                  and Version ID fields.  This cross reference
                                  works in conjunction with the AHL1, AHL1A, and
                                  AHL1B cross references.


                CROSS-REFERENCE:  101^AHL21C^MUMPS
                                  1)= N HL770 S HL770=$G(^ORD(101,DA,770)) S:$P(H
                                  L770,"^")&($P(HL770,"^",3)) ^ORD(101,"AHL21",$P
                                  (HL770,"^"),$P(HL770,"^",3),X,DA)=""

                                  2)= N HL770 S HL770=$G(^ORD(101,DA,770)) K:$P(H
                                  L770,"^")&($P(HL770,"^",3)) ^ORD(101,"AHL21",$P
                                  (HL770,"^"),$P(HL770,"^",3),X,DA)
                                  3)= This cross reference is required to look up
                                   the protocol related to an incoming message wi
                                  thout an event type.
                                  This cross reference is used to look up the
                                  protocol related to an incoming message without
                                  an event type at the time the incoming message
                                  is received.  This cross reference is composed
                                  of values from the Server Application, Message
                                  Type, and Version ID fields.  This cross
                                  reference works in conjunction with the AHL21
                                  and AHL21A cross references.



  101,771       PROCESSING ROUTINE     771;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      JUL 12, 1999
                HELP-PROMPT:        This is Standard MUMPS code.
                DESCRIPTION:      This field is executed on the receiving system.
                                  It defines the routine used to process the
                                  original inbound message in a transaction and
                                  to GENERATE and APPLICATION response/ACK back
                                  to the sending system using the entry point,
                                  GENACK^HLMA1.

                WRITE AUTHORITY:  @

  101,772       RESPONSE PROCESSING ROUTINE 772;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      JUL 12, 1999
                HELP-PROMPT:      Code that executes the routine to generate an
                                  acknowledgement message (for a subscriber
                                  application) or to process an acknowledgement
                                  message (for a server application).  This is
                                  Standard MUMPS code.
                DESCRIPTION:      This field is executed on the sending system
                                  when an Acknowledgement or Query response is
                                  received. The message ID of the original
                                  message is always contained within the
                                  response. This is used to identify the location
                                  of the original message and the corresponding
                                  event point protocol. Note that this pertains
                                  to Original and Enhanced Mode Application Acks
                                  only. The HL7 package generates and processes
                                  Enhanced mode Commit Accepts internally.

                WRITE AUTHORITY:  @

  101,773.1     SENDING FACILITY REQUIRED? 773;1 SET

                                  '1' FOR YES;
                                  '0' FOR NO;
                LAST EDITED:      SEP 28, 1994
                HELP-PROMPT:      Enter 'Y' for 'YES' if the sending facility
                                  field is required in the message header
                                  segment.

  101,773.2     RECEIVING FACILITY REQUIRED? 773;2 SET

                                  '1' FOR YES;
                                  '0' FOR NO;
                LAST EDITED:      SEP 28, 1994
                HELP-PROMPT:      Enter 'Y' for 'YES' if the receiving facility
                                  field is required in the message header
                                  segment.

  101,773.3     SECURITY REQUIRED?     773;3 SET

                                  '1' FOR YES;
                                  '0' FOR NO;
                LAST EDITED:      SEP 28, 1994
                HELP-PROMPT:      Enter 'Y' for 'YES' if the security field is
                                  required in the message header segment.

  101,773.4     DATE/TIME OF MESSAGE REQUIRED? 773;4 SET

                                  '1' FOR YES;
                                  '0' FOR NO;
                LAST EDITED:      JUL 12, 1999
                HELP-PROMPT:      Enter 'Y' for 'YES' if the date/time of message
                                  field is required in the message header
                                  segment.

  101,773.5     ACK MODE SET IN SUBSCRIBER 773;5 SET

                                  '1' FOR YES;
                                  '0' FOR NO;
                LAST EDITED:      APR 17, 2007
                HELP-PROMPT:      Enter 'Y' for 'YES' for setting the MSH-15 and
                                  MSH-16 from subscriber protocol instead of
                                  Event driver protocol.
                DESCRIPTION:      A 'YES' of this field will indicate that MSH-15
                                  and MSH-16 will be taken from Subscriber
                                  protocol instead of the value(s) defined in
                                  Event driver protocol.


  101,774       ROUTING LOGIC          774;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      SEP 24, 1996
                HELP-PROMPT:      This is Standard MUMPS code.
                DESCRIPTION:      M code in this field is executed only when a
                                  message is in an OUTBOUND state. Normally,
                                  Vista HL7 'broadcasts' a message to all
                                  subscribers whenever a message is generated.
                                  However, in some cases, a client may need to
                                  receive the message only if it matches a
                                  particular condition. This field allows you to
                                  set up screening logic to interpret the message
                                  and dynamically address the message to those
                                  interested in the data when it meets these
                                  conditions. The output of your routing logic
                                  routine should be the creation of a list of
                                  additional message recipients set into the
                                  HLL("LINKS") array.

                                  For details on dynamic addressing, see the
                                  documentation for HL*1.6*14.

                WRITE AUTHORITY:  @

  101,775       SUBSCRIBERS            775;0 POINTER Multiple #101.0775
                                   (Add New Entry without Asking)

                SCREEN:           S DIC("S")="I $P(^(0),U,4)=""S"""
                EXPLANATION:      Type field must be a Subscriber

  101.0775,.01    SUBSCRIBERS            0;1 POINTER TO PROTOCOL FILE (#101)
                                     (Multiply asked)

                  INPUT TRANSFORM:S DIC("S")="I $P(^(0),U,4)=""S""" D ^DIC K DIC
                                  S DIC=DIE,X=+Y K:Y<0 X
                  LAST EDITED:    JUL 22, 1999
                  DESCRIPTION:    This contains Protocols of Type, Subscribers,
                                  who are subscribing to this Event Drivers.

                  SCREEN:         S DIC("S")="I $P(^(0),U,4)=""S"""
                  EXPLANATION:    Type must be Subscriber
                  CROSS-REFERENCE:101.0775^B
                                  1)= S ^ORD(101,DA(1),775,"B",$E(X,1,30),DA)=""
                                  2)= K ^ORD(101,DA(1),775,"B",$E(X,1,30),DA)

                  CROSS-REFERENCE:101^AB
                                  1)= S ^ORD(101,"AB",$E(X,1,30),DA(1),DA)=""
                                  2)= K ^ORD(101,"AB",$E(X,1,30),DA(1),DA)





        FILES POINTED TO                      FIELDS

  COLLECTION SAMPLE (#62)           FILE LINK (#6)

  EXECUTE CODE (#62.07)             FILE LINK (#6)

  HL LOGICAL LINK (#870)            LOGICAL LINK (#770.7)

  HL7 ACCEPT/APPLICATION ACK CON
                     (#779.003)     ACCEPT ACK CODE (#770.8)
                                    APPLICATION ACK TYPE (#770.9)

  HL7 APPLICATION PARAMETER
                     (#771)         SENDING APPLICATION (#770.1)
                                    RECEIVING APPLICATION (#770.2)

  HL7 EVENT TYPE CODE (#779.001)    EVENT TYPE (#770.4)

  HL7 MESSAGE STRUCTURE CODE
                     (#779.005)     MESSAGE STRUCTURE (#770.5)

  HL7 MESSAGE TYPE (#771.2)         RESPONSE MESSAGE TYPE (#770.11)
                                    TRANSACTION MESSAGE TYPE (#770.3)

  HL7 VERSION (#771.5)              VERSION ID (#770.95)

  LABORATORY TEST (#60)             FILE LINK (#6)

  NEW PERSON (#200)                 CREATOR (#5)

  OPTION (#19)                      FILE LINK (#6)

  PACKAGE (#9.4)                    PACKAGE (#12)

  PROTOCOL (#101)                   ITEM:ITEM (#.01)
                                    MODIFYING ACTION (#4)
                                    SUBSCRIBERS:SUBSCRIBERS (#.01)

  RAD/NUC MED PROCEDURES (#71)      FILE LINK (#6)

  REQUEST ACTION TYPES (#123.1)     FILE LINK (#6)

  REQUEST SERVICES (#123.5)         FILE LINK (#6)

  SECURITY KEY (#19.1)              ACCESS:ACCESS (#.01)

  TOPOGRAPHY FIELD (#61)            FILE LINK (#6)

  URGENCY (#62.05)                  FILE LINK (#6)



  INPUT TEMPLATE(S):
  HL MESSAGING PROTOCOL EDIT    MAY 23, 1995@14:21  USER #0
  OR ACTIVATE ITEMS             OCT 11, 1991@08:49  USER #0
  OR ADV MENU                   MAY 22, 1989@14:53  USER #0
  OR EDIT MENU                  FEB 11, 1989        USER #0
  OR EDIT PROTOCOL              MAR 10, 1989        USER #0
  OR PROFILE                    FEB 11, 1989        USER #0
  ORCL ADV MENU EDIT            FEB 05, 1992@15:44  USER #0
  ORCL PROTOCOL MENU            JAN 28, 1992@11:01  USER #0
  VALM PROTOCOL EDIT            DEC 17, 1992@14:25  USER #0
  XUPRTL INPUT                  OCT 21, 2004@11:03  USER #0

  PRINT TEMPLATE(S):
  GMRC PROTOCOL LIST            OCT 07, 1991@15:09  USER #0
                                                               GMRC PROTOCOL LIST
  GMRC PROTOCOL RPT             OCT 09, 1991@18:21  USER #0
                                                          [GMRC PROTOCOL RPT HDR]
  GMRC PROTOCOL RPT HDR         OCT 10, 1991@14:28  USER #0                     @
  HL PROTOCOL MESSAGING FIELDS  JAN 16, 2003@07:37  USER #0
                                                Protocol Fields Used in Messaging

  SORT TEMPLATE(S):
  GMRC PROTOCOLS                OCT 07, 1991@15:08  USER #0
  SORT BY: ]NAME// (NAME from GMRC to GMRCZ)

  HL PROTOCOL MESSAGING FIELDS  JAN 23, 2003@05:39  USER #0
                        'HL PROTOCOL MESSAGING FIELDS' Print Template always used
  SORT BY: @SENDING APPLICATION//    (User is asked range)
    WITHIN SENDING APPLICATION, SORT BY: @TRANSACTION MESSAGE TYPE//    (User is a
  sked range)
      WITHIN TRANSACTION MESSAGE TYPE, SORT BY: @EVENT TYPE// (All EVENT TYPE (inc
  ludes nulls))
        WITHIN EVENT TYPE, SORT BY: @VERSION ID// (All VERSION ID (includes nulls)
  )
          WITHIN VERSION ID, SORT BY: INTERNAL(TYPE)="E";L1// (INTERNAL(TYPE)=""E"
  ")
            WITHIN INTERNAL(TYPE)="E", SORT BY: COUNT(SUBSCRIBER)>0;L1// (COUNT(SU
  BSCRIBER)>0)


  FORM(S)/BLOCK(S):
  HL7 INTERFACE                 JUL 09, 1999@08:39  USER #0
    HL7 INTERFACE HDR1            DD #101
    HL7 INTERFACE BLK1            DD #101
    HL7 EVENT DRV                 DD #101
    HL7 EVENT DRV ITEM            DD #101.0775
    HL7 SUBSCRIBER                DD #101
    HL SUBSCRIBER2                DD #101
    HL7 APP BLK2                  DD #771
    HL7 APP BLK3                  DD #771

LIST TEMPLATE
-------------

::

  STANDARD DATA DICTIONARY #409.61 -- LIST TEMPLATE FILE
  STORED IN ^SD(409.61,

  This file contains entries defining list attributes that are used by the
  Scheduling List Manager utility. The application developer adds entries in this
  file for each list of items to be displayed using the List Manager.


                DD ACCESS: @
                RD ACCESS: d
                WR ACCESS: @
               DEL ACCESS: @
             LAYGO ACCESS: @

  CROSS
  REFERENCED BY: NAME(B)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  409.61,.01    NAME                   0;1 FREE TEXT (Required)

                INPUT TRANSFORM:  K:$L(X)>30!(X?.N)!($L(X)<3)!'(X'?1P.E) X I $D(X
                                  ),$D(^SD(409.61,"B",X)) K X W !,"Template name
                                  already exists."
                LAST EDITED:      FEB 24, 1992
                HELP-PROMPT:      NAME MUST BE 3-30 CHARACTERS, NOT NUMERIC OR
                                  STARTING WITH PUNCTUATION
                DESCRIPTION:      This field contains the name of the list.

                                  The list name should be namespaced and unique.

                TECHNICAL DESCR:  The "B" cross reference of this field is used
                                  by the List Manager when it is called by the
                                  application. For example, the application would
                                  call the List Manager as follows:

                                  D EN^VALM("SDAM APPOINTMENT MANAGEMENT")

                                  The value passed in the actual list is used to
                                  find the LIST TEMPLATE entry.

                SOURCE OF DATA:   APPLICATION DEVELOPER
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  409.61^B
                                  1)= S ^SD(409.61,"B",$E(X,1,30),DA)=""
                                  2)= K ^SD(409.61,"B",$E(X,1,30),DA)


  409.61,.02    TYPE OF LIST           0;2 SET

                                  '1' FOR PROTOCOL;
                                  '2' FOR DISPLAY;
                                  '3' FOR SELECT (NOT AVAILABLE);
                LAST EDITED:      JAN 31, 1992
                DESCRIPTION:       This field indicates the type of list.

                                   A 'protocol' list will cause the List Manager
                                  to
                                   use the PROTOCOL entered in the 'PROTOCOL
                                  MENU'
                                   field.

                                   A 'display' list will use the standard VALM
                                  DISPLAY protocol
                                   supplied by the List Manager.  This protocol
                                  allows
                                   user to view or scroll though the list.  The
                                  user
                                   will be able to use the standard 'next
                                  screen',
                                   'previous screen',etc. actions.

                                   A 'select' list is similar to the 'display'
                                  list but
                                   will also allow the user to 'select' entries.
                                  The
                                   application will then use the selected entries
                                  in its
                                   processing  This type of list is not currently
                                  available.


                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,.03    LEFT MARGIN            0;3 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>132)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      NOV 25, 1991
                HELP-PROMPT:      Enter a column number from 1 to 132.
                DESCRIPTION:      This field contains the left column of the
                                  scrolling region where the list will be
                                  displayed.

                                  Currently(11/91), this parameter is not used.

                TECHNICAL DESCR:  This attribute is not currently used by the
                                  List Manager utility.

                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,.04    RIGHT MARGIN           0;4 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>240)!(X<80)!(X?.E1"."1N.N) X
                LAST EDITED:      NOV 18, 1992
                HELP-PROMPT:      Type a Number between 80 and 240, 0 Decimal
                                  Digits
                DESCRIPTION:      This field indicates the maximum number of
                                  characters a row can contain.

                TECHNICAL DESCR:  This attribute is not currently used by the
                                  List Manager utility.

                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,.05    TOP MARGIN             0;5 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>99)!(X<2)!(X?.E1"."1N.N) X
                LAST EDITED:      MAR 09, 1992
                HELP-PROMPT:      Type a Number between 2 and 99, 0 Decimal
                                  Digits
                DESCRIPTION:      This field contains the number of the top row
                                  of the scrolling region where the list will be
                                  displayed.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following local variable:
                                                VALM("TM")

                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,.06    BOTTOM MARGIN          0;6 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>99)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      NOV 25, 1991
                HELP-PROMPT:      Enter a row number from 1 to 99.
                DESCRIPTION:      This field contains the number of the bottom
                                  row of the scrolling region where the list will
                                  be displayed.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following local variable:
                                                VALM("BM")

                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,.07    OK TO TRANSPORT?       0;7 SET

                                  '0' FOR NOT OK;
                                  '1' FOR OK;
                LAST EDITED:      FEB 25, 1992
                DESCRIPTION:      This field indicates to the transport utility
                                  if this list template should be distributed.


  409.61,.08    USE CURSOR CONTROL     0;8 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      OCT 17, 1991
                DESCRIPTION:      This field indicates whether the cursor
                                  positioning and character enhancements
                                  capabilities of the device should be used.

                                  If set to 'NO', then lists will be presented in
                                  scrolling mode. For some actions, like 'up one
                                  entry', this would increase use of system
                                  resources.

                                  If set to 'YES', then list will be presented
                                  using the terminal type's capabilities.


                                  However, if the user signs on to a device that
                                  is not adequately defined in the TERMINAL TYPE
                                  file, then the list will automatically display
                                  in scrolling mode.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following local variable:
                                                VALMCC

                                  The terminal type attributes that must be
                                  defined for a 'yes' indication to take affect
                                  are the following:

                                           o  INSERT LINE
                                           o  SET TOP & BOTTOM MARGINS
                                           o  SAVE CURSOR
                                           o  RESTORE CURSOR
                                           o  ERASE TO END OF PAGE
                                           o  HIGH INTENSITY (BOLD)
                                           o  NORMAL INTENSITY (RESET)
                                           o  UNDERLINE ON
                                           o  UNDERLINE OFF
                                           o  REVERSE VIDEO ON
                                           o  REVERSE VIDEO OFF

                                  If any of these attributes are not defined then
                                  the List Manager will automatically enter into
                                  scrolling mode.

                SOURCE OF DATA:   APPLICATION DEVELOPER OR SITE IRM STAFF

  409.61,.09    ENTITY NAME            0;9 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30!($L(X)<1) X
                LAST EDITED:      NOV 05, 1991
                HELP-PROMPT:      Answer must be 1-30 characters in length.
                DESCRIPTION:      This field contains the term that will be
                                  displayed to the user that best describes the
                                  items in the list.  The term will be used if
                                  the developer wishes to use the generic
                                  'select' action.  For example, "Select
                                  Appointment(s):" could be displayed and the
                                  entity is 'Appointment'.

                                  The term will be used in other displays as
                                  well.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following local variable:
                                                VALM("ENTITY")

                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,.1     PROTOCOL MENU          0;10 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>63!($L(X)<3) X I $D(X) S DIC(0)="EQM",D
                                  IC="^ORD(101," D ^DIC K DIC K:Y<0 X I $D(X) S X
                                  =$P(Y,U,2)
                LAST EDITED:      DEC 05, 1992
                DESCRIPTION:      This field contains the name of the PROTOCOL
                                  that will be used by the List Manager if the
                                  the TYPE OF LIST is 'protocol'.

                                  This field is not used for 'display' or
                                  'select' types.

                TECHNICAL DESCR:  Note: This protocol is stored as a free-text
                                  pointer value.

                SOURCE OF DATA:   APPLICATION DEVELOPER
                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  409.61,.11    SCREEN TITLE           0;11 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>30!($L(X)<2) X
                LAST EDITED:      JAN 13, 1992
                HELP-PROMPT:      Answer must be 2-30 characters in length.
                DESCRIPTION:      This field contains the text that will be
                                  display/printed in the upper left corner of the
                                  screen display.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following local variable:
                                                VALM("TITLE")


  409.61,.12    ALLOWABLE NUMBER OF ACTIONS 0;12 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>4)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      MAY 29, 1992
                HELP-PROMPT:      Type a Number between 1 and 4, 0 Decimal Digits
                DESCRIPTION:      This field indicates the number of actions a
                                  user can select at one time.

                                  For example, if this parameter is set to 1 then
                                  the user can only enter one action...
                                      Select Action: NX

                                  ...and the following would not be allowed:
                                      Select Action: NX,EP

                                  If this parameter is not entered then the
                                  system defaults to 1.

                TECHNICAL DESCR:  This field could be very important to an
                                  application.  If an action causes a change in
                                  the list's entries then following actions could
                                  be affected. The user may think that an entry
                                  number corresponds to a certain entry, when in
                                  fact the list and the numbering may have been
                                  changed.


                                  Setting the parameter to 1 is the safest and is
                                  the default if the field is blank.


  409.61,.13    DATE RANGE LIMIT       0;13 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>999)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      NOV 01, 1991
                HELP-PROMPT:      Select the number between 1 and 999.
                DESCRIPTION:      This field contains the maximum number of days
                                  that can be specified by the user while
                                  entering a date range.

                                  This parameter is only used if the application
                                  calls the List Manager's date range selection
                                  utility.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following global variable:
                                                ^TMP("VALM
                                  DATA",$J,VALMEVL,"DAYS")

                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,.14    AUTOMATIC DEFAULTS     0;14 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      MAR 31, 1993
                DESCRIPTION:      This field indicates whether List Manager
                                  should always supply a default action at the
                                  'Select' prompt for 'Protocol' type List
                                  Templates.


                                  If set to 'NO', a default will not be provided
                                  automatically. It will be the developer's
                                  responsibility to indicate a default, if
                                  desired.  This default can be indicated by
                                  setting XQORM("B") as part of the protocol
                                  menu's HEADER code. (i.e. D SHOW^VALM S
                                  XQORM("B")="Your action")


                                  This parameter only is valid for 'Protocol'
                                  type List Templates.


                                  If the parameter is set to 'YES' or is blank, a
                                  default will be provided by List Manager. If
                                  the current screen contains the last line in
                                  the list, then the default will be 'Quit'.
                                  Otherwise, it will be "Next Screen". However,
                                  as discussed above, the developer can override
                                  this default by setting XQORM("B").


  409.61,1.01   PRINT LIST PROTOCOL    1;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>63!($L(X)<3) X I $D(X) S DIC(0)="EQM",D
                                  IC="^ORD(101," D ^DIC K DIC K:Y<0 X I $D(X) S X
                                  =$P(Y,U,2)
                LAST EDITED:      DEC 05, 1992
                HELP-PROMPT:      Answer must be 3-63 characters in length.
                DESCRIPTION:       This field contains the name of the protocol
                                  that will be called when the user selects the
                                  generic 'Print List' action.

                                  Normally, this field is blank and the generic
                                  printing action is sufficient.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  409.61,1.02   HIDDEN ACTION MENU     1;2 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>63!($L(X)<3) X I $D(X) S DIC(0)="EQM",D
                                  IC="^ORD(101," D ^DIC K DIC K:Y<0 X I $D(X) S X
                                  =$P(Y,U,2)
                LAST EDITED:      DEC 05, 1992
                HELP-PROMPT:      Answer must be 3-63 characters in length.
                DESCRIPTION:       This field contains the name of the protocol
                                  menu that will be used by the List Manager for
                                  the 'hidden' actions available to the user.

                                  Normally, the application enters the 'VALM
                                  HIDDEN ACTIONS' menu in this field. However,
                                  there maybe applications that would require a
                                  different set of 'hidden' actions.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  409.61,100    HEADER CODE            HDR;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      OCT 15, 1991
                HELP-PROMPT:      This is Standard MUMPS code.
                DESCRIPTION:      This MUMPS field contains the code that the
                                  List Manager will execute to print the
                                  application specific screen header.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following local variable:
                                                VALM("HDR")

                WRITE AUTHORITY:  @
                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,102    EXPAND CODE            EXP;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      OCT 16, 1991
                HELP-PROMPT:      This is Standard MUMPS code.
                DESCRIPTION:      This field contains the MUMPS code that
                                  displays a detail inquiry-type report/screen
                                  for a specific entry in the list.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following global variable:
                                                ^TMP("VALM
                                  DATA",$J,VALMEVL,"EXP")

                WRITE AUTHORITY:  @
                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,103    HELP CODE              HLP;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      OCT 16, 1991
                HELP-PROMPT:      This is Standard MUMPS code.
                DESCRIPTION:      This field contains the MUMPS code for the help
                                  that will appear when the user types '?' at the
                                  'Select Action:' prompt.

                                  This field is optional.  If not defined, the
                                  normal help given by the XQOR* driver will take
                                  affect.


                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following global variable:
                                                ^TMP("VALM
                                  DATA",$J,VALMEVL,"HLP")

                WRITE AUTHORITY:  @
                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,105    EXIT CODE              FNL;E1,245 MUMPS

                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      NOV 25, 1991
                HELP-PROMPT:      This is Standard MUMPS code.
                DESCRIPTION:      This field contains MUMPS logic that will be
                                  executed by the List Manager when the user
                                  exits the list.

                                  The code is usually used to clean up the
                                  partiton and kill any temporary globals used
                                  during the List Manager call.

                                  After this code is executed, the List Manager
                                  will clean up the variables and temporary
                                  globals it set.

                                  This field is optional.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following global variable:
                                                ^TMP("VALM
                                  DATA",$J,VALMEVL,"FNL")

                WRITE AUTHORITY:  @
                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,106    ENTRY CODE             INIT;E1,245 MUMPS

                INITIALIZATION CODE
                INPUT TRANSFORM:  K:$L(X)>245 X D:$D(X) ^DIM
                LAST EDITED:      NOV 25, 1991
                HELP-PROMPT:      This is Standard MUMPS code.
                DESCRIPTION:      This field contains MUMPS code that is executed
                                  when then List Manager is called.

                                  This code is usually used by the application to
                                  initialize variables.

                                  This field is optional.

                TECHNICAL DESCR:  The List Manager will store this field's data
                                  in the following global variable:
                                                ^TMP("VALM
                                  DATA",$J,VALMEVL,"INIT")

                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,107    ARRAY NAME             ARRAY;E1,50 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>50!($L(X)<1)!'(X?1" ".E) X
                LAST EDITED:      NOV 25, 1991
                HELP-PROMPT:      Enter the name of the array that will contain
                                  the list of items for display.
                DESCRIPTION:      This field contains the name of the array that
                                  holds the list of items to be displayed.

                                  The array name must be preceded by a space
                                  character.  This is needed to allow global
                                  specifications. (File Manager will not allow
                                  '^' as the first character.)

                                  The array can be either a local or global
                                  variable.

                TECHNICAL DESCR:  The List Manager will store is field's data in
                                  the following local variable:
                                                VALMAR

                SOURCE OF DATA:   APPLICATION DEVELOPER

  409.61,200    CAPTION LINE COLUMNS   COL;0 Multiple #409.621

                LAST EDITED:      NOV 25, 1991
                DESCRIPTION:      This multiple field contains column definitions
                                  for the data displayed in the list.  Adding
                                  entries to this multiple is optional.

                                  The column parameters are used when the List
                                  Manager writes the line indicating the top of
                                  the list's scrolling region.

                                  If no entries are added then only a line is
                                  written with no captions.


                                  The parameters are also used by special
                                  function calls that an application is allowed
                                  to used.  For example, there is a function at
                                  FLDUPD^VALM1 that can be used to update the
                                  screen. The function will change the value of a
                                  column for a particular entry.

                                  [$$FLDUPD^VALM1(<string>,<field name>,<line
                                  number>)]

                TECHNICAL DESCR:  The List Manager will store is field's data in
                                  the following local variable:
                                       VALMDDF(<column name>)= col name ^ col
                                  position ^ col width ^ caption

                SOURCE OF DATA:   APPLICATION DEVELOPERS

  409.621,.01     ITEM NAME              0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:  K:$L(X)>20!($L(X)<1) X
                  LAST EDITED:      MAR 02, 1992
                  HELP-PROMPT:      Answer must be 1-20 characters in length.
                  DESCRIPTION:      This field contains the reference name of the
                                    column.  The DISPLAY TEXT field contains the
                                    text that will be used when the caption line
                                    is written.

                                    The text in this field is used when the
                                    application refers to this column during
                                    programming.  For example, the <field name>
                                    reference in function call
                                    $$FLDUPD^VALM1(<string>,<field name>, <line
                                    number>) would contain this text.

                  SOURCE OF DATA:   APPLICATION DEVELOPER
                  CROSS-REFERENCE:  409.621^B
                                  1)= S ^SD(409.61,DA(1),"COL","B",$E(X,1,30),DA)
                                  =""

                                  2)= K ^SD(409.61,DA(1),"COL","B",$E(X,1,30),DA)


  409.621,.02     COLUMN               0;2 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>240)!(X<1)!(X?.E1"."1N.N) X
                  LAST EDITED:    NOV 18, 1992
                  HELP-PROMPT:    Type a Number between 1 and 240, 0 Decimal
                                  Digits
                  DESCRIPTION:    The field contains the column number where the
                                  data/caption starts.

                  SOURCE OF DATA: APPLICATION DEVELOPER

  409.621,.03     WIDTH                0;3 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>80)!(X<1)!(X?.E1"."1N.N) X
                  LAST EDITED:    MAR 10, 1993
                  HELP-PROMPT:    Type a Number between 1 and 80, 0 Decimal
                                  Digits
                  DESCRIPTION:    This field contains the number of characters
                                  this field will use.

                  SOURCE OF DATA: APPLICATION DEVELOPER

  409.621,.04     DISPLAY TEXT         0;4 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>80!($L(X)<1) X
                  LAST EDITED:    MAR 02, 1992
                  HELP-PROMPT:    Enter the text for the caption line. (1-80
                                  characters)
                  DESCRIPTION:    This field contains the text that will appear
                                  on the caption line for this column/field.

                                  If the text is longer than the WIDTH parameter,
                                  it will be truncated to the WIDTH specification
                                  when written as part of the caption line.

                                  This field is optional and can be left blank.

                  SOURCE OF DATA: APPLICATION DEVELOPER

  409.621,.05     DEFAULT VIDEO ATTRIBUTES 0;5 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>4!($L(X)<1) X I $D(X) N I F I=1:1:$L(X)
                                   I "HRUB"'[$E(X,I) K X Q
                  LAST EDITED:    JAN 21, 1993
                  HELP-PROMPT:    Indicate the video attributes that are the
                                  defaults for this field.
                  DESCRIPTION:    This parameter allows the developer to indicate
                                  the default video attributes that should be
                                  applied when program calls are made to the
                                  FLDCTRL^VALM10 video control utility.

                                  The following is the list of attributes and
                                  abbreviations used for this parameter:

                                   H - for highlight
                                   R - for reverse video
                                   U - for underline
                                   B - for blinking

                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  409.621,.06     SCROLL LOCK          0;6 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                  INPUT TRANSFORM:I $D(X),$O(^SD(409.61,DA(1),"COL","AIDENT",1,0)
                                  ),$O(^(0))'=DA K X
                  LAST EDITED:    NOV 29, 1992
                  DESCRIPTION:    If you want to lock one for more columns into
                                  place as the user scrolls horizontally through
                                  the list, you can place a 'scroll lock' on the
                                  right most column field that should be locked.
                                  Only one column can have this 'scroll lock'
                                  parameter set to 'yes'.  If you attempt to set
                                  more than one, the system will not allow it and
                                  will issue a warning.


                                  If this parameter is set to 'YES', this caption
                                  field and any other caption field, with a
                                  COLUMN parameter set to less than this current
                                  caption field's, will always be displayed by
                                  the List Manager.

                                  This parameter does not need to be filled in
                                  for List Templates with a RIGHT MARGIN of 80.
                                  For those templates with a RIGHT MARGIN of over
                                  80, this field also does not need to be
                                  entered. However, the use of this field allows
                                  the developer to indicate the list's
                                  identification fields for user readability.

                  TECHNICAL DESCR:


                  NOTES:          XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                  CROSS-REFERENCE:409.621^AIDENT
                                  1)= S ^SD(409.61,DA(1),"COL","AIDENT",$E(X,1,30
                                  ),DA)=""

                                  2)= K ^SD(409.61,DA(1),"COL","AIDENT",$E(X,1,30
                                  ),DA)





  INPUT TEMPLATE(S):
  VALM ADD/EDIT LIST TEMPLATE   NOV 22, 1992@21:24  USER #0
  VALM CAPTION EDIT             DEC 14, 1992@10:47  USER #0
  VALM DEMOGRAPHICS EDIT        DEC 14, 1992@10:44  USER #0
  VALM LIST REGION EDIT         DEC 14, 1992@11:38  USER #0
  VALM MUMPS CODE EDIT          JAN 07, 1993@09:32  USER #0
  VALM NEW ENTRY DEFAULTS       APR 01, 1993@08:23  USER #0
  VALM OTHER FIELDS             MAR 31, 1993@21:12  USER #0
  VALM PROTOCOL INFORMATION     DEC 14, 1992@10:45  USER #0

  PRINT TEMPLATE(S):
  VALM LIST TEMPLATE            NOV 19, 1992@12:21  USER #0    ^VALMXP          @

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):

HL7 APPLICATION PARAMETER
-------------------------

::

  STANDARD DATA DICTIONARY #771 -- HL7 APPLICATION PARAMETER FILE
  STORED IN ^HL(771,

  This file contains a list of Vista applications that are capable of sending and
  receiving HL7 transmissions.


  IDENTIFIED BY:
            "W": W "   ",@("$P($P($C(59)_$S($D(^DD(771,2,0)):$P(^(0),U,3),1:0)_$E
                 ("_DIC_"Y,0),0),$C(59)_$P(^(0),U,2)_"":"",2),$C(59),1)")

  POINTED TO BY: SENDING APPLICATION field (#.06) of the ADT/HL7 TRANSMISSION
                     File (#39.4)
                 REPORT VERIFIED BY COTS APP field (#9.3) of the RAD/NUC MED
                     REPORTS File (#74)
                 HL7 RECEIVING APPLICATION field (#.01) of the HL7 RECEIVING
                     APPLICATIONS sub-field (#79.02) of the RAD/NUC MED DIVISION
                     File (#79)
                 SENDING APPLICATION field (#.02) of the HL7 Message Exceptions
                     File File (#79.3)
                 HL7 APPLICATION NAME field (#.01) of the RAD/NUC MED HL7
                     APPLICATION EXCEPTION File (#79.7)
                 SENDING APPLICATION field (#770.1) of the PROTOCOL File (#101)
                 RECEIVING APPLICATION field (#770.2) of the PROTOCOL File (#101)
                 HL7 APPLICATION PARAMETER field (#.02) of the ADT/HL7 EVENT
                     REASON File (#391.72)
                 DHCP APPLICATION field (#8) of the HL7 NON-DHCP APPLICATION
                     PARAMETER File (#770)
                 RELATED FILE 771 ENTRY field (#12) of the HL7 NON-DHCP
                     APPLICATION PARAMETER File (#770)
                 APPLICATION field (#.01) of the APPLICATION sub-field (#771.113)
                     of the HL7 FIELD File (#771.1)
                 SERVER APPLICATION field (#2) of the HL7 MESSAGE TEXT File
                     (#772)
                 CLIENT APPLICATION field (#3) of the HL7 MESSAGE TEXT File
                     (#772)
                 SENDING APPLICATION field (#13) of the HL7 MESSAGE
                     ADMINISTRATION File (#773)
                 RECEIVING APPLICATION field (#14) of the HL7 MESSAGE
                     ADMINISTRATION File (#773)
                 RECEIVING APPLICATION field (#1) of the DESTINATION sub-field
                     (#774.01) of the SUBSCRIPTION CONTROL File (#774)
                 SENDING APPLICATIONS? field (#.01) of the SENDING APPLICATIONS?
                     sub-field (#776.53) of the HL7 MONITOR EVENTS PROFILE File
                     (#776.5)


  CROSS
  REFERENCED BY: NAME(AC), ACTIVE/INACTIVE(AF), NAME(B)


  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  771,.01       NAME                   0;1 FREE TEXT (Required)

                INPUT TRANSFORM:  K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>120!($L(X
                                  )<3)!'(X'?1P.E) X I $D(X),$D(^HL(771,"B",X)) K
                                  X D EN^DDIOL("Sorry, Application names must be
                                  unique.")
                LAST EDITED:      MAR 02, 2004
                HELP-PROMPT:      The name of the application that will
                                  send/receive HL7 messages (e.g., RADIOLOGY).
                                  Vista application names must be namespaced and
                                  unique.  Answer must be 3-120 characters in
                                  length.
                DESCRIPTION:      The name of the application that will
                                  send/receive HL7 messages (e.g., RADIOLOGY).
                                  Vista application names must be namespaced and
                                  unique.  Answer must be 3-120 characters in
                                  length.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  771^B
                                  1)= S ^HL(771,"B",$E(X,1,30),DA)=""
                                  2)= K ^HL(771,"B",$E(X,1,30),DA)
                                  Regular 'B' cross reference.


                CROSS-REFERENCE:  771^AC^MUMPS
                                  1)= S:$P(^HL(771,DA,0),"^",2)]"" ^HL(771,"AF",X
                                  ,$P(^(0),"^",2),DA)=""

                                  2)= K:$P(^HL(771,DA,0),"^",2)]"" ^HL(771,"AF",X
                                  ,$P(^(0),"^",2),DA)
                                  This cross reference is used in conjunction
                                  with the 'AF' cross reference on the
                                  Active/Inactive field (#2) to determine whether
                                  a specific Application is active.



  771,2         ACTIVE/INACTIVE        0;2 SET

                                  'a' FOR ACTIVE;
                                  'i' FOR INACTIVE;
                LAST EDITED:      SEP 25, 1991
                HELP-PROMPT:      This field indicates whether the DHCP
                                  application is currently active.  A DHCP
                                  application should be inactivated when
                                  application updates are taking place.
                DESCRIPTION:      This field indicates whether the DHCP
                                  application is currently active.  A DHCP
                                  application should be inactivated when
                                  application updates are taking place.

                                  The HL7 package will not accept messages from
                                  an inactive SENDING APPLICATION. An error will
                                  be returned from the call to GENERATE^HLMA.
                                  Also, it will not hand off inbound messages to
                                  an inactive RECEIVING APPLICATION. An error
                                  status will be logged.

                CROSS-REFERENCE:  771^AF^MUMPS
                                  1)= S ^HL(771,"AF",$P(^HL(771,DA,0),"^"),X,DA)=
                                  ""

                                  2)= K ^HL(771,"AF",$P(^HL(771,DA,0),"^"),X,DA)
                                  This cross reference is used in conjunction
                                  with the 'AC' cross reference on the Name field
                                  (#.01) to determine whether a specific DHCP
                                  Application is active.



  771,3         FACILITY NAME          0;3 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>80!($L(X)<1) X
                LAST EDITED:      MAR 02, 2004
                HELP-PROMPT:      Answer must be 1-80 characters in length
                DESCRIPTION:      This information will be placed in the FACILITY
                                  ID field of the HL7 message header if present.
                                  This information will override the default
                                  facility id information whenever the FACILITY
                                  ID REQUIRED field of the subscriber protocol is
                                  set to YES.


  771,4         MAIL GROUP             0;4 POINTER TO MAIL GROUP FILE (#3.8)

                LAST EDITED:      JUL 08, 1994
                HELP-PROMPT:      The mail group related to this application to
                                  which notifications will be sent should
                                  problems arise with delivering messages.
                DESCRIPTION:      Vista applications may use this field to
                                  generate Mailman notifications when messaging
                                  problems are detected. To retrieve this
                                  mailgroup, see documentation for the API,
                                  GETAPP^HLCS2.


  771,5         *HL7 SEGMENT           SEG;0 POINTER Multiple #771.05

                LAST EDITED:      JUL 07, 1999
                DESCRIPTION:      This is applicable to HL7 v1.5 interfaces only.
                                  Enter the HL7 segments used by the Vista
                                  application.


  771.05,.01      HL7 SEGMENT            0;1 POINTER TO HL7 SEGMENT TYPE FILE (#7
                                    71.3) (Required) (Multiply asked)

                  LAST EDITED:      FEB 19, 1993
                  HELP-PROMPT:      The HL7 segments used by the DHCP
                                    application.
                  DESCRIPTION:      The HL7 segments used by the DHCP
                                    application.

                  CROSS-REFERENCE:  771.05^B
                                  1)= S ^HL(771,DA(1),"SEG","B",$E(X,1,30),DA)=""
                                  2)= K ^HL(771,DA(1),"SEG","B",$E(X,1,30),DA)
                                  Regular 'B' cross reference.



  771.05,2        FIELDS USED IN THIS SEGMENT F;1 FREE TEXT (Required)

                  INPUT TRANSFORM:K:$L(X)>245!($L(X)<1) X
                  LAST EDITED:    AUG 18, 1991
                  HELP-PROMPT:    A list of the HL7 field numbers used by the
                                  DHCP application in an HL7 segment.  Each field
                                  number is separated by a comma (e.g.,
                                  1,3,7,8,9,10).  Answer must be 1-245 characters
                                  in length.
                  DESCRIPTION:    A list of the HL7 field numbers used by the
                                  DHCP application in an HL7 segment.  Each field
                                  number is separated by a comma (e.g.,
                                  1,3,7,8,9,10).




  771,6         *HL7 MESSAGE           MSG;0 POINTER Multiple #771.06

                LAST EDITED:      JUL 07, 1999
                DESCRIPTION:      This is applicable only to HL7 v1.5 interfaces.
                                  Enter the HL7 messages used by the DHCP
                                  application.


  771.06,.01      HL7 MESSAGE            0;1 POINTER TO HL7 MESSAGE TYPE FILE (#7
                                    71.2) (Required) (Multiply asked)

                  LAST EDITED:      FEB 19, 1993
                  HELP-PROMPT:      The HL7 messages used by the DHCP
                                    application.
                  DESCRIPTION:      The HL7 messages used by the DHCP
                                    application.

                  CROSS-REFERENCE:  771.06^B
                                  1)= S ^HL(771,DA(1),"MSG","B",$E(X,1,30),DA)=""
                                  2)= K ^HL(771,DA(1),"MSG","B",$E(X,1,30),DA)
                                  Regular 'B' cross reference.



  771.06,1        PROCESSING ROUTINE   R;E1,17 FREE TEXT (Required)

                  INPUT TRANSFORM:K:$L(X)>17!($L(X)<1) X
                  LAST EDITED:    SEP 08, 1991
                  HELP-PROMPT:    The processing routine that will be run for the
                                  DHCP application to file the data received in
                                  the HL7 message.  Valid entries are routine
                                  name, entry point and routine name or the word
                                  NONE.
                  DESCRIPTION:    The processing routine that will be run for the
                                  DHCP application to process the data received
                                  in the HL7 message.  Enter the routine name or
                                  an entry point and routine name or the literal
                                  NONE (e.g., ^HL7O or EN1^HL7O).




  771,7         COUNTRY CODE           0;7 POINTER TO COUNTRY CODE FILE (#779.004
                                  )

                LAST EDITED:      SEP 28, 1994
                HELP-PROMPT:      The country code applicable to this
                                  application.
                DESCRIPTION:      Enter the country code associated with this
                                  application.


  771,100       HL7 FIELD SEPARATOR    FS;E1,2 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>1!($L(X)<1)!'(X?1P) X S HLEC=$G(^HL(771
                                  ,DA,"EC")) I HLEC]"",HLEC[X K X
                LAST EDITED:      APR 18, 2000
                HELP-PROMPT:      The HL7 field separator used by the DHCP
                                  application.  If this field is not filled in,
                                  the uparrow (^) character is defaulted to as
                                  the field separator.  Answer must be 1
                                  character in length.
                DESCRIPTION:      The field separator separates two adjacent
                                  fields within a segment.  It also separates the
                                  segment ID from the first data field in the
                                  segment.  The field separator can be defined
                                  differently for each HL7 message.  The fourth
                                  character in the MSH segment serves as the
                                  field separator for all segments in the HL7
                                  message.

                                  If this field is left blank, the default will
                                  be the '^' character.  However, most messaging
                                  applications use the '|' as a field separator.

                                  Note that the character used as a field
                                  separator CANNOT be reused as one of the HL7
                                  ENCODING CHARACTERS. If you choose the default
                                  '^' as a field separator then choose the
                                  default encoding characters as well (~|\&). If
                                  you choose the vertical bar as a field
                                  separator, then simply replace the vertical bar
                                  in the encoding characters with the '^', i.e.,
                                  ~^\&. Due to Fileman limitations, the '^'
                                  cannot be the first character in the encoding
                                  character string.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  771,101       HL7 ENCODING CHARACTERS EC;E1,4 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>4!($L(X)<1)!'(X?1.4P) X S HLFS=$G(^HL(7
                                  71,DA,"FS")) S:HLFS="" HLFS="^" I X[HLFS K X
                LAST EDITED:      APR 18, 2000
                HELP-PROMPT:      The HL7 encoding characters used by the DHCP
                                  application.  If this field is not filled in,
                                  the characters ~|\& are used as the default
                                  encoding characters.  Answer must be 1-4
                                  characters in length.
                DESCRIPTION:      If this field is left blank, the default
                                  encoding characters will be set to, "~|\&".
                                  Note that if you choose this default, the FIELD
                                  SEPARATOR must be set to "^". If you choose the
                                  vertical bar ("|") as a field separator, enter
                                  "~^\&" as your encoding characters. This will
                                  avoid a potential conflict with VA Fileman.

                                  Up to four encoding characters may be defined.
                                  Each encoding character must be unique and none
                                  of the encoding characters may be the same as
                                  the field separator character. Each encoding
                                  character serves a specific purpose.

                                  The first encoding character is the component
                                  separator.  Some data fields may be divided
                                  into multiple components.  The component
                                  separator is used to separate adjacent
                                  components within a data field.

                                  The second encoding character is the repetition
                                  separator.  Some data fields may be repeated
                                  multiple times in a segment.  The repetition
                                  separator character is used to separate
                                  multiple occurrences of a field.

                                  The third encoding character is the escape
                                  character.  Data fields defined as text or
                                  formatted text may include escape sequences.
                                  The escape character is used to separate escape
                                  sequences from the actual text.

                                  The fourth encoding character is the
                                  sub-component separator.  Some data fields may
                                  be divided into components, and each component
                                  may be further divided into sub-components. The
                                  sub-component separator is used to separate
                                  adjacent sub-components within a component of a
                                  field.

                                  Note that the character used as a field
                                  separator CANNOT be reused as one of the HL7
                                  ENCODING CHARACTERS. If you choose the default
                                  '^' as a field separator then choose the
                                  default encoding characters as well (~|\&). If
                                  you choose the vertical bar as a field
                                  separator, then simply replace the vertical bar
                                  in the encoding characters with the '^', i.e.,
                                  ~^\&. Due to Fileman limitations, the '^'
                                  cannot be the first character in the encoding
                                  character string.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER



        FILES POINTED TO                      FIELDS

  COUNTRY CODE (#779.004)           COUNTRY CODE (#7)

  HL7 MESSAGE TYPE (#771.2)         *HL7 MESSAGE:HL7 MESSAGE (#.01)

  HL7 SEGMENT TYPE (#771.3)         *HL7 SEGMENT:HL7 SEGMENT (#.01)

  MAIL GROUP (#3.8)                 MAIL GROUP (#4)



  INPUT TEMPLATE(S):
  HL 1.6 APPLICATION PARAM EDIT NOV 21, 1994@08:50  USER #0

  PRINT TEMPLATE(S):

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):
  HL7 APP                       JUL 01, 1999@15:04  USER #0
    HL7 APP BLK1                  DD #771

HL Logical Link
---------------

::

  STANDARD DATA DICTIONARY #870 -- HL LOGICAL LINK FILE
  STORED IN ^HLCS(870,

  This file serves two purposes. It is a fileman-compatible transmission log. The
  Low Layer Protocols write and read directly from this file.  (See routines
  HLCSDR1 and HLCSDR2)

  This file stores parameters that govern the behaviour of the Low Layer
  Protocols. Fields like: READ TIMEOUT, ACK TIMEOUT, LLP START BLOCK, and LLP END
  BLOCK, are fields that govern how long the finite state machine waits for data
  to come down the line (READ TIMEOUT), how long it waits for a lower level
  acknowledgement (ACK TIMEOUT), and which control characters define the
  beginning and end of a message (LLP START BLOCK and LLP END BLOCK).

  This file also stores information that drives the SYSTEMS LINK MONITOR display
  option. Fields like, IN QUEUE FRONT POINTER, IN QUEUE BACK POINTER are used to
  manage the data flow in the queues but they are also displayed on the SYSTEMS
  LINK MONITOR under the alias's MESSAGES PROCESSED and MESSAGES RECEIVED. Fields
  like STATE and DEVICE TYPE are also used to drive the SYSTEMS LINK MONITOR.
  These fields are updated by the lower layer protocols in order to give
  real-time feedback as to what is ocurring on a link. For example, when a
  message is received (see HLCSDR1) the state transitions from "IDLE" to
  "READING".



  POINTED TO BY: LOGICAL LINK field (#2005) of the OUTPATIENT SITE File (#59)
                 LOGICAL LINK field (#1) of the CPRS ORDERING INSTITUTION
                     sub-field (#59.08) of the OUTPATIENT SITE File (#59)
                 LOGICAL LINK field (#770.7) of the PROTOCOL File (#101)
                 HL7 LOGICAL LINK field (#.18) of the CP INSTRUMENT File
                     (#702.09)
                 LOGICAL LINK field (#11) of the HL7 MESSAGE TEXT File (#772)
                 LOGICAL LINK field (#7) of the HL7 MESSAGE ADMINISTRATION File
                     (#773)
                 LOGICAL LINK - IN QUEUE field (#17) of the HL7 MESSAGE
                     ADMINISTRATION File (#773)
                 LOGICAL LINK field (#3) of the DESTINATION sub-field (#774.01)
                     of the SUBSCRIPTION CONTROL File (#774)
                 HLO STANDARD LISTENER field (#.1) of the HLO SYSTEM PARAMETERS
                     File (#779.1)
                 APPLICATION SPECIFIC LISTENER field (#.09) of the HLO
                     APPLICATION REGISTRY File (#779.2)
                 MIDDLEWARE LOGICAL LINK field (#.02) of the RECIPIENTS sub-field
                     (#779.41) of the HLO SUBSCRIPTION REGISTRY File (#779.4)
                 FACILITY LOGICAL LINK field (#.021) of the RECIPIENTS sub-field
                     (#779.41) of the HLO SUBSCRIPTION REGISTRY File (#779.4)
                 LINK field (#.01) of the LINKS sub-field (#779.91) of the HLO
                     PRIORITY QUEUES File (#779.9)
                 LOGICAL LINK field (#.01) of the LOGICAL LINK sub-field
                     (#869.311) of the LINK MONITOR VIEWS sub-field (#869.31) of
                     the HL COMMUNICATION SERVER PARAMETERS File (#869.3)


  CROSS
  REFERENCED BY: STATUS(AISTAT), LLP TYPE(ALLP), NODE(B), INSTITUTION(C),
                 MAILMAN DOMAIN(D), TCP/IP SERVICE TYPE(E)

  INDEXED BY:    INSTITUTION & NODE (AC), NODE & LLP TYPE & MAILMAN DOMAIN &
                 TCP/IP SERVICE TYPE (AD), NODE & LLP TYPE & DNS DOMAIN & TCP/IP
                 SERVICE TYPE (AD1), NODE & LLP TYPE & HLLP DEVICE (AD2), DNS
                 DOMAIN (DNS), DNS DOMAIN & NODE (DNS2), IEN772 InQ-Non-TCP
                 (IEN772IN), IEN772 OutQ-Non-TCP (IEN772OUT), TCP/IP ADDRESS (IP)



  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  870,.01       NODE                   0;1 FREE TEXT (Required)

                INPUT TRANSFORM:  K:$L(X)>10!($L(X)<3)!'(X'?1P.E) X
                LAST EDITED:      MAR 08, 2005
                HELP-PROMPT:      Enter the name of the logical link (3-10
                                  characters)
                DESCRIPTION:      This is the name of the logical link that data
                                  will be communicated on.  It is this name that
                                  will be displayed in the "NODE" column of the
                                  SYSTEMS LINK MONITOR display option.  It is
                                  suggested that this name be the same name as
                                  the commercial application e.g.
                                  KURZWEIL1,KURZWEIL2,COPATH, or SUNQUEST1.

                CROSS-REFERENCE:  870^B
                                  1)= S ^HLCS(870,"B",$E(X,1,30),DA)=""
                                  2)= K ^HLCS(870,"B",$E(X,1,30),DA)

                RECORD INDEXES:   AC (#94), AD (#95), AD1 (#101), AD2 (#108),
                                  DNS2 (#216)

  870,.02       INSTITUTION            0;2 POINTER TO INSTITUTION FILE (#4)

                INPUT TRANSFORM:  K:$O(^HLCS(870,"C",X,0)) X
                LAST EDITED:      MAY 28, 2004
                HELP-PROMPT:      Select an institution that has not been
                                  associated with another link.
                DESCRIPTION:      It may be necessary for an application to
                                  determine the appropriate link to use when the
                                  only information it has is the institution.
                                  This field is used to associate a link with
                                  that institution. There is a 1:1 correspondence
                                  between institution and logical link. An
                                  institution cannot be associated with more than
                                  one logical link.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  870^C
                                  1)= S ^HLCS(870,"C",$E(X,1,30),DA)=""
                                  2)= K ^HLCS(870,"C",$E(X,1,30),DA)

                RECORD INDEXES:   AC (#94)

  870,.03       MAILMAN DOMAIN         0;7 POINTER TO DOMAIN FILE (#4.2)

                INPUT TRANSFORM:  K:$O(^HLCS(870,"D",X,0)) X
                LAST EDITED:      MAR 08, 2005
                HELP-PROMPT:      Enter the Mailman domain corresponding to this
                                  link.
                DESCRIPTION:      Either this field or the OTHER DOMAIN field
                                  should have a value.  The domain is used to
                                  formulate the RECEIVING FACILITY field of the
                                  message header.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                CROSS-REFERENCE:  870^D
                                  1)= S ^HLCS(870,"D",$E(X,1,30),DA)=""
                                  2)= K ^HLCS(870,"D",$E(X,1,30),DA)

                RECORD INDEXES:   AD (#95)

  870,.08       DNS DOMAIN             0;8 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>70!($L(X)<4) X I $D(X) S HLIP=$$ADDRESS
                                  ^XLFNSLK(X) K:('HLIP)&($P($G(^HLCS(869.3,1,0)),
                                  "^",3)="P")&($P($$SITE^VASITE,"^",3)) X I HLIP
                                  S HLIP=$$IP^HLMA3(DA,HLIP)
                LAST EDITED:      MAY 11, 2016
                HELP-PROMPT:      Enter the full domain name as registered with
                                  DNS.
                DESCRIPTION:
                                  The domain name as registered with DNS.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER

                FIELD INDEX:      DNS (#109)    REGULAR    IR    LOOKUP & SORTING
                    Short Descr:  This is a regular index of new-style
                                  cross-reference on the DNS Domain field
                      Set Logic:  S ^HLCS(870,"DNS",$E(X,1,70),DA)=""
                     Kill Logic:  K ^HLCS(870,"DNS",$E(X,1,70),DA)
                     Whole Kill:  K ^HLCS(870,"DNS")
                           X(1):  DNS DOMAIN  (870,.08)  (Subscr 1)  (Len 70)
                                  (forwards)

                RECORD INDEXES:   AD1 (#101), DNS2 (#216)

  870,1         DESCRIPTION            3;0   WORD-PROCESSING #870.02

                HELP-PROMPT:      Enter a description for this link
                DESCRIPTION:      This field contains a brief explanation of this
                                  link.


  870,2         LLP TYPE               0;3 POINTER TO HL LOWER LEVEL PROTOCOL TYP
                                  E FILE (#869.1) (Required)

                LAST EDITED:      MAR 08, 2005
                HELP-PROMPT:      Enter the  LLP used for this logical link.
                DESCRIPTION:      Enter the type of Lower Level Protocol for this
                                  logical link. Selection of TCP implies that the
                                  MLLP protocol will be used. Each of the
                                  supported LLP's are described in detail in
                                  Appendix C of the HL7 Implementation Guide.

                CROSS-REFERENCE:  870^ALLP
                                  1)= S ^HLCS(870,"ALLP",$E(X,1,30),DA)=""
                                  2)= K ^HLCS(870,"ALLP",$E(X,1,30),DA)
                                  This cross-reference is used to link the HL
                                  Lower Layer Parameter file (#869.2) with the HL
                                  Logical Link file. Using this x-ref you can
                                  locate the parameter associated with this link.



                RECORD INDEXES:   AD (#95), AD1 (#101), AD2 (#108)

  870,3         DEVICE TYPE            0;4 SET

                                  'PC' FOR Persistent Client;
                                  'NC' FOR Non-Persistent Client;
                                  'SS' FOR Single-threaded Server;
                                  'MS' FOR Multi-threaded Server;
                                  'SH' FOR Serial HLLP;
                                  'SX' FOR Serial X3.28;
                                  'MM' FOR MailMan;
                LAST EDITED:      JUL 10, 2003
                HELP-PROMPT:      Not editable from any user option. See field
                                  description.
                DESCRIPTION:      This field is not editable from any user
                                  option. It is used purely for display purposes
                                  in the DEVICE TYPE column of the SYSTEMS LINK
                                  MONITOR display option.


  870,4         STATE                  0;5 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>60!($L(X)<1) X
                LAST EDITED:      AUG 01, 2007
                HELP-PROMPT:      Answer must be 1-60 characters in length
                DESCRIPTION:      This field is not editable from any user
                                  option. It is used purely for display purposes
                                  in the STATE column of the SYSTEMS LINK MONITOR
                                  display option.


  870,4.5       AUTOSTART              0;6 SET

                                  '0' FOR Disabled;
                                  '1' FOR Enabled;
                LAST EDITED:      NOV 20, 1996
                DESCRIPTION:      This field permits the link to be restarted by
                                  Taskman after a system reboot. If disabled, the
                                  link will not be restarted.


  870,4.9       STOP PROCESSING IN-QUEUE 0;9 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      JUL 18, 2006
                HELP-PROMPT:      Setting this field to 'Y' prevents the incoming
                                  filer from processing the incoming messages
                                  queued in this link.
                DESCRIPTION:      Setting this field to 'Y' prevents the incoming
                                  filer from processing the incoming messages
                                  queued in this link.


  870,5         IN QUEUE FRONT POINTER IN QUEUE FRONT POINTER;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>99999999999999)!(X<0)!(X?.E1"."1N.N)
                                   X
                LAST EDITED:      DEC 21, 2004
                HELP-PROMPT:      This field is not editable from any user
                                  option. See Field Description.
                DESCRIPTION:      The queue structure relies on two queues,
                                  INcoming and OUTgoing.  This pointer is used to
                                  point to the first message in the FIFO queue.


  870,6         IN QUEUE BACK POINTER  IN QUEUE BACK POINTER;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>99999999999999)!(X<0)!(X?.E1"."1N.N)
                                   X
                LAST EDITED:      DEC 21, 2004
                HELP-PROMPT:      Type a Number between 0 and 99999999999999, 0
                                  Decimal Digits
                DESCRIPTION:      The queue structure relies on two
                                  queues-INcoming and OUTgoing.  This pointer
                                  points to the last message in the FIFO queue.


  870,7         OUT QUEUE FRONT POINTER OUT QUEUE FRONT POINTER;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>99999999999999)!(X<0)!(X?.E1"."1N.N)
                                   X
                LAST EDITED:      DEC 21, 2004
                HELP-PROMPT:      This field is not editable from any user
                                  option. See Field Description.
                DESCRIPTION:      The queue structure relies on two
                                  queues-INcoming and OUTgoing.  This pointer
                                  points to the first message in the FIFO queue.


  870,8         OUT QUEUE BACK POINTER OUT QUEUE BACK POINTER;1 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>99999999999999)!(X<0)!(X?.E1"."1N.N)
                                   X
                LAST EDITED:      DEC 21, 2004
                HELP-PROMPT:      This field is not editable from any user
                                  option. See field description.
                DESCRIPTION:      The queue structure relies on two queues,
                                  INcoming and OUTgoing.  This pointer points to
                                  the last message in the FIFO queue.


  870,9         TIME STARTED           0;10 DATE

                INPUT TRANSFORM:  S %DT="EST" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      OCT 06, 1994
                HELP-PROMPT:      This field is not editable from any user
                                  option. See Field Description.
                DESCRIPTION:      This field contains the Date/Time the Lower
                                  Layer Protocol was last launched for the
                                  Logical Link. Only applicable to Lower Layer
                                  Protocols, not Mailman.


  870,10        TIME STOPPED           0;11 DATE

                INPUT TRANSFORM:  S %DT="EST" D ^%DT S X=Y K:Y<1 X
                LAST EDITED:      OCT 06, 1994
                HELP-PROMPT:      This field is not editable from any user
                                  option. See Field Description.
                DESCRIPTION:      This field contains the Date/Time the Lower
                                  Layer Protocol was last shutdown for the
                                  Logical Link. Only applicable to Lower Layer
                                  Protocols, not Mailman.


  870,11        TASK NUMBER            0;12 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>999999999999999)!(X<1)!(X?.E1"."1N.N
                                  ) X
                LAST EDITED:      OCT 06, 1994
                HELP-PROMPT:      This field is not editable from any user
                                  option. See Field Description.
                DESCRIPTION:      This is the task number assigned by TaskMan
                                  when the Lower Layer Protocol is launched in
                                  the background.


  870,14        SHUTDOWN LLP ?         0;15 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      FEB 22, 1995
                HELP-PROMPT:      Setting this field to 'Y' through the STOP
                                  HYBRID LLP option, shuts down the lower layer
                                  protocol and closes the device.
                DESCRIPTION:      This field is editable through the STOP HYBRID
                                  LLP option. When the Lower Layer Protocol is
                                  running, and this field is set to 'Y' the Lower
                                  Layer Protocol will shutdown and close the
                                  device.


  870,16        SHUTDOWN OUTGOING HLO MESSAGES 0;16 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      SEP 14, 2005
                HELP-PROMPT:      Enter YES to stop HLO messages from being
                                  transmitted to this destinations.
                DESCRIPTION:      This field affects only HLO messages.



  870,18        GROSS COMMUNICATIONS ERROR 0;19 POINTER TO HL7 ERROR MESSAGE FILE
                                   (#771.7)

                LAST EDITED:      DEC 13, 1994
                HELP-PROMPT:      This field contains the most recent
                                  communications error which has occured on a
                                  particular link.
                DESCRIPTION:      This field contains the most recent gross
                                  communications error. It serves a two purposes.
                                  It is a flag for the SYSTEMS LINK MONITOR.  In
                                  other words, if this field is defined it means
                                  a communications error has occured on the link.
                                  This is indicated by the NODE field flashing on
                                  the SYSTEMS LINK MONITOR. The error can be
                                  viewed by using the SHOW COMMUNICATION ERROR
                                  option.  The error can be cleared by using the
                                  CLEAR COMMUNICATION ERROR option.  If set, an
                                  error occurred while transmitting (timeout for
                                  example).  This field can be viewed using the
                                  'Show Gross LLP Error' and cleared using the
                                  'Clear Gross LLP Error' options.


  870,19        IN QUEUE               1;0 Multiple #870.019

                LAST EDITED:      OCT 12, 2004
                DESCRIPTION:      This multiple contains the queue for incoming
                                  messages.


  870.019,.01     MESSAGE NUMBER         0;1 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>999999999999999)!(X<0)!(X?.E1"."1N.N
                                  ) X
                  LAST EDITED:    NOV 02, 1994
                  HELP-PROMPT:    Not editable from any user option. See field
                                  description.
                  DESCRIPTION:    This is the number assigned to the message when
                                  it is enqued into the FIFO queue.

                  CROSS-REFERENCE:870.019^B
                                  1)= S ^HLCS(870,DA(1),1,"B",$E(X,1,30),DA)=""
                                  2)= K ^HLCS(870,DA(1),1,"B",$E(X,1,30),DA)


  870.019,1       STATUS               0;2 SET

                                  'P' FOR PENDING;
                                  'D' FOR DONE PROCESSING;
                                  'S' FOR STUB RECORD;
                                  'U' FOR UNUSED STUB RECORD;
                  LAST EDITED:    FEB 01, 2010
                  HELP-PROMPT:    This is the status of an individual message in
                                  the queue. These statuses control the flow and
                                  processing of the message.
                  DESCRIPTION:    Status of a particular message. Can be Stub,
                                  Pending, Done or Unused.  These statuses
                                  control the processing of a message. For
                                  example, a stub record is created when a
                                  message is enqueued, and cannot be processed
                                  until its status is changed from 'stub' to
                                  'pending'.  Changing this status is the last
                                  thing the Low Layer Protocol does after reading
                                  in a message.  Finally, once the message has
                                  been processed, its status is changed to
                                  'done'. Also, the effect of setting the 'UNUSED
                                  STUB RECORD' status is to remove the record
                                  from the queue and not to block the
                                  transmission of other messages that are pending
                                  on the queue.  The 'UNUSED STUB RECORD' status
                                  will get set if the stub record goes unused for
                                  a period of time as determined by the
                                  'RETENTION TIME QUEUED STUB RCD' parameter.

                  CROSS-REFERENCE:870^AISTAT
                                  1)= S ^HLCS(870,"AISTAT",$E(X,1,30),DA(1),DA)="
                                  "

                                  2)= K ^HLCS(870,"AISTAT",$E(X,1,30),DA(1),DA)
                                  Used to quickly identify links with messages in
                                  any status, thus improving performance.



  870.019,2       ERROR                0;3 SET

                                  'A' FOR LLP ACKNOWLEDGED NO ERROR;
                                  'C' FOR LLP CHAR COUNT WRONG;
                                  'X' FOR LLP XOR WRONG;
                                  'B' FOR DATA TOO LONG;
                                  'G' FOR OTHER LLP ERROR;
                  LAST EDITED:    OCT 27, 1994
                  HELP-PROMPT:    This field is not editable from any user
                                  option. See Field Description.
                  DESCRIPTION:    If this field contains a "C","X","B", or a "G"
                                  it means an error has ocurred while reading in
                                  a message. This field is not editable from any
                                  user option.


  870.019,3       MESSAGE TEXT         1;0   WORD-PROCESSING #870.193   (NOWRAP)

                  DESCRIPTION:
                                  This field contains the text of the message.


  870.019,4       tvv                  0;4 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>3!($L(X)<3) X
                  LAST EDITED:    JAN 12, 1995
                  HELP-PROMPT:    Answer must be 3 characters in length.

  870.019,5       ccccc                0;5 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>5!($L(X)<1) X
                  LAST EDITED:    JAN 13, 1995
                  HELP-PROMPT:    Answer must be 1-5 characters in length.

  870.019,6       xxx                  0;6 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>3!($L(X)<1) X
                  LAST EDITED:    JAN 13, 1995
                  HELP-PROMPT:    Answer must be 1-3 characters in length.

  870.019,7       dhcp-longtitudinal checksum 0;7 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>5!($L(X)<1) X
                  LAST EDITED:    JAN 13, 1995
                  HELP-PROMPT:    Answer must be 1-5 characters in length.

  870.019,8       dhcp-xor checksum    0;8 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>3!($L(X)<1) X
                  LAST EDITED:    JAN 13, 1995
                  HELP-PROMPT:    Answer must be 1-3 characters in length.

  870.019,9       IEN772 InQ-Non-TCP   0;9 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>30!($L(X)<1)!'(X?.N) X
                  LAST EDITED:    DEC 21, 2004
                  HELP-PROMPT:    Answer must be 1-30 numeric digits in length.
                  DESCRIPTION:    The ien of file #772, where this sub-entry is
                                  copied to.

                  FIELD INDEX:    IEN772IN (#217)    REGULAR    IR
                                  LOOKUP & SORTING    WHOLE FILE (#870)
                    Short Descr:  IEN772 whole file cross reference
                      Set Logic:  S ^HLCS(870,"IEN772IN",X,DA(1),DA)=""
                     Kill Logic:  K ^HLCS(870,"IEN772IN",X,DA(1),DA)
                     Whole Kill:  K ^HLCS(870,"IEN772IN")
                           X(1):  IEN772 InQ-Non-TCP  (870.019,9)  (Subscr 1)
                                  (forwards)


  870.019,10      DATE/TIME STUB RCD FOUND 0;10 DATE

                  INPUT TRANSFORM:S %DT="E" D ^%DT S X=Y K:Y<1 X
                  LAST EDITED:    DEC 30, 2009
                  DESCRIPTION:    A system date/time is entered into this field
                                  when a stub record is found.




  870,20        OUT QUEUE              2;0 Multiple #870.01
                                   (Add New Entry without Asking)

                LAST EDITED:      OCT 12, 2004
                DESCRIPTION:      This multiple contains the queue for outgoing
                                  messages.


  870.01,.01      MESSAGE NUMBER         0;1 NUMBER

                  INPUT TRANSFORM:K:+X'=X!(X>999999999999999)!(X<0)!(X?.E1"."1N.N
                                  ) X
                  LAST EDITED:    NOV 02, 1994
                  HELP-PROMPT:    Not editable from any user option. See Field
                                  Description.
                  DESCRIPTION:    This is the number assigned to the message when
                                  it is enque'd into the FIFO queue.

                  CROSS-REFERENCE:870.01^B
                                  1)= S ^HLCS(870,DA(1),2,"B",$E(X,1,30),DA)=""
                                  2)= K ^HLCS(870,DA(1),2,"B",$E(X,1,30),DA)


  870.01,1        STATUS               0;2 SET

                                  'P' FOR PENDING;
                                  'D' FOR DONE PROCESSING;
                                  'S' FOR STUB RECORD;
                                  'U' FOR UNUSED STUB RECORD;
                  LAST EDITED:    JAN 28, 2010
                  HELP-PROMPT:    This is the status of an individual message in
                                  the queue. These statuses control the flow and
                                  processing of the message.
                  DESCRIPTION:    Status of a particular message. Can be Stub,
                                  Pending, Done or Unused.  These statuses
                                  control the processing of a message. For
                                  example, a stub record is created when a
                                  message is enqueued, it cannot be processed
                                  until its status is changed from a 'stub' to
                                  'pending', this is the last thing HLCS1 does
                                  when dequeueing a message from file #772 and
                                  enqueueing it into file #870.  Finally, once
                                  the message has been processed, its status is
                                  changed to 'done'.  Also, the effect of setting
                                  the 'UNUSED STUB RECORD' status is to remove
                                  the record from the queue and not to block the
                                  transmission of other messages that are pending
                                  on the queue.  The 'UNUSED STUB RECORD' status
                                  will get set if the stub record goes unused for
                                  a period of time as determined by the
                                  'RETENTION TIME QUEUED STUB RCD' parameter.


  870.01,2        ERROR                0;3 SET

                                  'A' FOR LLP ACKNOWLEDGED NO ERROR;
                                  'C' FOR LLP CHAR COUNT WRONG;
                                  'X' FOR LLP XOR WRONG;
                                  'B' FOR DATA TOO LONG;
                                  'G' FOR OTHER LLP ERROR;
                  LAST EDITED:    NOV 17, 1994
                  HELP-PROMPT:    This field is not editable from any user
                                  option. See field description.
                  DESCRIPTION:    If this field contains a "C","X","B", or a "G"
                                  it means an error has occured while attempting
                                  to send a message to another application.  This
                                  field is not editable from any user option.


  870.01,3        MESSAGE TEXT         1;0   WORD-PROCESSING #870.13   (NOWRAP)

                  DESCRIPTION:
                                  This field contains the text of the message.


  870.01,4        dhcp-longtitudinal checksum 0;4 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>5!($L(X)<1) X
                  LAST EDITED:    JAN 13, 1995
                  HELP-PROMPT:    Answer must be 1-5 characters in length.

  870.01,5        dhcp-xor checksum    0;5 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>3!($L(X)<1) X
                  LAST EDITED:    JAN 13, 1995
                  HELP-PROMPT:    Answer must be 1-3 characters in length.

  870.01,6        IEN772 OutQ-Non-TCP  0;6 FREE TEXT

                  INPUT TRANSFORM:K:$L(X)>30!($L(X)<1)!'(X?.N) X
                  LAST EDITED:    DEC 21, 2004
                  HELP-PROMPT:    Answer must be 1-30 numeric digits in length.
                  DESCRIPTION:    The ien of file #772, where this sub-entry is
                                  copied from.

                  FIELD INDEX:    IEN772OUT (#218)    REGULAR    IR
                                  LOOKUP & SORTING    WHOLE FILE (#870)
                    Short Descr:  IEN772 whole file cross reference
                      Set Logic:  S ^HLCS(870,"IEN772OUT",X,DA(1),DA)=""
                     Kill Logic:  K ^HLCS(870,"IEN772OUT",X,DA(1),DA)
                     Whole Kill:  K ^HLCS(870,"IEN772OUT")
                           X(1):  IEN772 OutQ-Non-TCP  (870.01,6)  (Subscr 1)
                                  (forwards)


  870.01,10       DATE/TIME STUB RCD FOUND 0;10 DATE

                  INPUT TRANSFORM:S %DT="E" D ^%DT S X=Y K:Y<1 X
                  LAST EDITED:    DEC 30, 2009
                  DESCRIPTION:    A system date/time is entered into this field
                                  when a stub record is found.




  870,21        QUEUE SIZE             0;21 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>100000)!(X<2)!(X?.E1"."1N.N) X
                LAST EDITED:      DEC 21, 2004
                HELP-PROMPT:      Type a Number between 2 and 100000, 0 Decimal
                                  Digits
                DESCRIPTION:      This is the steady-state size of the queue. The
                                  queue may dynamically grow beyond this size,
                                  under certain conditions. See Users Manual, for
                                  more information.


  870,22        RETENTION TIME QUEUED STUB RCD 0;22 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>60)!(X<5)!(X?.E1"."1.N) X
                LAST EDITED:      NOV 17, 2010
                HELP-PROMPT:      Type a number between 5 and 60, 0 decimal
                                  digits.
                DESCRIPTION:      The field represents the time in minutes for
                                  how long a stub record must remain as such
                                  before that record is changed to a unused
                                  status.  The default time is 10 minutes.

                                  This field is compared to DATE/TIME STUB RCD
                                  FOUND.  If the time elapsed since the DATE/TIME
                                  STUB RCD FOUND is greater than the number of
                                  minutes found in this field, then the STATUS
                                  (870.019,1) is changed to unused if it is an
                                  incoming message.  If it is an outgoing message
                                  then the STATUS (870.01,1) is changed to
                                  unused.


                TECHNICAL DESCR:



  870,23        SINGLE THREADED        0;23 SET

                                  '1' FOR YES;
                                  '0' FOR NO;
                LAST EDITED:      FEB 11, 2011
                HELP-PROMPT:      Enter YES if the remote server is single
                                  threaded. HLO will then limit the client to a
                                  single connection.
                DESCRIPTION:      HLO provides the ability to setup multiple
                                  queues of outgoing messages to be transmitted
                                  over the same HL LOGICAL LINK.   However, if
                                  the remote server is single threaded, trying to
                                  open multiple connections over TCP/IP may cause
                                  problems.  Therefore, if the HL LOGICAL LINK is
                                  setup to communicate with a single threaded
                                  server, this field should be set to YES.


                                  Currently, only HLO messaging honors this
                                  field.  The older HL7 1.6 VistA messaging
                                  software does not support multiple outgoing
                                  queues to be transmitted over the same HL
                                  LOGICAL LINK.



  870,24        DO NOT PING            0;24 SET

                                  '0' FOR NO;
                                  '1' FOR YES;
                LAST EDITED:      JUL 12, 2012
                HELP-PROMPT:      Enter YES to prevent this link from being
                                  PINGED. The default is NO.
                DESCRIPTION:      This field, if set to YES, will prevent the
                                  link from being PINGED.



  870,100.01    MAIL GROUP             100;1 POINTER TO MAIL GROUP FILE (#3.8)

                LAST EDITED:      JUL 07, 1999
                HELP-PROMPT:      Enter the mail group that messages should be
                                  sent to.
                DESCRIPTION:      If you are building a logical link that will
                                  use Mailman as a transport, you must define a
                                  mail group that contains the remote member,

                                  S.HL V16 SERVER@your target domain

                                  The HL7 package will place outbound messages in
                                  file 870's outque. The link must be running for
                                  messages to be handed off to Mailman.

                                  Inbound messages that are received by the
                                  server option are placed directly in file 772.


  870,200.01    HLLP DEVICE            200;1 POINTER TO DEVICE FILE (#3.5)

                LAST EDITED:      MAR 08, 2005
                HELP-PROMPT:      Enter the device to be used for the HLLP
                                  protocol.
                DESCRIPTION:      This is an entry in the Device file (#3.5). It
                                  is opened when this logical link is started up
                                  and remains open until the link is shut down.
                                  Normally, Vista will initiate and the
                                  connection with this serial device.

                RECORD INDEXES:   AD2 (#108)

  870,200.02    RE-TRANSMISSION ATTEMPTS 200;2 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>999)!(X<0)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 07, 1999
                HELP-PROMPT:      Type a Number between 0 and 999, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the number of times to re-try sending a
                                  message.  The default is 5 tries if this field
                                  is left blank. If a single message exceeds this
                                  value an Alert is sent to the HL7 mail group
                                  and the link is shutdown.


  870,200.021   EXCEED RE-TRANSMIT ACTION 200;10 SET

                                  'I' FOR ignore;
                                  'R' FOR restart;
                                  'S' FOR shutdown;
                LAST EDITED:      AUG 20, 1999
                DESCRIPTION:      This field determines what to do when a message
                                  exceeds the number of
                                   retry attempts for this Logical Link.  Actions
                                  are:
                                    Ignore   = send alert once and keep trying to
                                  resend
                                    Restart  = send alert once and shutdown link
                                  then start link
                                    Shutdown = send alert once and shutdown link


  870,200.022   CLOSE BEFORE RE-TRANSMISSION 200;11 SET

                                  '1' FOR YES;
                LAST EDITED:      JUN 29, 2006
                HELP-PROMPT:      Enter YES if the TCP device should always be
                                  closed and re-opened before another
                                  re-transmission attempt.
                DESCRIPTION:      Re-transmitting a message over the same open
                                  connection may cause a synchronization problem
                                  for some applications.  Setting this field to
                                  YES will cause the TCP connection to always be
                                  closed after a READ timeout or other
                                  communication failure.  Instead, a new
                                  connection will be opened before attempting to
                                  re-transmit the message.



  870,200.03    BLOCK SIZE             200;3 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>512)!(X<9)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 07, 1999
                HELP-PROMPT:      Type a Number between 9 and 512, 0 Decimal
                                  Digits245 is the recommended default.

  870,200.04    READ TIMEOUT           200;4 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>600)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 08, 1999
                HELP-PROMPT:      Type a Number between 1 and 600, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the number of seconds the Lower Layer
                                  Protocol remains in a read state for data to
                                  come in on the link. The default is 10 seconds
                                  if this field is left blank.


  870,200.05    ACK TIMEOUT            200;5 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>600)!(X<0)!(X?.E1"."1N.N) X
                LAST EDITED:      APR 18, 2000
                HELP-PROMPT:      Type a Number between 0 and 600, 0 Decimal
                                  Digits
                DESCRIPTION:      The number of seconds the Lower Layer Protocol
                                  waits for an acknowledgement from the receiving
                                  application. The default is 60.  If this field
                                  is less than the READ TIMEOUT field, the READ
                                  TIMEOUT value will be used.


  870,200.06    LLP START BLOCK        200;6 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>300)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 1 and 300, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the numeric value of the control
                                  character used by the HLLP communications
                                  protocol as a START BLOCK CHARACTER. While this
                                  character is negotiable, the HL7 implementation
                                  guide recommends the use of the 'VT' character.
                                  If this field is left blank, the default value
                                  of 11 will be used.


  870,200.07    LLP END BLOCK          200;7 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>300)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 1 and 300, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the numeric value of the control
                                  character defined in the HLLP specification as
                                  the END BLOCK CHARACTER. The recommended value
                                  is 28. If this field is left blank, the default
                                  value will be 28 for the 'FS' character.


  870,200.08    PROTOCOL ID VERSION    200;8 SET

                                  '21' FOR 2.1;
                                  '22' FOR 2.2;
                                  '23' FOR 2.3;
                LAST EDITED:      AUG 05, 1999
                HELP-PROMPT:      Enter the version of HLLP as specified by the
                                  lates HL7 Implementation Guide
                DESCRIPTION:      The latest specification for the HLLP
                                  communications protocol is identified by a
                                  version number, which may be different from the
                                  HL7 standard itself.


  870,200.09    UNI-DIRECTIONAL WAIT   200;9 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>10)!(X<0)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 0 and 10, 0 Decimal
                                  Digits
                DESCRIPTION:      The number of seconds the Lower Layer Protocol
                                  waits after sending a messages.  This is only
                                  used if the message doesn't want an
                                  acknowledgment.


  870,300.01    X3.28 DEVICE           300;1 POINTER TO DEVICE FILE (#3.5)

                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Enter the device from the Device File.
                DESCRIPTION:      X3.28 is a serial protocol like HLLP. It
                                  requires the remote system be configured as a
                                  device (bi-directional) in the Device and
                                  terminal type files. The Vista system will
                                  normally open and maintain the connection.  See
                                  the HL7 Implementation Guide for details of
                                  this protocol.


  870,300.02    MAXIMUM MESSAGE SIZE   300;2 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>9999999)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 1 and 9999999, 0 Decimal
                                  Digits
                DESCRIPTION:      See the HL7 Implementation Guide for details of
                                  the x3.28 protcol.


  870,300.03    MAXIMUM BLOCK SIZE     300;3 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>245)!(X<9)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 9 and 245, 0 Decimal
                                  Digits
                DESCRIPTION:      See the HL7 Implementation Guide for details of
                                  the x3.28 protcol.


  870,300.04    TIMER A                300;4 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>60)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 1 and 60, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the time in seconds for the Response
                                  Timer. The default is 6 seconds if no time is
                                  entered.


  870,300.05    TIMER B                300;5 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>60)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 1 and 60, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the time in seconds for the Receive
                                  Timer. The default is 3 seconds if no time is
                                  entered.


  870,300.06    TIMER D                300;6 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>60)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 1 and 60, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the time for the Inter-Block timer. The
                                  default is 30 seconds if no time is specified.


  870,300.07    TIMER E                300;7 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>600)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 1 and 600, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the time for the Line Check Timer. The
                                  default is 180 seconds is no time is specified.



  870,400.01    TCP/IP ADDRESS         400;1 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>40!($L(X)<7) X
                LAST EDITED:      MAR 02, 2015
                HELP-PROMPT:      Answer must be 7-40 characters in length.
                DESCRIPTION:      Enter the IP address of the remote site using
                                  the syntax, nn.nn.nn.nn (IPV4) or
                                  hhhh:hhhh:hhhh:hhhh:hhhh:hhhh:hhhh:hhhh (IPV6)

                FIELD INDEX:      IP (#219)    REGULAR    IR    LOOKUP & SORTING
                    Short Descr:  IP Address cross reference
                      Set Logic:  S ^HLCS(870,"IP",$E(X,1,40),DA)=""
                     Kill Logic:  K ^HLCS(870,"IP",$E(X,1,40),DA)
                     Whole Kill:  K ^HLCS(870,"IP")
                           X(1):  TCP/IP ADDRESS  (870,400.01)  (Subscr 1)
                                  (Len 40)  (forwards)


  870,400.02    TCP/IP PORT            400;2 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>65535)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 1 and 65535, 0 Decimal
                                  Digits
                DESCRIPTION:      This is the port over which the HL7 service
                                  will create a socket for message exchange. In
                                  VA, this port will be 5000 between production
                                  systems.


  870,400.03    TCP/IP SERVICE TYPE    400;3 SET

                                  'C' FOR CLIENT (SENDER);
                                  'S' FOR SINGLE LISTENER;
                                  'M' FOR MULTI LISTENER;
                LAST EDITED:      MAR 08, 2005
                HELP-PROMPT:      Does this link send a connection request or
                                  receive connection requests?
                DESCRIPTION:      This field determines if the Logical Link is
                                  the client (sender) or a listener (server) of a
                                  message.  Choose from:


                                   CLIENT (SENDER): Indicates that this Logical
                                  Link connects to a target system, with the
                                  current system acting as the sender.

                                   SINGLE LISTENER: Designates that the current
                                  system is a server (listener), using a single M
                                  process to do the listening.

                                   MULTI LISTENER: Designates that the current
                                  system is a server (listener), creating
                                  multiple background processes.

                CROSS-REFERENCE:  870^E
                                  1)= S ^HLCS(870,"E",$E(X,1,30),DA)=""
                                  2)= K ^HLCS(870,"E",$E(X,1,30),DA)

                RECORD INDEXES:   AD (#95), AD1 (#101)

  870,400.04    PERSISTENT             400;4 SET

                                  'Y' FOR YES;
                                  'N' FOR NO;
                LAST EDITED:      JUL 09, 1999
                DESCRIPTION:      Enter 'YES' if this connection needs to remain
                                  open even if there are no messages to send. The
                                  connection will remain open until it is
                                  disconnected by either side via shutting-down
                                  the logical link.  A setting of 'YES' is
                                  appropriate for connecting to a COTS device
                                  with a high volume of messages.


  870,400.05    RETENTION              400;5 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>999999)!(X<0)!(X?.E1"."1N.N) X
                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Type a Number between 0 and 999999, 0 Decimal
                                  Digits
                DESCRIPTION:      Retention is the maximum time in seconds in
                                  which a non-persistent LLP will wait after the
                                  associated queue has been emptied.  If further
                                  messages arrive in the queue before the
                                  retention time has expired, the LLP will
                                  continue to dequeue and send messages.
                                  Otherwise, the LLP will become inactive and
                                  will remain inactive until further messages are
                                  queued.


  870,400.06    STARTUP NODE           400;6 POINTER TO TASKMAN SITE PARAMETERS F
                                  ILE (#14.7)

                LAST EDITED:      JUL 09, 1999
                HELP-PROMPT:      Enter the Taskman node to start this LLP on.
                DESCRIPTION:      This field is ONLY for VMS sites running Dual
                                  Taskman in DCL. This field is used to specify
                                  what Taskman node you want to job the Lower
                                  Level Protocol. It should only be used if you
                                  have two Taskmans running and only want the LLP
                                  to run on a particular node.  It will only work
                                  if you are running the dual Taskmans in DCL
                                  context on a VMS system.


  870,400.07    SAY HELO               400;7 SET

                                  'Y' FOR YES;
                                  'N' FOR NO;
                LAST EDITED:      NOV 02, 2000
                HELP-PROMPT:      Send initial HELO for Cache/NT TCP links?
                DESCRIPTION:      This field is applicable only to Cache/NT sites
                                  with TCP links.  If you are not a Cache/NT
                                  site, or this is not a TCP link, this field
                                  does not apply, AND will be ignored.

                                  If this TCP link is for a VA site, answer YES.
                                  If this TCP link is for a COTS system, answer
                                  NO.  This is the default.

                TECHNICAL DESCR:  When sending HL7 transactions to other VA sites
                                  over TCP links, Cache/NT sites must send an
                                  initial HELO to overcome buffering issues.
                                  However, the initial HELO is not part of the
                                  HL7 standard, and may cause a reject error when
                                  sent to a COTS system.


  870,400.08    TCP/IP PORT (OPTIMIZED) 400;8 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>65535)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      FEB 16, 2005
                HELP-PROMPT:      Enter the port to use for the new HL7
                                  'optimized' server, a number between 1 and
                                  65535. 5001 is the default.
                DESCRIPTION:      The new HL7 'optimized' server will operate
                                  concurrently with the  old HL7 1.6 server.  To
                                  enable that, the two servers are assigned
                                  different ports to listen on.  The default port
                                  for the old HL7 server is 5000, whereas the new
                                  optimized HL7 server uses port 5001.


  870,400.09    TCP/IP OPENFAIL TIMEOUT 400;9 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>60)!(X<1)!(X?.E1"."1N.N) X
                LAST EDITED:      APR 16, 2008
                HELP-PROMPT:      Type a Number between 1 and 60, 0 Decimal
                                  Digits
                DESCRIPTION:      Enter the number of seconds for the TCP/IP
                                  Openfail Timeout. The default is 30 seconds if
                                  this field is left blank.



        FILES POINTED TO                      FIELDS

  DEVICE (#3.5)                     HLLP DEVICE (#200.01)
                                    X3.28 DEVICE (#300.01)

  DOMAIN (#4.2)                     MAILMAN DOMAIN (#.03)

  HL LOWER LEVEL PROTOCOL TYPE
                     (#869.1)       LLP TYPE (#2)

  HL7 ERROR MESSAGE (#771.7)        GROSS COMMUNICATIONS ERROR (#18)

  INSTITUTION (#4)                  INSTITUTION (#.02)

  MAIL GROUP (#3.8)                 MAIL GROUP (#100.01)

  TASKMAN SITE PARAMETERS (#14.7)   STARTUP NODE (#400.06)


  File #870

    Record Indexes:

    AC (#94)    RECORD    MUMPS    IR    SORTING ONLY
        Short Descr:  Sorts entries by <station number>,<link name>,<ien>
          Set Logic:  S ^HLCS(870,"AC",$S($L($P($G(^DIC(4,+X2(1),99)),"^")):$P($G
                      (^DIC(4,+X2(1),99)),"^"),1:" "),X2(2),DA)=""
         Kill Logic:  K ^HLCS(870,"AC",$S($L($P($G(^DIC(4,+X1(1),99)),"^")):$P($G
                      (^DIC(4,+X1(1),99)),"^"),1:" "),X1(2),DA)
         Whole Kill:  K ^HLCS(870,"AC")
               X(1):  INSTITUTION  (870,.02)  (Subscr 1)  (forwards)
               X(2):  NODE  (870,.01)  (forwards)

    AD (#95)    RECORD    MUMPS    IR    ACTION
        Short Descr:  Used to find the link over which to send the application
                      acknowledgment.
          Set Logic:  D SET1^HLOTLNK(X(1),X(3))
           Set Cond:  S X=0 I X(4)="C",X(2),$P($G(^HLCS(869.1,X(2),0)),"^")="TCP"
                       S X=1
         Kill Logic:  D KILL1^HLOTLNK(X(1),X(3))
          Kill Cond:  S X=0 I X(4)="C",X(2),$P($G(^HLCS(869.1,X(2),0)),"^")="TCP"
                       S X=1
               X(1):  NODE  (870,.01)  (Subscr 1)  (Len 30)  (forwards)
               X(2):  LLP TYPE  (870,2)  (Subscr 2)  (forwards)
               X(3):  MAILMAN DOMAIN  (870,.03)  (Subscr 3)  (forwards)
               X(4):  TCP/IP SERVICE TYPE  (870,400.03)  (Subscr 4)  (forwards)

    AD1 (#101)    RECORD    MUMPS    IR    ACTION
        Short Descr:  Used to find the link overwhich to send the application
                      acknowledgment.
          Set Logic:  D SET2^HLOTLNK(X(1),X(3))
           Set Cond:  S X=0 I X(4)="C",X(2),$P($G(^HLCS(869.1,X(2),0)),"^")="TCP"
                       S X=1
         Kill Logic:  D KILL2^HLOTLNK(X(1),X(3))
          Kill Cond:  S X=0 I X(4)="C",X(2),$P($G(^HLCS(869.1,X(2),0)),"^")="TCP"
                       S X=1
               X(1):  NODE  (870,.01)  (Subscr 1)  (forwards)
               X(2):  LLP TYPE  (870,2)  (Subscr 2)  (forwards)
               X(3):  DNS DOMAIN  (870,.08)  (Subscr 3)  (forwards)
               X(4):  TCP/IP SERVICE TYPE  (870,400.03)  (Subscr 4)  (forwards)

    AD2 (#108)    RECORD    MUMPS    IR    ACTION
        Short Descr:  Used to find the link overwhich to send an application
                      acknowledgment.
          Set Logic:  D SET3^HLOTLNK(X(1),X(3))
           Set Cond:  S X=0 I X(2),$P($G(^HLCS(869.1,X(2),0)),"^")="HLLP" S X=1
         Kill Logic:  D KILL3^HLOTLNK(X(1),X(3))
          Kill Cond:  S X=0 I X(2),$P($G(^HLCS(869.1,X(2),0)),"^")="HLLP" S X=1
         Whole Kill:  K ^HLCS(870,"AD","HLLP")
               X(1):  NODE  (870,.01)  (Subscr 1)  (forwards)
               X(2):  LLP TYPE  (870,2)  (Subscr 2)  (forwards)
               X(3):  HLLP DEVICE  (870,200.01)  (Subscr 3)  (forwards)

    DNS2 (#216)    RECORD    REGULAR    IR    LOOKUP & SORTING
        Short Descr:  Regular index of new-style x-ref on the DNS Domain and Node
                      fields
          Set Logic:  S ^HLCS(870,"DNS2",$E(X(1),1,70),$E(X(2),1,30),DA)=""
         Kill Logic:  K ^HLCS(870,"DNS2",$E(X(1),1,70),$E(X(2),1,30),DA)
         Whole Kill:  K ^HLCS(870,"DNS2")
               X(1):  DNS DOMAIN  (870,.08)  (Subscr 1)  (Len 70)  (forwards)
               X(2):  NODE  (870,.01)  (Subscr 2)  (Len 30)  (forwards)


  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):
  CAPTIONED                                         USER #0

  SORT TEMPLATE(S):

  FORM(S)/BLOCK(S):
  HL7 LOGICAL LINK              JUL 06, 1999@12:07  USER #0
    HL7 LL HEADER1                DD #870
    HL7 LL BLK1                   DD #870
    HL7 LLP HLLP                  DD #870
    HL7 LLP TCP                   DD #870
    HL7 LLP MAIL                  DD #870
    HL7 LLP X3.28                 DD #870

Remote Procedure
----------------

::

  STANDARD DATA DICTIONARY #8994 -- REMOTE PROCEDURE FILE
  STORED IN ^XWB(8994,

  This file is used as a repository of server-based procedures in the context of
  the Client/Server architecture.  By using the Remote Procedure Call (RPC)
  Broker, applications running on client workstations can invoke (call) the
  procedures in this file to be executed by the server and the results will be
  returned to the client application.

  Each remote procedure entry is associated with an entry point (ROUTINE with
  optional TAG).  Calls to these procedures can include parameters of different
  value types.  The resulting value of the call can be either a string, a list of
  strings or a word processing string as indicated by the RETURN VALUE TYPE field
  (.04).

  The remote procedure may be available for use by anyone or its use may be
  restricted to one or more application.  The range of availability is indicated
  by the AVAILABILITY field.  IF THERE IS NO ENTRY IN THE AVAILABILITY FIELD,
  then the procedure is assumed to be PUBLIC.

  A remote procedure may be removed from service for a period of time by setting
  the INACTIVE field.  A request for use of a procedure which is marked inactive
  will result in an error being returned to the originating application.


                DD ACCESS: @
                RD ACCESS: @
                WR ACCESS: @
               DEL ACCESS: @
             LAYGO ACCESS: @
             AUDIT ACCESS: @

  POINTED TO BY: RPC field (#.01) of the RPC sub-field (#19.05) of the OPTION
                     File (#19)
                     RPC field (#.13) of the OE/RR REPORT File (#101.24)


  CROSS
  REFERENCED BY: NAME(B)

      LAST MODIFIED: AUG 19,2017@20:23:16

  DATA          NAME                  GLOBAL        DATA
  ELEMENT       TITLE                 LOCATION      TYPE
  -------------------------------------------------------------------------------
  8994,.01      NAME                   0;1 FREE TEXT (Required)

                INPUT TRANSFORM:  K:$L(X)>30!(X?.N)!($L(X)<3)!'(X'?1P.E) X
                HELP-PROMPT:      NAME MUST BE 3-30 CHARACTERS, NOT NUMERIC OR
                                  STARTING WITH PUNCTUATION
                CROSS-REFERENCE:  8994^B
                                  1)= S ^XWB(8994,"B",$E(X,1,30),DA)=""
                                  2)= K ^XWB(8994,"B",$E(X,1,30),DA)


  8994,.02      TAG                    0;2 FREE TEXT

                INPUT TRANSFORM:  K:$L(X)>16!($L(X)<1) X
                MAXIMUM LENGTH:   16
                LAST EDITED:      MAR 08, 2016
                HELP-PROMPT:      Enter the TAG to be used as the entry point for
                                  the routine, 1-16 characters.  Leave empty if a
                                  TAG is not required.
                DESCRIPTION:      This is the TAG to be used as the entry point
                                  for the ROUTINE. Leave this field empty if a
                                  TAG is not required.


  8994,.03      ROUTINE                0;3 FREE TEXT (Required)

                INPUT TRANSFORM:  K:$L(X)>16!($L(X)<3)!'(X?1U1.15UN) X
                MAXIMUM LENGTH:   16
                LAST EDITED:      MAR 30, 2016
                HELP-PROMPT:      Enter the name of the Routine, 3 to 16
                                  uppercase characters.
                DESCRIPTION:      This is the name of the routine used by this
                                  API.

                NOTES:            XXXX--CAN'T BE ALTERED EXCEPT BY PROGRAMMER


  8994,.04      RETURN VALUE TYPE      0;4 SET (Required)

                                  '1' FOR SINGLE VALUE;
                                  '2' FOR ARRAY;
                                  '3' FOR WORD PROCESSING;
                                  '4' FOR GLOBAL ARRAY;
                                  '5' FOR GLOBAL INSTANCE;
                LAST EDITED:      JUL 12, 1995
                HELP-PROMPT:      Select the appropriate value to indicate what
                                  type of value will be returned by the API.
                DESCRIPTION:      This field tells RPC Broker how to process the
                                  resulting data from the call.

                                  SINGLE VALUE: Broker will return the value of
                                  the return parameter (first
                                     parameter in the formal list).  For example,
                                         TAG(RESULT)     ;
                                                 S RESULT="DOE, JOHN"
                                                 Q

                                  ARRAY: Using $ORDER Broker will traverse the
                                  return parameter (first
                                     parameter in the formal list), returning all
                                  elements of the array.
                                     For example,
                                         TAG(RESULT)     ;
                                                 S RESULT(1)="ONE"
                                                 S RESULT(2)="TWO"
                                                 Q
                                  WORD PROCESSING: This type is treated exactly
                                  the same way as the ARRAY,
                                     with one exception that the WORD WRAP ON
                                  field is used to
                                     control whether each line returned is
                                  terminated with CR + LF characters.
                                     See WORD WRAP ON field description for more
                                  information.

                                  GLOBAL ARRAY: Return value parameter should be
                                  set to a closed global
                                     reference in ^TMP. The global's data nodes
                                  will be traversed using
                                     $QUERY, and all data values on global nodes
                                  descendant from the global
                                     reference are returned.  This type is
                                  especially useful for returning data
                                     from VA FileMan word processing fields,
                                  where each line is on a
                                     0-subscripted node.

                                     Important: The global reference you pass is
                                  killed by the Broker at the
                                                end of RPC Execution as part of
                                  RPC cleanup. Do not pass a
                                                global reference that is not in
                                  ^TMP or that should not be
                                                killed.

                                     This type is useful for returning large
                                  amounts of data to the client,
                                     where using the ARRAY type can exceed the
                                  symbol table limit and crash
                                     your RPC.

                                     For example, to return sign-on introductory
                                  text you could do this,
                                         TAG(RESULT)     ;
                                                 M RESULT=^XTV(8989.3,1,"INTRO")
                                                 K RESULT(0)  ;this node is not
                                  needed
                                                 Q

                                  GLOBAL INSTANCE: Using this type Broker will
                                  return the value of a global
                                     node.  For example the following code will
                                  return the whole 0th node
                                     from the NEW PERSON file for the current
                                  user.
                                         TAG(RESULT)     ;
                                                 S RESULT=$NA(^VA(200,DUZ,0))
                                                 Q


  8994,.05      AVAILABILITY           0;5 SET

                                  'P' FOR PUBLIC;
                                  'S' FOR SUBSCRIPTION;
                                  'A' FOR AGREEMENT;
                                  'R' FOR RESTRICTED;
                LAST EDITED:      DEC 13, 1994
                HELP-PROMPT:      Select the appropriate indicator of the
                                  availability of this API as PUBLIC (general),
                                  SUBSCRIPTION (need to subscribe), AGREEMENT
                                  required, or RESTRICTED to the developing
                                  package.
                DESCRIPTION:      This field is used to indicate the availability
                                  of the API to various users.

                                  PUBLIC indicates that the API is available for
                                  general use by any package, and it is not
                                  necessary to either indicate that the API is
                                  being used or to request permission to use it.

                                  SUBSCRIPTION indicates that the API is
                                  available to those packages that wish to use
                                  it, BUT the package needs to indicate that it
                                  is using the API or subscribing to it.

                                  AGREEMENT indicates that the API is available
                                  to packages, other than the developing package,
                                  only by means of an integration agreement on
                                  its usage.

                                  RESTRICTED indicates that the API is not
                                  available for reference by any package other
                                  than the package which developed it.  Entry of
                                  the input and return parameter information is
                                  at the option of the developing package in this
                                  case.


  8994,.06      INACTIVE               0;6 SET

                                  '0' FOR ACTIVE;
                                  '1' FOR INACTIVE;
                                  '2' FOR LOCAL INACTIVE (ACTIVE REMOTELY);
                                  '3' FOR REMOTE INACTIVE (ACTIVE LOCALLY);
                LAST EDITED:      OCT 07, 1999
                HELP-PROMPT:      Marks RPC as not useable completely, locally,
                                  or remotely.
                DESCRIPTION:      This field is used to indicate that the RPC is
                                  not available for use for some reason.  An RPC
                                  can be marked as completely unusable (1),
                                  unusable locally (2), or unusable remotely (3).
                                  Local use means in the account the user is
                                  logged into; remote use means in an account
                                  other than the one the user is directly logged
                                  into (i.e., a 'Remote RPC').  The Broker will
                                  not run an RPC that is marked as unusable in
                                  the applicable context.

                TECHNICAL DESCR:
                                  Before patch XWB*1.1*10, this field was for
                                  documentation only.  Also, the set of codes was
                                  only 1 = INACTIVE.


  8994,.07      CLIENT MANAGER         0;7 SET

                                  '1' FOR YES;
                LAST EDITED:      DEC 15, 1994
                HELP-PROMPT:      Enter 1 or YES if this API requires other
                                  configuration information related to
                                  transmission to the client.
                DESCRIPTION:      This field is used to identify those APIs which
                                  may be initiated to control the client or to
                                  send data to the client unrelated to requests
                                  from the client.  These actions usually require
                                  additional information on the configuration
                                  which is present.


  8994,.08      WORD WRAP ON           0;8 SET

                                  '0' FOR FALSE;
                                  '1' FOR TRUE;
                LAST EDITED:      AUG 04, 1995
                DESCRIPTION:      Affects GLOBAL ARRAY and WORD PROCESSING return
                                  value types only. If set to FALSE, all data
                                  values are returned in a single concatenated
                                  string in Results[0]. If set to TRUE, each
                                  array node on the M side is returned as a
                                  distinct array item in the Results property of
                                  the TRPCBroker.

                                  If you're returning some text to the client and
                                  you'd rather let the memo box of the client
                                  control the wrapping of lines, set WORD WRAP ON
                                  to FALSE.  On the other hand, if you want to
                                  preserve line breaks as they exist on the
                                  server, set WORD WRAP ON to TRUE.


  8994,.09      VERSION                0;9 NUMBER

                INPUT TRANSFORM:  K:+X'=X!(X>9999)!(X<0)!(X?.E1"."6N.N) X
                LAST EDITED:      OCT 07, 1999
                HELP-PROMPT:      Type a Number between 0 and 9999, 5 Decimal
                                  Digits
                DESCRIPTION:      A number to identify the version of the Remote
                                  Procedure.  Currently this number is only
                                  checked if the Remote Procedure is being run on
                                  a foreign server.  If a version number is
                                  passed to the Broker by the application
                                  requesting that the Remote Procedure be run on
                                  the foreign server, the Remote Procedure will
                                  only be run if the value of this field is equal
                                  to or greater than the passed version number.

                TECHNICAL DESCR:
                                  Introduced in patch XWB*1.1*10.


  8994,.1       SUPPRESS RDV USER SETUP 0;10 SET

                Suppress RDV user setup
                                  '0' FOR No;
                                  '1' FOR Yes;
                LAST EDITED:      AUG 20, 2001
                HELP-PROMPT:      Must not be set to YES for RPC's that collect
                                  Patient data.
                DESCRIPTION:      This field controls how Remote Data View
                                  handles the setup of a user to run the RPC. If
                                  the field is set to No or is blank than the
                                  remote users data will be set up in the New
                                  Person file and DUZ for the process will be set
                                  to the user. If the field is set to Yes at the
                                  remote site the remote user data will NOT be
                                  entered into the New Person file and DUZ will
                                  be set to the Postmaster.

                                  This field should not be set to Yes for RPC's
                                  that collect patient data.  If there is any
                                  question about why a RPC has this set to yes
                                  contact the DBA for the VA.

                WRITE AUTHORITY:  ^

  8994,.11      APP PROXY ALLOWED      0;11 SET

                                  '0' FOR No;
                                  '1' FOR Yes;
                LAST EDITED:      MAR 01, 2005
                DESCRIPTION:      This field must be set to Allowed if this RPC
                                  is to be run by an APPLICATION PROXY user.  The
                                  default is to NOT allow access.


  8994,1        DESCRIPTION            1;0   WORD-PROCESSING #8994.01   (NOWRAP)


  8994,2        INPUT PARAMETER        2;0 Multiple #8994.02
                                   (Add New Entry without Asking)

                DESCRIPTION:      Input parameter is what RPC Broker passes into
                                  your remote procedure.  The name that you may
                                  call the input parameter has no special meaning
                                  to the Broker.  However, you should choose a
                                  name that best describes the data that the
                                  parameter is used for.

  8994.02,.01     INPUT PARAMETER        0;1 FREE TEXT (Multiply asked)

                  INPUT TRANSFORM:  K:$L(X)>30!($L(X)<3) X
                  LAST EDITED:      DEC 13, 1994
                  HELP-PROMPT:      Answer must be 3-30 characters in length.
                  DESCRIPTION:      This field is used to identify an input
                                    parameter for the API.

                  CROSS-REFERENCE:  8994.02^B
                                    1)= S ^XWB(8994,DA(1),2,"B",$E(X,1,30),DA)=""
                                    2)= K ^XWB(8994,DA(1),2,"B",$E(X,1,30),DA)


  8994.02,.02     PARAMETER TYPE         0;2 SET

                                    '1' FOR LITERAL;
                                    '2' FOR LIST;
                                    '3' FOR WORD PROCESSING;
                                    '4' FOR REFERENCE;
                  LAST EDITED:      AUG 07, 1997
                  HELP-PROMPT:      Select the appropriate value indicating
                                    whether the parameter is a literal, a list, a
                                    reference or a word processing string.
                  DESCRIPTION:      This field is used to indicate the type
                                    (Literal, List, Reference, or Word Processing
                                    entry) of value passed by this parameter.
                                    The Literal, List, and Reference types
                                    correspond to the TParamType of the same
                                    name.  A Word Processing type would also be a
                                    List TParamType.

                  TECHNICAL DESCR:  Currently, this field is used only for
                                    documenting the RPC's input parameters.

                                    In version 1.0 of the RPC Broker the Literal
                                    type was called Single Value and the List
                                    type was called Array.

  8994.02,.03     MAXIMUM DATA LENGTH    0;3 NUMBER

                  INPUT TRANSFORM:  K:+X'=X!(X>32000)!(X<1)!(X?.E1"."1N.N) X
                  LAST EDITED:      DEC 13, 1994
                  HELP-PROMPT:      Indicate the maximum length of the parameter,
                                    type a Number between 1 and 32000, 0 Decimal
                                    Digits
                  DESCRIPTION:      This field indicates the maximum length that
                                    would be expected for the parameter value.


  8994.02,.04     REQUIRED               0;4 SET

                                    '1' FOR YES;
                                    '0' FOR NO;
                  LAST EDITED:      DEC 15, 1994
                  HELP-PROMPT:      This field is used to indicate when an input
                                    parameter is required in the API call.
                  DESCRIPTION:      This field is used to indicate that the input
                                    parameter is a required argument in the API
                                    call.


  8994.02,.05     SEQUENCE NUMBER        0;5 NUMBER

                  INPUT TRANSFORM:  K:+X'=X!(X>30)!(X<1)!(X?.E1"."1N.N) X
                  LAST EDITED:      MAR 28, 1997
                  HELP-PROMPT:      Type a Number between 1 and 30, 0 Decimal
                                    Digits
                  DESCRIPTION:      This number should correspond to the position
                                    of this parameter in the formal list of the
                                    function.  Consider that the return parameter
                                    that Broker passes in, by reference, is the
                                    very first parameter with the sequence number
                                    of 0.  The next parameter is the first
                                    application-supplied parameter with the
                                    sequence of 1.

                                    Example:
                                      Your entry point may look like:

                                        EN(RESULT,USER,DATE)       ;this will do
                                    something

                                          In this case the parameter
                                    corresponding to USER should have sequence
                                          number 1 and the DATE parameter should
                                    be 2.

                  CROSS-REFERENCE:  8994.02^PARAMSEQ
                                  1)= S ^XWB(8994,DA(1),2,"PARAMSEQ",$E(X,1,30),D
                                  A)=""

                                  2)= K ^XWB(8994,DA(1),2,"PARAMSEQ",$E(X,1,30),D
                                  A)


  8994.02,1       DESCRIPTION          1;0   WORD-PROCESSING #8994.021
                       (NOWRAP)




  8994,3        RETURN PARAMETER DESCRIPTION 3;0   WORD-PROCESSING #8994.03
                       (NOWRAP)

  INPUT TEMPLATE(S):

  PRINT TEMPLATE(S):
  DSIC RPC LIST                 DEC 18, 2002@15:45  USER #0
                                                            REMOTE PROCEDURE LIST
  XWB SEND API                  FEB 02, 1995        USER #0

  SORT TEMPLATE(S):
  IBD RPC LIST                  JUN 04, 1996@11:19  USER #0
       AICS Remote Procedure List


  FORM(S)/BLOCK(S):
