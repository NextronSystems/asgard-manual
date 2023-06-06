Changelog
=========

This chapter contains all the changes of the ASGARD
Management Center.

ASGARD Management Center
^^^^^^^^^^^^^^^^^^^^^^^^

Changelog of ASGARD Management Center releases since version 2.0.0

ASGARD 2.15
###########

ASGARD 2.15.3
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Tue, 16 May 2023 11:59:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Improved error message on wrong 2FA code
    * - Change
      - Synchronize deleted assets with Analysis Cockpit
    * - Change
      - Updated Sigma LogSources for LogWatcher
    * - Bugfix
      - Fixed non-working gatekeeper to broker connection for two different host names
    * - Bugfix
      - Removed some debug messages in asgard log
    * - Bugfix
      - Fixed a typo in logrotate config that caused agent access log to not be rotated
    * - Bugfix
      - Fixed non-working agent timeline if not agent log file exists
    * - Bugfix
      - Truncate sigma rule title and creator to fit the database table requirements
    * - Bugfix
      - Fixed typo in detection of deprecated and unsupported THOR versions
    * - Bugfix
      - Removed raw code line in custom signature ioc table
    * - Bugfix
      - Do not show 'labels: all' in group tasks that are based on ASGARD Query
    * - Bugfix
      - Fixed non-working deletion of agent installers that are tagged as legacy
    * - Bugfix
      - Fixed synchronization issues with Analysis Cockpit in very large environments
    * - Bugfix
      - Fixed crashing LogWatcher caused by Sigma rulesets without custom rules

ASGARD 2.14
###########

ASGARD 2.14.6
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon,  7 Nov 2022 15:39:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed non-working advanced labeling in group scan/task dialog

ASGARD 2.14.5
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed,  2 Nov 2022 10:49:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Broker Network support
    * - Feature
      - Search and select assets with queries, e.g. 'hostname ends with "-dev" OR labels = "dev"'
    * - Feature
      - Optionally create group tasks with an asset query instead of labels
    * - Feature
      - The agent config can now be maintained from ASGARD, e.g. change proxy settings
    * - Feature
      - Move agent to a different ASGARD
    * - Feature
      - Automatically resume THOR scans that have been terminated due to shutdown signals (e.g. on reboot)
    * - Feature
      - Added a lot new ASGARD features to Master ASGARD, e.g. manage and download agent installers, manage Broker Network
    * - Feature
      - Allows to delete assets
    * - Feature
      - Delete agent installers
    * - Feature
      - Added diagnostic checks to diagnostic download packs
    * - Feature
      - Support unix filepath format in playbooks for Windows targets
    * - Feature
      - Detect assets that run with same key material, e.g. cloned assets
    * - Feature
      - Forward THOR and Aurora events via rsyslog
    * - Feature
      - Migrate key material from old agent config on agent re-installation
    * - Feature
      - Added more columns in some tables, e.g. 'creator' in service configurations or 'active since' in services
    * - Feature
      - Download ASGARD users as CSV
    * - Feature
      - Set description for remote consoles
    * - Feature
      - New default playbook "Collect Agent Log" (requires an agent update)
    * - Feature
      - Bulk task / scan creation
    * - Change
      - Require min. TLS 1.3 for all agent connections. To disable min. TLS 1.3, set "LegacyTLS=1" in the ASGARD config file.
    * - Change
      - Disable "Add and activate" button for "Add group task", if "Scheduled start" is set
    * - Change
      - Allow "--nohtml" flag for THOR
    * - Change
      - Set scan status to error if THOR scan result does not contain 'THOR scan finished' message
    * - Change
      - Collect stdout/stderr at the end of each playbook step instead of streaming it directly to ASGARD
    * - Change
      - Automatically set THOR's max runtime to unlimited and removed THOR's max runtime argument from THOR flag list
    * - Change
      - Ignore deprecated sigma rules
    * - Change
      - Improved compression level of some generated zip files
    * - Change
      - Allow stop of group tasks without starting it
    * - Change
      - Improved diagnostics for synchronization with Analysis Cockpit
    * - Change
      - Disabled syslog debug log on agents by default, added option to agent installer to enable syslog
    * - Change
      - Added key usage and SAN to self-signed TLS certificate for UI on installation
    * - Bugfix
      - Security fixes
    * - Bugfix
      - Fixed missing 'Default response mode' in Sigma ruleset details
    * - Bugfix
      - Fixed some missing Aurora flags
    * - Bugfix
      - Fixed non-working save button for global Sigma false positive filter list
    * - Bugfix
      - Fixed NaN when removing the score of an IOC
    * - Bugfix
      - Fixed a bug in event caching in offline mode of Aurora Agent and LogWatcher
    * - Bugfix
      - Fixed 'Windows 11' detected as 'Windows 10'
    * - Bugfix
      - Fixed missing LastLogon date in local users table
    * - Bugfix
      - Disable deletion of the own user
    * - Bugfix
      - Added "x86_64" in addition to "amd64" for agent installer rpm packages to support older yum/rpm
    * - Bugfix
      - Fixed wrong YARA rule count after uploading YARA rules
    * - Bugfix
      - Fixed "in a few seconds" last seen timestamps that have been caused by either a wrong server or browser clock
    * - Bugfix
      - Removed some Aurora and Sigma error messages in ASGARD log after fresh installation
    * - Bugfix
      - Removed a race condition between automatic and manual update checks that may cause corrupt product version numbers
    * - Bugfix
      - Fixed missing "enabled/disabled service" history entries on ASGARDs that are connected to a Master ASGARD
    * - Bugfix
      - Fixed corrupt network interfaces search in asset table for new assets that had no interrogate job yet
    * - Bugfix
      - Fixed a bug in motd config that causes some error messages after a fresh installation
    * - Bugfix
      - Removed c2 file name prefix from some compiled custom signatures
    * - Bugfix
      - Fixed non-working obfuscated agent for AIX

