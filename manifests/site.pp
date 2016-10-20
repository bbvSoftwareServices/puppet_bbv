node default {

  include debconf

  include oraclejdk

  include postgresql::server::contrib
}