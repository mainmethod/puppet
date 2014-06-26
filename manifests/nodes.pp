node default {
  include apt
  include build_essential
  include users
  include git
  include htop
  include memcached
  include imagemagick
  class { 'apache2':
    sitename => 'drupal_site'
  }
  include apache2_utils
  class { 'php': 
    modules => ['php5-mysql','php5-curl','php5-imagick','php5-memcached']
  }
  include mysql
}