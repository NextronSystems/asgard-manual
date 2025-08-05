.. index:: Golden Image

Installing ASGARD Agent on a Golden Image
=========================================

If you want to implement the ASGARD Agent into your Golden Image, you
can do this by following the steps in this section. Make sure to download
the right Agent Installer package from your ASGARD.

You have two options to deploy an Agent on your Golden Image, with the
first one being the easier method.

Offline Installation
^^^^^^^^^^^^^^^^^^^^

.. note:: 
   Before continuing, make sure the host can't reach your ASGARD.

In this method we make sure that the host system, which is being prepared
for the Golden Image, is either offline or can't reach the ASGARD. Go ahead
and install your ASGARD agent as you do normally. Once the installation is
done, you can stop the ``asgard2-agent`` service.

Windows (administrative command prompt):

.. code-block:: doscon

   C:\Windows\system32>sc stop asgard2-agent

Linux:

.. code-block:: console

   user@golden:~$ sudo systemctl stop asgard2-agent.service

You ASGARD Agent should be ready now. You have to make sure that the Agent
is not communicating with your ASGARD during the whole process. If the agent
is for some reason communicating with the ASGARD and creating an Asset 
Request, make sure that you stop the ``asgard2-agent`` service again and
inspect the following file:

* Windows: ``C:\Windows\System32\asgard2-agent\asgard2-agent.yaml``
* Linux: ``/var/lib/asgard2-agent/asgard2-agent.yaml``

The file should not contain the marked lines in the next example. If both lines
exist, make sure you delete them and save the file. Make also sure to deny the
Asset Request in your ASGARD to avoid confusion:

.. code-block:: yaml
   :linenos:
   :emphasize-lines: 2-3

   host: yourasgard.domain.local:443
   token: +uW6HrF3kxmLNZYqKTKuZt [...]
   registered: true
   proxy: []
   system_proxy: false
   labels: []
   write_log: false

.. warning:: 
   Your Golden Image will not work if the two lines in the ``asgard2-agent.yaml``
   file exist, it instead will create a ``Duplicate Asset``. So make sure that
   they are not present when you are creating the Golden Image!

Online Installation
^^^^^^^^^^^^^^^^^^^

If for some reason you can not prevent your host, which is being used for
the Golden Image, to communicate with your ASGARD, then follow the next
steps. Go ahead and install your ASGARD agent as you do normally. Once the
installation is done, you can stop the ``asgard2-agent`` service.

Windows (administrative command prompt):

.. code-block:: doscon

   C:\Windows\system32>sc stop asgard2-agent

Linux:

.. code-block:: console

   user@golden:~$ sudo systemctl stop asgard2-agent.service

Once the service is stopped, we have to alter the configuration file of the
agent. This is necessary because your agent will have communicated with your
ASGARD by now, thus having generated an ``token``, which should be unique.
If you would create your Golden Image now, you would have the
systems, installed with the Golden Image, appear as ``Duplicate Asset``.

Open the ``asgard2-agent.yaml`` file and delete the marked lines in our example.

* Windows: ``C:\Windows\System32\asgard2-agent\asgard2-agent.yaml``
* Linux: ``/var/lib/asgard2-agent/asgard2-agent.yaml``

.. code-block:: yaml
   :linenos:
   :emphasize-lines: 2-3

   host: yourasgard.domain.local:443
   token: +uW6HrF3kxmLNZYqKTKuZt [...]
   registered: true
   proxy: []
   system_proxy: false
   labels: []
   write_log: false

After you deleted the two lines and saved the file, your host is ready. Make
sure those two lines are not present, as well as your ``asgard2-agent`` service
is still not running. We delete the ``token`` because it is unique to ASGARD.
If two agents are presenting the same token, they will be flagged as duplicate
assets. The ``registered`` value tells the agent if it has to send a new asset
request or not. Once it is set to ``true`` it would not send a new request.

.. hint::
   Make sure to deny the Asset Request, which we just created while installing
   the agent on our host, in ASGARD. This is to avoid confusion down the road.
