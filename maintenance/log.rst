.. index:: Log Rotation and Retention

Log Rotation and Retention
==========================

ASGARD is rotating logs automatically at a set time interval. It is
important to keep in mind how long logs will be stored on the system
before they get purged. All logs will be rotated and zipped into one
file monthly, for up to 14 months.

To get a better understanding of how the log rotation is handled,
you can inspect ``/etc/logrotate.d/asgard-management-center``.

Syslog Logs
~~~~~~~~~~~

ASGARD will store all logs under ``/var/lib/asgard-management-center/log``.
This does not include the Scan Logs, as those are handled separately.

If you require a longer retention period, please copy the oldest log
packages to another directory or to a dedicated log server. Do not
modify the built-in rotation settings as this might interfere with ASGARD updates!

.. list-table::
   :header-rows: 1
   :widths: 70, 30

   * - Log
     - Name
   * - Audit
     - asgard-audit.log
   * - ASGARD Management Center
     - asgard.log
   * - ASGARD Agent and Service Controller
     - agent.log
   * - ASGARD Agent Access
     - agent-access.log
   * - THOR via Syslog
     - scan.log
   * - THOR via Syslog (Scan Start, Licensing, Completion only)
     - subscan.log
   * - Aurora
     - aurora-service.log

If you want to forward those logs automatically to a dedicated server,
you can set up :ref:`administration/additional:rsyslog forwarding`. Forwarded
logs will still reside on ASGARD.