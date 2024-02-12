.. Index:: ESXi

Create a new ESX VM and Mount the ISO
-------------------------------------

Create a new VM with your virtualization software. In this case,
we will use VMWare ESX managed through a VMWare VCenter.

The new VM must be configured with a Linux base system and Debian
GNU/Linux 12 (64 bits) as target version. It is recommended to
upload the ASGARD or Master ASGARD ISO to an accessible data
store and mount the same to your newly created VM. 

.. figure:: ../images/setup_esx1.png
   :alt: New Virtual Machine - ESX

.. figure:: ../images/setup_esx2.png
   :alt: New Virtual Machine - ESX

.. figure:: ../images/setup_esx3.png
   :alt: New Virtual Machine - ESX

.. figure:: ../images/setup_esx4.png
   :alt: New Virtual Machine - ESX

Please make sure to select a suitable v-switch or physical interface that
reflects the IP address scheme you are planning to use for the new ASGARD.
Only use one Hard Disk for the installation.