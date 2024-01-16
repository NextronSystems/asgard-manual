.. index:: Backup and Restore

Backup and Restore
==================

All of our ASGARD servers come with predefined backup and restore scripts.
You can use them to keep a backup available in case something stops working.

.. warning::
   If you are using a Management Center and Analysis Cockpit together, it
   is advised to create the backups at the same time. This avoids
   potential data inconsistencies across the two platforms. You can
   do this via a cronjob on both systems or with an automation tool like
   Ansible, Terraform, etc.

   The same should be kept in mind when restoring your backups. You should
   always restore the backups on all servers, to avoid getting problems
   in the future.

Backup
^^^^^^

The command ``asgard2-backup`` can be used to generate a backup of
all configurations, assets, tags, user accounts, tasks etc., except:

* Log files (ASGARD, THOR)
* Playbook results (collected evidence)
* Quarantined samples (Bifrost)

.. code-block:: console 

   nextron@asgard:~$ sudo asgard2-backup
   Writing backup to '/var/lib/nextron/asgard2/backups/20200427-1553.tar'
   tar: Removing leading '/' from member names
   tar: Removing leading '/' from hard link targets
   Removing old backups (keeping the 5 most recent files)...
   done.

If you want to transfer the backup to a different system, make sure to copy the
``.tar`` file to the home directory of the ``nextron`` user and change the permissions:

.. code-block:: console

   nextron@asgard:~$ sudo cp /var/lib/nextron/asgard2/backups/20200427-1553.tar /home/nextron
   nextron@asgard:~$ sudo chown nextron:nextron /home/nextron/20200427-1553.tar
   nextron@asgard:~$ ls -l
   total 596496
   -rw-r--r-- 1 nextron nextron 309217280 Nov  1 12:01 20200427-1553.tar

After this is done, you can use ``scp`` or any other available tool to
transfer the backup file to a different system.

.. hint::
   Our recommendation is to run the backup as a cronjob during a time, when
   no tasks are running or are scheduled to run. The reason for this is that
   our sample script will stop the ASGARD service before the backup to avoid any
   inconsistency with the data.

Here is an example script and cronjob entry to create backups on a schedule:

.. literalinclude:: ../scripts/backup.sh
   :language: bash
   :linenos:
   :caption: Example backup script, e.g. ``/root/backup.sh``

The following crontab entry could be created to run the script every day at 2am.
You can edit the crontab of the root user with the following commands:

.. code-block:: console

   nextron@asgard:~$ sudo su
   [sudo] password for nextron:
   root@asgard:~# crontab -e

.. code-block:: none

   0 2 * * * /bin/bash /root/backup.sh >> /root/backup.log

.. warning::
   Please keep in mind that the ``asgard2-backup`` script is only keeping **5**
   backups in place. If you want to change this, you have to change the value
   ``GENERATIONS`` in the file ``/usr/sbin/asgard2-backup`` to a different value.

Restore
^^^^^^^

You can use the ``asgard2-restore`` command to restore a backup.

.. code-block:: console

   nextron@asgard:~$ sudo asgard2-restore
   Usage: /usr/sbin/asgard2-restore <BACKUP FILE>
   nextron@asgard:~$ sudo asgard2-restore /var/lib/nextron/asgard2/backups/20200427-1553.tar
   Stopping services... Removed /etc/systemd/system/multi-user.target.wants/asgard2.service.
   done.
   etc/nextron/asgard2/
   etc/nextron/asgard2/upgrade2.sh
   etc/nextron/asgard2/run_asgard2.sh
   etc/nextron/asgard2/server.pem
   etc/nextron/asgard2/ca2.key
   etc/nextron/asgard2/pre_asgard2.sh
   etc/nextron/asgard2/rsyslog-asgard-audit.conf
   etc/nextron/asgard2/client.yaml
   ...
   1+0 records in
   1+0 records out
   24 bytes copied, 3.2337e-05 s, 742 kB/s
   Starting services... Created symlink /etc/systemd/system/multi-user.target.wants/asgard2.service → lib/systemd/system/asgard2.service. done.

.. note::
   The version of the ASGARD were the backup will be restored should
   be the same as the version which was present while the backup was
   created. If you need an older version of ASGARD, please contact our
   support team.