Maintenance
===========

Log Rotation and Retention
--------------------------

ASGARD is rotating logs automatically at a set time interval. It is
important to keep in mind how long logs will be stored on the system
before they get purged. All logs will be rotated and zipped into one
file monthly, for up to 14 months.

To get a better understanding of how the log rotation is handled,
you can inspect ``/etc/logrotate.d/asgard``.

Syslog Logs
~~~~~~~~~~~

ASGARD will store all logs under ``/var/lib/nextron/asgard2/log/``.
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
   * - Agent Agent and Service Controller
     - agent.log
   * - THOR via Syslog
     - scan.log
   * - THOR via Syslog (Scan Start, Licensing, Completion only)
     - subscan.log

If you want to forward those logs automatically to a dedicated server,
you can set up :ref:`usage/administration:Rsyslog Forwarding`. Forwarded
logs will still reside on ASGARD.

Regain Disk Space
-----------------

If your disk usage is growing too fast and free disk space is running
out, you have several options:

1. Increase the size of your disk
2. Delete files that are not needed for operation (i.e. safe to delete)
3. Delete files that are used by MC but might be unneeded / dated



Safe-to-Delete Files
~~~~~~~~~~~~~~~~~~~~

The following files are safe to delete. They are not needed for ASGARD to operate.

- ``/var/lib/nextron/asgard2/log/*.gz``

They are only kept on the system if needed for further processing.
E.g. saving/sending the log files to another system. If you do not
need or plan to use those, they can be deleted. If you are unsure
make a copy to another system before deleting them.

- ``/var/lib/nextron/asgard2/downloads/*`` (except current day)

The files in this folder are only generated for temporary downloading
files from the UI and are not needed after the download has finished.
The directory has a sub structure of ``year/month/day``. It is save to
delete any files older than the current day.

Potentially Unneeded / Dated Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Bifrost quarantined files

If you use Bifrost, the collected files are not deleted by default.
If dated files are no longer needed, you can define a retention
period at ``Settings`` > ``Bifrost``.

- ``/var/lib/nextron/asgard2/scan-results/*.gz``
- ``/var/lib/nextron/asgard2/generic-results/*``
- ``/var/lib/nextron/asgard2/remote-console/protocol/*``

The listed files are the results of THOR scans (scan-results), Tasks
except Scans (generic-results) and the sessions of remote consoles (remote-console).
They are not needed for ASGARD to function, but the data is viewed and
available for download in ASGARD. This means deleting these files will
not break ASGARD, but you lose the information provided by the files.
If you need the disk space and cannot increase the disk, we suggest to
delete these files older than a given date, that you no longer need.
This can be done with a find-remove combination using the command line:

.. code-block:: console

   root@asgard:~# find /var/lib/nextron/asgard2/<directory> -mtime +<days> -print0 | xargs -0 -r rm

Where ``<directory>`` is one of ``scan-results/*.gz``, ``generic-results/*`` or ``remote-console/protocol/*``
and ``<days>`` the number of days you want to keep. Files and folders older than ``<days>`` days will be deleted.