ASGARD 2.13
###########

ASGARD 2.13.11
~~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 14 Sep 2022 10:44:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed possible deadlock in synchronization between Master ASGARD and ASGARD
    * - Bugfix
      - Fixed EOF error in synchronization between Master ASGARD and ASGARD
    * - Bugfix
      - Removed a hard-coded limit that caused some missing data in UI

ASGARD 2.13.8
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Fri,  8 Jul 2022 08:57:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Security
      - TLS Hardening
    * - Security
      - Trusted Proxies
    * - Bugfix
      - Fixed missing description for ASGARDs on Master ASGARD
    * - Bugfix
      - Fixed bug in first sync between ASGARD and Master ASGARD

ASGARD 2.13.7
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 30 May 2022 11:46:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Security
      - OS Security Fix

ASGARD 2.13.6
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 18 May 2022 12:49:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - fixed non-working creation of tasks with "unlimited" rate
    * - Bugfix
      - added missing "No Resource Control" option in scan control
    * - Bugfix
      - fixed wrong Aurora status in expanded asset view
    * - Bugfix
      - short C2 IP addresses such as 1.1.1.1 are no longer getting a 'short' hint message

ASGARD 2.13.5
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Tue, 12 Apr 2022 15:18:00 +0200

.. list-table::
    :header-rows: 1

    * - IMPORTANT
    * - Master ASGARD must be upgraded before upgrading the connected ASGARDs

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Support Aurora Agent
    * - Feature
      - THOR progress bar - A progress bar in the scan table that shows the current progress of the THOR scan. On hover, you can see a detailed view of the progress
    * - Feature
      - AIX Support (Beta only)
    * - Feature
      - Collect JSON THOR Log (optional)
    * - Feature
      - Alternatively manage iocs with files instead of ioc groups
    * - Feature
      - Added 'THOR 10 Latest' option to THOR download page
    * - Feature
      - New product "Aurora Signatures"
    * - Feature
      - New section 'Playbook Files' that lists all files that are available for playbook steps. This section also supports downloading, deleting and uploading files.
    * - Feature
      - New tab 'Diagnostics' that lists all components with their status
    * - Feature
      - New loading bar when refreshing tables
    * - Feature
      - Custom IOC rulesets and MISP rulesets support for Aurora Agent
    * - Feature
      - The Master ASGARD can now generate THOR download links and provide a License API, too
    * - Feature
      - Added 'Auto Refresh' to most tables that can automatically refresh the table in a specified interval
    * - Feature
      - Show total ram and disk usage in overview page
    * - Feature
      - New filter 'Show all / show active only' in Service Control
    * - Feature
      - Show which scheduled group scans are affected when compiling or deleting custom IOC rulesets or MISP rulesets
    * - Feature
      - When adding new scans with custom IOC rulesets, a warning will be shown if a ruleset contains uncompiled changes
    * - Feature
      - Single Scans and Single Tasks can now be created in Scan Control and Response Control with the 'Add Scan' / 'Add Task' buttons
    * - Feature
      - Show warning if automatic THOR Signature updates are disabled and the currently used THOR Signatures are outdated
    * - Feature
      - Show warning if ASGARD license expires soon
    * - Feature
      - Show warning if a configured scheduled group scan is running with an outdated THOR version
    * - Feature
      - Added ntp to services in settings section
    * - Feature
      - Custom max. runtime for scans and tasks
    * - Feature
      - Added API endpoints 'Add Playbook File' and 'Search Playbook Files' to API documentation
    * - Feature
      - In the Downloads > THOR > Download Token section, the latest usage of the download token will be shown
    * - Feature
      - New Sigma response flag "lowprivonly" that applies responses only on processes with low privileges
    * - Feature
      - Logging time stats and network traffic of Master ASGARD synchronization
    * - Feature
      - Show services that use ioc / misp / sigma ruleset when compiling / deleting ruleset
    * - Feature
      - Show number of assets per service configuration
    * - Feature
      - Show pending changes, available revision and running revision in service table
    * - Feature
      - "Available since" and "Used since" in THOR / THOR Signatures and Aurora products table
    * - Feature
      - Show warning if selecting all entries in a table but table has more than 1 page
    * - Feature
      - Test proxy
    * - Feature
      - Show TLS information
    * - Feature
      - Show NTP information
    * - Feature
      - Recommended response actions for Sigma
    * - Feature
      - Added success notifications in UI
    * - Feature
      - The version of the used Aurora Agent can now be pinned per service configuration
    * - Feature
      - Completely refactored agent installer section. Added more information like asset labels and proxy and added repacker buttons per installer.
    * - Change
      - Removed the 'is directory' property in playbook steps. There will be no difference anymore between files and directories when collecting a filepath or directory
    * - Change
      - Completely refactored the API documentation, the API itself has not been changed
    * - Change
      - Cosmetics
    * - Change
      - Wordings
    * - Change
      - Added a lot more tooltips and information
    * - Change
      - Other smaller UX stuff
    * - Change
      - Improved performance between Master ASGARD and ASGARD
    * - Change
      - Table columns are not clickable anymore, use the expand button in the first column instead
    * - Change
      - Added hostname of ASGARD to CSR generator
    * - Change
      - Playbook steps can now be managed in the right sidebar instead of the expanded table row in the playbook table
    * - Change
      - Separated playbooks in 'new task' dialog into 'pre-installed' and 'custom'
    * - Change
      - When adding new scans or creating THOR download links, the latest THOR version will automatically be selected in the dialog
    * - Change
      - Changing a THOR or Signature version manually will now disable the auto update, auto update can now be activated in the 'set version' dialog, too
    * - Change
      - Added fallback logic for missing THOR versions - e.g. scan with 10.5 if 10.6 was not found
    * - Change
      - Creating a Sigma ruleset with "Auto Config" will now add all existing rules that match the config to the ruleset
    * - Change
      - Security Fix - Updated TLS cipher suite
    * - Change
      - Upgraded winpmem
    * - Change
      - The asset view per service is now splitted into two tabs, one with already deployed services and one with non-deployed services
    * - Change
      - Hiding LogWatcher per default if LogWatcher has not been used yet
    * - Bugfix
      - Added info that filename iocs are not case insensitive if applied as regex
    * - Bugfix
      - Fixed reset of MISP form data on error
    * - Bugfix
      - Fixed adding users without role
    * - Bugfix
      - Fixed missing ntp restrictions in ntp config
    * - Bugfix
      - Fixed performance and stability of MISP event synchronization
    * - Bugfix
      - Automatically refresh the UI if the UI version differs from server's UI version
    * - Bugfix
      - Some collected Aurora or LogWatcher events were corrupt
    * - Bugfix
      - Fixed synchronization issues between Master ASGARD and ASGARDs caused by time sync issues
    * - Bugfix
      - Fixed non-working 'Agent Update Available' and 'Service Controller Update Available' indicators on Master ASGARD
    * - Bugfix
      - Added autoremove to upgrade routine to prevent issues with boot partition

