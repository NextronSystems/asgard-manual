.. index:: Managing Logs

Managing Logs
=============

There are two different types of logs which we will explain
further in this chapter. The first log type are :ref:`maintenance/logs:system logs`,
or rather logs which are independently stored on the system, meaning
they are not linked back to any scan results.

The second type of logs are your THOR :ref:`maintenance/logs:scan logs`,
which are collected via the agent whenever you issue a scan.
Those scan logs are linked to your (group) scans and should
not be deleted, unless you need to :ref:`maintenance/disk:regain disk space`.

System Logs
-----------

The Management Center will store all system logs under ``/var/log/asgard-management-center/log``

Below you can find a list of logs and where they originate from:

.. csv-table::
   :file: ../csv/asgard-logs.csv
   :widths: 22 42 37
   :delim: ;
   :header-rows: 1

.. [1] Only if ``--syslog %asgard-host%`` is using during scanning.
       This can be **optionally** used if you want to receive THOR
       Logs in real-time.

.. note::
   Some of the above logs can be forwarded via syslog. Please see
   :ref:`administration/syslog:syslog forwarding` for a full list
   of log types which can be forwarded via syslog.

Log Rotation and Retention
~~~~~~~~~~~~~~~~~~~~~~~~~~

The system logs get automatically rotated at a set time interval. It is
important to keep in mind how long logs will be stored on the system
before they get purged. All logs will be rotated and zipped into one
file monthly, for up to 14 months.

To get a better understanding of how the log rotation is handled,
you can inspect ``/etc/logrotate.d/asgard-management-center``.

If you want to keep logs for longer, we recommend to transfer the
logs to another system once they have been archived/zipped.

Do not change any logrotate configuration manually, as this will be overwritten
with every update.

Scan Logs
---------

Your Management Center will store all scan logs under ``/var/lib/asgard-management-center/scan-results``

All Scans will generate two files, ``thor-<ID>.txt.gz`` and ``thor-report-<ID>.html.gz``.
The first file will be the raw THOR Scan Log(s) and the second file will be
the HTML Report(s). The numeric value in the file name is the Scan-ID, which
can be found in the the Scan Control view. Please make sure to enable the ``ID``
column, since it is not enabled in the default view.

For Scans which were started with the ``--json`` flag, log files are
additionally placed in the scan-results directory and are named ``thor-<ID>.json.gz``.
Please keep in mind, those JSON log files are not being transferred to
any connected Analysis Cockpit.