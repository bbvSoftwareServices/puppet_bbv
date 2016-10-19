# Oracle JDK module.
class oraclejdk {

  if $::operatingsystem == 'Debian' and $::architecture == 'amd64' {
    package { 'debconf-utils':
      ensure => 'installed',
    }

    # sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
    apt::key { 'webupd8team-key':
      ensure => present,
      # id   => 'EEA14886',
      id     => '7B2C3B0889BF5709A105D03AC2518248EEA14886',
      server => 'hkp://keyserver.ubuntu.com:80',
      require => Class['aptrepo']
    }

    # echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise
    # main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list

    apt::source { 'webupd8team-source':
      location => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
      release  => 'precise',
      repos    => 'main',
      include  => {
        'src' => true,
        'deb' => true,
      },
      require  => Apt_Key['webupd8team-key'],
    }

    include install
  }
}
