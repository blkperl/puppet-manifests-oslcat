class mad_base {
  include ntp
  # include networking
  # include networking::wicd

  service { "NetworkManager":
    enable => false,
  }

  service { "wicd":
    enable => true,
  }

  include bash
  include keychain

  util::system_package { "fuse-sshfs":
    ensure => present,
  }

  include awesome
  include firefox
  include mplayer
  include puzzles
  include sakura

  include slim

  include fonts::inconsolata

  include users::simpson
}

class mad_audio inherits mad_base {
  include audio::dev
  include midi
}
