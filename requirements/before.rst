.. index:: Before you begin

Before You Begin
================

Agent to ASGARD Communication
-----------------------------

There are a few things to consider before you start with the installation.
The communication between ASGARD and the ASGARD agent is unidirectional.
The ASGARD agent polls ASGARD in a given time frame and ask for tasks to
execute. There is no active triggering from ASGARD to the ASGARD agent –
we have designed it that way, because we believe that opening a port on
all connected endpoints should and can be avoided. 

Performance Considerations
--------------------------

In environments with up to 500 endpoints, the default polling interval
is 20 seconds. In larger environments the polling interval increases
automatically up to one minute for 2.000 endpoints and 10 minutes for
a configuration with 25.000 endpoints connected to a single ASGARD. 

Obviously, large environments are not as responsive as small environments
when it comes to opening remote shells or executing urgent response
tasks. It may take up to 10 minutes for the shell to open or the result
to show up. However, once open, the shell or the response tasks are
very responsive – almost as if it is native on the system.

In order to adapt to specific requirements regarding responsiveness,
the polling behavior can be modified. For details, refer to 
:ref:`usage/commandline:Performance Tuning`.
The hardware requirements in the next chapter assume that the default polling interval is used. 

Using a Proxy between ASGARD Agent and ASGARD
---------------------------------------------

ASGARD supports using a standard http proxy for the entire Agent to
ASGARD communication. In order to use a proxy, the ASGARD agent must
be repacked after installation. For details, see :ref:`usage/commandline:Creating Custom Agent Installer`.