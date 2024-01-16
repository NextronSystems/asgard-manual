.. index:: ASGARD Errors

ASGARD Errors
=============

ASGARD noticed that the THOR scan failed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In some cases THOR fails to complete its scan and ASGARD reports the following error. 

.. code-block:: none

   ASGARD noticed that the THOR scan failed 

   could not remove temp directory: remove C:\Windows\Temp\asgard2-agent\12fa35a6762a\thor\signatures\sigma\windows\file_event_win_webshell_creation_detect.yms:
   The process cannot access the file because it is being used by another process. exit status 1
   (scan result does not exist)

The most likely reason for this error is an Antivirus interaction. The Antivirus killed
the THOR process and still holds a handle to one of the signature files. The "THOR Launcher"
can only report that the process was terminated and that it isn't able to remove all files
because the Antivirus process still has that open handle on the file. 

Solution: 

Configure an Antivirus exclusion for THOR. See
:ref:`requirements/av_edr:antivirus and edr exclusions` for more details.
