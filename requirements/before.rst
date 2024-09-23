.. index:: Before you begin

Before You Begin
================

This chapter contains high level information which will help
you plan and implement the ASGARD Management Center within
your existing environment.

.. hint:: 
    Within this manual we might call the ASGARD Management Center
    just ``ASGARD`` or ``Management Center`` for the sake of
    simplicity.

Agent to ASGARD Communication
-----------------------------

There are a few things to consider before you start with the installation.
The communication between ASGARD and the ASGARD agent is unidirectional.
The ASGARD agent polls the in a given time frame and ask for tasks to
execute. There is no active triggering from ASGARD to the ASGARD agent –
we have designed it that way, because we believe that opening a port on
all connected endpoints should and can be avoided. 

Performance Considerations
--------------------------

In environments with up to 500 endpoints, the default polling interval
is around 20 seconds. In larger environments the polling interval increases
automatically up to one minute for 2.000 endpoints and 10 minutes for
configurations with 25.000 endpoints connected to a single ASGARD. 

For this reason larger environments are not as responsive as small environments
when it comes to opening remote shells or executing urgent response
tasks. It may take up to 10 minutes for the shell to open or results of a
THOR scan to show up. Once a task is running, like the remote console for
example, the connection becomes almost instant.

Most environments contain endpoints which need faster polling between the
agent and your ASGARD Management Center. For this reason we implemented a
``Fast Poll`` mode which can be set individually on a per host basis. For
more information, please see :ref:`administration/assets:asset overview`.

Using a Proxy between ASGARD Agent and ASGARD
---------------------------------------------

ASGARD supports using a standard http proxy for the entire Agent to
ASGARD communication. In order to use a proxy, the ASGARD agent must
be repacked after installation. For details, see :ref:`advanced/custom-agent:creating custom agent installers`.