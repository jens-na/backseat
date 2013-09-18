Overview
========
backseat is an observer for network based backups.

Features
--------
  - Customizable notifications
  - serverside pre-exec and post-exec actions

Support
-------
backseat supports network backups of the following backup utilities out of 
the box:

  - rsnapshot
  - storebackup

Anyway, it is easy to write your own implementation for your favorite backup utility. 
Take a look at the Contributing section.

Dependencies
------------
  - ruby

Installation
------------

To install backseat run:
```
# gem install backseat
```
After the installation you have to prepare your filesystem for backseat. The
default root directory is `/srv/backseat`.

In this directory the backup candidates and their backups resides.

Example structure:
```
/srv/backseat/host1/
/srv/backseat/host1/backup-2013-09-12/
/srv/backseat/host1/backup-2013-09-11/
/srv/backseat/host2/
/srv/backseat/host2/backup-2013-09-12/
/srv/backseat/host2/backup-2013-09-11/
```

It's also possible to use symbolic links to connect the backup candidates
with
the backups.

Example:
```
ln -s /srv/nfs4/backups/host1/ /srv/backseat/host1/
```
Configuration
-------------
Backseats configuration file is placed in `/etc/backseat.yml`. Backseat uses
the data serialization format YAML for it's configuration files.

```YAML
#
# Backseat basic configuration
#
backseat:
  root: /srv/backseat/

#
# Host configuration section
#
grace:
  preexec:
  postexec:
  notifications: [nobackup]

tiros:
  preexec: 
  postexec:
  notifications: [nobackup, newbackup]

#
# Notification section
#
notifications:

  # No backup available for N days.
  nobackup:
    active: true
    days: 3
    via: [api, rss, mail]
    message: |
      No backup of %1 for %2 days.

  # New backup available
  newbackup:
    active: true
    via: [api, rss, mail]
    message: |
      New backup of %1 available.
```

Contributing
------------

License and Copyright
=====================
Licensed under the GNU General Public License 3.

(C) Jens Nazarenus, 2013
