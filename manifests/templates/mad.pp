class mad_base {
  include ntp
  include networking
  include networking::wicd

  include bash
  include keychain

  include awesome
  include firefox
  include puzzles
  include sakura

  include fonts::inconsolata

  include users::simpson
}
