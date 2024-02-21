.. index:: Admin User Password Reset 

Admin User Password Reset 
=========================

If you've lost the password of the local ``admin`` user (Web GUI) but
still have access the system via SSH, you can reset it via command
line using the following command. 

.. code-block:: console 

   nextron@asgard:~$ sudo mysql asgard-management-center -e "UPDATE users SET password = 'YmIc6P_6jdbeEL0HY4xIcpYstmM' WHERE name = 'admin';"

This resets the password to ``admin``. You should then change that password immediately.
