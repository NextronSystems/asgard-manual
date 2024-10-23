.. index:: Backup and Restore

Backup and Restore (deprecated)
===============================

.. warning::
   This section of the manual is deprecated and will be removed in a future release.
   Please use the :ref:`maintenance/backup-restore:backup & restore` section.

All of our ASGARD servers come with predefined backup and restore scripts.
You can use them to keep a backup available in case something stops working.

.. hint::
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

We create a script which can be used to generate a backup of
all configurations, assets, tags, user accounts, tasks etc., except:

* Log files (ASGARD, THOR)
* Playbook results (collected evidence)
* Quarantined samples (Bifrost)

.. code-block:: console 

   nextron@asgard:~$ sudo /usr/share/asgard-management-center/scripts/backup.sh 
   Writing backup to '/var/lib/asgard-management-center/backups/20240209-1110.tar'
   tar: Removing leading `/' from member names
   tar: Removing leading `/' from hard link targets
   Removing old backups (keeping the 5 most recent files)... 
   done.

If you want to transfer the backup to a different system, make sure to copy the
``.tar`` file to the home directory of the ``nextron`` user and change the permissions:

.. code-block:: console

   nextron@asgard:~$ sudo cp /var/lib/asgard-management-center/backups/20240209-1110.tar /home/nextron
   nextron@asgard:~$ sudo chown nextron:nextron /home/nextron/20240209-1110.tar
   nextron@asgard:~$ ls -l
   total 205560
   -rw-r--r-- 1 nextron nextron 210493440 Feb  9 11:17 20240209-1110.tar

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
   Please keep in mind that the ``backup.sh`` script is only keeping **5**
   backups in place. If you want to change this, you have to change the value
   ``GENERATIONS`` in the file ``/usr/share/asgard-management-center/scripts/backup.sh``
   to a different value.

Restore
^^^^^^^

You can use the ``restore.sh`` script to restore a backup.

.. code-block:: console

   nextron@asgard:~$ sudo /usr/share/asgard-management-center/scripts/restore.sh
   Usage: /usr/share/asgard-management-center/scripts/restore.sh <BACKUPFILE>
   nextron@asgard:~$ sudo /usr/share/asgard-management-center/scripts/restore.sh /var/lib/asgard-management-center/backups/20240209-1110.tar
   Stopping services... Removed "/etc/systemd/system/multi-user.target.wants/asgard-management-center.service".                                                                                                      
   done.                                                                                                                                                                                                             
   etc/asgard-management-center/                                                                                                                                                                                     
   etc/asgard-management-center/broker.conf                                                                                                                                                                          
   etc/asgard-management-center/server_cert_ext.cnf.in                                                                                                                                                               
   etc/asgard-management-center/rsyslog-thor.conf.20240208142245.bak
   ...
   1+0 records in
   1+0 records out
   24 bytes copied, 0.000126177 s, 190 kB/s
   Starting services... Created symlink /etc/systemd/system/multi-user.target.wants/asgard-management-center.service → /lib/systemd/system/asgard-management-center.service.
   done.

.. note::
   The version of the ASGARD were the backup will be restored should
   be the same as the version which was present while the backup was
   created. If you need an older version of ASGARD, please contact our
   support team.