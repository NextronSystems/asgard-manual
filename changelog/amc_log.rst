Management Center v3
====================

This chapter contains all the changes of the ASGARD Management Center.

Management Center 3.0.15
------------------------

Release Date: Tue, 18 Jun 2024 16:45:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Normalized hostnames during license generation to reduce quota usage in the long term
    * - Bugfix
      - Fixed issues with the http proxy configuration on fresh installations

Management Center 3.0.12
------------------------

Release Date:  Thu, 28 Mar 2024 11:46:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Improved performance of the asset table and the task statistics
    * - Bugfix
      - Fixed non-working API key generation for read-only users
    * - Bugfix
      - Fixed non-working CSR generation for HTTPS TLS certificate
    * - Bugfix
      - Removed some major upgrade leftovers from the diagnostics pack

Management Center 3.0.11
------------------------

Release Date:  Wed, 28 Feb 2024 09:19:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed non-working diagnostics pack generation on some Management Centers

Management Center 3.0.10
------------------------

Release Date:  Tue, 20 Feb 2024 13:01:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Operating System Upgrade
      - Upgraded operating system from Debian 10 to Debian 12
    * - Switched update server
      - Changed update server from update3.nextron-systems.com to update-301.nextron-systems.com. Please adjust your firewall to allow connections to the new server.
    * - Time service transition
      - Switched from ntp to timesyncd for time synchronization.
    * - UI Enhancements
      - A fresh, improved look and feel that makes the UI more intuitive and easier to use.