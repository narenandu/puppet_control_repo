node default {
    file{'/root/README':
      ensure => file,
      owner => 'root',
      content => 'This is a README file',
    }
}

node 'master.puppet.vm' {
  include role::master_server
}

node /^web/ {
  include role::app_server
}
node /^db/ {
  include role::db_server
}
