# == Class dante::install
#
# This class is called from dante for install.
#
class dante::install {

  package {$::dante::package_name:
    ensure => present,
  }
}
