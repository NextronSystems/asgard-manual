.. index:: Asset Management

Asset Management
================

In the ``Assets`` view you can see all the connected ASGARD
agents. New assets will be placed under ``Asset Requests`` and need a
manual approval before being able to connect to your ASGARD (for auto
accept see :ref:`administration/advanced:advanced settings`).

If the ``Duplicate Assets`` view is visible, you should try to remediate
the issues in a timely manner, since this might cause unwanted side
effects on the duplicate hosts.

.. warning::
   Assets in the ``Duplicate Assets`` view indicate that one or more
   agents are running on multiple endpoints. This might be caused by
   cloning a system with an already installed ASGARD Agent. Undesirable
   side effects of duplicate assets are alternating hostnames and tasks
   that fail immediately.

For remediation please see :ref:`troubleshooting/agent-debugging:duplicate assets remediation`

Asset Overview
^^^^^^^^^^^^^^

Management of all endpoints registered with ASGARD can be performed
in Asset Management. The assets will be presented as a table with an
individual ASGARD ID, their IP addresses and host names.

.. figure:: ../images/mc_assets-view.png
   :alt: Asset View

   Asset View

By clicking the control buttons in the Actions column, you can start
a new scan, run a response playbook, open a command line or browse the
remote file system.

.. note::

    * Depending on the user's role, some of the control buttons may be disabled
    * The ``Run Scan`` button might be greyed out in new installations - this is
      because the ASGARD Management Center did not download the THOR packages yet.
      You can either wait for a few minutes, or see the chapter
      :ref:`administration/updates:updates of thor and thor signatures`,
      to trigger a download manually.

Asset Labels
^^^^^^^^^^^^

Labels are used to group assets. These groups can then be used in scans or tasks. 

You can add multiple labels to an asset or a group of assets. This is done by
selecting the particular assets in the left column, typing the label name
(e.g. New_Label) and clicking the blue ``Add Labels`` button. 

.. note::
   Don't use labels with white space characters as it could cause issues in
   syncs with your Analysis Cockpit, exports/imports or other underlying legacy
   functions. 

.. figure:: ../images/mc_add-labels.png
   :alt: Asset Labeling

   Add labels

In order to remove labels, select your assets, click the yellow ``Remove Labels``
button and type the name of the label you want to remove for these assets.

.. figure:: ../images/mc_remove-labels.png
   :alt: Asset Labeling

   Remove labels

The asset management section has extensive filtering capabilities, e.g.
it is easy to select only Linux endpoints that have been online today
and have a particular label assigned. 

Export Asset List 
~~~~~~~~~~~~~~~~~

The Import/Export Section allows you to export your assets to a CSV formatted file. 

Import Labels
~~~~~~~~~~~~~

The import function allows you to add or remove labels on assets based on columns in
the previously generated CSV formatted file. 

The import function processes the values in the columns ``Add Labels ...`` and ``Remove Labels ...``
only. In order to change labels, use the already exported list, add values in these
columns and re-import it by using the ``Apply Labels from CSV`` button.
Separate multiple labels with comma. Leading or ending white space characters
will be stripped from the labels. 

.. figure:: ../images/asset-label-import.png
   :alt: Asset Labeling via CSV

   Asset Labeling via CSV

ASGARD Search Query
^^^^^^^^^^^^^^^^^^^

You can search for Assets in your Management Center with the ``ASGARD Search Query``.
This allows you to write more complex queries to search for assets. Additionally,
this helps you to be more flexible with your scan/response tasks, since you can
just specify a query and not set labels for all assets first. A good example of
this might be if you want to scan a specific subnet every week, and a new
agent is being deployed in this subnet. You don't have to think of all the
labels or troubleshoot why scans are not being deployed. One example you
could achieve this with is the following query:

``system = "linux" and interfaces = "172.16.50.0/24"``

This would run the task on all linux systems in the subnet 172.16.50.0/24.

The following operators are available:

.. csv-table::
     :file: ../csv/asgard-query-operators.csv
     :widths: 30, 70
     :delim: ;
     :header-rows: 1

You can create simple or complex queries this way. You can group/separate queries with brackets:

``(system = "linux" and interfaces = "172.28.30.0/24") or (system = "windows" and interfaces = "172.28.50.0/24")``

``(system = "linux" and interfaces = "172.28.30.0/24" and labels = "my-label") or labels = "robot-test"``

The following keys for the asset query are available:

.. csv-table::
     :file: ../csv/asgard-query-fields.csv
     :widths: 50, 50
     :delim: ;
     :header-rows: 1

.. hint:: 
   You can see which query-name a field has by enabling the column in your asset view
   and clicking into the query text field:

   .. figure:: ../images/asgard_asset_query_fieldnames.png

The ASGARD Search Query is the preferred tool to manage scans and assets.
If you are using the Analysis Cockpit and need to labels, you can still use
them.

Asset Migration
^^^^^^^^^^^^^^^

.. hint::
   You have to enable the option ``Show Response Control Advanced Tasks``
   in the ``Settings`` > ``Advanced`` section of your ASGARD Management
   Center to allow Asset Migration.

You can move an asset from one Management Center to another via the Maintenance
Module of the Response Control. To do this, navigate to ``Assets`` and select the
assets you want to migrate. Alternatively you can navigate to ``Response Control``
and add a new task. You can now click the ``Add Task`` button to open the Task Menu.
Choose the ``Maintenance`` module and then the ``Move asset to another ASGARD`` Type.
You have to upload an agent installer from the ASGARD you want to migrate the asset to.

.. figure:: ../images/mc_migrate-asset.png
   :alt: Management Center Move Asset

.. note::
   The target OS or Arch of the installer doesn't matter, we will only use the installers
   configuration data for the migration.

The task will fail if the migrated asset is unable to communicate with the new Management
Center. In this case, the asset will remain on the Management Center which issued the
migration task. Only the asset will be migrated (it shows up as a brand new asset on
your new Management Center), no scan or response tasks and also no logs will be migrated.

Delete Assets
^^^^^^^^^^^^^

Deleting assets will remove the assets from the ``Active Only`` asset view and will
invalidate the authentication for those assets.

To delete an asset, go to the ``Assets`` View and mark the assets you want
to delete. Click the ``Delete Assets`` Button on the top right corner. Confirm that
you want to delete the assets.

To see all the deleted assets, change your view from ``Active Only`` to ``Deleted Only``.

.. warning::
   Deleted assets can no longer communicate with the ASGARD. Please use with caution.
   This cannot be undone, you have to manually fix the asset.

.. figure:: ../images/mc_deleted-only.png
   :alt: Deleted Assets

   Deleted Assets View