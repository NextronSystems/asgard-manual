Management Center v3.1
======================

Management Center 3.1.8
-----------------------

Release Date: Tue, 22 Apr 2025 10:42:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Resolved sporadic "unknown asset" error encountered during synchronization with Master ASGARD
    * - Bugfix
      - Corrected a defect that caused JSON reporting to fail for scans executed with THOR 10.7
    * - Bugfix
      - Fixed missing chart legend in group scan results when using the light theme
    * - Bugfix
      - Addressed an issue where collected Bifrost samples could not be downloaded from the Master ASGARD interface
    * - Bugfix
      - Fixed the absence of a progress bar for certain completed THOR scans in the scan results interface
    * - Bugfix
      - Restored functionality of search filters for labels and network interfaces within the asset requests table
    * - Bugfix
      - Resolved a problem that prevented agent log downloads from the Master ASGARD
    * - Bugfix
      - Fixed an error displayed when retrying a failed group scan initiated via an ASGARD Query
    * - Bugfix
      - Restored visibility of the Broker Network section when accessed via Firefox version 137
    * - Security
      - Addressed a privilege escalation vulnerability on Windows during installation of the ASGARD Agent. A local attacker could potentially exploit the installation process to execute code with elevated privileges. This vulnerability only affects the installation process and does not require updating already installed agents. To fully remediate this vulnerability, it is essential to regenerate and replace all existing agent installers after applying this update. Thanks to Jorge Escabias from NATO Cyber Security Centre (NCSC) for reporting this

Management Center 3.1.7
-----------------------

Release Date: Thu, 13 Feb 2025 10:14:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Resolved an issue where log forwarding for Thunderstorm events did not function correctly after log rotation
    * - Bugfix
      - Removed the "Automatically accept all asset requests" setting from Master ASGARD, as this configuration must be managed directly on the Management Center
    * - Bugfix
      - Fixed a bug causing cloned tasks on Master ASGARD to remain in a perpetual pending state
    * - Bugfix
      - Updated the tooltip for changing the type of a playbook step
    * - Bugfix
      - Addressed an issue where temporary files created during IOC ruleset compilation were not properly removed
    * - Bugfix
      - Corrected spelling errors in the licensing section
    * - Bugfix
      - Fixed an issue where scheduled backups were not executed in certain scenarios
    * - Bugfix
      - The expiration date of a group scan now takes precedence over the configured resume deadline for THOR scans. This ensures that scans interrupted and eligible for resumption are not resumed if the group scan's expiration date has already passed
    * - Bugfix
      - Resolved inconsistencies in the statistics displayed on the Master ASGARD overview page
    * - Bugfix
      - Fixed an issue where the "Stop" and "Interrupt" buttons did not function correctly for certain group scans on the Master ASGARD

Management Center 3.1.6
-----------------------

Release Date: Wed, 13 Nov 2024 15:00:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed a bug, which caused the maintenance task 'Move asset to another ASGARD' to fail
    * - Bugfix
      - Increased max. size for temporary tables to prevent 'table is full' errors
    * - Bugfix
      - Fixed grayed out 'Save' button when creating one-time use playbooks
    * - Bugfix
      - Fixed a bug, which caused not all asset labels to be applied when accepting a new asset
    * - Bugfix
      - Increased the max. size for mac addresses to prevent 'Data too long for column' errors
    * - Bugfix
      - Fixed csv export of the asset table to include all rows
    * - Bugfix
      - Fixed missing 'last seen' column in csv export of the asset table
    * - Bugfix
      - Fixed performance issues in the asset table
    * - Bugfix
      - Fixed scheduled group scan's details page showing all group scans

Management Center 3.1.5
------------------------

Release Date: Tue, 22 Oct 2024 14:02:00 +0200

----

* Breaking Changes

  - The ASGARD Agent now also acts as the Service Controller. Existing Service Controller installations will be automatically put into sleep mode. Deployed Aurora Agents will still work as expected

----

* Highlights

  - The ASGARD Agent will from now on receive new tasks in real time.
  - The ASGARD Agent will from now on be able to run multiple tasks in parallel.
  - With the new real time agent, there will also be a new field 'Status' in the asset table (online/offline).
  - Added 'Essential Mode' to the ASGARD Agent, including only THOR and Aurora. It's ideal for critical systems where only the basic functionality is needed.
  - New 'Managed Service' mode that will use an ASGARD Security Center to manage the asset's licenses on a per-tenant basis.
  - Integrated THOR Thunderstorm into the ASGARD Management Center to scan samples sent from any device within the network.
  - New agent module 'File Browser' that allows you to browse the file system of the ASGARD Agent.

----

* Features

  - New agent module 'Sysstats' that allows you to view the system statistics such as CPU, RAM, and disk usage of the ASGARD Agent in real time.
  - New agent module 'Log' that allows you to view and download the agent's log.
  - Users can now be forced to use 2FA or change their password on the next login
  - Bruteforce protection
  - Users can now be temporarily disabled
  - Backup and restore via UI

