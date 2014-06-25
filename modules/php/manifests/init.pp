class php {
  include php::install
}

class php::install {
  package { "php5":
    ensure => installed,
  }
}