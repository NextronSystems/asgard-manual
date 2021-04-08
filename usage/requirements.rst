
Before You Begin
================

Agent to ASGARD Communication
-----------------------------

There are a few things to consider before you start with the installation. The communication between ASGARD and the ASGARD agent is unidirectional. The ASGARD agent polls ASGARD in a given timeframe and ask for tasks to execute. There is no active triggering from ASGARD to the ASGARD agent – we have designed it that way, because we believe that opening a port on all connected endpoints should and can be avoided. 

Performance Considerations
--------------------------

In environments with up to 500 endpoints, the default polling interval is 20 seconds. In larger environments the polling interval increases automatically up to one minute for 2.000 endpoints and 10 minutes for a configuration with 25.000 endpoints connected to a single ASGARD. 

Obviously, large environments are not as responsive as small environments when it comes to opening remote shells or executing urgent response tasks. It may take up to 10 minutes for the shell to open or the result to show up. However, once open, the shell or the response tasks are very responsive – almost as if it is native on the system.

In order to adapt to specific requirements regarding responsiveness, the polling behavior can be modified. For details, refer to chapter 6.1 Performance Tuning. The hardware requirements in the next chapter assume that the default polling interval is used. 

Using a Proxy between ASGARD Agent and ASGARD
---------------------------------------------

ASGARD supports using a standard http proxy for the entire Agent to ASGARD communication. In order to use a proxy, the ASGARD agent must be repacked after installation. For details, see chapter 6.3 Creating Custom Agent Installer.

Hardware Requirements
---------------------

ASGARDs hardware requirements depend on the number of connected endpoints and also on the intended use. For example, you should consider using bigger hard disks if you are planning to use Bifrost or ASGARD’s evidence collection feature extensively.

.. list-table::
   :header-rows: 1

   * - Connected Endpoints
     - Minimum  Hardware Requirements
   * - up to 500
     - System memory: 4 GB, Hard disk: 500 GB, CPU Cores: 2
   * - up to 10,000
     - System memory: 8 GB, Hard disk: 1TB, CPU Cores: 4
   * - up to 25,000
     - System memory: 16 GB, Hard disk: 1TB SSD (min 100 MB/s), CPU Cores: 4


Agent Requirements
------------------

The ASGARD Agent, which is installed on endpoints, uses up to 10MB of RAM. THOR uses up to 300 MB of RAM additionally when scanning is in progress. 

The agent will use up to 50 MB of hard disk. Together with THOR and its temporary files it uses a maximum of 200 MB in total. 

Please note, that some response actions, such as collecting triage packs or collecting system RAM, require additional disk space.

There are no requirements pertaining to the CPU as scans can be scheduled in a way that THOR reduces its own process priority and limits its CPU usage to a configurable percentage.

Network Requirements
--------------------

The ASGARD system requires the following open ports (incoming).

From ASGARD Agent to ASGARD Server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

============================ ================
Description                  Ports 
============================ ================
Agent / Server communication 443/tcp 
Syslog forwarder             514/tcp, 514/udp
============================ ================

From Management Workstation to ASGARD Server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

============================ ================
Description                  Ports 
============================ ================
Administrative web interface 8443/tcp
Command line administration  22/tcp
============================ ================

From ASGARD to SIEM
^^^^^^^^^^^^^^^^^^^
============================ ================
Description                  Ports
============================ ================
Syslog forwarder             514/tcp, 514/udp
============================ ================

From ASGARD to Analysis Cockpit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
================================================= ================
Description                                       Ports 
================================================= ================
Asset Synchronization, Log- and Sample forwarding 443/tcp
Syslog forwarder (optional)                       514/tcp, 514/udp
================================================= ================

From ASGARD and MASTER ASGARD to the Internet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ASGARD systems are configured to retrieve updates from the following remote systems via HTTPS on port 443/tcp:

================ =====================================
Product          Remote Systems                                  
================ =====================================
ASGARD packages  update3.nextron-systems.com
THOR updates     update1.nextron-systems.com 
THOR updates     update2.nextron-systems.com
================ =====================================

All proxy systems should be configured to allow access to these URLs without TLS/SSL interception. (ASGARD uses client-side SSL certificates for authentication). It is possible to configure a proxy server, username and password during the setup process of the ASGARD platform. Only BASIC authentication is supported (no NTLM authentication support).

From MASTER ASGARD to ASGARD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

================================== =============
Direction                          Port                                  
================================== =============
From Master ASGARD v2 to ASGARD v2 5443/tcp 
From Master ASGARD v2 to ASGARD v1 9443/tcp 
================================== =============

You cannot manage ASGARD v2 systems from a MASTER ASGARD v1.

From Management Workstation to MASTER ASGARD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

============================ ================
Description                  Ports
============================ ================
Administrative web interface 8443/tcp
Command line administration  22/tcp
============================ ================

Time Synchronization
^^^^^^^^^^^^^^^^^^^^

ASGARD tries to reach the public Debian time servers by default.

============================ ================
Server                       Port 
============================ ================
0.debian.pool.ntp.org        123/udp
1.debian.pool.ntp.org        123/udp
2.debian.pool.ntp.org        123/udp
============================ ================

The NTP server configuration can be changed.

DNS
^^^

ASGARD needs to be able to resolve internal and external IP addresses.

Antivirus or EDR Exclusions
---------------------------

We recommend excluding certain folders and binaries from Antivirus scanning. 

The exclusions will not only prevent Antivirus engines from removing the agents and scanner executables but also increase scan speed, since their real-time engines won't check every file that the scanner has opened for analysis. This can improve the scan speed by up to 30% and also reduces the system's CPU load. 

We recommend using this list - include all sub folders:

- %SYSTEMROOT%\\System32\\asgard2-agent\\ 
- %SYSTEMROOT%\\Temp\\asgard2-agent\\

If you have to create a more specific list that can use wildcards, use the following list:

- %SYSTEMROOT%\\System32\\asgard2-agent\\asgard2-agent.exe
- %SYSTEMROOT%\\System32\\asgard2-agent\\asgard2-agent-service.exe
- %SYSTEMROOT%\\System32\\asgard2-agent\\bin\\thor.exe
- %SYSTEMROOT%\\System32\\asgard2-agent\\bin\\interrogate.exe
- %SYSTEMROOT%\\System32\\asgard2-agent\\bin\\console.exe
- %SYSTEMROOT%\\System32\\asgard2-agent\\asgard2-agent_sc.exe
- %SYSTEMROOT%\\System32\\asgard2-agent\\asgard2-agent_sc-service.exe
- %SYSTEMROOT%\\System32\\asgard2-agent\\services\\bin\\logwatcher.exe
- %SYSTEMROOT%\\Temp\\asgard2-agent\\ (and all sub folders)

Using the more specific list, we've experienced problems with some AV solutions that even trigger on certain keywords in filenames. They don't kill the excluded executable but block write access to disk if certain keywords like "bloodhound" or "mimikatz" appear in filenames. In these cases, the executable exclusions are not enough and you should use the recommended list of two folders and all sub folders (see above). 

If you've obfuscated the agent name, replace *asgard2-agent* with your custom agent name. 
