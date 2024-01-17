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
Master ASGARD and Cockpit are shown with a graph that shows
asset connections and asset streams.

.. note::
   The THOR version numbers may be missing in a new installation.
   THOR is not included in the installed packages. THOR is downloaded
   automatically after the installation and should show up not
   later than one hour after installation.

.. figure:: ../images/mc_overview-1.png
   :alt: Overview Top Half

   Overview Top Half

.. figure:: ../images/mc_overview-2.png
   :alt: Overview Bottom Half

   Overview Bottom Half

Diagnostics
^^^^^^^^^^^

The diagnostics sub menu shows the periodically performed checks
and their status. Clicking the magnifying glass icon shows details
of the performed check. If a check failed it gives a detailed error
message and hints on which steps typically help in resolving the issue.

.. figure:: ../images/mc_diagnostics.png
   :alt: Overview Over Periodic Diagnostic Checks

   Overview Over Periodic Diagnostic Checks

The indicator on the top right always shows if any of those checks
failed by showing a warning or error (i.e. yellow or red light). You
can click the icon to view the diagnostics page as a pop-up.

Logs
^^^^

The logs section shows the latest and most relevant logs.
Complete logs can be found at ``/var/lib/nextron/asgard2/log``.
You can also download the selected log type directly.

.. figure:: ../images/mc_logs-section.png
   :alt: Logs Section

   Logs Section

Available logs and their content:

.. list-table::
   :header-rows: 1
   :widths: 40,60

   * - Log Type
     - Explanation
   * - ASGARD Management Center
     - Overall status of the Management Center, general errors and warnings
   * - Audit
     - Containing user login/logout and changes done over the UI
   * - ASGARD Agent and Service Controller
     - Status of the agents deployed on assets
   * - ASGARD Agent and Service Controller Access Log
     - Logs of agents and service controllers communicating with the Management Center
   * - THOR via Syslog
     - Received syslog events of THOR scans. Partial results if a scan did not complete
   * - THOR via Syslog (Scan Start, Licensing, Completion only)
     - As the name suggest, only those three event types
   * - Aurora
     - All Aurora events
   * - Aurora Event Producers
     - The top 10 event producing processes per endpoint
   * - Aurora Response Actions
     - Only response action events of Aurora
   * - Aurora Simulated Response Actions
     - Only simulated response action events of Aurora
   * - Diagnostic Pack
     - Button for generating and downloading a diagnostic pack that may be asked for by support