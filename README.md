[puppet-nfs](https://github.com/stankevich/puppet-nfs)
======

Puppet module for installing and managing NFS client and server.

## Usage

### nfs

Installs and manages NFS client services.

	include nfs

### nfs::server

Installs and manages NFS server.

	include nfs::server

### nfs::export

Exports NFS share.

**ensure** — present/absent. Default: present

**hosts** — Allowed host list.

**options** — List of NFS options. Default: rw,sync,no_root_squash,no_subtree_check

	nfs::export { '/data/nfs':
	  hosts   => '10.1.1.0/24',
	  options => 'rw,sync,no_root_squash,no_subtree_check',
	}

## Authors

[Sergey Stankevich](https://github.com/stankevich)
