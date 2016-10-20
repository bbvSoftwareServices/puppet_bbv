class{'postgresql::globals':
  encoding => 'UTF-8',
  manage_package_repo => true,
  version =>  '9.6',
}->
class { 'postgresql::server':
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*',
  postgres_password          => 'postgres',

  postgresql::server::db { 'bbvtestdatabase':
    user  => 'bbvuser',
    password => postgresql_password('bbvuser','bbvpassword')
  }
} ->
class { 'postgresql::server::contrib':
  package_ensure => 'present',
}