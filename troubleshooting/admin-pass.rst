.. index:: Admin User Password Reset 

Admin User Password Reset 
=========================

If you've lost the password of the local ``admin`` user (Web GUI) but
still have access the system via SSH, you can reset it via command
line using the following command. 

.. code-block:: console 

   nextron@asgard:~$ sudo asgard-management-center set-password
    {"LEVEL":"Info","MESSAGE":"LDAP disabled","MODULE":"LDAP","TIME":"2024-04-10T08:17:42Z"}
    Please enter password for user `admin`: 
    Please re-enter password for user `admin`: 
    Apr 10 08:17:49 asgard THOR_UTIL: Info: SET_PASSWORD: password successfully updated
