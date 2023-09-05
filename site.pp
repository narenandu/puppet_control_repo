node default {
  file { '/root/README':
    ensure => file,
    content => 'This is a readme',
    owner   => 'root',
  },
  file { '/root/README_FOR_SURE':
    ensure => file,
    content => 'This is a readme by me',
    owner   => 'root',
  }
}
