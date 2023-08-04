# ASGARD Management Center Manual

This repository contains all the sources for our online manual of the ASGARD Management Center.

## How to use

You can either use the online version of this manual, which is hosted on ReadTheDocs, or clone the repository and build it locally.

### Online Version

You can find the online version here:  

[https://asgard-manual.nextron-systems.com](https://asgard-manual.nextron-systems.com)

### Offline Version

Clone the repository to your local machine and build the project:

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
