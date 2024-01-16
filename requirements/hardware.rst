.. Index:: Hardware Requirements

Hardware Requirements
---------------------

ASGARDs hardware requirements depend on the number of connected
endpoints and also on the intended use. For example, you should
consider using more disk space if you are planning to use Bifrost
or ASGARD's evidence collection feature extensively.

.. list-table::
   :header-rows: 1
   :widths: 30, 70

   * - Connected Endpoints
     - Minimum  Hardware Requirements
   * - up to 500 [1]_
     - System memory: 4 GB, Hard disk: 500 GB, CPU Cores: 2
   * - up to 10,000 [1]_
     - System memory: 8 GB, Hard disk: 1TB, CPU Cores: 4
   * - up to 25,000 [1]_
     - System memory: 16 GB, Hard disk: 1TB SSD (min 100 MB/s), CPU Cores: 4

.. [1]
  THOR and AURORA count as individual endpoints in this calculation.
  AURORA is more demanding than THOR. This results in a maximum of 200/4000/10000
  endpoints if THOR **and** AURORA are installed on each endpoint.
