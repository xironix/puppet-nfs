class nfs::config {

  if $::operatingsystem == 'Debian' {
    service { 'nfs-common':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => false,
      pattern    => 'rpc.idmapd',
    }

    File['/etc/default/nfs-common'] {
      notify => Service['nfs-kernel-server'],
    }
  }

  file { '/etc/default/nfs-common':
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/nfs/nfs-common',
  }

}
