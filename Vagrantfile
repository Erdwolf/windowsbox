Vagrant.configure(2) do |config|
  # Using Windows 2012 R2 since it comes with .NET 4.5 preinstalled
  config.vm.box = "opentable/win-2012r2-standard-amd64-nocm"

  config.vm.define :dev do |dev|
    # Install ruby
    dev.vm.provision "install-ruby", type: :shell, privileged: false, inline: <<-POWERSHELL
      ((new-object net.webclient).DownloadFile('https://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.3-x64.exe','rubyinstaller.exe'))
      ./rubyinstaller.exe /verysilent /tasks="modpath"
      $env:PATH+=';C:/Ruby22-x64/bin'
    POWERSHELL
    # Install puppet (from gem)
    dev.vm.provision "gem-install-puppet", type: :shell, inline: 'gem install puppet -v 4.3.1'
    ## Install puppet-chocolatey integration
    dev.vm.provision "install-puppet-chocolatey", type: :shell, inline: 'puppet module install chocolatey-chocolatey'
    # Run puppet apply to do the rest of the provisioning
    dev.vm.provision "puppet", type: :shell, run: "always", inline: <<-POWERSHELL
      $env:FACTER_SERVERVERSION="4.3.1"
      puppet apply /vagrant/windowsbox.pp
    POWERSHELL
  end

end
# vi: set ft=ruby :
