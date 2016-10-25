node default {

  include debconf

  include oraclejdk

  include postgresql::server::contrib

  include puppet_test_container
}