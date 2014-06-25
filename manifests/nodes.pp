node default {
  include apt
  include build_essential
  include users
  include git
  include htop
  include memcached
  include imagemagick
  class { 'apache2':
    sitename => 'kitchendaily'
  }
  include apache2_utils
  include php
  include mysql
}