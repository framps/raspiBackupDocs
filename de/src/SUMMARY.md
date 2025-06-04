# raspiBackup

[Einführung](introduction.md)

[Kontakmöglichkeiten](contact.md)

[Danksagungen](thanks.md)

[Trinkgeld](donations.md)

[Haftungsausschluss](legals.md)

- [Funktionsübersicht von Website](function-overview.md)
- [Funktionsübersicht aus Benutzerhandbuch](function-overview2.md)

- [Benutzerhandbuch](usermanual.md)

- [Unterstützte Hardware und Software](supported-hardware-and-software.md)
    - [Unterstützung für Raspberry Compute Module 4 und NVMe](support-for-raspberry-compute-module-4-and-nvme.md)
    - [Raspberry3 USB Boot Unterstützungstestmatrix](raspberry3-support-test-matrix.md)
    - [Nutzung von WEBDAV als Backupziel für raspiBackup](nutzung-von-webdav-als-backupziel-fuer-raspibackup.md)
    - [Nutzung einer AVM Fritzbox als Backupziel für raspiBackup](nutzung-einer-avm-fritzbox-als-backupziel-fuer-raspibackup.md)

- [Sprachunterstützung](language-support.md)

- [Installation](installation.md)
    - [Installation in 5 Minuten](installation-in-5-minutes.md)
    - [Manuelle Installation und Konfiguration](manual-installation-and-configuration.md)
    - [Updates](updates.md)
    - [Konfigurationsupdate bei einem Upgrade auf eine neue Version](configuration-update-when-upgrading-to-a-new-version.md)
    - [Erweiterungsmöglichkeiten](hooks-for-own-scripts.md)
    - [Statistiken](statistics.md)

- [Installation, Grundeinstellungen, Erstes Backup und Restore](installation-grundeinstellungen-erstes-backup-und-restore.md)

- [Backuptype und Entscheidungsbaum](backuptypes.md)
- [Vergleich partitionsorientierter Backup und normaler Backup](normal-or-partition-backup.md)
- [Backupverzeichnisstruktur](backup-directory-structure.md)
- [Rotationsstrategie](intelligent-rotation-strategy.md)
- [Snapshots](snapshots.md)

- [Wiederherstellen/Restore](restore.md)
    - [Manueller Restore eines Backups](manual-restore.md)

- [Konfigurationsbeispiele](configuration-examples.md)
    - [Konfiguration von raspiBackup mit mSMTP für einen web.de Account](konfiguration-von-raspibackup-mit-msmtp-fuer-einen-web-de-account.md)
    - [exim4 konfigurieren](exim4-konfigurieren.md)
    - [nullmailer konfigurieren](nullmailer-konfigurieren.md)

- [Aufruf und Optionen](usage-and-options.md)

- [Fragen und Antworten]()
    - [FAQ](faq.md)
    - [Allgemeine Fragen](general-questions.md)
    - [Welches Dateisystem kann auf der Backuppartition benutzt werden?](which-filesystem-can-be-used-on-the-backup-partition.md)
    - [Wie funktionieren Hardlinks zusammen mit rsync](how-do-hardlinks-work-with-rsync.md)
    - [Warum sollte man dd als Backupmethode besser nicht benutzen?](why-shouldn-t-you-use-dd-as-backup-method.md)
    - [Wie kann man mit raspiBackup einen Clone erstellen?](how-to-create-a-cold-standby-clone-with-raspibackup.md)
    - [Umziehen des Raspberry Betriebssystems von SD Karte auf SSD, USB Platte oder USB Stick](migrate-the-raspberry-os-from-sd-card-to-ssd-usb-disk-or-usb-pen-drive.md)
    - [Wie kann ich die Betaversion installieren und ausprobieren ?](how-can-i-install-and-test-the-beta-version.md)

- [Fehlermeldungen und -suche](error-messages.md)

- [Hilfsprogramme]()
    - [raspiBackupDialog - ein komfortables Hilfsscript für raspiBackup](raspibackupdialog-a-convenient-helper-script-for-raspibackup.md)
    - [Nützliche Hilfsprogramme](useful-helper-scripts.md)

- [Hilfreiche Links zum Thema Backup](helpful-links.md)
- [Weitere Backuptools fuer die Raspberry](other-raspberry-backup-tools.md)
- [Tipps zur Homeautomation](tips-homeautomation.md)
- [Synology/NAS](synology-as-backupspace.md)
- [Ubuntu Support](ubuntu-support.md)

- [Internes]()
  - [Versionshistorie](versionshistory.md)
  - [raspiBackup hat ein neues Logo](raspibackup-has-a-new-logo.md)
  - [10 Jahre raspiBackup](10-years-raspibackup.md)
  - [Ausgeführte Regressiontests vor der Veröffentlichung einer neuen Release](regressiontests-executed.md)
  - [Entwicklungsumgebung](developmentenvironment.md)

  - [Nutzer in aller Welt](list-of-countries-raspibackup-is-used-in-the-world.md)


# WORK-IN-PROGRESS - Originalseiten zur Recherche

