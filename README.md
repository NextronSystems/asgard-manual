# ASGARD Management Center Manual

This repository contains all the sources for our online manual of the ASGARD Management Center.

## How to use

You can either use the online version of this manual, which is hosted on ReadTheDocs, or clone the repository and build it locally.

### Online Version

You can find the online version here:  

[https://asgard-manual.nextron-systems.com](https://asgard-manual.nextron-systems.com)

### Offline Version

You have two options if you want to download and use the manual offline.

#### Direct Download

You can navigate to the ReadTheDocs page of the [ASGARD Management Center Manual](https://asgard-manual.nextron-systems.com) and click the bottom left label which says ``v: latest``.
You can find older versions of the manual, but most importantly, you can download the currently selected version for offline viewing.
Just choose one of the formats you would like to use.

#### Using git

You can use ``git`` to clone the repository to your local machine and build the project. This method is more geared towards developers who want to contribute towards the project.

``` bash
$ git clone https://github.com/NextronSystems/asgard-manual.git
$ python3 -m venv venv
$ source venv/bin/activate
$ cd asgard-manual
$ pip install -r requirements.txt
$ make html
```

You will see a folder called ``_build`` in the current directory. In this folder you can find another folder called ``html``, which contains ``index.html``. You can open this file with a browser of your choice and 
browse the manual locally.
