# == Class dante::config
#
# This class is called from dante for service config.
#
class dante::config {
  file {$::dante::config_file:
    content => template($::dante::cfg_tmpl_sockd_conf),
    validate_cmd => "${::dante::sockd_cmd} -V -f %",
  }
}