ASGARD 2.12
###########

ASGARD 2.12.10
~~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon,  7 Mar 2022 11:22:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed some missing MISP attributes in MISP events

ASGARD 2.12.9
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 26 Jan 2022 12:29:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed non-working tls certificate upload

ASGARD 2.12.8
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 24 Jan 2022 12:20:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Support Aurora Agent (Beta Only)
    * - Feature
      - Manage Sigma Responses and False Positives (Aurora Only)
    * - Feature
      - Enable / Disable Sigma Rules
    * - Feature
      - Manually check for THOR and Signature Updates
    * - Feature
      - Show log of previous update process
    * - Feature
      - Auto Config for Sigma Rulesets (Automatically add new Sigma Rules based on level)
    * - Feature
      - The UI now has a lot more indicators for e.g. 'Asset Requests', 'Uncompiled Rulesets' and more
    * - Feature
      - Added more graphs to overview page, e.g. incoming Aurora and Log Watcher events
    * - Feature
      - Added bulk update for available Sigma rule updates
    * - Feature
      - Added default Sigma Rulesets (if no ruleset has been created yet)
    * - Feature
      - Added background routine that removes older and unused THOR / Signature versions
    * - Feature
      - Edit Scan Templates
    * - Feature
      - Search THOR Flags / Aurora Options
    * - Feature
      - Download THOR Zip with target hostname as filename
    * - Change
      - Improved Server Status indicators
    * - Change
      - Improved licensing
    * - Change
      - LDAP users require at least one LDAP role, otherwise they are not authenticated anymore
    * - Change
      - Updated Sigma rules
    * - Change
      - Cosmetics and UX improvements
    * - Change
      - Updated default THOR and Signature auto-update config
    * - Change
      - Added more links and password reset help to login page
    * - Change
      - Improved usability and feedback in IOC Management section
    * - Change
      - Require current password for password change
    * - Bugfix
      - Re-added and improved "no labels" filter in assets table
    * - Bugfix
      - Re-added resize buttons for Remote Console
    * - Bugfix
      - Fixed an issue that causes some API keys to be corrupt
    * - Bugfix
      - Fixed non-working 'Install Service Controller' playbook on Master ASGARD
    * - Bugfix
      - Updated interrogate job to detect 'Windows 11' correctly
    * - Bugfix
      - Fixed corrupt 'Is Domain Controller: No' filter
    * - Bugfix
      - Fixed missing default value when editing Sigma or YARA rules in IOC Management
    * - Bugfix
      - Fixed non-working "use newer Sigma rule" button
    * - Bugfix
      - Fixed CRLF issues in IOC Management for some IOC types
    * - Bugfix
      - Fixed some missing MISP iocs in THOR download package
    * - Bugfix
      - Fixed permissions on some files that caused backup process of ASGARD config files on Master ASGARD to not work properly
    * - Bugfix
      - Fixed encryption issues with custom signatures for THOR Lite
    * - Bugfix
      - Fixed missing import in ntp config that causes ntp to not work properly on some ASGARDs
    * - Bugfix
      - Fixed tasks that are pending forever due to unknown task module
    * - Bugfix
      - Fixed non-working rsyslog reload after monthly logrotation
    * - Bugfix
      - Fixed wrong file extension of stdout and stderr file in group task result package

