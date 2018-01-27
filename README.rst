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

A Dockerfile has been created for convience of development. This uses a
docker volume to mount the local routines directory into the container's
p directory. This eliminates the need to sftp or otherwise transfer the
developed routines into the container.

To build the image:

    docker build -t osehra/xindex .

To run the image:

    docker run -p 9430:9430 -p 8001:8001 -p 2222:22 -v $(pwd)/Packages/Toolkit/Routines:/home/osehra/p -d -P --name=xindex osehra/xindex

-----
Links
-----

* OSEHRA Homepage: http://osehra.org
* OSEHRA Repositories: http://code.osehra.org
* OSEHRA Github: https://github.com/OSEHRA
