# $title is the name of the user this config should exist for
define vim::user_config (
  $home="/home/${title}",
  $pathogen=false,
  $template="vim/vimrc.erb"
) {
  @file {
    "vim_dir_${title}":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim",
      ensure => directory;
    "vim_ftdetect_dir_${title}":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim/ftdetect",
      ensure => directory;
    "vim_ftplugin_dir_${title}":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim/ftplugin",
      ensure => directory;
    "vim_syntax_dir_${title}":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim/syntax",
      ensure => directory;
    "vim_autoload_dir_${title}":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim/autoload",
      ensure => directory;

    "vimrc_${title}":
      tag       => "vim",
      owner     => "${title}",
      group     => "users",
      path      => "${home}/.vimrc",
      content   => template("${template}");
    "vim_zsh_${title}":
      tag       => "zsh",
      owner     => "${title}",
      group     => "users",
      path      => "${home}/.zshrc.d/vim",
      content   => template("vim/vim_zshrc.erb");
  }

  if $pathogen {
    @file {
      "${title}_pathogen_autoload":
        path   => "${home}/.vim/autoload/pathogen.vim",
        source => "puppet:///modules/vim/pathogen/autoload/pathogen.vim",
        ensure => present,
        tag    => "vim";
      "${title}_pathogen_bundle":
        path   => "${home}/.vim/bundle",
        ensure => directory,
        tag    => "vim";
    }

    Vcsrepo <| tag == "${title}_pathogen" |>
  }
}

