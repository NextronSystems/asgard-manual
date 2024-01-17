.. Index:: Install Service

Install the ASGARD Management Center Service
--------------------------------------------

Use SSH to connect to the appliance using the user ``nextron`` and the password
you specified during the installation. Now you can run the following command: 

.. code-block:: console

   nextron@asgard:~$ sudo nextronInstaller -asgard

.. caution::
   Upper case "i" in the middle.

This will install the ASGARD Management Center on top of the base operating
system from the ISO.

.. figure:: ../images/setup_nextronInstaller.png
   :alt: running the nextronInstaller

After the installation is completed, type the following command to see
if the service is running: 

.. code-block:: console
   :emphasize-lines: 5

   nextron@asgard:~$ sudo systemctl status asgard-management-center.service
   [sudo] password for nextron: 
   ● asgard-management-center.service - ASGARD Management Center
        Loaded: loaded (/lib/systemd/system/asgard-management-center.service; enabled; preset: enabled)
        Active: active (running) since Tue 2024-01-16 13:45:15 CET; 1min 38s ago
       Process: 898 ExecStartPre=/usr/share/asgard-management-center/scripts/exec_start_pre.sh (code=exited, status=0/SUCCESS)
      Main PID: 927 (exec_start.sh)
         Tasks: 10 (limit: 4601)
        Memory: 186.0M
           CPU: 2.043s

The installation is now completed, you are ready to log into the web UI
of your Management Center.
