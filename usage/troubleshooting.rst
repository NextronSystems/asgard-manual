Troubleshooting
===============

Agent Debugging
---------------

Internal Agent Debugging
~~~~~~~~~~~~~~~~~~~~~~~~

Edit the file ``asgard2-agent.yaml`` and set the value of ``write_log`` to true. The file can be found in ``C:\Windows\System32\asgard2-agent\`` or ``/var/lib/asgard2-agent/`` for Windows and Linux/macOS, respectively.

.. code::

   write_log: true

After making these changes, restart the ASGARD service. You can then find log entries and possible error messages in the file ``asgard2-agent.log`` in the same directory as the configuration file.

Note: The value is set to ``false`` by default, because the agent doesn't rotate or compress these logs. Leaving that value on ``true`` could cause that file to grow very big and use a significant amount of disk space. We recommend resetting it after the debugging session.

Go Debug Logging
~~~~~~~~~~~~~~~~

On Windows, open the cmd.exe as Administrator. Set some environment variables.

.. code:: winbatch 

   set GRPC_GO_LOG_SEVERITY_LEVEL=info
   set GODEBUG=http2debug=2

Navgiate into the agent's program directory and start it to see all output messages.

.. code:: winbatch 

   sc stop asgard2-agent
   cd C:\Windows\system32\asgard2-agent\
   asgard2-agent.exe

Interrupt the agent with ``CTRL+C``. Don't forget to start the Windows service after the debugging session. 

.. code:: winbatch

   sc start asgard2-agent

On Linux, open a shell as root (sudo). 

.. code:: bash

   export GRPC_GO_LOG_SEVERITY_LEVEL=info
   export GODEBUG=http2debug=2

Navgiate into the agent's program directory and start it to see all output messages.

.. code:: bash 

   systemctl stop asgard2-agent
   cd /var/lib/asgard2-agent/
   ./asgard2-agent

Interrupt the agent with ``CTRL+C``. Don't forget to start the Linux service after the debugging session. 

.. code:: bash 

   systemctl start asgard2-agent

Aurora Diagnostics Pack
~~~~~~~~~~~~~~~~~~~~~~~

If Aurora does not behave like it should, e.g. using more resources than you expected, you can create a diagnostics pack for our support to help in troubleshooting the issue. This can be conveniently done using the playbook ``[Default] Create and Collect Aurora Agent Diagnostics Pack (Windows)``.

It can be run from ``Asset Management`` > ``Response Action`` (Play button) or from ``Response Control`` > ``Tasks`` > ``Add Task`` or if needed as a group task. The resulting ``diagnostics.zip`` can be downloaded from the third step in the ``Playbook Result`` tab of the expanded task.

SSL Interception
----------------

Using a web proxy with TLS/SSL interception will break the installation routine and shows this error:

.. code::

   Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown.  Could not handshake: Error in the certificate verification.

Solution: Disable TLS/SSL interception for our update servers. 

- update3.nextron-systems.com

Used for THOR updates:

- update1.nextron-systems.com
- update2.nextron-systems.com

We do not support setups in which the CA of the intercepting proxy is used on our ASGARD appliances. 

Using Hostname instead of FQDN 
------------------------------

The most common error is to define a simple hostname instead of a valid FQDN during installation. This happens in cases in which no domain name has been set in the setup step named "Configure the network". 

This leads to a variety of different problems. 

The most important problem is that ASGARD Agents that install on end systems will never be able to resolve and connect to the ASGARD server. 

Errors that appear in these cases 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: 

   Apr 23 12:07:12 debian10-dev/10.10.30.118 ASGARD_AGENT: Error: could not run: rpc error: code = Unavailable desc = connection error: desc = "transport: authentication handshake failed: x509: certificate is valid for wrong-fqdn, not asgard.nextron.internal"

How to Fix an unset or wrong FQDN
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The FQDN is set at installation time and is composed by the hostname and the domain name. The ASGARD Agents require a resolvable FQDN to correctly operate and connect to the ASGARD Server.
One of the processes which are executed at installation time include the integration of the FQDN we set during installation into our agents. If we incorrectly set the FQDN or we leave any of those values empty , the agents will fail to connect to ASGARD.

With this fix we'll set a new FQDN for the ASGARD Server , recreate the internal certificates and rebuild the agents.

* Connect via SSH to the system.

 .. code:: bash

   ssh nextron@YOURASGARDSERVER

* Create a new file which will contain the script with the fix. In this example we'll use nano as the text editor.

 .. code:: bash

   nano fix-fqdn.sh

 Change the HOST and DOMAIN variable , make sure that the resulting FQDN is resolvable by the endpoints you deploy the agent to later.

 .. code:: bash

   #!/bin/bash
   # VARIABLES
   ############################################
   HOST="asgard"
   DOMAIN="internaldomain.net"
   FQDN=$HOST.$DOMAIN
   CLIENTCERTVALIDITY=36500
   ############################################
   hostnamectl set-hostname "$FQDN"

   openssl req -new -newkey rsa:4096 -days 36500 -nodes -x509 -subj "/O=Nextron Systems GmbH/CN=$FQDN" -keyout /etc/nextron/asgard2/server.key -out /etc/nextron/asgard2/server.pem

   openssl req -newkey rsa:4096 -nodes -subj "/O=Nextron Systems GmbH/CN=$FQDN" -keyout /etc/nextron/asgard2/client-service.key -out /etc/nextron/asgard2/client-service.csr

   openssl x509 -req -in /etc/nextron/asgard2/client-service.csr -CA /etc/nextron/asgard2/ca.pem -CAkey /etc/nextron/asgard2/ca.key -CAcreateserial -days $CLIENTCERTVALIDITY -out /etc/nextron/asgard2/client-service.pem

   asgard2-repacker -host $FQDN

* After changing the variables to the desired values , save the file. This can be done in "nano" pressing CTRL + X and confirming the changes

* Give the created script execution permissions

 .. code:: bash

   chmod +x fix-fqdn.sh


* Execute the script

 .. code:: bash

   sudo ./fix-fqdn.sh

Once the script has been executed the ASGARD service should be restarted.

* Restart the service

 .. code:: bash

   sudo systemctl restart asgard2

You should now be able to reach the ASGARD Server under the new FQDN. Navigate to ``https://FQDN:8443`` being the FQDN the one you defined earlier in the script.

You should now install the agents on the endpoints again. They should be communicating correctly back to ASGARD by now. Remember to review the network requirements section to ensure all needed ports are open to the ASGARD Management Center from the endpoint.
