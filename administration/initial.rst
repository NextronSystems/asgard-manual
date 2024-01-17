.. Index:: Initial Configuration

Initial Tasks
=============

The following tasks will ensure that your Management Center
is functional and ready to deploy THOR scans on your agents.

Change the Admin Password
-------------------------

Login to the ASGARD Web interface with the user ``admin`` and password ``admin``.

The admin user has limited/restricted access to some sections to ensure the correct
audit of certain actions. In order to access restricted functions which require an
audit please create an user with the corresponding rights under ``Settings`` > ``Users``.

.. figure:: ../images/mc_login-screen.png
   :alt: Login Screen

   Login Screen

Click the username ``admin`` in the top right corner. This will open
a dropdown menu. Click ``User Settings`` to see user specific settings.
Here you can change the default password of the admin user.

.. figure:: ../images/mc_changing-password.png
   :alt: Changing the Password

   Changing the Password

License Installation
--------------------

Login to the Management Center, navigate to ``Licensing``, click 
``Upload ASGARD Management Center License`` and upload a valid license. 


.. figure:: ../images/mc_upload-license.png
   :alt: Install a License

   Install a license

After uploading your license, the license details are displayed.
