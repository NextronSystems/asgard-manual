.. index:: Resetting TLS/SSL Certificates

Resetting TLS/SSL Certificates
==============================

Web GUI: Regenerate the Self-Signed Certificate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ASGARD ships with a self-signed certificate for its web interface
that expires after 182 days. If you do not use your own CA
infrastructure and want to renew the certificate or want to revert
from a broken state, you can recreate a self-signed certificate.
To do so log in using SSH and execute:

.. code-block:: console

   nextron@asgard:~$ sudo openssl req -new -newkey rsa:4096 -days 182 -nodes -x509 -subj "/O=Nextron Systems GmbH/CN=$(hostname --fqdn)" -keyout /etc/asgard-management-center/server.key -out /etc/asgard-management-center/server.pem

You need to restart ASGARD in order for the changes to take effect.

.. code-block:: console

   nextron@asgard:~$ sudo systemctl restart asgard-management-center.service

Regenerate ASGARD Server Certificate Agent Communication 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Please see chapter :ref:`troubleshooting/hostname-fqdn:using hostname instead of fqdn`.
