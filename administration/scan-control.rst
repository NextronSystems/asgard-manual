.. index:: Scan Control

Scan Control
------------

The Scan Control in your ASGARD allows you to run different kind of Scans on one
or multiple assets. Additionally, you can create Scan Templates to use with new
Scans, so the different options don't need to be configured for every new scan.
False-Positive Filters can be set to exclude certain files from scan results,
or even whole directories can be excluded.

Your ASGARD will also take care of THOR scans which stopped (e.g. the asset
rebooted or lost connection to your ASGARD during a scan), so that a scan
will not fail if the asset is temporarily offline.

Managing Scan Templates
^^^^^^^^^^^^^^^^^^^^^^^

Scan templates are the most convenient way to make use of THOR's rich set of
scan options. Starting with ``ASGARD 1.10``, it is possible to define scan parameters
for THOR 10 and store them in different templates for later use in single scans
and grouped scans. 

Imagine you want to use dedicated scan options for different system groups (e.g.
Linux Servers, Domain Controllers, Workstations, etc.) and make sure to use exactly
the same set of scan options every time you scan a particular group of systems.
With ASGARD you can now add a scan template for every group.

A popular use case for scan templates is providing additional resource control – for
example telling THOR to set the lowest process priority for itself and never
use more than 50% of CPU. 

Please keep in mind, that we have already optimized THOR to use the most relevant
scan options for a particular system (based on type, numbers of CPUs and system resources)
and a comprehensive resource control is enabled by default. 

For more details please refer to the `THOR manual <https://thor-manual.nextron-systems.com/en/latest/>`_.
Only use the scan templates if you want to deviate from the default for a reason.

Scan templates are protected from being modified by ASGARD users without the
"Manage Scan Templates"-permission and can also be restricted from being used
by ASGARD users in case the flag "ForceStandardArgs" is set for this user.
(See section :ref:`administration/users:restrictions` for details).

By clicking the ``Import Scan Template`` button you can import a previously exported scan template.

.. figure:: ../images/scan-templates-overview.png
   :alt: Scan Templates

   Scan Templates Overview

In order to create a scan template, navigate to ``Scan Control`` > ``Scan Templates``
and click the ``Add Scan Template`` button. The ``Add Scan Template`` dialogue appears.
The current THOR scanner version is chosen for you by default but can be changed if needed.

After choosing or changing a scanner you will find the most frequently used options on
the top of this page in the "Favorite Flags" category. View all THOR options by
clicking on the other categories or quickly search for known flags in the search bar.
By clicking on the star symbols you can also edit your personal favorites. 

.. figure:: ../images/scan-flags.png
   :alt: Scan Flags

   Scan Flags

By checking the "Default" box, you can make this scan template the default template
for every new scan. There can only be one default template at a time and selecting
the box will uncheck a previous default, if set.
Checking the "Restricted" flag will make the template restricted, meaning only a
restricted set of users can use the template for scans. The set of users consists
of all users who do not have the "ForceStandardArgs" restriction set. (By default
this are all users who are not member of the group "Operator Level 1").
After clicking the "Add Template" button on the bottom of the template page, an
overview of all existing scan templates is shown. 

THOR Excludes and False-Positive Filters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In THOR you can define `directory and file excludes <https://thor-manual.nextron-systems.com/en/latest/usage/configuration.html#files-and-directories>`_
and `false positive filters <https://thor-manual.nextron-systems.com/en/latest/usage/configuration.html#false-positives>`_.
With ASGARD 2.13+ these features can be globally defined in ASGARD at ``Scan Control`` > ``THOR Config``.

.. figure:: ../images/scan-exclude-and-fp.png
   :alt: Scan Control - Global Directory Exclude and FP Filtering

   Scan Control - Global Directory Exclude and FP Filtering

.. warning::
   Be careful not to use too broad filters or excludes as this might
   cripple THOR's detection capabilities, if done incorrectly.