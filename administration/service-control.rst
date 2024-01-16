.. index:: Service Control

Service Control
===============

Service Control is ASGARD's way of deploying real-time services on endpoints.
Currently there exist the Aurora and the LogWatcher service. To use any of those
two, the service controller has to be installed on an asset.

Service Controller Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To install asgard2-service-controller on an asset you need to install the asgard2-agent
first. If you already have installed asgard2-agent on an asset and accepted it in ASGARD,
you can use the **"Install ASGARD Service Controller"** playbook to deploy the service
controller on an asset or you can manually download and execute the asgard2-service-controller
installer from the ASGARD downloads page.

.. figure:: ../images/sc-install.png
   :alt: Install Service Controller

   Install Service Controller

Service Controller Update
^^^^^^^^^^^^^^^^^^^^^^^^^

If an ASGARD update comes with a new service controller version, you need to update
the service controller on the already rolled-out assets. You can do this using an
"Update Agent" task. For a single asset the task can be run in ``Asset Management`` >
``Assets`` > ``Run Task`` (play button action) or analogous as a (scheduled) group task
under ``Response Control`` > ``(Scheduled) Group Tasks`` > ``Add (Scheduled) Group Task``.

.. figure:: ../images/sc-update.png
   :alt: Update Service Controller

   Update Service Controller

.. note::
    If you don't see the **Update Agent** module, you need to enable **Show Advanced Tasks** in ``Settings`` > ``Advanced``
