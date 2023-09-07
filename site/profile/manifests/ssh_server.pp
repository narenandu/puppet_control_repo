class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDnZkhhT9Lq+f05TrYNWhNsrADkgKOFfhVsmWJPBaNNG5LBimfOpc4TL1wZe0SIIKSEbL0iT1vR0bkvw1ngfHx97pzF/wpTb07ZF4pYw0UFmfKbKhep1XVCCMVSXMHyP33PjIPQGLiVGSq0nj5VqRYNxR/0v4x6oW5PUHBDCK2x6gFyMNgwRi2uU8Mv/iDMwRcyf2KuDpYTkVP2zqp8PzoW3UpYSDjum/9iQD0mFiYv276EKMOJ3kp/aMKmBMQtBDUmApP2apwu1L1GuTtN8BIG39I2NzQfVY2A5RnbZFNkXwXc9fWjJFxLH93viNzc/bIKpAUkKe8l1FBDUIhswc9l',
	}
}
