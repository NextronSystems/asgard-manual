.. index:: Antivirus and EDR Exclusions

Antivirus and EDR Exclusions
----------------------------

We recommend excluding certain folders and binaries from Antivirus scanning. 

The exclusions will not only prevent Antivirus engines from removing the
agents and scanner executables but also increase scan speed, since their
real-time engines won't check every file that the scanner has opened for
analysis. This can improve the scan speed by up to 30% and also reduces
the system's CPU load. 

General Recommendation
^^^^^^^^^^^^^^^^^^^^^^
We recommend using this list - include all sub folders:

.. list-table:: 
  :header-rows: 1
  :stub-columns: 1

  * -
    - Folder Exclusions including Subfolders
  * - **Windows**
    - %SYSTEMROOT%\\System32\\asgard2-agent\\
  * - 
    - %SYSTEMROOT%\\Temp\\asgard2-agent\\
  * - 
    -
  * - **Linux**
    - /usr/sbin/asgard2-agent-service
  * - 
    - /var/lib/asgard2-agent/
  * - 
    - /var/tmp/asgard2-agent/
  * - 
    -
  * - **macOS**
    - /var/lib/asgard2-agent/
  * - 
    - /var/tmp/asgard2-agent/

.. note::
   If you have obfuscated the agent name, replace *asgard2-agent* with your custom agent name.

If you have to create a more specific list that can use wildcards, use
the following list (and replace [random] with the wildcard). If you have
the choice, the broader approach above should be preferred.

.. list-table:: 
  :header-rows: 1
  :stub-columns: 1

  * - 
    - Specific File/Process Exclusions
  * - **Windows**
    - %SYSTEMROOT%\\System32\\asgard2-agent\\asgard2-agent.exe
  * - 
    - %SYSTEMROOT%\\System32\\asgard2-agent\\asgard2-agent-service.exe
  * - 
    - %SYSTEMROOT%\\System32\\asgard2-agent\\bin\\thor.exe
  * - 
    - %SYSTEMROOT%\\System32\\asgard2-agent\\bin\\interrogate.exe
  * - 
    - %SYSTEMROOT%\\System32\\asgard2-agent\\bin\\console.exe
  * - 
    - %SYSTEMROOT%\\System32\\asgard2-agent\\asgard2-agent_sc.exe
  * - 
    - %SYSTEMROOT%\\System32\\asgard2-agent\\asgard2-agent_sc-service.exe
  * - 
    - %SYSTEMROOT%\\Temp\\asgard2-agent\\ (and all sub folders)
  * - **Especially**
    - %SYSTEMROOT%\\Temp\\asgard2-agent\\[random]\\thor\\thor.exe
  * - **And/Or**
    - %SYSTEMROOT%\\Temp\\asgard2-agent\\[random]\\thor\\thor64.exe
  * -
    - %SYSTEMROOT%\\Temp\\asgard2-agent-sc\\ (and all sub folders)
  * - **Especially**
    - %SYSTEMROOT%\\Temp\\asgard2-agent-sc\\aurora\\[random]\\aurora\\aurora-agent.exe
  * - **And/Or**
    - %SYSTEMROOT%\\Temp\\asgard2-agent-sc\\aurora\\[random]\\aurora\\aurora-agent-64.exe
  * -
    - 
  * - **Linux**
    - /usr/sbin/asgard2-agent-service
  * -
    - /var/lib/asgard2-agent/asgard2-agent
  * -
    - /var/lib/asgard2-agent/bin/console
  * -
    - /var/lib/asgard2-agent/bin/interrogate
  * -
    - /var/lib/asgard2-agent/bin/thor
  * -
    - /var/lib/asgard2-agent/bin/update
  * -
    - /var/tmp/asgard2-agent/[random]/thor/thor-linux
  * -
    - /var/tmp/asgard2-agent/[random]/thor/thor-linux-64
  * -
    -
  * - **macOS**
    - /var/lib/asgard2-agent/asgard2-agent-service
  * -
    - /var/lib/asgard2-agent/asgard2-agent
  * -
    - /var/lib/asgard2-agent/asgard2-agent/bin/console
  * -
    - /var/lib/asgard2-agent/asgard2-agent/bin/interrogate
  * -
    - /var/lib/asgard2-agent/asgard2-agent/bin/thor
  * -
    - /var/lib/asgard2-agent/asgard2-agent/bin/update
  * -
    - /var/tmp/asgard2-agent/[random]/thor/thor-macosx