----

* Improvements

  - IOC rulesets can now be configured to automatically recompile after changes
  - New configuration option to use THOR for Server licenses for workstations once the THOR for Workstation licenses are exhausted
  - Added more API endpoints to the API documentation page
  - Replaced 'Resource Control' for THOR scans with more granular options like RAM and disk limits
  - Added a new button to relaunch playbooks or scans
  - Improved interrogate job for MacOS and Linux assets, e.g. collect installed software and local users
  - Improved interrogate job to also collect network interface names and mac adresses
  - Status of Master ASGARD now represents the status of the connected ASGARD Management Centers
  - Created new 'Incoming requests' graphs in the Overview section
  - Added new stop button to the group scans table, which will also stop all running tasks
  - Store the used Aurora Agent version in the service table and show if the version is outdated
  - Added revision numbers to IOC rulesets
  - Added new delete button to the scheduled group tasks/scans table
  - Added new edit button to the scheduled group scans table
  - Improved and migrated the Agent API validators from the ASGARD Gatekeeper
  - Added new column 'status' to the Sigma rules table
  - Added new option to automatically remove Sigma rules from a ruleset if the rule's level has been changed and is under the configured level
  - Added new columns 'failed' and 'successful' to the group tasks/scans table
  - Added an option in the LDAP settings to use nested groups

----

* UX

  - Improved charts and statistics in the Overview section
  - Moved manuals to more prominent position
  - Made 'not yet valid' licenses in License section visible in the default view
  - Added ASGARD Query to Service Control section
  - When update servers are not reachable, the user will now get a link to the ip adress list
  - Max. runtime of '0' has been mistakenly described as 'unlimited' in some places. This has been corrected to '48 hours'
  - Sigma rule update counter will be hidden in case no Aurora or LogWatcher is used
  - Added filters to the ASGARD Agent Installers page
  - When creating new playbooks, the user can now also define all steps in one go
  - When creating a new playbook task, the user can now also create a new playbook on-the-fly
  - The IOC Management section has been improved. There is now a new 'IOCs' section that contains all IOCs of all groups. When adding new IOCs, groups can now be added on-the-fly.
  - Toggle visibility of IPv6 addresses in the asset table
  - Added role descriptions in the Roles management
  - Added prompt to several dialogs to confirm the action, e.g. when stopping a group scan
  - Added auto complete to Asset Labels selection
  - Improved colors of MISP tags
  - Improved error messages when linking or synchronizing with Master ASGARD or Analysis Cockpit fails
  - Enhanced security by preventing API endpoint leaks and using a more secure password hash algorithm
  - Show 'update available' indicator in the sidebar for the Broker Network
  - Improved overall usability in the Licensing section
  - Custom IOCs in scan table are now clickable
  - Fixed double scrollbar in some sections
  - Use pretty names instead of raw flags when creating a new THOR scan
  - Show connectivity status in the Analysis Cockpit settings page
  - Hide MISP stuff if MISP is not configured
  - Made the license expiration warning dependent on the license runtime

----

* Security

  - Changed the authentication for Mariadb to not use SHA-1 based mysql_native_password. Thanks to Ianis BERNARD from NATO Cyber Security Centre (NCSC) for reporting this

----

* Bugfixes

  - Fixed wrong file paths and names when collecting nested directories on Windows assets
  - Fixed 'Started' and 'Duration' columns for THOR scans, especially when the scan has been resumed
  - Fixed wrong expire date in the license expiration warning
  - Deletion of Nextron's default Sigma rules returned success even if the deletion failed
  - Fixed some non-working filters on the Master ASGARD
  - Fixed description of allowed characters for ASGARD Agent Installer affix
  - When deleting IOCs, the affected rulesets have not been marked as 'uncompiled changes'
  - Fixed a race condition during synchronization with ASGARD Analysis Cockpit
  - Fixed wrong dialog when disconnecting an ASGARD Gatekeeper
  - Removed directories from the ASGARD Installer page
  - Fixed some tooltip overlap issues
  - Prevent creating IOC groups without a name
  - Fixed a bug where the total count didn't match the actual search result
  - Fixed a rare case where the THOR scan fails due to a not yet valid license
  - Fixed some error messages, which were based on the endpoint's system language
  - Fixed ASGARD Agent Installer repacker to not touch the /usr/share directory
  - Fixed ASGARD Agent Installer repacker for AIX not working when also using agent obfuscation
  - Fixed error message when trying to test compilation of custom IOCs
  - Fixed short delay of first scan start in a group scan in case a rate limit is set
  - Fixed error message when trying to unlink a MISP

----

* Chore

  - Wordings
  - Removed some deprecated playbooks like installation of the Service Controller or uninstalling the ASGARD 1 Agent
  - Removed obsolete 'fast poll' mode from the ASGARD Agent