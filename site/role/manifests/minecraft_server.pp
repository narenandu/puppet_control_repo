class role::minecraft_server {
  class{'minecraft':
    install_dir => '/srv/minecraft'
  }
}
