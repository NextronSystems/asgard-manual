Management Center v3.2
======================

Management Center 3.2.2
-----------------------

Release Date: Fri, 30 Jan 2026 11:45:00 +0100

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed AIX compatibility issue where the binary was only running on AIX 7.3; now supports AIX 7.2 again
    * - Bugfix
      - Fixed THOR Launcher deadlock when THOR subprocess received an external termination signal

Management Center 3.2.1
-----------------------

Release Date: Wed, 17 Dec 2025 12:27:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed an issue where agents appeared offline and could not download the Agent Core due to exhausted module download slots caused by agents with repeated download failures (e.g., due to full disks)

Management Center 3.2.0
-----------------------

Release Date: Thu,  2 Oct 2025 11:26:00 +0200

----

* Features

  - Added ``Max. concurrent tasks`` / ``Max. concurrent scans`` setting on group tasks to limit parallel execution; excess tasks are queued until running ones finish
  - Enhanced the Sigma False Positive Filters Builder to support more complex conditions, including filter groups with configurable AND/OR logic both at the group and individual filter level
  - Added functionality for users to add or remove custom tags to Sigma rules, which are dynamically appended to the rules when transmitted to endpoints
  - New "Resolve Duplicate Assets" feature that deletes all detected duplicates at once so endpoints reconnect as new assets and each will get its own authentication token

----

* Improvements

  - Agents now remove a broader set of outdated THOR versions to reclaim disk space
  - Unsupported or deprecated THOR scan options are now clearly highlighted in yellow when configuring scans, making them easy to identify and remove

----

* Bugfixes

  - The agent for AIX is now built with a more modern AIX build server
  - Fixed an issue with THOR log cleanup on endpoints
  - Fixed a temporary issue where some temp directories on endpoints were not immediately cleaned up after use
  - Agents that were deleted are now reliably stopped
