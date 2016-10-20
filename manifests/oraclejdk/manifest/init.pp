# Oracle JDK module.
class oraclejdk {

  if $::operatingsystem == 'Debian' and $::architecture == 'amd64' {
    package { "debconf-utils":
      ensure => installed
    }

    apt::pin { 'oracle-java6-installer':
      ensure   => present,
      packages => 'oracle-java6-installer',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'oracle-java7-installer':
      ensure   => present,
      packages => 'oracle-java7-installer',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'oracle-java9-installer':
      ensure   => present,
      packages => 'oracle-java9-installer',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-6-jre':
      ensure   => present,
      packages => 'openjdk-6-jre',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-6-jdk':
      ensure   => present,
      packages => 'openjdk-6-jdk',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-6-jre-headless':
      ensure   => present,
      packages => 'openjdk-6-jre-headless',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-7-jre':
      ensure   => present,
      packages => 'openjdk-7-jre',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-7-jdk':
      ensure   => present,
      packages => 'openjdk-7-jdk',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-7-jre-headless':
      ensure   => present,
      packages => 'openjdk-7-jre-headless',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-8-jre':
      ensure   => present,
      packages => 'openjdk-8-jre',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-8-jdk':
      ensure   => present,
      packages => 'openjdk-8-jdk',
      priority => -1,
      version  => '*',
    }

    apt::pin { 'openjdk-8-jre-headless':
      ensure   => present,
      packages => 'openjdk-8-jre-headless',
      priority => -1,
      version  => '*',
    }

    # sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

    apt::key { 'webupd8team-key':
      ensure => present,
      # id   => 'EEA14886',
      id     => '7B2C3B0889BF5709A105D03AC2518248EEA14886',
      server => 'hkp://keyserver.ubuntu.com:80',
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
      before => Exec['accept-oracle-java8-license'],
    }

    # lint:ignore:80chars
    exec { 'accept-oracle-java8-license':
      command => 'echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections',
      unless  => 'debconf-get-selections | egrep "oracle-java8-installer[[:space:]]shared/accepted-oracle-license-v1-1.*true"',
      path    => '/bin:/usr/bin:/sbin:/usr/sbin',
      before  => Package['oracle-java8-installer'],
    }
    # lint:endignore

    package { 'oracle-java8-installer':
      ensure => installed,
      require => Package['debconf'],
    }

    package { 'oracle-java8-set-default':
      ensure  => installed,
      require => Package['oracle-java8-installer'],
    }
  }
}
