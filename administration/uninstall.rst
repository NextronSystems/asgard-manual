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

   C:\Windows\system32>sc stop asgard2-agent
   C:\Windows\system32>sc delete asgard2-agent
   C:\Windows\system32>sc stop asgard2-agent_sc
   C:\Windows\system32>sc delete asgard2-agent_sc
   C:\Windows\system32>rmdir /S /Q C:\Windows\System32\asgard2-agent
   C:\Windows\system32>rmdir /S /Q C:\ProgramData\thor

.. note::
   Line 3 and 4 are only necessary if the new service controller (on ASGARD 2.11+) has been installed.

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

   root@host:~# /usr/sbin/asgard2-agent-amd64 stop
   root@host:~# /usr/sbin/asgard2-agent-amd64 uninstall
   root@host:~# rm -r /usr/sbin/asgard2-agent-amd64
   root@host:~# rm -r /var/tmp/nextron/asgard2-agent
   root@host:~# rm -r /var/lib/nextron/asgard2-agent
   root@host:~# rm -r /var/lib/thor

Uninstall ASGARD Agents on macOS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console 

   user@mac:~$ sudo /var/lib/asgard2-agent/asgard2-agent --uninstall
   user@mac:~$ sudo rm -r /var/lib/asgard2-agent/asgard2-agent
   user@mac:~$ sudo rm -r /var/lib/thor

Uninstall ASGARD Service Controller
----------------------------------- 

If you only want to uninstall the ASGARD Service Controller (Aurora),
but leave the normal ASGARD Agent as it is, execute the following command:

.. code-block:: doscon

    C:\Windows\system32>C:\Windows\System32\asgard2-agent\asgard2-agent_sc.exe -uninstall
