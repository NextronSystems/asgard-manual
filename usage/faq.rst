FAQ
===

Scheduled Scans do not run at the correct time
----------------------------------------------
In some cases the timezone during the installation of the server image might not be correct. To see if you have this problem in your current installation, please log into your server and execute the following command:

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

List all the timezones with ``timedatectl list-timezones``. If you want to search for a specific Country/City, you can use grep, e.g. ``timedatectl list-timezones | grep Prague``.

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

**Note**: This might cause problems with existing Scheduled Scans!

Aurora is generating too many False Positives
---------------------------------------------

In some environments, Aurora might generate a high amount of False Positives. This should never be the case, since Aurora should only alert on very few and mostly important findings. Most likely a rule is matching on the environment and generates too many false positives. To circumvent this, you can disable the rule and set a filter later on. For Tuning, please see :ref:`usage/administration:False Positive Tuning of Sigma Rules`.