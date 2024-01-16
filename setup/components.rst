.. Index:: Install Service

Install the ASGARD Management Center Services
---------------------------------------------

Use SSH to connect to the appliance using the user ``nextron`` and the password you
specified during the installation (if you were using an old ISO to install the base
system, the password is ``nextron``). Now you can run the following command: 

``sudo nextronInstaller -asgard`` (caution: upper case “i" in the middle). This will install ASGARD.

.. figure:: ../images/setup_nextronInstaller.png
   :alt: running the nextronInstaller


After installation is complete type the following command to see if the service
is running: 

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

The installation is complete, you are ready to log into the web UI
of your Management Center.
