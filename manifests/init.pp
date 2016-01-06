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
  $package_name        = $::dante::params::package_name,
  $service_name        = $::dante::params::service_name,
  $cfg_tmpl_sockd_conf = 'dante/sockd.conf.erb',
  $sockd_cmd           = $::dante::params::sockd_cmd,
  $config_file         = $::dante::params::config_file,
  $internal_addr       = $::ipaddress,
  $listen_port         = 1080,
  $external_addr       = $::ipaddress,
  $logoutput           = $::dante::params::logoutput,
  $unpriv_user         = $::dante::params::unpriv_user,
  $client_rules        = [{
      mode     => 'pass',
      from     => "${::ipaddress}/32",
      to       => '0/0',
      log      => 'error',
    },{
      mode     => 'block',
      from     => '0/0',
      to       => '0/0',
      log      => 'connect error',
    },
  ],
  $socks_rules        = [{
      mode     => 'pass',
      from     => "${::ipaddress}/32",
      to       => '0/0',
      protocol => 'tcp',
      log      => 'error connect disconnect',
    },{
      mode     => 'block',
      from     => '0/0',
      to       => '0/0',
      log      => 'connect error',
    },
  ],

) inherits ::dante::params {

  validate_string($package_name)
  validate_string($service_name)
  validate_string($cfg_tmpl_sockd_conf)
  validate_absolute_path($sockd_cmd)
  validate_absolute_path($config_file)
  #validate_ip_address($internal_addr)
  validate_string($internal_addr)
  validate_integer($listen_port)
  #validate_ip_address($external_addr)
  validate_string($external_addr)
  validate_string($logoutput)
  validate_string($unpriv_user)
  validate_array($client_rules)
  validate_array($socks_rules)

  class { '::dante::install': } ->
  class { '::dante::config': } ~>
  class { '::dante::service': } ->
  Class['::dante']
}
