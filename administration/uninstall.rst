.. index:: Uninstall ASGARD Agents

Uninstall ASGARD Agents 
=======================

The following listings contain commands to uninstall ASGARD Agents on endpoints. 

.. note::
   The commands contain names used by the default installer packages.
   If you have generated custom installer packages with a custom service
   and binary name, you have to adjust the commands accordingly. 

Uninstall ASGARD Agents on Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You need administrative privileges to remove the ASGARD Agent from Windows.
Open a command prompt with administrative privileges and run the following commands:

.. code-block:: doscon
   :linenos:

   C:\Windows\system32>C:\Windows\system32\asgard2-agent\asgard2-agent-service.exe stop
   C:\Windows\system32>C:\Windows\system32\asgard2-agent\asgard2-agent-service.exe uninstall
   C:\Windows\system32>rmdir /S /Q C:\Windows\System32\asgard2-agent
   C:\Windows\system32>rmdir /S /Q C:\ProgramData\thor

.. note::
   Change `system32` to `SysWOW64` if you are running the agent on a x86 machine.

The commands above will:

- Disable the ASGARD agent's service
- Delete the ASGARD agent's service
- Remove all files associated with the ASGARD agent

Uninstall ASGARD Agents on Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

RPMs via ``yum``

.. code-block:: console 

   user@host:~$ sudo yum remove asgard2-agent
   user@host:~$ sudo rm -r /var/lib/thor

DEBs via ``dpkg``

.. code-block:: console 

   user@host:~$ sudo dpkg -P asgard2-agent
   user@host:~$ sudo rm -r /var/lib/thor

Manual uninstall

.. code-block:: console

   user@host:~$ sudo asgard2-agent-service stop
   user@host:~$ sudo asgard2-agent-service uninstall
   user@host:~$ sudo rm -r /usr/sbin/asgard2-agent-service
   user@host:~$ sudo rm -r /var/tmp/asgard2-agent
   user@host:~$ sudo rm -r /var/lib/asgard2-agent
   user@host:~$ sudo rm -r /var/lib/thor

Uninstall ASGARD Agents on macOS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console 

   user@mac:~$ sudo /private/var/lib/asgard2-agent/asgard2-agent-service stop
   user@mac:~$ sudo /private/var/lib/asgard2-agent/asgard2-agent-service uninstall
   user@mac:~$ sudo rm -r /var/lib/asgard2-agent/asgard2-agent
   user@mac:~$ sudo rm -r /var/lib/thor

Remove manually the ``asgard2-agent-service`` from  ``System Settings`` > ``Privacy & Security`` > ``Full Disk Access``.