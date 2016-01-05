# == Class dante::params
#
# This class is meant to be called from dante.
# It sets variables according to platform.
#
class dante::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'dante'
      $service_name = 'dante'
    }
    'RedHat', 'Amazon': {
      $package_name = 'dante'
      $service_name = 'dante'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
