node default {

  notice("Running Puppet version $::clientversion")

  include chocolatey

  package {'vim':
    provider => chocolatey,
  }

}
