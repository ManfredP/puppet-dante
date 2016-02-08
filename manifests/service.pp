# == Class dante::service
#
# This class is meant to be called from dante.
# It ensure the service is running.
#
class dante::service {

  service { $::dante::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    restart    => $::dante::reload_cmd,
  }
}
