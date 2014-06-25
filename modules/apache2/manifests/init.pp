class apache2 {
  notice("class apache2")
  include apache2::install, apache2::config, apache2::service
  Class['apache2::install'] -> Class['apache2::config'] -> Class['apache2::service']
}

class apache2::install {
  notice("class apache2::install")
  package { "apache2":
    ensure => installed,
  }
}

class apache2::config {
  
}

class apache2::service {
  notice("class apache2::service")
  service { "apache2":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true
  }
}