# == Class: dante
#
# Full description of class dante here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class dante (
  $package_name = $::dante::params::package_name,
  $service_name = $::dante::params::service_name,
) inherits ::dante::params {

  # validate parameters here

  class { '::dante::install': } ->
  class { '::dante::config': } ~>
  class { '::dante::service': } ->
  Class['::dante']
}
