include nfs::server

nfs::export { '/data/nfs':
  export => {
    '10.1.1.0/24' => 'rw,sync,no_root_squash,no_subtree_check',
    '192.168.1.1' => 'ro,async',
  },
}
