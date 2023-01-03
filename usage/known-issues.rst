Known Issues
=============

AMC#001: API Documentation Curl Examples Not Working
----------------------------------------------------

Since ASGARD 2.12.8 the API documentation is not showing the API key
in example queries as it should and did.

..
    Source of Issue
    ~~~~~~~~~~~~~~~
    add after source is known

AMC#001: Workaround
~~~~~~~~~~~~~~~~~~~

You need to manually add ``-H 'Authorization: <your-API-key>'`` to your queries.

Example with API endpoint ``/playbooks/search``:

    Non-working curl example:

    .. code-block:: console

       user@host:~$ curl -X 'GET' \
         'https://asgard.local:8443/api/v1/playbooks/search?limit=1' \
         -H 'accept: application/json'


    Working curl example:

    .. code-block:: console

       user@host:~$ curl -X 'GET' \
         'https://asgard.local:8443/api/v1/playbooks/search?limit=1' \
         -H 'accept: application/json' \
         -H 'Authorization: <your-API-key>'

You also need the ``--insecure`` curl flag, if you are using the self-signed
certificate that ASGARD shipped with.

AMC#001: Status
~~~~~~~~~~~~~~~

Resolved in ASGARD 2.13.5+

AMC#002: Aurora False Positive Filters Cleared After Saving
-----------------------------------------------------------

If the global Aurora false positive filter at ``Service Control`` >
``Aurora`` > ``False Positive Filters`` is used, the text box is
empty/cleared after saving and refreshing the page.

AMC#002: Workaround
~~~~~~~~~~~~~~~~~~~

If the false positive tuning you want to achieve is only affecting one rule, the best place to
tune it is a single rule false positive tuning at ``Service Control`` > ``Sigma`` > ``Rules`` and choosing
the "Edit false positives filters of this rule" action.

If you need global false positive filter, you can edit the file
``/var/lib/nextron/asgard2/products/aurora-config/false-positives.cfg``
directly via the ASGARD command line. In order for the changes to take effect it is important
**NOT** to click the ``Service Control`` > ``Aurora`` > ``False Positive Filters`` > ``Save`` button.

Instead go to ``Service Control`` > ``Aurora`` > ``Configurations``
and edit the configuration of the assets that need the false
positive filter. To do so just open the configuration using
the edit action and saving without any modifications using the
"Save Configuration and Restart Aurora Agents" button. This will
use the false positive filter defined in the file via CLI and
restarts the assets to use the new configuration.

AMC#002: Status
~~~~~~~~~~~~~~~

Open. Will be fixed in the next release.

AMC#003: Error on newly installed Management Center
---------------------------------------------------

You just installed an ASGARD Management Center and get error messages such as
    
.. code-block:: none

    Error: Something went wrong
    c is null

or

.. code-block:: none

    Error: Something went wrong
    Cannot read properties of null (reading 'forEach')

This happens if you want to initiate THOR scans or access THOR scan settings
before ASGARD was able to download the THOR packages from our update servers.

AMC#003: Workaround
~~~~~~~~~~~~~~~~~~~

