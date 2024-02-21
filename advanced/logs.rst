.. index:: Managing Logs

Managing Logs
=============

ASGARD will store all logs under ``/var/lib/asgard-management-center/log``

All logs in this directory will be rotated and automatically cleared
after 14 months, please see :ref:`maintenance/log:log rotation and retention` for more information.

Please copy the oldest log packages to another directory or to a dedicated
log server in case you require longer retention periods.
**Do not modify the built-in rotation settings** as this might
interfere with ASGARD updates!

.. list-table::
   :header-rows: 1
   :widths: 50, 25, 25

   * - Log
     - Name
     - Rsyslog
   * - Audit
     - asgard-audit.log
     - Audit Log [1]_
   * - ASGARD Management Center
     - asgard.log
     - ASGARD Log [1]_
   * - ASGARD Agent and Service Controller
     - agent.log
     - Agent Log [1]_
   * - ASGARD Agent Access
     - agent-access.log
     - 
   * - THOR via Syslog
     - scan.log
     - THOR Log [1]_
   * - THOR via Syslog (Scan Start, Licensing, Completion only)
     - subscan.log
     - THOR Log [1]_
   * - Aurora
     - aurora-service.log
     - 

.. [1] This is the **Type** you can select in :ref:`administration/additional:rsyslog forwarding`.

The logs will always be stored here, even if you have :ref:`administration/additional:rsyslog forwarding` activated.

Scan Logs
^^^^^^^^^

ASGARD will store all scan logs under ``/var/lib/asgard-management-center/scan-results``

All Scans will generate two files, ``thor-<ID>.txt.gz`` and ``thor-report-<ID>.html.gz``.
The first file will be the raw THOR Scan Log(s) and the second file will be
the HTML Report(s). The numeric value in the file name is the Scan-ID, which
can be found in the the Scan Control view. Please make sure to enable the ``ID``
column, since it is not enabled in the default view.

For Scans which were started with the ``--json`` flag, log files are
additionally placed in the scan-results directory and are named ``thor-<ID>.json.gz``.
Please keep in mind, those JSON log files are not being transferred to
any connected Analysis Cockpit.