ASGARD 2.11
###########

ASGARD 2.11.11
~~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Thu, 11 Nov 2021 16:38:00 +0100

.. list-table::
    :header-rows: 1

    * - IMPORTANT: Please read before you upgrade your ASGARD!
    * - The upgrade can take up to one hour in large installations, do not reboot during installation
    * - The API has been revised. This will potentially break existing API integrations
    * - Master ASGARD must be upgraded before upgrading the connected ASGARDs
    * - To enable new Service Control section add Service Control right to respective roles (Settings > Roles)
    * - Existing group scans will be stopped and can not be restarted or resumed and must therefore be recreated
    * - Scheduled group scans will continue working unless custom IOCs are in use. If custom IOCs are in use, scheduled group scans must be stopped and recreated in order to function properly
    * - The IOC Management has been completely revised. Existing custom IOCs will be deactivated and can be found and downloaded at /var/lib/nextron/asgard2/iocs/. Re-upload your existing custom IOCs through our new UI at Scan Control > IOC Management

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Refactored and improved UI
    * - Feature
      - Improved performance of tables on the UI
    * - Feature
      - Updating the search in a UI table will now cancel the previous query instead of detaching the previous query in the background
    * - Feature
      - A Service Controller Agent is now available to be installed in addition to the existing agent. It can be used to run services instead of one-shot tasks.
    * - Feature
      - Added new service 'Log Watcher' that scans the Windows EventLog in real-time, based on Sigma Rules that are managed on the Management Center
    * - Feature
      - Multiple THOR minor version can now be managed and used for Scan tasks
    * - Feature
      - THOR flags in UI are now based on the selected THOR version
    * - Feature
      - CPU-, RAM- and DISK-usage are now automatically refreshing in UI every second
    * - Feature
      - New ASGARD status light in UI (green = no overload, yellow = temporary overloaded, red = overloaded)
    * - Feature
      - CSV exports now contain more information, added CSV export to many more tables
    * - Feature
      - ASGARD can now handle multiple licenses
    * - Feature
      - Licenses for archived assets are invalidated after 3 month and the license count is reduced accordingly
    * - Feature
      - Scans in the scan table now contain the exact THOR version and signature version that has been used for scanning
    * - Feature
      - THOR scans are now terminated more gracefully to improve error handling
    * - Feature
      - Completely refactored IOC Management
    * - Feature
      - Improved LDAP settings and testing options
    * - Feature
      - The asset timeline is now available on Master ASGARD
    * - Feature
      - Repack agent installers from UI
    * - Feature
      - MacOS ARM64 Support
    * - Change
      - Requirements for password complexity has been increased
    * - Change
      - The group task engine has been refactored to issue tasks asynchronously in background instead of synchronously on agent pings
    * - Change
      - The single task table now only shows tasks that haven't been issued by a group task
    * - Change
      - Improved security by adding more strict http headers to UI
    * - Change
      - The Master ASGARD now requires that all connected ASGARDs are at least version 2.11.0
    * - Change
      - Regenerated ASGARD's certificate for agent communication with SAN extension
    * - Change
      - The agent stream API now terminates streams that are inactive for over 10 minutes
    * - Change
      - Added more retries and pauses to the agent functions to handle issues with EDRs and AVs
    * - Change
      - Improved performance by removing some mutexes and using more specific mutexes for critical data
    * - Change
      - Master ASGARD now synchronizes scanners and signatures with the connected ASGARDs

