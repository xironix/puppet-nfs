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

**export** — A hash of hosts and options for an export. Allows one to specify a single nfs export with multiple hosts & options per host

	nfs::export { '/data/nfs':
	  export => {
	    # host           options
	    '10.1.1.0/24' => 'rw,sync,no_root_squash,no_subtree_check',
	    '192.168.1.1' => 'ro,async',
	  },
	}

## Authors

[Sergey Stankevich](https://github.com/stankevich)
[Steffen L. Norgren](https://github.com/xironix)