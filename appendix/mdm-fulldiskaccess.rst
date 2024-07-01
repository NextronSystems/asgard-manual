.. index:: Full Disk Access for macOS asgard2-agent-service via MDM

Full Disk Access for macOS asgard2-agent-service via MDM
========================================================

To create an appropriate profile, to push ``Full Disk Access`` via MDM, you have to retrieve the ``codesign`` from ``asgard2-agent-service``.

To do this, execute the following command in terminal:

.. code-block:: console
   
   MacBook-Pro:~ nextron$  sudo -s
   MacBook-Pro:~ nextron$  codesign -dr - /private/var/lib/asgard2-agent/asgard2-agent-service
   Executable=/private/var/lib/asgard2-agent/asgard2-agent-service
   designated => identifier "client-arm64" and anchor apple generic and certificate ...

You have to copy the output, starting from ``identifier`` in your MDM profile in the related field. 

.. note:: 
  Please be aware, that setting the ``Full Disk Access`` via MDM will not result in listing the granted access in the ``System Settings`` of macOS.
  The only way to check if everything is correct is to execute in terminal:

  .. code-block:: console

     MacBook-Pro:~ nextron$  /usr/libexec/PlistBuddy -c "print" /Library/Application Support/com.apple.TCC/MDMOverrides.plist

For further support, please take a look in the manuals of your MDM provider.