ASGARD 2.10
###########

ASGARD 2.10.10
~~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Thu, 24 Jun 2021 07:47:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Added a maximum of users that will be collected with interrogate

ASGARD 2.10.9
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Fri, 18 Jun 2021 11:08:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Improved interrogate by adding more output and timeouts for specific operations
    * - Change
      - Cosmetics
    * - Change
      - Replaced pdf manuals with online versions
    * - Change
      - Upgraded CyLR Tool
    * - Change
      - Improved IOC type detection of custom IOCs
    * - Bugfix
      - Fixed non-working playbook step "Download File" from Master ASGARD
    * - Bugfix
      - Fixed empty task table of a group task in response control
    * - Bugfix
      - Fixed creation of playbook tasks with more than one placeholder
    * - Bugfix
      - Fixed missing pending tasks in task table if filter is set to 'last x days'
    * - Bugfix
      - Fixed non-working 'last x days' filter in response control's task table

ASGARD 2.10.8
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 12 May 2021 14:50:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Added a new archive script that manually archives scans and scan results that are older than X days
    * - Change
      - Notarization and new code signing certificate of MacOS binaries
    * - Change
      - Signed MacOS installer with an installer certificate
    * - Change
      - Updated Sigma Rules
    * - Bugfix
      - In some cases the ASGARD Agents and Master ASGARD sent many DNS requests for a few seconds
    * - Bugfix
      - Fixed ldap configuration issues

ASGARD 2.10.3
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Fri, 23 Apr 2021 07:29:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Configurable host for agent API, GUI and other APIs
    * - Bugfix
      - Fixed corrupt agent download links on some browsers

ASGARD 2.10.2
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 12 Apr 2021 16:00:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature [beta]
      - Service Controller
    * - Feature [beta]
      - New service 'Log Watcher' that scans EventLog with Sigma in real-time
    * - Feature
      - Get additional asset information on interrogate, e.g. installed software and local users
    * - Feature
      - New columns 'Error' and 'Error Help' in scan table to improve troubleshooting with THOR scan issues
    * - Feature
      - New button in asset- and scan table that shows the history of an asset, including online/offline stats and scan stats
    * - Feature
      - Added an Agent Log Analysis Tool to command line
    * - Security
      - Smaller security fixes, e.g. increased min. TLS version, added more CSP headers, added more Logout headers, ...
    * - Change
      - Improved LDAP with timeouts, retries and added BindDN/BindPassword to support Active Directory
    * - Change
      - Refactored synchronization with Master ASGARD 2 and Analysis Cockpit 3 to improve MySQL workload
    * - Change
      - Apply hostname and other system information on asset request accept
    * - Change
      - Wordings
    * - Bugfix
      - Do not abort THOR scan if license type could not be determined, the system will be treated as server, instead
    * - Bugfix
      - Fixed corrupt group scan duplication on Master ASGARD
    * - Bugfix
      - Fixed corrupt Asset Request deny on non-Master ASGARD

ASGARD 2.6
##########

ASGARD 2.6.2
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 11 Jan 2021 14:20:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Rescan assets that failed in a grouped task by duplicating the grouped task
    * - Feature
      - Cache THOR scan results, if they can not be uploaded due to connection issues and collect them in a subsequent task
    * - Feature
      - Two factor authentication
    * - Feature
      - Network traffic graph in overview section
    * - Feature
      - Import / Export scan templates
    * - Feature
      - Search for "never" in 'Last Scan Completed' column of asset table
    * - Feature
      - Added new column 'Status Text' in scan table that contains more information about the status, e.g. error message
    * - Feature
      - Added button to manually synchronize with MISP
    * - Change
      - Wordings
    * - Change
      - Cosmetics
    * - Bugfix
      - Fixed usage of unpublished MISP events in generated rulesets
    * - Bugfix
      - No proxy for initial Analysis Cockpit 3 connection

ASGARD 2.5
##########

