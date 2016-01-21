windowsbox
==========

Provides a starting point for those times when you need to do something on a windows box.

Just do

    vagrant up

and you are good to go! :)

You can add further provisioning to the `windowsbox.pp` Puppet manifest.

To run puppet again, do:

    vagrant provision --provision-with=puppet


Interacting with the box
------------------------

You can `vagrant ssh` into the box if need be, but it is recommended you run

    vagrant plugin install vagrant-winrm

to be able to run commands with:

    vagrant winrm -c 'Write-Host "I am a PowerShell script running in the box!"'

Keep in mind that the current directory will be mounted as `C:/vagrant`.


Requirements
------------

Tested with Vagrant 1.7.2 on Ubuntu 14.04.
