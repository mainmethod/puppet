class apache2($sitename='test') {
  include apache2::install, apache2::config, apache2::service
  Class['apache2::install'] -> Class['apache2::config'] -> Class['apache2::service']
}

class apache2::install {
  package { "apache2":
    ensure => installed,
  }
}

class apache2::config {
  file { "${apache2::sitename}.conf":
    path => "/etc/apache2/sites-available/${apache2::sitename}.conf",
    ensure => file,
    owner => 'root',
    group => 'root',
    content => template('apache2/default.conf.erb')
  }
  file { "${apache2::sitename}":
    ensure => directory,
    path => "/var/www/${apache2::sitename}",
    owner => 'deploy',
    group => 'deploy'
  }
  exec { "disable-default": 
    command => "/usr/sbin/a2dissite 000-default",
  }
  exec { "enable-site": 
    command => "/usr/sbin/a2ensite ${apache2::sitename}",
  }
}

class apache2::service {
  service { "apache2":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true
  }
}