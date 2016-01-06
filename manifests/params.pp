# == Class dante::params
#
# This class is meant to be called from dante.
# It sets variables according to platform.
#
class dante::params {
  case $::osfamily {
    'RedHat': {
      if 0 + $::operatingsystemmajrelease == 7 {
        $package_name = 'dante-server'
        $service_name = 'sockd'
        $sockd_cmd    = '/usr/sbin/sockd'
        $config_file  = '/etc/sockd.conf'
        $logoutput    = 'stderr'
        $unpriv_user  = 'nobody'
      } else {
        fail("${::operatingsystem} ${::operatingsystemmajrelease} not supported")
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