Make sure ASGARD is able to access our update servers
(see ``System Status``: Connectivity Test or ``System Status`` > ``Diagnostics``
and that you have imported a valid license (see ``Licensing``).

You can either wait for ASGARD to download the THOR packages
automatically (check at ``Updates`` > ``THOR and Signatures``) or
initiate a download of THOR packages and signatures manually by
clicking the "Manually Check for Updates" button at ``Updates`` > ``THOR and Signatures``.

AMC#003: Status
~~~~~~~~~~~~~~~

Open.

AMC#004: RPM Packages do not have a compatible architecture
-----------------------------------------------------------

Some Linux systems return this error message when installing
the RPM packages of the ASGARD agents. 

.. code-block:: none

    Depsolve Error occured: \n Problem: conflicting requests\n  - package asgard2-agent-1-1.0.0.amd64 does not have a compatible architecture.

The issue is known and can be ignored. The installation completes successfull regardless of this error message. 

AMC#004: Workaround 1
~~~~~~~~~~~~~~~~~~~~~

No workaround required. Regardless of the message the package installation completes successfully.

You can avoid the error messages using this command: 

.. code-block:: console 

    user@host:~$ sudo yum install --forcearch amd64 ./asgard2-agent-linux-amd64.rpm

For an unattended installation (no user interaction) use:

.. code-block:: console

    user@host:~$ sudo yum install -y --forcearch amd64 ./asgard2-agent-linux-amd64.rpm

AMC#004: Workaround 2
~~~~~~~~~~~~~~~~~~~~~

You can build a new RPM package and use it for automated installations.

Log into the Asgard server which should be used by the clients to
connect to and execute the following steps:

.. code-block:: console

    nextron@asgard:~$ sudo -u asgard2 -s # Open a shell with the access rights of the asgard2 user
    asgard2@asgard:~$ rpmbuild --target x86_64 --buildroot /var/lib/nextron/asgard2/templates/rpm/BUILDROOT/x86_64 -bb /var/lib/nextron/asgard2/templates/rpm/SPECS/asgard2-agent-amd64.spec

Use the following file instead of the RPM from the Agent Download section in the Asgard UI:

``/var/lib/nextron/asgard2/templates/rpm/x86_64/asgard2-agent-1-1.0.0.x86_64.rpm``

When using ``scp`` to transfer the file from the server, you will
need to copy the file to a directoy that is accessible by the
``nextron`` user. You also need to change the file permissions.
One possibility to achive this is to use the following commands:

.. code-block:: console

    asgard2@asgard:~$ exit # close the session of the asgard2 user if still open
    nextron@asgard:~$ sudo cp /var/lib/nextron/asgard2/templates/rpm/x86_64/asgard2-agent-1-1.0.0.x86_64.rpm /home/nextron/
    nextron@asgard:~$ sudo chown nextron:nextron /home/nextron/asgard2-agent-1-1.0.0.x86_64.rpm

The resulting RPM should no longer cause the described "unsupported
architecture" error message when it is used with ``yum`` or ``dnf``.

AMC#004: Workaround 3
~~~~~~~~~~~~~~~~~~~~~

There are rare cases where the package installation should be
automated and the command line flags are not an option. In this
cases it is possible to perform the ASGARD agent installation
manually. This requires to collect some files from ASGARD and
move them to the asset that should be connected.

.. code-block:: bash

    # For 64-bit systems
    /var/lib/nextron/asgard2/templates/linux/asgard2-agent-amd64
    /var/lib/nextron/asgard2/templates/linux/client-amd64

    # For 32-bit systems
    /var/lib/nextron/asgard2/templates/linux/asgard2-agent-386
    /var/lib/nextron/asgard2/templates/linux/client-386

    # For all systems
    /etc/nextron/asgard2/ca.pem
    /etc/nextron/asgard2/client.yaml

These files have to be located on the target asset as follows

.. code-block:: bash

    # Preparation if it is a first time installation
    mkdir -p /var/lib/asgard2-agent/

    # For 64-bit systems
    mv asgard2-agent-amd64 /usr/sbin/asgard2-agent-service
    mv client-amd64 /var/lib/asgard2-agent/asgard2-agent

    # For 32-bit systems
    mv asgard2-agent-386 /usr/sbin/asgard2-agent-service
    mv client-386 /var/lib/asgard2-agent/asgard2-agent

    # For all systems
    mv ca.pem /var/lib/asgard2-agent/ca.pem
    mv client.yaml /var/lib/asgard2-agent/asgard2-agent.yaml

    # Make sure access rights in the file system are secure
    chown -R root:root /var/lib/asgard2-agent
    chmod -R g-rwx /var/lib/asgard2-agent
    chmod -R o-rwx /var/lib/asgard2-agent

Afterwards the installation is done by running:

.. code-block:: console

    user@host:~$ sudo /var/lib/asgard2-agent/asgard2-agent -install

To uninstall the ASGARD agent without using the RPM package the following steps can be used:

.. code-block:: console

    user@host:~# sudo /var/lib/asgard2-agent/asgard2-agent -uninstall
    user@host:~# sudo rm /usr/sbin/asgard2-agent-service
    user@host:~# sudo rm -Rf /var/lib/asgard2-agent/

AMC#004: Status
~~~~~~~~~~~~~~~

Under investigation. We are planning to provide fixes but have
to test if the fix would cause problems with older installations. (upgrades, legacy issues)

AMC#005: Basename Missing Operand after SSH Login
-------------------------------------------------

After logging into ASGARD Management Center via SSH right
after installing the base system, the following message can appear: 

.. code-block:: none

    basename: missing operand
    Try 'basename --help' for more information

It is caused by a unhandled condition in the MOTD (message of
the day) script that evaluates the version of the scanners and
signatures. After installing ASGARD it takes some minutes to
retrieve and install all scanners from the update servers.

The issue is known and can be ignored.

AMC#005: Workaround
~~~~~~~~~~~~~~~~~~~

No workaround required. The issue solves itself after the
download of the scanner and signature packages. 

AMC#005: Status
~~~~~~~~~~~~~~~

Fixed in next ASGARD version. 


AMC#006: Nested LDAP Groups not working
---------------------------------------

Using nested groups in your LDAP/AD will result in no users because the query will fail.

AMC#006: Workaround
~~~~~~~~~~~~~~~~~~~

Change your LDAP GroupFilter to the following:

.. code-block:: none
    
    (&(objectCategory=group)(objectClass=group)(member:1.2.840.113556.1.4.1941:=%s))

AMC#006: Status
~~~~~~~~~~~~~~~

Fixed in next ASGARD version.