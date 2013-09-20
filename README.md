Overview
========
**backseat** is an observer for network based backups.

Features
--------
  - Customizable notifications
  - RSS feeds 
  - Exec functions

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
  - ...

Installation
------------
To install backseat run:
```
# gem install backseat
```

Afterwards you need to configure your backup candidates and their notifications in
the configuration file `/etc/backseat.yml`. See the Configuration section below.

Configuration
-------------
Backseats configuration file is placed in `/etc/backseat.yml`. Backseat uses
the data serialization format YAML for it's configuration files.

```YAML
#
# Backseat basic configuration
#
backseat:

  # the RSS settings which are used if there is 
  # something to notify.
  rss:
    author: Jens Nazarenus
    title: Backups
    output: /srv/http/htdocs/backup.rss

  # The executable settings
  # $1: notification type (nobackup, newbackup)
  # $2: backup candidate
  # $3: backup candidate's root directory
  exec:
    executable: /usr/local/bin/myscript.sh


#
# Candidates configuration section
#
candidates: 

  host1:
    root: /srv/nfs4/backups/host1
    backuptool: storebackup

    notifications:
      nobackup:
        expire: 3
        via: [rss]
      newbackup:
        via: [exec, rss]

  host2:
    root: /srv/nfs4/backups/host2
    backuptool: storebackup

    notifications:
      nobackup:
        expire: 10
        via: [rss]
      newbackup:
        via: [exec, rss]
```

Contribution
------------
Coming soon.

License and Copyright
=====================
Licensed under the GNU General Public License 3.

(C) Jens Nazarenus, 2013
