Overview
========
**backseat** is an observer for network based backups.

Features
--------
  - Customizable notifications
  - RSS feeds 
  - Exec functions

Dependencies
------------
  - ruby

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

    notifications:
      nobackup:
        expire: 3
        via: [rss]
      newbackup:
        via: [exec, rss]

  host2:
    root: /srv/nfs4/backups/host2

    notifications:
      nobackup:
        expire: 10
        via: [rss]
      newbackup:
        via: [exec, rss]
```

Usage
-----
Use an alternative configuration file for backseat
```
  # backseat --file /my/path/to/backseat.yml
```

List all configured backup candidates
```
  # backseat --list-candidates
```

Specify an candidate for the backseat CLI program
```
  # backseat --candidate host1
```

Checks if a specified candidate is expired. If `--expired-code` is specified the return value of the program is
used to signal if the candidate is expired:
  - 1: expired
  - 0: not expired

``` 
  # backseat --candidate host1 --expired
  # backseat --candidate host1 --expired-code
```

Returns a list of backups of the specified candidate
``` 
  # backseat --candidate host1 --list-backups
``` 

Prints the latest backup for a backup candidate
``` 
  # backseat --candidate host1 --last-backup
``` 


License and Copyright
=====================
Licensed under the GNU General Public License 3.

(C) Jens Nazarenus, 2013
