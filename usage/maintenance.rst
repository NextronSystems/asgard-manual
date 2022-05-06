Maintenance
===========

Regain Disk Space
-----------------

If your disk usage is growing too fast and free disk space is running out, you have several options:

1. Increase the size of your disk
2. Delete files that are not needed for operation (i.e. safe to delete)
3. Delete files that are used by MC but might be unneeded / dated



Safe-to-Delete Files
~~~~~~~~~~~~~~~~~~~~

The following files are safe to delete. They are not needed for ASGARD to operate.

- ``/var/lib/nextron/asgard2/log/*.gz``

They are only kept on the system if needed for further processing. E.g. saving/sending the log files to another system. If you do not need or plan to use those, they can be deleted. If you are unsure make a copy to another system before deleting them.

- ``/var/lib/nextron/asgard2/downloads/*`` (except current day)

The files in this folder are only generated for temporary downloading files from the UI and are not needed after the download has finished. The directory has a sub structure of ``year/month/day``. It is save to delete any files older than the current day.

Potentially Unneeded / Dated Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


- Bifrost quarantined files

If you use Bifrost, the collected files are not deleted by default. If dated files are no longer needed, you can define a retention period at ``Settings`` > ``Bifrost``.

- ``/var/lib/nextron/asgard2/scan-results/*.gz``
- ``/var/lib/nextron/asgard2/generic-results/*``
- ``/var/lib/nextron/asgard2/remote-console/protocol/*``

The listed files are the results of THOR scans (scan-results), Tasks except Scans (generic-results) and the sessions of remote consoles (remote-console).
They are not needed for ASGARD to function, but the data is viewed and available for download in ASGARD. This means deleting these files will not break ASGARD, but you lose the information provided by the files. If you need the disk space and cannot increase the disk, we suggest to delete these files older than a given date, that you no longer need. This can be done with a find-remove combination using the command line:

.. code-block:: none

   find /var/lib/nextron/asgard2/<directory> -mtime +<days> -print0 | xargs -0 -r rm

Where ``<directory>`` is one of ``scan-results/*.gz``, ``generic-results/*`` or ``remote-console/protocol/*`` and ``<days>`` the number of days you want to keep. Files and folders older than ``<days>`` days will be deleted.

Regenerate the Self-Signed Certificate
--------------------------------------

ASGARD ships with a self-signed certificate for its web interface that expires after 182 days. If you do not use your own CA infrastructure and want to renew the certificate or want to revert from a broken state, you can recreate a self-signed certificate. To do so log in using SSH and execute:

.. code:: bash

   sudo openssl req -new -newkey rsa:4096 -days 182 -nodes -x509 -subj "/O=Nextron Systems GmbH/CN=$(hostname --fqdn)" -keyout /etc/nextron/asgard2/server.key -out /etc/nextron/asgard2/server.pem

You need to restart ASGARD in order for the changes to take effect.

.. code:: bash

   sudo systemctl restart asgard2.service

