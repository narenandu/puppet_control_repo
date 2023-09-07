class minecraft{
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar',
  }
  package {'java':
    ensure => present,
  }
  file{'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file{'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service'
  }
  service{'minecraft':
    ensure => running,
    enable => true,
  }
}
