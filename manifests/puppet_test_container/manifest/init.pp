class puppet_test_container {

  wget::fetch { 'puppettestcontainer download':
    source => 'https://github.com/bbvSoftwareServices/bbvmavenrepo/blob/master/eu/bbv/puppettestcontainer/0.0.1/puppettestcontainer-0.0.1.jar',
    destination => '/tmp/',
    timeout => 0,
    verbose => true,
    cache_dir => '/var/cache/wget',
    require => Class['oraclejdk'],
    before => File['/opt/bbv/puppettestcontainer-0.0.1.jar'],
  }

  file {'/opt/bbv':
    ensure => directory,
  }

  file {'/opt/bbv/puppettestcontainer-0.0.1.jar':
    ensure => present,
    source => '/tmp/puppettestcontainer-0.0.1.jar',
    mode => '111',
    before => File['/etc/init.d/puppettestcontainer'],
  }

  file { '/etc/init.d/puppettestcontainer':
    ensure => 'link',
    target => '/opt/bbv/puppettestcontainer-0.0.1.jar',
    before => Service['puppettestcontainer'],
  }

  service { 'puppettestcontainer':
    ensure => running,
    enable => true,
    start => '/etc/init.d/puppettestcontainer start',
    stop => '/etc/init.d/puppettestcontainer stop',
    require => File["/etc/init.d/puppettestcontainer"],

  }

}