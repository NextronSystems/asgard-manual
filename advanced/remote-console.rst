.. index:: Disable Remote Console Globally

Disable Remote Console Globally
===============================

Remote Console on connected endpoints can be disabled centrally by creating the following file. 

.. code-block:: console

   nextron@asgard:~$ sudo touch /etc/asgard-management-center/disable_console

To re-enable Remote Console simply remove the created file

.. code-block:: console

   nextron@asgard:~$ sudo rm /etc/asgard-management-center/disable_console
