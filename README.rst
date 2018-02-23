.. title: OSEHRA XINDEX

==============
OSEHRA XINDEX
==============

This source tree holds a reference copy of M components for XINDEX, the
tool designed for reporting cross-references and compliance with the SAC.  It
is maintained by OSEHRA, the Open Source Electronic Health Record Alliance.

-------
Purpose
-------

It has been found that XINDEX doesn't run or report on all VistA components
that can be contained within a KIDS build. This creates errors of omission
when trying to find other code references or compliance with the SAC.

-----------
Development
-----------

You can mount a volume into the container to share the routines instead of
transferring them using sftp or only modifying the routines in the container.

To run the image:

    docker run -p 9430:9430 -p 8001:8001 -p 2222:22 -v $(pwd)/Packages/Toolkit/Routines:/home/osehra/p -d -P --name=xindex krmassociates/osehravista

-----------
What's New
-----------

The XINDEX code here is based on the latest VA code which was relased in patch
XT*7.3*140 obtained from https://hdl.handle.net/10909/11315.

The changes made here can be dividied into enhancements for XINDEX for it to be
able to find and index all M code in VistA; Fileman Templates Pointer Analysis;
and other enhancements to XINDEX, mostly bug fixes.

The authors will be referenced by their initials. Here is a list of all of them:

* Christopher Edwards; CJE (main author)
* Sam Habiel; SMH (secondary author; corresponding author for questions)
* Joe Synder; JS (contributor)
* David Whitten; DHW (contributor)
* John McCormack; JM (contributor)
* George Timson; GFT (contributor)

M-Code-Finding Expansion
========================
XINDEX has now been expanded to cover the following which XINDEX didn't cover
before.

Fileman Coverage (CJE)
----------------------
XINDEX coverged a lot of Fileman code frameworks, but not all. It now does 
cover all allowable M code extension points that Fileman executes. The following
is new:

* Variable pointer screens in ^DD(file,field,.12,1)
* Expression for pointer screen in ^DD(file,field,12.2)
* Special Lookup code in ^DD(file,0,"DIC")
* Post-Action code in ^DD(file,0,"ACT")
* New Style Indexes
* M code embedded in Print Templates
* M code in the Sort Template file (#.401)--embedded code in Sort Tempaltes is very rare: only a single $DATA check was found in all of FOIA.
* M code embedded in Input Templates

The first 5 bullets are shown under the \|ddnnn faux routine. Print, Sort, and
Input templates are shown under faux routines \|prnt, \|sort, and \|inpt.


Other Component Coverage (CJE)
------------------------------
These components that have M code were previously not analyzed by XINDEX:

* Forms (in faux routine \|form)
* Dialogs ( " " " \|dialog)
* Help Frames ( " " " \|help)
* Security Keys ( " " " \|key)
* Protocols ( " " " \|ptcl)
* List Templates ( " " " \|list)
* HL7 Application Parameters ( " " " \|hlap)
* Remote Procedures ( " " " \|rpc)

Remarks on how this is accomplished (CJE)
-----------------------------------------
There is a new select by namespace prompt and a new select file prompt. This
lets users choose to analyse a whole namespace. What BUILD or INSTALL selects
has not changed: These still do not do new components. This is left for future
work.

Fileman Template Pointer Analysis (SMH)
=======================================
This is the routine XINDX13, which has the entry points DIBT, DIET, and DIPT,
that produce CSV files in ``/tmp/`` called respectively DIBTOUT.csv, DIETOUT.csv,
and DIPTOUT.csv. Here's some sample output::

	SORT TEMPLATE IEN,SORT TEMPLATE NAME,SOURCE FILE,DESTINATION FILE,DESTINATION FIELD
	224,RT ALL INPATIENTS,2,190,4
	223,RT WARD LIST,2,195.2,15
	8,XUOPTLOGS,19.081,19,.01
	104,DGWAIT LIST,42.5,42.51,5

The output is used to figure out if a source file calls to a destination file
that is not itself and what field is the destination file is called in the
template. The second line (i.e. first data line after the header) says that RT
ALL INPATIENTS is a sort template based on File 2 (PATIENT) but in the process
of doing the sort, a reference is made to file 190 (RECORDS) field 4
(APPLICATION). The output for print and input templates follows the same
pattern.

It's worth noting for experienced readers that the templates analyse computed
expressions as well, not just upright fields.

Other Enhancements to XINDEX
============================
* XINDX2 Modified to not crash on non-Cache systems when trying to evaluate the existence of Cache classes (JS)
* XINDX6 allows you to choose "F" for diagramming control flow (DHW). XINDEX already supported this but did not show "F" as an option when printing routines.
* XINDX8 ':' (post-conditionals) show as a lowercase "if" in structured listing of routines (DHW).
* XINDX5 Tags can be 16 characters long according to latest SAC (JM).
* XINDX3 R $$ or R $P is invalid syntax (GFT).
* XINDX7 Update VA Standards and Conventions tag line with correct version of the current SAC that this XINDEX enforces (SMH); ^$PDISPLAY is not a standard SSVN (GFT). Fix spelling on environment (CJE).
* XINDX51 Routine name can be up to 16 characters long in the header (GFT); print Fileman documentation file in routine listings if it is present (GFT).

----------------
Future Work List
----------------

* All new items, plus \|opt, print as a single faux routine. Consider making each internal entry number a faux routine. E.g. \|opt123.
* If a build file or install file is entered, the new components should be analysed. Right now, the new components are only analysed when selecting by namespaces.
* Create pexpect based Unit Tests.

----------
Unit Tests
----------

No Unit Tests are supplied in this release.

-----
Links
-----

* OSEHRA Homepage: http://osehra.org
* OSEHRA Repositories: http://code.osehra.org
* OSEHRA Github: https://github.com/OSEHRA
