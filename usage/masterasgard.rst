
MASTER ASGARD
=============

MASTER ASGARD is a single central management console that can control all of your ASGARD systems. It is meant to centrally manage controlled scans on all your ASGARD systems. MASTER ASGARD also provides one central point of management for your Response Playbooks, Evidence Collection and IOC Management. 

Since MASTER ASGARD version 2, you install a MASTER ASGARD by promoting a bare ASGARD system with the installation of a special license. After the MASTER ASGARD license installation many functions offer additional options. Howevery from that moment onwards, your MASTER ASGARD controls all endpoints connected to all linked ASGARD systems. 

Hardware Requirements for MASTER ASGARD
---------------------------------------

MASTER ASGARD has the following hardware requirements.

=================== =======
Component           Value
=================== =======
System memory       16 GB
Hard disk           1 TB 
CPU Cores           8
=================== =======

License Management
------------------

Once you connect ASGARD systems with MASTER ASGARD, the licensing sections on connected ASGARD systems become inactive. The local ASGARD license will be replaced with the MASTER ASGARD license. Every ASGARD can issue scanning licenses to assets as long as the total number of scanned servers and workstations does not exceed the number of systems in the master license.

Setting up MASTER ASGARD
------------------------

The setup procedure for MASTER ASGARD is identical to the setup procedure for ASGARD Management Center. 
Since MASTER ASGARD v2, you install an ASGARD v2 and promote it to MASTER ASGARD v2 through a special license upload.

.. note::
   After upgrading an ASGARD to a MASTER ASGARRD, all previous information and settings on that system will be lost. Don't upgrade ASGARD systems with connected endpoints, but only newly installed systems. 

Default Password Web GUI
^^^^^^^^^^^^^^^^^^^^^^^^

User: ``admin``
Password: ``admin`` 

Default Password Console
^^^^^^^^^^^^^^^^^^^^^^^^

User: ``nextron`` 
Password: ``nextron``

Link ASGARD Systems with MASTER ASGARD 
--------------------------------------

On your ASGARD server, got to ``Settings`` > ``Connections`` > ``Link MASTER ASGARD``, generate a one-time code and copy it. 

.. figure:: ../images/link-master1.png
   :target: ../_images/link-master1.png
   :alt: Generate One Time Token

   Generate One Time Token on ASGARD

In MASTER ASGARD go to ``Asgard Management``, click the ``Add ASGARD`` button in the upper right and use the hostname and one-time token to connect that ASGARD system. You can use a description to provide more information on that ASGARD server, e.g. ``DMZ 1`` or ``Region EMEA - HQ 1``. 

.. figure:: ../images/link-master2.png
   :target: ../_images/link-master2.png
   :alt: Link ASGARD in MASTER ASGARD

   Link ASGARD in MASTER ASGARD

.. note::
   You don't have to provide a port in the hostname field. Don't use a URL like ``https://`` but just the FQDN. Remember that MASTER ASGARD must be able to reach ASGARD v2 systems on port 5443/tcp and ASGARD v1 systems on port 9443/tcp. Also make sure that the MASTER ASGARD system is able to resolve the hostname of the ASGARD system. 

Scan Control
------------

Scan Control in MASTER ASGARD looks the same as in an ASGARD server. The only difference is that you can select an ASGARD Server or "All ASGARDs" to run the scans on.  

.. figure:: ../images/master-asgard-scan-control.png
   :target: ../_images/master-asgard-scan-control.png
   :alt: MASTER ASGARD Scan Control

   Scan Control in MASTER ASGARD - New Group Scan

Asset Management
----------------

Asset Management in MASTER ASGARD is very similar to the asset management in ASGARD. 

The only differences are:

* ASGARD column shows to which ASGARD system the endpoint is connected
* Only CSV export is allow (asset labeling via CSV import is unavailable)

IOC Management
--------------

ASGARD provides two ways to import custom IOCs, YARA or Sigma rules:

1. Upload in a format that THOR understands (see THOR Manual)  
2. Sync with a MISP instance

All IOCs, rules and MISP events can be used in scans on every connected endpoint. 

In version 2.4 of MASTER ASGARD synced down IOCs are not visible on the connected ASGARD servers by default. However, there is a setting that enables the visibility on the connected ASGARD servers, although it is not yet available in the web GUI. To enable the visibility open the file ``/etc/nextron/asgard2/asgard.conf`` and add the following setting. 

.. code:: bash

   MasterSyncIOCs = 1

The MASTER ASGARD server has the be restarted after that change. 

.. note::
   This only works for setups that use ASGARD v2.4 or higher and MASTER v2.4 or higher.

Evidence Collection 
-------------------

All collected evidence is available in MASTER ASGARD's ``Evidence Collection`` section. 

In version 2.4 of ASGARD it is not possible to limit the availability of collected evidence, e.g. making locally collected evidence on an ASGARD only available to local users and not the users on the MASTER ASGARD. Future versions of ASGARD will allow that.

Download Section 
----------------

The ``Downloads`` section of MASTER ASGARD doesn't contain scanner packages since the scanners get downloaded and maintained on each of the connected ASGARD servers only. 

Updates
-------

The ``Updates`` section contains a tab in which upgrades for ASGARD can be installed. 

A second tab named ``Scanners and Signatures`` gives you an overview of the used scanner and signature versions on all connected ASGARDs. 

.. figure:: ../images/scanner-updates1.png
   :target: ../_images/scanner-updates1.png
   :alt: MASTER ASGARD Scanner Updates

   MASTER ASGARD Scanner Updates

It is possible to set a certain THOR and Signatures version for each connected ASGARD. However, if automatic updates is configured, this setting has only effect until a new version gets downloaded. 

.. figure:: ../images/scanner-updates2.png
   :target: ../_images/scanner-updates2.png
   :alt: MASTER ASGARD Set Scanner Version

   MASTER ASGARD Set Scanner Version

Customers use this feature in cases in which they want to test a certain THOR version before using it in production. In this use case the ASGARD system that runs the test scans is set to automatic updates, while the ASGARD systems in production use versions that administratos set manually after successful test runs. 

User Management
---------------

MASTER ASGARD offers no no central user and role management for all connected ASGARD servers. Each Since MASTER ASGARD and ASGARD allow to use LDAP for authentication, we believe that complex and centralised user management should be based on LDAP.

MASTER ASGARD and Analysis Cockpit
----------------------------------

It is not possible to link MASTER ASGARD with an Analysis Cockpit and transmit all scan logs via MASTER ASGARD to a single Analysis Cockpit instance. Each ASGARD has to deliver its logs seperately to a connected Analysis Cockpit.

MASTER ASGARD API
-----------------

The MASTER ASGARD API is documented in the ``API Documentation`` section and resembles the API in ASGARD systems. 

However, many API endpoints contain a field in which users select the corresponding ASGARD (via ID) or all ASGARDs (ID=``0``) 

.. figure:: ../images/master-api1.png
   :target: ../_images/master-api1.png
   :alt: MASTER ASGARD API Specialty

   MASTER ASGARD API Specialty
