.. index:: Syslog Forwarding

Syslog Forwarding
=================

.. hint::
   This chapter is optional

To configure Syslog Forwarding of logs, you can set the ``--syslog`` flag
during scans. You have multiple options as to where you can send the logs.

.. figure:: ../images/mc_syslog-flag.png
   :alt: Syslog Forwarding via --syslog flag

The ``--syslog`` value is constructed of the following arguments. Please
keep in mind that the fields need to be in the correct order. Values are
separated with the colon sign ``:``

.. list-table::
   :header-rows: 1

   * - Pos.
     - Field
     - Description
     - Possible Values
   * - 1
     - Server
     - The receiving server, ``%asgard-host%`` is the ASGARD which issued the Scan for the Agent
     - FQDN or IP of remote host
   * - 2
     - Port
     - **optional** - the listening port on the remote system, default is ``514``
     - 1 - 65535
   * - 3
     - Format
     - **optional** - the log format, default is ``DEFAULT``
     - \- DEFAULT [1]_
     
       \- CEF
       
       \- JSON
       
       \- SYSLOGJSON
       
       \- SYSLOGKV
   * - 4
     - Socket
     - **optional** - The socket type, default is ``UDP``
     - \- UDP

       \- TCP

       \- TCPTLS

.. [1] This is the default log format of THOR.

.. hint:: 
   The syslog listener on the Management Center
   is running on port UDP/514.

Examples:

* ``cribl.local:6514``
* ``172.16.20.10:514:SYSLOGKV:TCP``
* ``rsyslog-forwarder.dom.int:514:JSON:TCP``
* ``arcsight.dom.int:514:CEF:UDP``

If you choose to use the ``--syslog`` flag, please make sure that the
necessary ports are allowed within your network/firewall. If you decide
to forward your logs via ASGARD to a SIEM, please have a look at
:ref:`administration/additional:rsyslog forwarding`.

.. note::
   If Syslog Forwarding is selected for a new THOR Scan, the default
   target will be set to ``%asgard-host%``, which is your Management
   Center. Syslog Forwarding is optional and you do not lose any
   functionality if you are not using it (in most cases). If you
   want to forward logs in real-time from your Management Center to
   a SIEM (for example), you do however have to enable Syslog Forwarding.

   Please see :ref:`administration/additional:rsyslog forwarding` for more
   information