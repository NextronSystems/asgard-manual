.. index:: Helpful scripts

Installing ASGARD Agent via Powershell Script
---------------------------------------------

You can find a simple script to install the ASGARD Agent via
Powershell. Place the installer and script in the same folder.
Change the script as needed.

.. literalinclude:: ../scripts/install_agent.ps1
   :language: powershell
   :linenos:

Deploy ASGARD Agents via SCCM
-----------------------------

To deploy the ASGARD Agent (or any other .exe installer) via SCCM, you
have to write a Powershell script with a few conditions to mark an
installation correctly as successful or failed.

Please refer to Microsoft's `Create applications in Configuration Manager <https://learn.microsoft.com/en-us/mem/configmgr/apps/deploy-use/create-applications#about-custom-script-detection-methods>`_ .

.. literalinclude:: ../scripts/install_agent_sccm.ps1
   :language: powershell
   :linenos:

.. warning::
   This is just an example script which should work with SCCM.
   If you encounter any problems, refer to the link provided
   above for additional information.

SCCM Applications can also use a script to detect the Deployment.
You can use this part of the script to detect if the installation was successful:

.. code-block:: powershell
   :linenos:

   $servicename = "asgard2-agent"
   if (Get-Service -Name $servicename -ErrorAction SilentlyContinue) {
      Write-Host "ASGARD Agent installed"
      exit 0
   } else {
      $Host.UI.WriteErrorLine("ASGARD Agent not installed")
      exit 1
   }
