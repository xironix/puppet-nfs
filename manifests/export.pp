# == Define: nfs::export
#
# Exports NFS share.
#
# === Parameters
#
# [*ensure*]
#  present / absent. Default: present
#
# [*hosts*]
#  Allowed host list.
#
# [*options*]
#  List of NFS options. Default: rw,sync,no_root_squash,no_subtree_check
#
# === Examples
#
# include nfs::server
#
# nfs::export { '/data/nfs':
#   hosts   => '10.1.1.0/24',
#   options => 'rw,sync,no_root_squash,no_subtree_check',
# }
#
# === Authors
#
# Sergey Stankevich
#
define nfs::export (
  $ensure  = present,
  $hosts   = false,
  $options = 'rw,sync,no_root_squash,no_subtree_check'
) {

  # Parameter validation
  if ! $hosts {
    fail('nfs::export: hosts parameter must not be empty')
  }

  concat::fragment { "nfs_export_${name}":
    ensure  => $ensure,
    target  => '/etc/exports',
    order   => '20',
    content => template('nfs/exports.erb'),
  }

}
