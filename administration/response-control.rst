.. index:: Response Control

Response Control
================

The Response Control is used to execute tasks on your agents. Those
tasks can be:

* Run Playbook (pre-defined or custom)
* Run Interrogate (collect system information)
* Open Remote Console
* Maintenance

  - Upgrade Agent
  - Upgrade Service Controller
  - Configure the asset's proxy
  - Move asset to another ASGARD

Opening a Remote Console on an endpoint
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In order to open a remote console on an endpoint, open the Asset
Management section and click the "command line" button in the Actions column.

.. figure:: ../images/mc_remote-console.png
   :alt: Opening a Remote Console from the Asset View

   Opening a Remote Console from the Asset View

Depending on your configuration it may take between 10 seconds and 10
minutes for the remote console to open. Please note that all actions
within the remote console are recorded and can be audited. All consoles
open with root or system privileges.

.. figure:: ../images/mc_open-remote-console.png
   :alt: Remote Shell

   Remote Shell

In order to replay a remote console session, navigate to ``Response Control``,
expand the task that represents your session, select the ``Console Log`` tab
and click the play button in the bottom row.

.. figure:: ../images/replay-remote-shell-session.png
   :alt: Replay Remote Shell Session

   Replay Remote Shell Session

ASGARD users can only see their own remote console session. Only users with
the ``RemoteConsoleProtocol`` permission are able to replay all sessions from all users.

Response Control with Pre-Defined Playbooks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In addition to controlling THOR scans, ASGARD Management Center contains
extensive response functions. Through ASGARD, you can start or stop processes,
modify and delete files or registry entries, quarantine endpoints, collect
triage packages and execute literally any command on connected systems.
All with one click and executed on one endpoint or groups of endpoints.

It is also possible to download specific suspicious files. You can transfer
a suspicious file to the ASGARD Management Center and analyze it in a Sandbox. 


.. figure:: ../images/built-in-playbooks.png
   :alt: Built-in Playbooks

   Built-in Playbooks

To execute a predefined response action on a single endpoint, navigate
to the Asset Management view and click the "play" button in the Actions
Column. This will lead you to a dialogue where you can select the desired action. 

.. figure:: ../images/execute-playbook-on-single-endpoint.png
   :alt: Execute Playbook on Single Endpoint

   Execute Playbook on Single Endpoint

In this example, we collect a full triage package.

ASGARD ships with pre-defined playbooks for the following tasks:

* Collect ASGARD Agent Log
* Create and Collect Aurora Agent Diagnostics Pack (Windows only)
* Collect full triage pack (Windows only)
* Isolate endpoint (Windows only)
* Collect system memory
* Collect file / directory
* Collect directory
* Collect Aurora diagnostics pack
* Execute command and collect stdout and stderr

Nextron provides additional playbooks via ASGARD updates.

.. warning::
    The collection of memory can set the systems under high load and
    impacts the systems response times during the transmission of
    collected files. Consider all settings carefully! Also be aware
    that memory dumps may fail due to kernel incompatibilities or
    conflicting security mechanisms. Memory dumps have been successfully
    tested on all supported Windows operating systems with various patch
    levels. The memory collection on Linux systems depends on kernel
    settings and loaded modules, thus we cannot guarantee a successful
    collection. Additionally, memory dumps require temporary free
    disk space on the system drive and consume a significant amount
    of disk space  on ASGARD as well. The ASGARD agent checks if there
    is enough memory on the  system drive and adds a 50% safety buffer.
    If there is not enough free disk  space, the memory dump will fail.  

Response Control for Groups of Systems
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Response functions for groups of systems can be defined in the ``Group Tasks``
tab or the ``New Scheduled Group Task`` tab.

.. figure:: ../images/execute-playbook-on-group-of-endpoints.png
   :alt: Execute Playbook on Group of Endpoints

   Execute Playbook on Group of Endpoints

Response Control with Custom Playbooks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can add your own custom playbook by clicking the ``Add Playbook`` button in the 
``Response Control`` > ``Playbooks`` tab. 

.. figure:: ../images/add-custom-playbook.png
   :alt: Add Custom Playbook

   Add Custom Playbook

This lets you define a name and a description for your playbook. After clicking
the ``Add Playbook`` button, click on the ``Edit steps of this playbook`` action. 

.. figure:: ../images/custom-playbook-edit-steps.png
   :alt: Playbook Action Items

   Playbook Action Items

This opens the side pane in which single playbook steps
can be added using the ``Add Step`` button.


.. figure:: ../images/add-playbook-entry.png
   :alt: Add Playbook Entry

   Add Playbook Entry

If you need custom files for your playbook (scripts, configurations, binaries, etc.)
you can select local files to be uploaded to ASGARD during the creation of the playbook
step (by selecting "Upload New File" in the file drop-down). You can manage these
files at ``Response Control`` > ``Playbook Files`` and upload or update files using
the ``Upload Playbook File`` button.

.. figure:: ../images/playbook-files.png
   :alt: Manage Playbook Files

   Manage Playbook Files

You can have up to 16 steps in each playbook that are executed sequentially. Every
step can be either "download something from ASGARD to the endpoint", "execute a
command line" or "upload something from the endpoint to ASGARD". If you run a
command line the stdout and stderr are reported back to ASGARD.

Change the Asset(s) Proxy
^^^^^^^^^^^^^^^^^^^^^^^^^

You can change the Proxy Settings on your Assets via the Response Control.
To do this, select the asset(s) and click ``Add Task`` in the top right corner.
Next, set the Module to ``Maintenance`` and the Maintenance Type to
``Configure the asset's proxy``. You can now set your proxy. Multiple proxies
can be set, though only one FQDN/IP-Address per field can be set.

.. figure:: ../images/response-control-proxy.png
   :alt: Change/Set an assets Proxy

   Change/Set an assets Proxy