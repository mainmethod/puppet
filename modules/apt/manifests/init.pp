class apt {
  notice("class apt")
  include apt::update
}

class apt::update {
  notice("class apt::update")
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }
}