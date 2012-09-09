include nfs::server

nfs::export { '/data':
  hosts   => '10.1.1.0/24',
  options => 'rw,sync,no_root_squash,no_subtree_check',
}
