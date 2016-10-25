class puppet_test_container {

  wget::fetch { 'puppettestcontainer download':
    source => 'https://repo.bbvsws.de/nexus/content/repositories/releases/eu/bbv/puppettestcontainer/0.0.1/puppettestcontainer-0.0.1.jar',
    destination => '/tmp/',
    user => 'deployment',
    password => '>7sTK[XroMgx4bg',
    timeout => 10,
    verbose => false,
    cache_dir => '/var/cache/wget',
    before => File['copyfile'],
  }

  file {'copyfile':
    ensure => absent,
    path => '/opt/bbv/puppettestcontainer-0.0.1.jar',
    source => '/tmp/puppettestcontainer-0.0.1.jar',
    before => File['/etc/init.d/puppettestcontainer'],
  }

  file { '/etc/init.d/puppettestcontainer':
    ensure => 'link',
    target => '/opt/bbv/puppettestcontainer-0.0.1.jar',
    before => Service['puppettestcontainer'],
  }

  service { 'puppettestcontainer':
    ensure => running,
    start => 'service pupettestcontainer start',
    stop =>  'service puppettestcontainer stop'
  }

}