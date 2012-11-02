class nfs::config {

  file { '/etc/default/nfs-common':
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/nfs/nfs-common',
    notify => Service['nfs-kernel-server'],
  }

}
