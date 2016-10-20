class{'postgresql::globals':
  encoding => 'UTF-8',
  manage_package_repo => true,
  version =>  '9.6',
}->
class { 'postgresql::server':
  listen_addresses           => '*',
}

postgresql::server::pg_hba_rule { 'allow access from 10.20.1.3':
  description => "allow access from 10.20.1.3",
  type => 'host',
  database => 'all',
  user => 'all',
  address => '10.20.1.3/32',
  auth_method => 'md5',
  order       => '002',
}

postgresql::server::db { 'my_application_database':
  user     => 'postgresql',
  password => postgresql_password('postgresql', 'password'),
  require  => Class['postgresql::server'],
}