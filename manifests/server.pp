# == Class: nfs::server
#
# Installs and manages NFS server.
#
# === Examples
#
# include nfs::server
#
# === Authors
#
# Sergey Stankevich
#
class nfs::server {

  # Compatibility check
  $compatible = [ 'Debian', 'Ubuntu' ]
  if ! ($::operatingsystem in $compatible) {
    fail("Module is not compatible with ${::operatingsystem}")
  }

  Package['nfs-kernel-server'] -> Service['nfs-kernel-server']

  Nfs::Export <| |> ~> Service['nfs-kernel-server']

  package { 'nfs-kernel-server': ensure => present }

  service { 'nfs-kernel-server':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    pattern    => 'rpc.mountd',
  }

  include concat::setup

  concat { '/etc/exports':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Service['nfs-kernel-server'],
  }

  concat::fragment { 'nfs_config':
    ensure  => present,
    target  => '/etc/exports',
    order   => '10',
    content => '',
    notify  => Service['nfs-kernel-server'],
  }

}
