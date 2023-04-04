Known Issues
=============

AMC#012: Missing asgard2-agent.yaml
-----------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50

    * - Introduced Version
      - Fixed Version
    * - asgard2-agent (1.6.5)
      - 

Due to a bug in the installer of our ASGARD Agent, there is a possibility that
the configuration file (``asgard2-agent.yaml``) gets renamed but not replaced
by a more current version. This usually happens if the agent installer is being
run a second time, after the agent is aready installed. In some rare cases this
can also happen when the agent is being updated via your ASGARD. All together,
this leaves the agent in an undesirable state, which will cause no tasks/jobs
to be executed due to the missing config file (task will be in ``Pending`` state
or return an error).

You will find errors in the agent log (``C:\Windows\System32\asgard2-agent\log\agent.log``)
and also observe that the installer directory only contains ``asgard2-agent.yaml.old``
and not the correct ``asgard2-agent.yaml`` config file.

.. code-block:: none
  :caption: Error in the asgard.log file

   2023/03/29 23:34:26 ASGARD_THOR: Error: could not load config: open C:\Windows\System32\asgard2-agent\asgard2-agent.yaml: The system cannot find the file specified.
   2023/03/29 23:34:26 ASGARD_AGENT: Error: task 1350 done with error: exit status 1

Another indicator is the ``asgard2-agent-install.log`` file located at
``C:\Windows\System32\asgard2-agent\``. This almost always means the installer
was executed multiple times.

.. code-block:: none
  :caption: Error in the asgard2-agent-install.log file

  2023/03/30 16:13:14 installer arguments: asgard2-agent.exe -install
  2023/03/30 16:13:14 could not open dst file C:\Windows\System32\asgard2-agent\asgard2-agent-service.exe: open C:\Windows\System32\asgard2-agent\asgard2-agent-service.exe: The process cannot access the file because it is being used by another process.
  2023/03/30 16:13:14 could not copy files from executable path . to install path C:\Windows\System32\asgard2-agent: open C:\Windows\System32\asgard2-agent\asgard2-agent-service.exe: The process cannot access the file because it is being used by another process.

AMC#012: Workaround
~~~~~~~~~~~~~~~~~~~

To get the agent up and running again, you need to rename the config file to its
original name and restart the asgard2-agent service. We wrote a little batch script
you can use, alternatively you can write your own and deploy it. Administrative
rights on the endpoint are needed.

.. code-block:: batch
  :linenos:

  @ECHO OFF

  IF EXIST "C:\Windows\System32\asgard2-agent\asgard2-agent.yaml" GOTO noFix
  IF EXIST "C:\Windows\System32\asgard2-agent\asgard2-agent.yaml.old" GOTO fixConfig

  :noFix
  echo config file exists, nothing to do
  GOTO commonExit

  :fixConfig
  echo config file in renamed state, fixing
  copy "C:\Windows\System32\asgard2-agent\asgard2-agent.yaml.old" "C:\Windows\System32\asgard2-agent\asgard2-agent.yaml"
  timeout /t 2

  echo stopping asgard2-agent service
  sc stop asgard2-agent
  timeout /t 5

  echo starting asgard2-agent service
  sc start asgard2-agent
  timeout /t 5

  echo service should be in state RUNNING
  sc query asgard2-agent | findstr STATE

  GOTO commonExit

  :commonExit
  exit

.. hint:: 
  If you are seeing a second asset with the same hostname in your ASGARD, the issue was
  most likely caused by re-installing the agent over an already installed agent. Try to
  avoid running the installer a second time on systems which already have an agent installed.
  You can find information when the installer was being run in the installer log
  ``C:\Windows\System32\asgard2-agent\asgard2-agent-install.log``.

AMC#011: Context Deadline Exceeded
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

AMC#011: Workaround
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

AMC#010: High number of duplicate assets
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

AMC#010: Workaround
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
the :ref:`usage/administration:advanced` Settings in the meantime, to
avoid cleaning up after the changes to the endpoints have been made.

AMC#009: agent-access.log is not being rotated
----------------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - <= 2.14.6
      - >2.14.6

The file ``/var/lib/nextron/asgard2/log/agent-access.log`` is not included
in the logrotate configuration. This could cause a full disk after a certain
period of time, due to the file growing bigger and not being rotated.

AMC#009: Workaround
~~~~~~~~~~~~~~~~~~~

To fix that problem you have to connect via ssh to your ASGARD Management Center
and edit the following file (as root user):

.. code-block:: console 

    user@unix:~$ ssh nextron@asgard

.. code-block:: console

    nextron@asgard:~$ sudoedit /etc/logrotate.d/asgard
    [sudo] password for nextron:

You will see the contents of the asgard logrotate file. The entry on the bottom of
the file will be the one you need to change. Please make sure to only change the
following highlighted line:

