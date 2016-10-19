class install {
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
  }

  package { 'oracle-java8-set-default':
    ensure  => installed,
    require => Package['oracle-java8-installer'],
  }
}