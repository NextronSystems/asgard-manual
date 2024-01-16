.. index:: Scheduled Scans have incorrect time

Scheduled Scans have incorrect time
===================================

In some cases the timezone during the installation of the server
image might not be correct. To see if you have this problem in your
current installation, please log into your server and execute the following command:

.. code-block:: console

    nextron@asgard:~$ timedatectl
                   Local time: Mon 2022-10-24 09:52:03 BST
               Universal time: Mon 2022-10-24 08:52:03 UTC
                     RTC time: Mon 2022-10-24 08:52:04
                    Time zone: Europe/London (BST, +0100)
    System clock synchronized: no
                  NTP service: inactive
              RTC in local TZ: no

If you see that the **Time zone** is incorrect, follow the next steps to correct it.

List all the timezones with ``timedatectl list-timezones``. If you want
to search for a specific Country/City, you can use grep, e.g. ``timedatectl list-timezones | grep Prague``.

Now that you have the correct timezone you can set it the following way:

.. code-block:: console

	nextron@asgard:~$ sudo timedatectl set-timezone Europe/Prague
	nextron@asgard:~$ timedatectl
 	               Local time: Mon 2022-10-24 10:56:45 CEST
            	   Universal time: Mon 2022-10-24 08:56:45 UTC
 	                 RTC time: Mon 2022-10-24 08:56:46
	                Time zone: Europe/Prague (CEST, +0200)
	System clock synchronized: no
	              NTP service: inactive
	          RTC in local TZ: no


Please reboot the system after the changes have been made.

.. warning::
   This might cause problems with existing Scheduled Scans!
