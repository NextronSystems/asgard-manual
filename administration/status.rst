.. index:: System Status

System Status
=============

Status Overview
^^^^^^^^^^^^^^^

The initial system status page provides a summary of the
most important system components. 

It also includes the current resource consumption (disk,
CPU and memory) and lists the currently installed ASGARD
software version along with available versions of THOR.
Additionally, the connection status to the update servers,
MASTER ASGARD and Cockpit are shown with a graph that shows
asset connections and asset streams.

.. note::
   The THOR version numbers may be missing in a new installation.
   THOR is not included in the installed packages. THOR is downloaded
   automatically after the installation and should show up not
   later than one hour after installation. 

.. figure:: ../images/overview1.png
   :alt: Overview Top Half

   Overview Top Half

.. figure:: ../images/overview2.png
   :alt: Overview Bottom Half

   Overview Bottom Half

Diagnostics
^^^^^^^^^^^

The diagnostics sub menu shows the periodically performed checks
and their status. Clicking the magnifying glass icon shows details
of the performed check. If a check failed it gives a detailed error
message and hints on which steps typically help in resolving the issue.

.. figure:: ../images/diagnostics.png
   :alt: Overview Over Periodic Diagnostic Checks

   Overview Over Periodic Diagnostic Checks

The traffic light on the left menu always shows if any of those checks
failed by showing a warning or error (i.e. yellow or red light) and
you can click the status to view the diagnostics page as a pop-up.

Logs
^^^^

The logs section shows the latest and most relevant logs.
Complete logs can be found at ``/var/lib/nextron/asgard2/log``.

.. figure:: ../images/logs-section.png
   :alt: Logs Section

   Logs Section

Available logs and their content:

- Audit: Containing user login/-off, changes done over the UI.
- ASGARD Management Center: Overall status of the MC, general errors and warnings.
- ASGARD Agent and Service Controller: Status of the agents deployed on assets.
- THOR via Syslog: Received syslog events of THOR scans. Partial results if a scan did not complete.
- Aurora: All Aurora events:
- Aurora Event Producers: The top 10 of event producing processes per endpoint.
- Aurora Response Actions: Only response action events of Aurora:
- Aurora Simulated Response Actions: Only simulated response action events of Aurora.
- LogWatcher: All LogWatcher events.
- Diagnostic Pack: Button for generating and downloading a diagnostic pack that may be asked for by support.