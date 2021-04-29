Common Errors
=============

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

Connect via SSH to the system. 

TBD

The agents have to be rebuild after a change of the FQDN. Adjust and run the following script: 

.. code:: bash

   #!/bin/bash
   # VARIABLES
   ############################################
   HOST="asgard"
   FQDN=$HOST.internaldomain.net
   CLIENTCERTVALIDITY=36500
   ############################################
   hostnamectl set-hostname "$FQDN"
   
   openssl req -new -newkey rsa:4096 -days 36500 -nodes -x509 -subj "/O=Nextron Systems GmbH/CN=$FQDN" -keyout /etc/nextron/asgard2/server.key -out /etc/nextron/asgard2/server.pem
   
   openssl req -newkey rsa:4096 -nodes -subj "/O=Nextron Systems GmbH/CN=$FQDN" -keyout /etc/nextron/asgard2/client-service.key -out /etc/nextron/asgard2/client-service.csr
   
   openssl x509 -req -in /etc/nextron/asgard2/client-service.csr -CA /etc/nextron/asgard2/ca.pem -CAkey /etc/nextron/asgard2/ca.key -CAcreateserial -days $CLIENTCERTVALIDITY -out /etc/nextron/asgard2/client-service.pem
   
   asgard2-repacker -host $FQDN   
