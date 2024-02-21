.. index:: Aurora too many False Positives

Aurora has too many False Positives
===================================

In some environments, Aurora might generate a high amount of False
Positives. This should never be the case, since Aurora should only
alert on very few and mostly important findings. Most likely a rule
is matching on the environment and generates too many false positives.
To circumvent this, you can disable the rule and set a filter later on.
For Tuning, please see :ref:`administration/sigma:false positive tuning of sigma rules`.