#  English-only pages ...

  - [How to restore single files or directories from the backup](how-to-retrieve-single-files-or-directories-from-the-backup.md)  # https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/596-how-to-retrieve-single-files-or-directories-from-the-backup ←→
  - [Local language support for languages other than DE and EN (L10N)](local-language-support-for-languages-other-than-de-and-en-l10n.md)  # https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/603-local-language-support-for-languages-other-than-de-and-en-l10n ←→
  - [Manual restore of a tgz backup](manual-restore-of-a-tgz-backup.md)  # https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/646-raspibackup-manual-restore-of-a-tgz-backup ←→
  - [/usr/sbin/NetworkManager: error while loading shared libraries: libhogweed.so.4: cannot open shared object file: No such file or directory](usr-sbin-networkmanager-error-while-loading-shared-libraries-libhogweed-so-4-cannot-open-shared-object-file-no-such-file-or-directory.md)  # https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/677-usr-sbin-networkmanager-error-while-loading-shared-libraries-libhogweed-so-4-cannot-open-shared-object-file-no-such-file-or-directory ←→

## Doppelte Dateinamen

  Häufige Fragen (FAQ) faq.md  # https://www.linux-tips-and-tricks.de/de/faq ←→ https://www.linux-tips-and-tricks.de/en/faq
  Installation und Konfiguration in 5 Minuten  installation.md   # https://www.linux-tips-and-tricks.de/de/installation ←→ https://www.linux-tips-and-tricks.de/en/installation
  How to restore single files or directories from the backup  how-to-retrieve-single-files-or-directories-from-the-backup.md  # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/596-how-to-retrieve-single-files-or-directories-from-the-backup ←→
  Local language support for languages other than DE and EN (L10N)  local-language-support-for-languages-other-than-de-and-en-l10n.md  # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/603-local-language-support-for-languages-other-than-de-and-en-l10n ←→
  Trinkgeld  donations.md  # https://www.linux-tips-and-tricks.de/de/trinkgeld ←→ https://www.linux-tips-and-tricks.de/en/donations
  Wiederherstellen eines Backups  restore.md  # https://www.linux-tips-and-tricks.de/de/wiederherstellen ←→ https://www.linux-tips-and-tricks.de/en/restore
  /usr/sbin/NetworkManager: error while loading shared libraries: libhogweed.so.4: cannot open shared object file: No such file or directory  usr-sbin-networkmanager-error-while-loading-shared-libraries-libhogweed-so-4-cannot-open-shared-object-file-no-such-file-or-directory.md  # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/677-usr-sbin-networkmanager-error-while-loading-shared-libraries-libhogweed-so-4-cannot-open-shared-object-file-no-such-file-or-directory ←→
  Manual restore of a tgz backup  raspibackup-manual-restore-of-a-tgz-backup.md  # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/646-raspibackup-manual-restore-of-a-tgz-backup ←→
  raspiBackup Schnappschüsse (Snapshots)  snapshots.md  # https://www.linux-tips-and-tricks.de/de/snapshots ←→ https://www.linux-tips-and-tricks.de/en/snapshots

## war schon erledigt

  Tipps zu Homeautomation  anwendungstipps.md  # https://www.linux-tips-and-tricks.de/de/anwendungstipps ←→
  Aufrufsyntax und Optionen  invocation-and-options.md  # https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen ←→ https://www.linux-tips-and-tricks.de/en/invocation-and-options
  Einführung und Installation - Youtube Video in Deutsch  introductional-video.md  # https://www.linux-tips-and-tricks.de/de/einfuehrungsvideo ←→ https://www.linux-tips-and-tricks.de/en/introductional-video
  Übersicht  features.md  # https://www.linux-tips-and-tricks.de/de/funktionsuebersicht ←→ https://www.linux-tips-and-tricks.de/en/features
  Anwendungs- und Konfigurationsbeispiele  configuration-samples.md   # https://www.linux-tips-and-tricks.de/de/konfigurationsbeispiele ←→ https://www.linux-tips-and-tricks.de/en/configuration-samples
  Erstelle regelmäßig automatisch Sicherungsversionen Deiner Raspberries  backup.md  # https://www.linux-tips-and-tricks.de/de/raspibackup ←→ https://www.linux-tips-and-tricks.de/en/backup
  Nutzung von Synology als Backupspace  synology.md   # https://www.linux-tips-and-tricks.de/de/synology ←→ https://www.linux-tips-and-tricks.de/en/synology
  Intelligente Rotationsstrategie  smart-recycle.md   # https://www.linux-tips-and-tricks.de/de/rotationsstrategie ←→ https://www.linux-tips-and-tricks.de/en/smart-recycle
  Fehlermeldungen, Ursachen und Aktionen  raspibackupmessagese.md  # https://www.linux-tips-and-tricks.de/de/raspibackupmeldungen ←→ https://www.linux-tips-and-tricks.de/en/raspibackupmessagese
  Ubuntu Unterstützung  raspibackup-ubuntu-support.md  # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/632-raspibackup-ubuntu-unterstuetzung ←→ https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/633-raspibackup-ubuntu-support
  Erweiterungen (Plugins)  raspibackup-extensions.md  # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/442-raspibackup-erweiterungen ←→ https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/443-raspibackup-extensions
  Danksagungen  credits.md  # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/456-danksagungen ←→ https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/457-credits
  Unterstützte Hardware und Software  supported-hard-and-software.md   # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/608-unterstuetzte-hard-und-software ←→ https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/609-supported-hard-and-software
  Manuelle Installation und Konfiguration  raspibackup-manual-installation.md   # https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/538-raspibackup-manuelle-installation ←→ https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/539-raspibackup-manual-installation
