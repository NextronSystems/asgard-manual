Management Center v3.1
======================

Management Center 3.1.0
------------------------

Release Date: Mon,  2 Sep 2024 07:48:00 +0200

* **Highlights**

  - The ASGARD Agent will from now on receive new tasks in real time. (MC-202)
  - The ASGARD Agent will from now on be able to run multiple tasks in parallel. (MC-202)
  - With the new real time agent, there will also be a new field 'Status' in the asset table (online/offline). (MC-572)
  - Added 'Essential Mode' to the ASGARD Agent, including only THOR and Aurora. It's ideal for critical systems where only the basic functionality is needed. (MC-573)
  - New 'Managed Service' mode that will use an ASGARD Security Center to manage the asset's licenses on a per-tenant basis. (MC-2)
  - Integrated THOR Thunderstorm into the ASGARD Management Center to scan samples sent from any device within the network. (MC-458)
  - New agent module 'File Browser' that allows you to browse the file system of the ASGARD Agent. (MC-447)

----

* **Features**
    
  - New agent module 'Sysstats' that allows you to view the system statistics such as CPU, RAM, and disk usage of the ASGARD Agent in real time. (MC-371)
  - New agent module 'Log' that allows you to view and download the agent's log. (MC-574)
  - Users can now be forced to use 2FA or change their password on the next login (MC-5)
  - Bruteforce protection (MC-4)
  - Users can now be temporarily disabled (MC-162)
  - Backup and restore via UI (MC-247)

----

* **Improvements**
    
  - IOC rulesets can now be configured to automatically recompile after changes (MC-46)
  - New configuration option to use THOR for Server licenses for workstations once the THOR for Workstation licenses are exhausted (MC-77)
  - Added more API endpoints to the API documentation page (MC-62)
  - Replaced 'Resource Control' for THOR scans with more granular options like RAM and disk limits (MC-90)
  - Added a new button to relaunch playbooks or scans (MC-117)
  - Improved interrogate job for MacOS and Linux assets, e.g. collect installed software and local users (MC-123)
  - Improved interrogate job to also collect network interface names and mac adresses (MC-393)
  - Status of Master ASGARD now represents the status of the connected ASGARD Management Centers (MC-50)
  - Created new 'Incoming requests' graphs in the Overview section (MC-561)
  - Added new stop button to the group scans table, which will also stop all running tasks (MC-395)
  - Store the used Aurora Agent version in the service table and show if the version is outdated (MC-74)
  - Added revision numbers to IOC rulesets (MC-511)
  - Added new delete button to the scheduled group tasks/scans table (MC-342)
  - Added new edit button to the scheduled group scans table (MC-341)
  - Improved and migrated the Agent API validators from the ASGARD Gatekeeper (MC-598)
  - Added new column 'status' to the Sigma rules table (MC-68)
  - Added new option to automatically remove Sigma rules from a ruleset if the rule's level has been changed and is under the configured level (MC-69)
  - Added new columns 'errored' and 'succeed' to the group tasks/scans table (MC-340)
  - Added an option in the LDAP settings to use nested groups (MC-324)

----

* **UX**
    
  - Improved charts and statistics in the Overview section (MC-345)
  - Moved manuals to more prominent position (MC-32)
  - Made 'not yet valid' licenses in License section visible in the default view (MC-36)
  - Added ASGARD Query to Service Control section (MC-60)
  - When update servers are not reachable, the user will now get a link to the ip adress list (MC-56)
  - Max. runtime of '0' has been mistakenly described as 'unlimited' in some places. This has been corrected to '48 hours' (MC-82)
  - Sigma rule update counter will be hidden in case no Aurora or LogWatcher is used (MC-95)
  - Added filters to the ASGARD Agent Installers page (MC-112)
  - When creating new playbooks, the user can now also define all steps in one go (MC-216)
  - When creating a new playbook task, the user can now also create a new playbook on-the-fly (MC-354)
  - The IOC Management section has been improved. There is now a new 'IOCs' section that contains all IOCs of all groups. When adding new IOCs, groups can now be added on-the-fly. (MC-214)
  - Toggle visibility of IPv6 addresses in the asset table (MC-184)
  - Added role descriptions in the Roles management (MC-173)
  - Added prompt to several dialogs to confirm the action, e.g. when stopping a group scan (MC-174)
  - Added auto complete to Asset Labels selection (MC-238)
  - Improved colors of MISP tags (MC-320)
  - Improved error messages when linking or synchronizing with Master ASGARD or Analysis Cockpit fails (MC-325)
  - Enhanced security by preventing API endpoint leaks and using a more secure password hash algorithm. (MC-329, MC-442)
  - Show 'update available' indicator in the sidebar for the Broker Network (MC-78)
  - Improved overall usability in the Licensing section (MC-466)
  - Custom IOCs in scan table are now clickable (MC-512)
  - Fixed double scrollbar in some sections (MC-527)
  - Use pretty names instead of raw flags when creating a new THOR scan (MC-557)
  - Show connectivity status in the Analysis Cockpit settings page (MC-380)
  - Hide MISP stuff if MISP is not configured (MC-399)
  - Made the license expiration warning dependent on the license runtime (MC-57)

----

* Bugfixes

  - Fixed wrong file paths and names when collecting nested directories on Windows assets (MC-84)
  - Fixed 'Started' and 'Duration' columns for THOR scans, especially when the scan has been resumed (MC-87)
  - Fixed wrong expire date in the license expiration warning (MC-94)
  - Deletion of Nextron's default Sigma rules returned success even if the deletion failed (MC-130)
  - Fixed some non-working filters on the Master ASGARD (MC-45)
  - Fixed description of allowed characters for ASGARD Agent Installer affix (MC-48)
  - When deleting IOCs, the affected rulesets have not been marked as 'uncompiled changes' (MC-52)
  - Fixed a race condition during synchronization with ASGARD Analysis Cockpit (MC-43)
  - Fixed wrong dialog when disconnecting an ASGARD Gatekeeper (MC-136)
  - Removed directories from the ASGARD Installer page (MC-240)
  - Fixed some tooltip overlap issues (MC-261)
  - Prevent creating IOC groups without a name (MC-285)
  - Fixed a bug where the total count didn't match the actual search result (MC-281)
  - Fixed a rare case where the THOR scan fails due to a not yet valid license (MC-327)
  - Fixed some error messages, which were based on the endpoint's system language (MC-513)
  - Fixed ASGARD Agent Installer repacker to not touch the /usr/share directory (MC-519)
  - Fixed ASGARD Agent Installer repacker for AIX not working when also using agent obfuscation (MC-566)
  - Fixed error message when trying to test compilation of custom IOCs (MC-404)
  - Fixed short delay of first scan start in a group scan in case a rate limit is set (MC-445)
  - Fixed error message when trying to unlink a MISP (MC-578)

----

* Chore
  
  - Wordings (MC-61)
  - Removed some deprecated playbooks like installation of the Service Controller or uninstalling the ASGARD 1 Agent (MC-328)
  - Removed obsolete 'fast poll' mode from the ASGARD Agent (MC-468)