.. index:: Agent Debugging

Agent Debugging
===============

This chapter contains debugging information for our ASGARD Agent.

SLES 11 Installation
~~~~~~~~~~~~~~~~~~~~

On older SLES (SUSE Linux Enterprise Server) versions, the installation
of the ASGARD Agent might fail with the following error:

.. code-block:: none

   error: Failed dependencies:
        rpmlib(FileDigests) <= 4.6.0-1 is needed by asgard2-agent-1-1.6.5.x86_64

To circumvent this error savely, you can just add the ``--nodeps`` flag to install
the package:

.. code-block:: console

   user@sles11:~$ sudo rpm -ivh --nodeps asgard2-agent-linux-amd64.rpm                 
      Preparing...                ########################################### [100%]
         1:asgard2-agent          ########################################### [100%]
   user@sles11:~$ 

Aurora Diagnostics Pack
~~~~~~~~~~~~~~~~~~~~~~~

If Aurora does not behave like it should, e.g. using more resources
than you expected, you can create a diagnostics pack for our support
to help in troubleshooting the issue. This can be conveniently done
using the playbook ``[Default] Create and Collect Aurora Agent Diagnostics Pack (Windows)``.

It can be run from ``Asset Management`` > ``Response Action`` (Play button)
or from ``Response Control`` > ``Tasks`` > ``Add Task`` or if needed
as a group task. The resulting ``diagnostics.zip`` can be downloaded
from the third step in the ``Playbook Result`` tab of the expanded task.

Duplicate Assets Remediation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``Duplicate Assets`` view in your Management Center lists
assets, which appear to be active on multiple endpoints at
the same time, often due to system cloning. This can cause
issues like a changing hostname and failing tasks. Deleting
these duplicate assets will allow each endpoint to reconnect
as a new asset with its own authentication, resolving these
problems.

.. figure:: ../images/mc_duplicate_assets.png
   :alt: Troubleshooting Duplicate Assets

   Troubleshooting Duplicate Assets

To fix the issue, follow the instructions in your Management Center.

.. important::
   Endpoints will reconnect as new assets. Previous scan history
   will remain attached to the **old/deleted** asset, so the new
   endpoints will appear without history.