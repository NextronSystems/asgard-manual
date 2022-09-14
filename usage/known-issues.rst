Known Issues
=============

AMC#001: API Documentation Curl Examples Not Working
----------------------------------------------------

Since ASGARD 2.12.8 the API documentation is not showing the API key in example queries as it should and did.

..
    Source of Issue
    ~~~~~~~~~~~~~~~
    add after source is known

Workaround
~~~~~~~~~~
You need to manually add ``-H 'Authorization: <your-API-key>'`` to your queries.

Example with API endpoint ``/playbooks/search``:

    Non-working curl example:

    .. code::

       curl -X 'GET' \
         'https://asgard.local:8443/api/v1/playbooks/search?limit=1' \
         -H 'accept: application/json'


    Working curl example:

    .. code::

       curl -X 'GET' \
         'https://asgard.local:8443/api/v1/playbooks/search?limit=1' \
         -H 'accept: application/json' \
         -H 'Authorization: <your-API-key>'

You also need the ``--insecure`` curl flag, if you are using the self-signed certificate that ASGARD shipped with.

Status
~~~~~~
Resolved in ASGARD 2.13.5+

AMC#002: Aurora False Positive Filters Cleared After Saving
-----------------------------------------------------------
If the global Aurora false positive filter at ``Service Control`` > ``Aurora`` > ``False Positive Filters``
is used, the text box is empty/cleared after saving and refreshing the page.

Workaround
~~~~~~~~~~
If the false positive tuning you want to achieve is only affecting one rule, the best place to
tune it is a single rule false positive tuning at ``Service Control`` > ``Sigma`` > ``Rules`` and choosing
the "Edit false positives filters of this rule" action.

If you need global false positive filter, you can edit the file ``/var/lib/nextron/asgard2/products/aurora-config/false-positives.cfg``
directly via the ASGARD command line. In order for the changes to take effect it is important
**NOT** to click the ``Service Control`` > ``Aurora`` > ``False Positive Filters`` > ``Save`` button.

Instead go to ``Service Control`` > ``Aurora`` > ``Configurations`` and edit the configuration of the assets that need the false positive
filter. To do so just open the configuration using the edit action and saving without any modifications using the "Save Configuration and Restart Aurora Agents" button. This will use the false positive filter defined in the file via CLI and restarts the assets to use the new configuration.

Status
~~~~~~
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

Workaround
~~~~~~~~~~
Make sure ASGARD is able to access our update servers (see ``System Status``: Connectivity Test or ``System Status`` > ``Diagnostics``
and that you have imported a valid license (see ``Licensing``).

You can either wait for ASGARD to download the THOR packages automatically (check at ``Updates`` > ``THOR and Signatures``) or
initiate a download of THOR packages and signatures manually by clicking the "Manually Check for Updates" button at ``Updates`` > ``THOR and Signatures``.

Status
~~~~~~
Open.

AMC#004: RPM Packages do not have a compatible architecture
-----------------------------------------------------------

Some Linux systems return this error message when installing the RPM packages of the ASGARD agents. 

.. code-block:: none

    Depsolve Error occured: \n Problem: conflicting requests\n  - package asgard2-agent-1-1.0.0.amd64 does not have a compatible architecture.

The issue is known and can be ignored. The installation completes successfull regardless of this error message. 

Workaround
~~~~~~~~~~
No workaround required. Regardless of the message the package installation completes successfully. You can try using ``rpm -i`` instead of yum to avoid the message.

Status
~~~~~~

Under investigation. We are planning to provide fixes but have to test if the fix would cause problems with older installations. (upgrades, legacy issues)

AMC#005: Basename Missing Operand after SSH Login
-------------------------------------------------

After logging into ASGARD Management Center via SSH right after installing the base system, the following message can appear: 

.. code-block:: none

    basename: missing operand
    Try 'basename --help' for more information

It is caused by a unhandled condition in the MOTD (message of the day) script that evaluates the version of the scanners and signatures. After installing ASGARD it takes some minutes to retrieve and install all scanners from the update servers.

The issue is known and can be ignored.

Workaround
~~~~~~~~~~
No workaround required. The issue solves itself after the download of the scanner and signature packages. 

Status
~~~~~~

Fixed in next ASGARD version. 
