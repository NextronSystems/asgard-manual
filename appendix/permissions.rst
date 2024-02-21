Broken file and folder permissions
----------------------------------

The ASGARD Agent folder has in a normal installation specific
permissions set. The ASGARD Agent checks regularly
for broken permissions and tries to fix them. If for some reason this
process fails, you have to check and change the permissions manually.

.. code-block:: none

   2023/03/31 12:02:35 ASGARD_THOR: Error: failed to repair permissions: set security info: Access is denied.

To do this we wrote a little PowerShell script which can help you with
this process. Please test the script before you deploy it in your
environment. To do this, you can leave the ``-WhatIf`` flag to see what
the script would do if the permissions are broken. If you are content
with the potential changes, remove the ``-WhatIf`` arguments. The script
needs administrative permissions.

.. literalinclude:: ../scripts/fix_broken_acls.ps1
   :language: powershell
   :linenos:
   :emphasize-lines: 9, 16, 24

.. tip:: 
   After you changed the permissions of the asgard2-agent folder,
   the agent might correct the permissions again and set them accordingly.
   Only use this script if the agent is showing errors that permissions
   can not be set.
