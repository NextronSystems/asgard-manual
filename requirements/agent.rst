.. index:: Agent Requirements

Agent Requirements
------------------

The ASGARD Agent, which needs to be installed on endpoints, is a lightweight
service which is used to establish a secure connection with your Management
Center. Memory usage of the agent is around 50 MB, which makes it very unobtrusive.
THOR uses up to 1.5 GB of RAM additionally when scanning is in progress. This
value will vary depending on the operating system THOR is running on. We
observed lower RAM usage on unix systems all together, whereas Windows
endpoints generally use more RAM.

The agent will use up to 50 MB of hard disk. Together with THOR and its
temporary files it uses a maximum of 200 MB in total. 

Please note that some response actions, such as collecting triage packs
or collecting the system's RAM, require additional disk space.

There are no requirements pertaining to the CPU as scans can be scheduled
in a way that THOR reduces its own process priority. This limits the CPU
usage to a configurable percentage, with the tradeoff being prolonged
scan times. There are multiple ways to facilitate THOR scans to your
environment, which you can find in our separate
`THOR Manual <https://thor-manual.nextron-systems.com>`_.

Supported operating systems are the ones
`supported by THOR <https://thor-manual.nextron-systems.com/en/latest/usage/requirements.html#operating-systems>`__.
Not supported are the operating systems with limited or special THOR support.