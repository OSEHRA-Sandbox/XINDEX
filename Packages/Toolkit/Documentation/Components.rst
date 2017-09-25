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

SORT TEMPLATE
-------------

INPUT TEMPLATE
--------------

FORM
----

FUNCTION
--------

DIALOG
------

BULLETIN
--------

MAIL GROUP
----------

HELP FRAME
----------

ROUTINE
-------

OPTION
------

SECURITY KEY
------------

PROTOCOL
--------

LIST TEMPLATE
-------------

HL7 APPLICATION PARAMETER
-------------------------

HL LOWER LEVEL PROTOCOL
-----------------------

HL LOGICAL LINK
---------------

REMOTE PROCEDURE
----------------
