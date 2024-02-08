.. index:: SSL Interception

SSL Interception
================

Using a web proxy with TLS/SSL interception will break the installation routine and shows this error:

.. code-block:: none

   Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown.  Could not handshake: Error in the certificate verification.

Solution: Disable TLS/SSL interception for our update servers. 

- update-301.nextron-systems.com

Used for THOR updates:

- update1.nextron-systems.com
- update2.nextron-systems.com

We do not support setups in which the CA of the intercepting proxy
is used on our ASGARD appliances. 