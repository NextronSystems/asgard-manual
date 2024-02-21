.. index:: Using Hostname instead of FQDN

Using Hostname instead of FQDN
==============================

The most common error is to define a simple hostname instead of a valid
FQDN during installation. This happens if no domain name
has been set during the setup step :ref:`setup/network:network configuration`
(``Domain name``). 

This leads to a variety of different problems. 

The most important problem is that ASGARD Agents that install on endpoints
will never be able to resolve and connect to the ASGARD server. 

Errors that appear in these cases 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: none

   Apr 23 12:07:12 debian10-dev/10.10.30.118 ASGARD_AGENT: Error:
   could not run: rpc error: code = Unavailable desc = connection
   error: desc = "transport: authentication handshake failed: x509:
   certificate is valid for wrong-fqdn, not asgard.nextron.internal"

How to Fix a non-existing or wrong FQDN
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The FQDN is set at installation time and is composed by the hostname
and the domain name. The ASGARD Agents require a resolvable FQDN to
correctly operate and connect to the ASGARD Server.
One of the processes which are executed at installation time include
the integration of the FQDN - which should be set during installation - into
the ASGARD agents. If we incorrectly set the FQDN or leave any of those
values empty, the agents will fail to connect to ASGARD.

With this fix we will set a new FQDN for the ASGARD Management Center, recreate
the internal certificates, and rebuild the agents.

.. warning:: 
   The used FQDN in this manual is just an example. Please use the
   FQDN of your domain. make sure the FQDN is resolvable via your DNS
   server.

Set a valid FQDN
^^^^^^^^^^^^^^^^

To set a valid FQDN for your ASGARD Management Center server, follow the steps below.
We are assuming that your local DNS server already has an A-Record assigned, so your
clients can resolve the new hostname/FQDN of your ASGARD Management Center.

Connect via SSH to the ASGARD Management Center:

.. code-block:: console

  user@somehost:~$ ssh nextron@asgard-mc.example.org

Edit the hosts file. Please be careful with the changes in this file,
as this might make your system unusable!

.. code-block:: console

   nextron@asgard-mc:~$ sudoedit /etc/hosts
   [sudo] password for nextron: 

You need to change the following line (**do not change the IP-Address!**):

.. code-block:: none
   :linenos:
   :emphasize-lines: 2

   127.0.0.1       localhost
   172.16.0.20     asgard-mc

   # The following lines are desirable for IPv6 capable hosts
   ::1     localhost ip6-localhost ip6-loopback
   ff02::1 ip6-allnodes
   ff02::2 ip6-allrouters

To this (values are examples, please change accordingly!)

.. code-block:: none
   :linenos:
   :emphasize-lines: 2

   127.0.0.1       localhost
   172.16.0.20     asgard-mc.example.org asgard-mc

   # The following lines are desirable for IPv6 capable hosts
   ::1     localhost ip6-localhost ip6-loopback
   ff02::1 ip6-allnodes
   ff02::2 ip6-allrouters

.. note:: 
   If you did not set a static IP-Address for your ASGARD Management Center
   server, your IP-Address in the second line of the file might be ``127.0.1.1``.
   This is due to your server using DHCP. It is advised that you are using a 
   static IP-Address. To change this, please see :ref:`setup/configure_os:changing the ip-address`.

You can verify if the changes worked. Run the following commands and see the difference
in the output:

.. code-block:: console

   nextron@asgard-mc:~$ hostname --fqdn
   asgard-mc.example.org
   nextron@asgard-mc:~$ hostname
   asgard-mc

If the first command shows the FQDN and the second one the hostname without domain,
your changes were set up correctly and you can continue to the next step.

Recreate the TLS Certificate
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We need to recreate the TLS certificate to make the Agent to ASGARD communication
possible again. Create a new file which will contain the script with the fix.
In this example we'll use nano as the text editor. Make sure that the system has
a valid FQDN.

.. code-block:: console

   nextron@asgard-mc:~$ nano fix-fqdn.sh

Insert the following content into the text editor:

.. code-block:: bash
   :linenos:

   #!/bin/bash
   export FQDN=$(hostname --fqdn)

   sed "s/\$FQDN/${FQDN}/" /etc/asgard-management-center/server_cert_ext.cnf.in > /etc/asgard-management-center/server_cert_ext.cnf
   openssl req -new -nodes -subj "/O=Nextron Systems GmbH/CN=${FQDN}" -key /etc/asgard-management-center/client-service.key -out /etc/asgard-management-center/client-service.csr
   openssl x509 -req -in /etc/asgard-management-center/client-service.csr -CA /etc/asgard-management-center/ca.pem -CAkey /etc/asgard-management-center/ca.key -CAcreateserial -days 36500 -out /etc/asgard-management-center/client-service.pem -extfile /etc/asgard-management-center/server_cert_ext.cnf
   systemctl restart asgard-management-center.service
   asgard-agent-repacker -host $FQDN

After changing the variables to the desired values, save the file.
In ``nano`` this can be done in by pressing ``CTRL + X`` and confirming the changes with ``y``.

Give the created script execution permissions and execute it:

.. code-block:: console

   nextron@asgard-mc:~$ chmod +x fix-fqdn.sh
   nextron@asgard-mc:~$ sudo ./fix-fqdn.sh

You should now be able to reach the ASGARD Server via the new FQDN.
Navigate to ``https://<YOUR-FQDN>:8443``, which reflects the FQDN we set earlier.

At this point you have to install the ASGARD agents on your endpoints again.
Remember to review the network requirements section to ensure all needed ports
are open to the ASGARD Management Center from your endpoints.
See :ref:`requirements/network:network requirements`