Using the more specific list, we've experienced problems with some
AV solutions that even trigger on certain keywords in filenames. They
don't kill the excluded executable but block write access to disk if
certain keywords like ``bloodhound`` or ``mimikatz`` appear in filenames.
In these cases, the executable exclusions are not enough and you should
use the recommended list of two folders and all sub folders (see above). 

McAfee EDR Exclusions
^^^^^^^^^^^^^^^^^^^^^

McAfee needs Exclusions set in multiple locations. In addition to the
general recommendation, customers with McAfee EDR need to set the following exclusions.

McAfee On-Access Scan
"""""""""""""""""""""

.. list-table:: 
  :header-rows: 1
  :stub-columns: 1
  :widths: 25, 75

  * -
    - McAfee On-Access Scan Exclusions
  * - **Low Risk**
    - thor.exe
  * -  
    - thor64.exe
  * -  
    - interrogate.exe
  * -  
    - generic.exe
  * -  
    - asgard2-agent.exe
  * -  
    - asgard2-agent-service.exe
  * -  
    - aurora-agent-64.exe
  * -  
    - aurora-agent.exe
  * - 
    -
  * - **Exclusions**

      (include sub folders)
    - %SYSTEMROOT%\\System32\\asgard2-agent\\
  * -
    - %SYSTEMROOT%\\Temp\\asgard2-agent\\
  * -
    - %SYSTEMROOT%\\Temp\\asgard2-agent-sc\\
  * - 
    -
  * - Access Protection
    - thor.exe
  * -
    - thor64.exe
  * -
    - interrogate.exe
  * -
    - generic.exe
  * -
    - aurora-agent.exe
  * -
    - aurora-agent-64.exe
  * -
    - asgard2-agent.exe
  * -
    - asgard2-agent-service.exe
  * -
    - asgard2-agent-windows-amd64.exe
  * -
    - asgard2-agent-windows-386.exe
  * -
    - C:\\Windows\\Temp\\asgard2-agent\\*\\thor\\*
  * -
    - C:\\Windows\\Temp\\asgard2-agent\\*\\thor\\*\\*
  * -
    - C:\\Windows\\Temp\\asgard2-agent\\*
  * -
    - C:\\Windows\\Temp\\asgard2-agent-sc\\aurora\\*\\aurora\\*
  * -
    - C:\\Windows\\Temp\\asgard2-agent-sc\\aurora\\*\\aurora\\*\\*
  * -
    - C:\\Windows\\Temp\\asgard2-agent-sc\\aurora\\*
  * -
    - %SYSTEMROOT%\\System32\\asgard2-agent\\bin\\*
  * -
    - %SYSTEMROOT%\\System32\\asgard2-agent\\*

McAfee EDR
""""""""""

.. list-table:: 
  :header-rows: 1
  :stub-columns: 1
  :widths: 25, 75

  * -
    - McAfee EDR Exclusions
  * - **Network Flow**
    - C:\\Windows\\System32\\asgard2-agent\\asgard2-agent.exe
  * -
    - C:\\Windows\\System32\\asgard2-agent\\bin\\generic.exe
  * -
    - C:\\Windows\\System32\\asgard2-agent\\bin\\interrogate.exe
  * -
    - C:\\Windows\\System32\\asgard2-agent\\bin\\thor.exe
  * - 
    -
  * - **Trace**
    - C:\\Windows\\System32\\asgard2-agent\\asgard2-agent.exe
  * -
    - C:\\Windows\\System32\\asgard2-agent\\bin\\generic.exe
  * -
    - C:\\Windows\\System32\\asgard2-agent\\bin\\interrogate.exe
  * -
    - C:\\Windows\\System32\\asgard2-agent\\bin\\thor.exe
  * -
    -
  * - **File Hashing**
    - C:\\Windows\\System32\\asgard2-agent\\
  * -
    - C:\\Windows\\System32\\asgard2-agent\\*\\
  * -
    - C:\\Windows\\Temp\\asgard2-agent\\
  * -
    - C:\\Windows\\Temp\\asgard2-agent\\*\\
  * -
    - C:\\Windows\\Temp\\asgard2-agent-sc\\
  * -
    - C:\\Windows\\Temp\\asgard2-agent-sc\\*\\