ASGARD 2.5.7
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 18 Nov 2020 09:12:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Use proxy for MISP synchronization (optionally)
    * - Bugfix
      - Fixed duplicate files in THOR zip packages
    * - Bugfix
      - Fixed removal of THOR config files if content is empty on update

ASGARD 2.5.6
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Fri,  6 Nov 2020 12:17:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Encrypt custom IOCs and MISP IOCs in the download packages
    * - Feature
      - Download THOR packages with IOCs from Master ASGARD 2 on ASGARD 2
    * - Change
      - Master ASGARD 2 now synchronizes the custom IOCs to the connected ASGARDs per default
    * - Bugfix
      - Fixed asset synchronization with Analysis Cockpit 2
    * - Bugfix
      - Fixed proxy issues between Master ASGARD 2 and ASGARD 2 and between ASGARD 2 and Analysis Cockpit 3
    * - Bugfix
      - Fixed rejection of custom ioc deletion when Master ASGARD 2 is connected
    * - Bugfix
      - Fixed browser cache issues in THOR config management
    * - Bugfix
      - Fixed issues with log file collection after THOR crashed
    * - Bugfix
      - Fixed calculation of used RAM in the Overview section

ASGARD 2.5.4
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Thu,  1 Oct 2020 16:31:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Added default false_positive_filters.cfg in THOR packages if not configured via GUI

ASGARD 2.5.3
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 30 Sep 2020 12:24:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed connectivity issues with Analysis Cockpit 2

ASGARD 2.5.2
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 28 Sep 2020 17:43:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Support for Analysis Cockpit 3
    * - Feature
      - Support for THOR 10 TechPreview
    * - Feature
      - Added description field to single scans
    * - Feature
      - Generate and download THOR licenses via GUI
    * - Feature
      - Remote console can be disabled via command line
    * - Feature
      - Improved download token management
    * - Feature
      - Use download token for license API, support THOR's --asgard flag
    * - Feature
      - Added watcher to THOR launcher that will terminate THOR if system resources run out
    * - Feature
      - Download ASGARD's ca.pem via GUI that will be used for Agent- and THOR communcation
    * - Feature
      - Manage THOR config files via GUI (Direcory Excludes, False Positive Filters)
    * - Feature
      - New tab 'Agents' in update section that will show assets with legacy agents and legacy installers
    * - Change
      - Exchanged code signing certificate and added time stamping
    * - Change
      - Redesigned management of events in MISP rulesets
    * - Change
      - Added unlink buttons for Analysis Cockpit and MISP
    * - Change
      - Page content will now be vertically scrollable if large tables exceed the 100% width
    * - Change
      - Wordings
    * - Change
      - Cosmetics
    * - Bugfix
      - Fixed corrupt THOR Manual download link in IOC Management

ASGARD 2.4
##########

ASGARD 2.4.4
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Fri, 19 Jun 2020 16:58:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed disabled delete and edit buttons for playbook steps

ASGARD 2.4.3
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 15 Jun 2020 08:40:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Improved system stability during process memory collection by adding more watchers on the pmem process
    * - Change
      - Cosmetics
    * - Change
      - Improved audit logging for Bifrost settings
    * - Bugfix
      - Fixed sporadically wrong task stats graph in grouped task details view (Master ASGARD only)
    * - Bugfix
      - Added 'missingok' to logrotate config

ASGARD 2.4.2
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon,  8 Jun 2020 13:04:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Improved differentiation between ASGARD and Master ASGARD by adding separate logo and page title

ASGARD 2.4.1
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon,  8 Jun 2020 08:34:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Added missing column in asset request's table when upgrading from ASGARD 2.3

