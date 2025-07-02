<!-- vim: set conceallevel=0: -->
# raspiBackup

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

Note: This file here (SUMMARY.md) is used by *mdbook* to determine the
contents and structure of the book to be generated.

Following data is read for this:

  - the headings level 1 (#)
  - links for prefix- and suffix-chapters
  - all lists (even nested)
  - horizontal rules ---

Lists are only allowed to have links in it.
All links are title of the chapter and the name of the correspondig file.

That allows for some tricks:

1.) Comments are possible in this file. E.g.:
    a.) This leading note. Additionally the comment is marked up as codeblock.
        So the list above won't be parsed as such.
    b.) "TODO marker" or similar.

2.) Chapters can be "deactivated" by making the link invalid.

    For example:

    private](very-private.md)

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
```


[Introduction](introduction.md)

- [Function overview](function-overview.md)

- [Supported hardware and software](supported-hardware-and-software.md)
    - [Raspberry Pi OS / RaspbianOS](support-for-raspbianos.md)
    - [Ubuntu](ubuntu-support.md)
    - [Compute Module](support-for-raspberry-compute-module-4-and-nvme.md)

- [Language support](language-support.md)

- [Installation and first backup](installation.md)
    - [Installation in 5 minutes](installation-in-5-minutes.md)
    - [Manual installation and configuration](manual-installation-and-configuration.md)
    - [Statistics](statistics.md)
    - [Updates](updates.md)

- [Restore](restore.md)
    - [Restore with raspiBackup](full-restore.md)
    - [Manual restore](manual-restore.md)
    - [Restore single files/directories](how-to-retrieve-single-files-or-directories-from-the-backup.md)

- [Details zum Aufruf und zur Konfiguration](details.md)
    - [Usage and options](usage-and-options.md)
    - [Backup types and decision tree](backuptypes.md)
    - [Comparing partition orientated and normal backup](normal-or-partition-backup.md)
    - [Backup directory structure](backup-directory-structure.md)
    - [Rotation strategy](smart-recycle.md)
    - [Snapshots](snapshots.md)

    - [Configuration update when upgradung to e new version](configuration-update-when-upgrading-to-a-new-version.md)
    - [Hooks for own scripts](hooks-for-own-scripts.md)

    - [Configuration examples](configuration-examples.md)
        - [msmtp configuration for a web.de account](msmtp-configuration-for-web-de-account.md)
        - [exim4 configuration](exim4-configuration.md)
        - [nullmailer configuration](nullmailer-configuration.md)

- [Frequently asked questions / FAQ](faq.md)

- [More questions and answers](more-questions-and-answers.md)
    - [Which filesystem can be used on the backup partition](which-filesystem-can-be-used-on-the-backup-partition.md)
    - [How do hardlinks work with rsync](how-do-hardlinks-work-with-rsync.md)
    - [Why shouldn't you use dd as backup type](why-shouldn-t-you-use-dd-as-backup-type.md)
    - [How to create a cold standby clone with raspiBackup](how-to-create-a-cold-standby-clone-with-raspibackup.md)
    - [Migrate the Raspberry OS from sd-card to ssd, usb-disk or usb-pen-drive](migrate-the-raspberry-os-from-sd-card-to-ssd-usb-disk-or-usb-pen-drive.md)
    - [How can I install and test the beta version](how-can-i-install-and-test-the-beta-version.md)

- [Error messages](error-messages.md)

- [Helper scripts](helper-scripts.md)
    - [raspiBackupDialog - a convenient helper script](raspibackupdialog-a-convenient-helper-script-for-raspibackup.md)
    - [More helpful scripts](useful-helper-scripts.md)

- [Other backupspaces](more-backupspaces.md)
    - [Synology/NAS as backupspace](synology-as-backupspace.md)
    - [AVM Fritzbox as backupspace](avm-fritzbox-as-backupspace.md)
    - [WEBDAV as backupspace](how-to-use-webdav-on-linux.md)
    - [CIFS/Samba wth autoFS as backupspace](use-a-synology-with-cifs-and-autofs.md)

- [Tips for homeautomation](tips-homeautomation.md)

- [Helpful links regarding backup](helpful-links.md)
- [Other backup tools for Raspberry Pi](other-raspberry-backup-tools.md)

- [Any other business](any-other-business.md)
    - [Version history](version-history.md)
    - [raspiBackup has a new logo](raspibackup-has-a-new-logo.md)
    - [10 years raspiBackup](10-years-raspibackup.md)
    - [Executed regression tests](regressiontests-executed.md)
    - [Development environment](development-environment.md)
    - [Users all over the world](list-of-countries-raspibackup-is-used-in-the-world.md)
    - [Version of this documentation](doc-version-info-automatically-generated.md)


- [English-only pages -- translation/integration required]()

  - [Local language support for languages other than DE and EN (L10N)](local-language-support-for-languages-other-than-de-and-en-l10n.md)
  - [Manual restore of a tgz backup](manual-restore-of-a-tgz-backup.md)
[.status]: todo "Check the remaining english-only file(s)"
