class php($modules=[]) {
  include php::install, php::modules
  Class['php::install'] -> Class['php::modules']
}

class php::install {
  package { "php5":
    ensure => installed,
  }
}

class php::modules {
  package { $php::modules: 
    ensure => installed,
  }
}