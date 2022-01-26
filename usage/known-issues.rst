Known Issues
=============

AMC#001: API Documentation Curl Examples Not Working
----------------------------------------------------

Since ASGARD 2.12.8 the API documentation is not showing the API key in example queries as it should and did.

..
    Source of Issue
    ~~~~~~~~~~~~~~~
    add after source is known

Workaround
~~~~~~~~~~
You need to manually add ``-H 'Authorization: <your-API-key>'`` to your queries.

Example with API endpoint ``/playbooks/search``:

    Non-working curl example:

    .. code::

       curl -X 'GET' \
         'https://asgard.local:8443/api/v1/playbooks/search?limit=1' \
         -H 'accept: application/json'


    Working curl example:

    .. code::

       curl -X 'GET' \
         'https://asgard.local:8443/api/v1/playbooks/search?limit=1' \
         -H 'accept: application/json' \
         -H 'Authorization: <your-API-key>'

You also need the ``--insecure`` curl flag, if you are using the self-signed certificate that ASGARD shipped with.

Status
~~~~~~
Work in progress.

