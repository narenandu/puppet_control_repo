class minecraft(
  $url = 'https://piston-data.mojang.com/v1/objects/e9f105b3c5c7e85c7b445249a93362a22f62442d/server.jar',
  $install_dir = '/opt/minecraft'
){
  file {$install_dir:
    ensure => directory,
  }
  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file{"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file{'/etc/systemd/system/minecraft.service':
    ensure => file,
    #source => 'puppet:///modules/minecraft/minecraft.service'
    content => epp('minecraft/minecraft.service', {
      install_dir => $install_dir,
    })
  }
  service{'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service']],
  }
}