ASGARD 2.4.0
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Thu, 28 May 2020 13:10:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Master ASGARD v2
    * - Feature
      - Added 'Collected Evidences' section that unites incoming evidences from multiple sources
    * - Feature
      - Added notifications that can be dismissed for a whole session, e.g. that 'admin' password was not changed
    * - Feature
      - When creating a scan, you can now decide between THOR and THOR Lite (a trimmed THOR that doesn't cost you a license)
    * - Change
      - Refactored remote console to be much more stable
    * - Change
      - Improved error messages when THOR exits with non-zero status code
    * - Change
      - Using stacked graph for issued / completed tasks of grouped tasks
    * - Change
      - Cosmetics
    * - Change
      - Upgraded swagger UI
    * - Change
      - Improved audit logging
    * - Change
      - Added warning to product update popup, if product has automatic updates configured
    * - Bugfix
      - Fixed bug in graph of issued / completed tasks of grouped task
    * - Bugfix
      - Fixed process leak that may occur on too many page clicks that causes missing system info on overview page

ASGARD 2.3
##########

ASGARD 2.3.3
~~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Fri,  8 May 2020 11:16:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Removed legacy auto-update config that may cause unwanted THOR/Signatures updates in background

ASGARD 2.3.2
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed,  6 May 2020 15:50:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - THOR HTML reports will be generated after THOR scans and can be downloaded via GUI
    * - Feature
      - Added MOTD to SSH sessions
    * - Feature
      - New playbook - List processes
    * - Feature
      - New playbook - Kill process
    * - Feature
      - New playbook - Uninstall ASGARD 1 Agent
    * - Feature
      - MISP Rulesets don't have to be generated manually anymore. Adding MISP Events to a ruleset that doesn't exist will automatically create a new one
    * - Feature
      - Added port 80 listener that redirects to port 8443
    * - Feature
      - Improved detailed view of playbook results. Stdout/Stderr and collected files are now shown in the GUI
    * - Feature
      - New user restriction 'NoInactiveAssets' that restricts users from seeing inactive assets in the Asset Management
    * - Change
      - Added hostname and task start date to filename of scan results
    * - Change
      - Update filename of memory dumps from mem.raw to mem.aff4
    * - Change
      - Default admin role will now have all rights (doesn't affect ASGARDs that were upgraded to 2.3)
    * - Change
      - Wordings
    * - Change
      - Download tokens are not based on query parameters anymore
    * - Change
      - Reduced default validity for self-signed ASGARD certificate
    * - Change
      - License adjustments
    * - Change
      - Removed memory collection playbook for MacOS
    * - Bugfix
      - Removed loading circle when clicking on an attribute in a MISP event
    * - Bugfix
      - Improved IE support
    * - Bugfix
      - Hide proxy credentials in log
    * - Bugfix
      - Fixed a field name in Swagger API documentation
    * - Bugfix
      - Fixed THOR flag synchronization issues due to too large description

ASGARD 2.2
##########

ASGARD 2.2.1
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed,  8 Apr 2020 14:46:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Security
      - Always clear all temporary files and use random names for temp directories

ASGARD 2.2.0
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon,  6 Apr 2020 11:37:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - API documentation in GUI
    * - Feature
      - Improved query APIs for assets, tasks and more
    * - Feature
      - Dynamic ping rate based on number of connected assets
    * - Feature
      - Added default roles
    * - Feature
      - Quarantine playbook (and de-quarantine playbook)
    * - Feature
      - Download file or directory playbook
    * - Feature
      - Backup and restore scripts
    * - Feature
      - Create diagnostic pack script + download via GUI
    * - Feature
      - Added "NoTaskStart" right
    * - Feature
      - Search for multiple values using pipe
    * - Feature
      - Show head and tail of THOR logs in preview instead of head only
    * - Feature
      - Check total memory and free disk space before running PMEM 
    * - Feature
      - Throttle uploads
    * - Feature
      - Specify max. file size / dir size using 'KB', 'MB', ...
    * - Feature
      - Show badge in sidebar if ASGARD update is available
    * - Feature
      - Resizable remote console
    * - Feature
      - Set max. runtime for a task (default is 1 week)
    * - Feature
      - Added new flag '-systemproxy' to agent repacker. Agents will then use system-configured proxy.
    * - Feature
      - Support agent obfuscation by passing '-name <name>' to agent repacker
    * - Feature
      - Support more search types, e.g. '< 3 GB'. All types are now shown as tooltip in search fields
    * - Feature
      - Improved uninstall of agents
    * - Feature
      - Edit playbooks and playbook steps
    * - Feature
      - License API
    * - Feature
      - Automatically hide assets that haven't been seen for X days (can be configured)
    * - Change
      - Wording Client > Agent
    * - Change
      - Cosmetics
    * - Change
      - Agents do not write local log anymore (except with `write_log: true` in config)
    * - Change
      - Automatically download newest THOR and signatures every hour (per default, can be disabled)
    * - Change
      - Improved error handling in remote console sessions
    * - Change
      - Improved usability in playbook section
    * - Change
      - Restrict uploads of ioc files with unknown file type
    * - Change
      - Differentiate between rights and restrictions in User Management
    * - Change
      - Improved IOC generation from MISP (reduces false positives)
    * - Change
      - Download API is now protected with unique tokens (validation can be disabled)
    * - Security
      - Improved randomness of login tokens
    * - Security
      - Added CSRF tokens for POST requests
    * - Bugfix
      - Fixed escape problems in windows playbooks
    * - Bugfix
      - Fixed typo in logrotate config
    * - Bugfix
      - Fixed missing filenames in file upload forms
    * - Bugfix
      - Fixed missing role descriptions
    * - Bugfix
      - Fixed wrong permissions of agent installers
    * - Bugfix
      - Fixed missing debian packages for changelog extraction
    * - Bugfix
      - Do not hide other labels when searching for a label
    * - Bugfix
      - Fixed wrong disk usage on ASGARDs that were installed with an ISO
    * - Bugfix
      - Generate a server license for an asset that already has a workstation license but now requires a server license

ASGARD 2.1
##########

ASGARD 2.1.0
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon,  2 Mar 2020 16:12:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Master ASGARD Support
    * - Feature
      - LDAP Authorization
    * - Feature
      - Remote Console
    * - Feature
      - Remote Console Protocol 
    * - Feature
      - Cache THOR on assets (encrypted)
    * - Feature
      - Show asset labels in task tables
    * - Feature
      - Grouped navigation bar items
    * - Feature
      - Role Management
    * - Feature
      - Import / Export client requests as CSV
    * - Feature
      - Download all group task results as tar.gz
    * - Feature
      - Schedule start of group task
    * - Feature
      - Added more lines to group task graphs, e.g. errored tasks
    * - Feature
      - Dynamic playbooks (by using placeholders)
    * - Change
      - Automatically check for updates after license installation
    * - Change
      - Cosmetics
    * - Bugfix
      - Fixed corrupt bifrost files download
    * - Bugfix
      - Threadsafe config writings
    * - Bugfix
      - Changed agent binary directory to /usr/sbin/ due to problems with SELinux
    * - Bugfix
      - Security Fixes - Improved TLS cipher suites and http headers

ASGARD 2.0
##########

ASGARD 2.0.3
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 19 Feb 2020 09:38:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Added missing upgrade script to /etc/nextron/asgard2

ASGARD 2.0.2
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 19 Feb 2020 08:24:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed gz issues on log forwarding to Analysis Cockpit

ASGARD 2.0.1
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Tue, 18 Feb 2020 12:15:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Import / Export assets as CSV
    * - Bugfix
      - Support IE 11 (Protofills, JS syntax error fixes)
    * - Bugfix
      - Fixed spec file for RPM 32bit installer
    * - Bugfix
      - Fixed non-working table filters
    * - Bugfix
      - Fixed upgrade procedure

ASGARD 2.0.0
~~~~~~~~~~~~

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed,  Mon, 17 Feb 2020 14:17:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Major Release
      - Initial release

ASGARD Agent
^^^^^^^^^^^^

Changelog of ASGARD Agent releases since version 1.2.0

Agent 1.6.5
###########

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 24 Oct 2022 15:00:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Support for ASGARD Broker
    * - Change
      - Improved proxy support
    * - Change
      - Improved logging. Logs are now written in log/ subdirectory and rotated based on file size
    * - Change
      - Disabled syslog per default 

Agent 1.5.5
###########

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon,  8 Nov 2021 06:59:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Support for ARM64 MacOS 
    * - Fix
      - Improved stability of task executions on clients with an EDR installed
    * - Fix
      - Gracefully shutdown running tasks on os signals
    * - Fix
      - Improved stability of config file on system crash

Agent 1.4.3
###########

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon,  6 Sep 2021 12:19:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Rebuilt agent with newest Golang Version
    * - Change
      - Removed code fragments used for service controller

Agent 1.4.2
###########

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Tue, 11 May 2021 05:16:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Signed MacOS binaries with a new certificate
    * - Fix
      - In some cases the ASGARD Agents sent many DNS requests for a few seconds
    * - Fix
      - Fixed non-starting task after module version upgrade in some cases

Agent 1.3.5
###########

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 28 Sep 2020 10:38:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Exchanged code signing certificate and added time stamping

Agent 1.2.0
###########

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Wed, 19 Feb 2020 09:38:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Major Release
      - Initial release

ASGARD Service Controller
^^^^^^^^^^^^^^^^^^^^^^^^^

Changelog of ASGARD Service Controller releases since version 2.0.5

Service Controller 2.1.2
########################

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Tue, 13 Aug 2022 08:55:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Support for ASGARD Broker
    * - Change
      - Improved proxy support
    * - Change
      - Improved logging. Logs are now written in log/ subdirectory and rotated based on file size 

Service Controller 2.0.7
########################

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Mon, 21 Feb 2022 15:05:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Send more detailed status of currently running services

Service Controller 2.0.6
########################

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Thu,  9 Dec 2021 09:42:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Change
      - Increased max. offline mode time from 4 to 14 days
    * - Bugfix
      - Improved stability in offline mode
    * - Bugfix
      - Fixed sporadically service restarts due to connectivity issues

Service Controller 2.0.5
########################

.. list-table:: 
    :header-rows: 1

    * - Release Date
    * - Thu, 11 Nov 2021 16:38:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Major Release
      - Initial release