.. code-block:: none
    :caption: old agent-access.log location
    :lineno-start: 51
    :linenos:
    :emphasize-lines: 1

    /etc/nextron/asgard2/log/agent-access.log {
        rotate 14
        missingok
        notifempty
        compress
        delaycompress
        maxsize 10G
        daily
        postrotate
            pkill -SIGHUP rsyslogd >/dev/null 2>&1 || true
        endscript
    }

.. code-block:: none
    :caption: new agent-access.log location
    :lineno-start: 51
    :linenos:
    :emphasize-lines: 1

    /var/lib/nextron/asgard2/logs/agent-access.log {
        rotate 14
        missingok
        notifempty
        compress
        delaycompress
        maxsize 10G
        daily
        postrotate
            pkill -SIGHUP rsyslogd >/dev/null 2>&1 || true
        endscript
    }

You can save the file by pressing ``CTRL + O`` (you will be asked what File Name to write to,
you can just press ``Enter`` here). Exit the file by pressing ``CTRL + X``.

Since the logrotate job will run every day at a certain time, the changes will take affect 
with the next run. If you need to rotate the file immediately, run the following command:

.. code-block:: console

    nextron@asgard:~$ sudo logrotate -v /etc/logrotate.d/asgard

You should see in your output something along the lines of the following:

.. code-block:: none

    rotating pattern: /var/lib/nextron/asgard2/log/agent-access.log  after 1 days (14 rotations)
    empty log files are not rotated, log files >= 10737418240 are rotated earlier, old logs are removed
    considering log /var/lib/nextron/asgard2/log/agent-access.log
      Now: 2023-02-13 10:10
      Last rotated at 2023-02-13 10:00
      log does not need rotating (log has been already rotated)

AMC#008: Show Asset Timeline Fails
----------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - <= 2.14.6
      - >2.14.6

After clicking on the asset timeline, the following error appears:

.. code-block:: none

    could not get client stats ID:7 ERROR: no agentlog could be opened

AMC#008: Workaround
~~~~~~~~~~~~~~~~~~~

To fix that problem you have to connect via ssh to your ASGARD Management Center and run the following commands. 

.. code-block:: console 

    user@unix:~$ ssh nextron@asgard

.. code-block:: console

    nextron@asgard:~$ sudo touch /var/lib/nextron/asgard2/log/agent.log
    [sudo] password for nextron: 
    nextron@asgard:~$ sudo chown asgard2: /var/lib/nextron/asgard2/log/agent.log

AMC#007: Sigma Rule Update Fails
--------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Signature Set
      - Fixed Signature Set
    * - 23.1.5-122954
      - 23.1.9-153938 or newer

The signature set released on the 06.01.2023 contains a rule with an author
field which is too long for the database field we use in AMC.

Updating the ruleset results in an error message:

.. code-block:: none

    could not use new blob ERROR: Error 1406: Data too long for column 'author' at row 1

AMC#007: Workaround
~~~~~~~~~~~~~~~~~~~

Search for rule title ``Malicious PowerShell Commandlets``, click on ``Update``,
and deny the problematic update for this single rule by selecting ``Keep current version``.
You can now update the rest of the ruleset using the ``Update All Rules`` button. 

This will disable/skip the current update of the rule. As soon as a new update is
available, the rule will be shown again in the ``Rule Updates`` view.

.. note:: 
    Denying an update for a rule will only deny the current rule update. Any
    future updates to this rule will be available again.

AMC#006: Nested LDAP Groups not working
---------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - 2.0.0
      - Open

Using nested groups in your LDAP/AD will result in no users because the query will fail.

AMC#006: Workaround
~~~~~~~~~~~~~~~~~~~

Change your LDAP GroupFilter to the following:

.. code-block:: none
    
    (&(objectCategory=group)(objectClass=group)(member:1.2.840.113556.1.4.1941:=%s))

AMC#005: Basename Missing Operand after SSH Login
-------------------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - 2.0.0
      - >=2.14.5

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

AMC#004: RPM Packages do not have a compatible architecture
-----------------------------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - 
      - Under investigation

Some Linux systems return this error message when installing
the RPM packages of the ASGARD agents. 

.. code-block:: none

    Depsolve Error occured: \n Problem: conflicting requests\n  - package asgard2-agent-1-1.0.0.amd64 does not have a compatible architecture.

The issue is known and can be ignored. The installation completes successfully regardless of this error message. 

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
need to copy the file to a directory that is accessible by the
``nextron`` user. You also need to change the file permissions.
One possibility to achieve this is to use the following commands:

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

AMC#003: Error on newly installed Management Center
---------------------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - 2.11.11
      - Open

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

AMC#002: Aurora False Positive Filters Cleared After Saving
-----------------------------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - <2.14.5
      - >=2.14.5

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

AMC#001: API Documentation Curl Examples Not Working
----------------------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 50, 50
    
    * - Introduced Version
      - Fixed Version
    * - 2.12.8
      - >=2.13.5

The API documentation is not showing the API key
in example queries as it should and did.

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

