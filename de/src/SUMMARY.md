<!-- vim: set conceallevel=0: -->

# raspiBackup

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

Hinweis: Diese Datei hier (SUMMARY.md) wird von *mdbook* genutzt,
den zu erstellenden Inhalt des Buches zu ermitteln.

Dazu werden ausgewertet:

  - die Überschriften Level 1 (#)
  - Links für Prefix- und Suffix-Kapitel
  - alle Listen (auch verschachtelt)
  - Trennlinien (horizontal rules ---

Die Listen dürfen ausschließlich Links enthalten.
Alle Links bestehen aus Titel des Kapitels und Name der entsprechenden Datei.

Dies ermöglicht einige kleine Kniffe:

1.) Es sind "Kommentare" in der Datei möglich. Zum Beispiel:
    a.) Dieser einführende Hinweis. Zusätzlich ist dieser Hinweis als
        Codeblock formuliert, damit obige Liste nicht als solche geparsed wird.
    b.) "TODO-Marker" oder Ähnliches

2.) Es lassen sich Kapitel "deaktivieren" durch Ungültigmachen des Links.

    Beispiel:

    private](very-private.md)

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
```


[Einführung](introduction.md)

[Kontakmöglichkeiten](contact.md)

[Danksagungen](credits.md)

[Trinkgeld](donations.md)

[Haftungsausschluss](legals.md)

- [Funktionsübersicht von Website](function-overview.md)    @TODO
- [Funktionsübersicht aus Benutzerhandbuch](function-overview2.md)    @TODO

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
- [Rotationsstrategie](smart-recycle.md)
- [Snapshots](snapshots.md)

- [Wiederherstellen/Restore](restore.md)  #@WIP
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

