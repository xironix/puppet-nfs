class nfs::config {

  service { 'nfs-common':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    pattern    => 'rpc.idmapd',
  }

  file { '/etc/default/nfs-common':
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/nfs/nfs-common',
    notify => Service['nfs-common'],
  }

}
