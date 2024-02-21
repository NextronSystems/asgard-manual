.. Index:: Verify the ISO

Verify the Downloaded ISO (Optional)
------------------------------------

You can do a quick hash check to verify that the download was not corrupted.
We recommend to verify the downloaded ISO's signature as this is the cryptographically sound method.

The hash and signature file are both part of the ZIP archive you download
from our `portal server <https://portal.nextron-systems.com>`__.

Via Hash
^^^^^^^^

Extract the ZIP and check the sha256 hash:

On Linux

.. code-block:: console

  user@unix:~/nextron-universal-installer$ sha256sum -c nextron-universal-installer.iso.sha256
  nextron-universal-installer.iso: OK

or in Windows command prompt

.. code-block:: doscon

  C:\temp\nextron-universal-installer>type nextron-universal-installer.iso.sha256
  efccb4df0a95aa8e562d42707cb5409b866bd5ae8071c4f05eec6a10778f354b  nextron-universal-installer.iso
  C:\temp\nextron-universal-installer>certutil -hashfile nextron-universal-installer.iso SHA256
  SHA256 hash of nextron-universal-installer.iso:
  efccb4df0a95aa8e562d42707cb5409b866bd5ae8071c4f05eec6a10778f354b
  CertUtil: -hashfile command completed successfully.

or in Powershell

.. code-block:: ps1con

  PS C:\temp\nextron-universal-installer>type .\nextron-universal-installer.iso.sha256
  efccb4df0a95aa8e562d42707cb5409b866bd5ae8071c4f05eec6a10778f354b  nextron-universal-installer.iso
  PS C:\temp\nextron-universal-installer>Get-FileHash .\nextron-universal-installer.iso
  
  Algorithm       Hash                                                                   Path
  ---------       ----                                                                   ----
  SHA256          EFCCB4DF0A95AA8E562D42707CB5409B866BD5AE8071C4F05EEC6A10778F354B       C:\Users\user\Desktop\asgard2-installer\nextron-universal-installer.iso

Via Signature (Recommended)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Extract the ZIP, `download the public signature <https://www.nextron-systems.com/certificates-and-keys>`__
and verify the signed ISO:

On Linux

.. code-block:: console

  use@unix:~/temp$ wget https://www.nextron-systems.com/certs/codesign.pem
  use@unix:~/temp$ openssl dgst -sha256 -verify codesign.pem -signature nextron-universal-installer.iso.sig nextron-universal-installer.iso
  Verified OK

or in Powershell

.. code-block:: ps1con

  PS C:\temp\nextron-universal-installer>Invoke-WebRequest -Uri https://www.nextron-systems.com/certs/codesign.pem -OutFile codesign.pem
  PS C:\temp\nextron-universal-installer>"C:\Program Files\OpenSSL-Win64\bin\openssl.exe" dgst -sha256 -verify codesign.pem -signature nextron-universal-installer.iso.sig nextron-universal-installer.iso
  Verified OK

.. note::
  If ``openssl`` is not present on your system you can easily install
  it using winget: ``winget install openssl``.
