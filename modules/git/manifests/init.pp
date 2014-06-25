class git {
  notice("class git")
  include git::install
}

class git::install {
  notice("class git::install")
  package { "git": 
    ensure => present
  }
}