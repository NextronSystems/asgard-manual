Known Issues
============

AMC#004: could not generate csr
-------------------------------

This bug will prevent you from generating a new CSR in the TLS
Section of the Settings. The error message will look like this:

.. code-block:: none

  Error - could not generate csr
  Could not read private key

.. list-table::
    :header-rows: 1
    :widths: 50, 50

    * - Introduced Version
      - Fixed Version
    * - <= 3.0.11
      - 3.0.12

This bug will only occur if you upgraded your ASGARD Management
Center from version 2.x to 3.x. The issue is caused by the
``controller.key`` file not being present in the ``/etc/asgard-management-center``
directory. If you installed a fresh ASGARD Management Center 3.x,
with the new web based installer, this issue will not occur.

AMC#004: Workaround
~~~~~~~~~~~~~~~~~~~

To work around this issue, you can run the following command:

.. code-block:: console

  nextron@asgard:~$ sudo -u asgard-management-center ln -s /etc/asgard-management-center/server.key /etc/asgard-management-center/controller.key
  [sudo] password for nextron:

This will create a symbolic link from the ``server.key`` to the
``controller.key`` file. After that, you should be able to
generate a new CSR in the TLS Section of the Settings.

AMC#003: Context Deadline Exceeded
----------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50

    * - Introduced Version
      - Fixed Version
    * - N/A
      - Ongoing

When debugging GRPC connectivity issues between your components (for example Management
Center to Analysis Cockpit), you might encounter an error similar to the following one:

.. code-block:: json
   :linenos:
   :emphasize-lines: 9

   {
    "LEVEL":"Warning",
    "MESSAGE":"could not dial grpc",
    "MODULE":"api",
    "REQUEST_IP":"172.16.30.20",
    "TIME":"2023-03-06T12:35:37Z",
    "USER":"admin",
    "error":"context deadline exceeded",
    "host":"cockpit3.domain.local:7443"
   }

AMC#003: Workaround
~~~~~~~~~~~~~~~~~~~

There is no workaround for this type of error. The error usually occurs because
one of the following things are preventing proper communication between your
components:

* Firewall is using TLS Inspection
* Proxy is using TLS Inspection
* DNS Issues

.. note::
  Your components expect specific certificates from each other when communicating.
  If a device is trying to inspect TLS traffic, the certificate will change and
  you receive the above error.

To help you figuring out what is causing the problem, you can try the following.
You can use openssl on your source system to see which certificate is presented
by the destination host (change the host and port values as needed).

.. code-block:: console
  :emphasize-lines: 3, 6

  nextron@asgard2:~$ openssl s_client -host cockpit3.domain.local -port 7443
  CONNECTED(00000005)                        
  depth=0 O = Nextron Systems GmbH, CN = cockpit3.domain.local
  verify error:num=20:unable to get local issuer certificate
  verify return:1
  depth=0 O = Nextron Systems GmbH, CN = cockpit3.domain.local
  verify error:num=21:unable to verify the first certificate
  verify return:1
  write W BLOCK
  ---               
  Certificate chain      
   0 s:O = Nextron Systems GmbH, CN = cockpit3.domain.local
     i:O = Nextron Systems GmbH, CN = Analysis Cockpit 3
  ---         
  Server certificate     
  -----BEGIN CERTIFICATE-----

The marked lines show you the certificate which is presented by the destination
host. If this certificate is different from the one you installed, then the problem
might be a device trying to do TLS Inspection.

We are currently working on improving the presented error message, to give
a better understanding what might be the issue at hand.

AMC#002: High number of duplicate assets
----------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50

    * - Introduced Version
      - Fixed Version
    * - N/A
      - N/A

In some edge cases within restricted endpoint configurations,
you can encounter a problem which causes some agents to send
a lot of asset requests. This is mostly caused by hardened systems,
where the asgard agent is not able to write to its own configuration
file. One example is SELinux prohibiting write access to the needed
YAML file.

AMC#002: Workaround
~~~~~~~~~~~~~~~~~~~

The asgard-agent process needs write access to the configuration file.

Make sure the following condition is present to avoid multiple asset
requests from the same endpoint:

.. list-table::
    :header-rows: 1
    :widths: 40, 44, 16

    * - Process
      - File
      - Permissions
    * - /var/lib/asgard2-agent/asgard2-agent
      - /var/lib/asgard2-agent/asgard2-agent.yaml
      - Read/Write

Make sure to disable ``Automatically accept all Asset Requests`` in
the :ref:`administration/advanced:advanced settings` Settings in the meantime, to
avoid cleaning up after the changes to the endpoints have been made.

AMC#001: Nested LDAP Groups not working
---------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - 2.0.0
      - Open

Using nested groups in your LDAP/AD will result in no users because the query will fail.

AMC#001: Workaround
~~~~~~~~~~~~~~~~~~~

Change your LDAP GroupFilter to the following:

.. code-block:: none
    
    (&(objectCategory=group)(objectClass=group)(member:1.2.840.113556.1.4.1941:=%s))
