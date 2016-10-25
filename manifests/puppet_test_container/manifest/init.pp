class puppet_test_container {

  wget::fetch { 'puppettestcontainer download':
    source => 'https://repo.bbvsws.de/nexus/content/repositories/releases/eu/bbv/puppettestcontainer/0.0.1/puppettestcontainer-0.0.1.jar',
    destination => '/tmp/',
    user => 'download',
    password => 'download',
    timeout => 0,
    verbose => true,
    cache_dir => '/var/cache/wget',
    before => File['/opt/bbv/puppettestcontainer-0.0.1.jar'],
  }

  file {'/opt/bbv':
    ensure => directory,
  }

  file {'/opt/bbv/puppettestcontainer-0.0.1.jar':
    ensure => present,
    source => '/tmp/puppettestcontainer-0.0.1.jar',
    before => File['/etc/init.d/puppettestcontainer'],
  }

  file { '/etc/init.d/puppettestcontainer':
    ensure => 'link',
    target => '/opt/bbv/puppettestcontainer-0.0.1.jar',
    #before => Service['puppettestcontainer'],
  }

  service { 'puppettestcontainer':
    ensure => running,
    enable => true,
    require => File["/etc/init.d/puppettestcontainer"],

  }

}