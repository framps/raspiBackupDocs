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

- [Funktionsübersicht](function-overview.md)

- [Unterstützte Hardware und Software](supported-hardware-and-software.md)
    - [Raspberry Pi OS / RaspbianOS](support-for-raspbianos.md)
    - [Ubuntu](ubuntu-support.md)
    - [Compute Module](support-for-raspberry-compute-module-4-and-nvme.md)

- [Sprachunterstützung](language-support.md)

- [Einführung](function-intro.md)
    - [Backup](backup-intro.md)
        - [Backuptype und Entscheidungsbaum](backuptypes.md)
        - [Vergleich partitionsorientierter Backup und normaler Backup](normal-or-partition-backup.md)
        - [Backupverzeichnisstruktur](backup-directory-structure.md)
        - [Intelligente Rotationsstrategie](smart-recycle.md)
        - [Snapshots](snapshots.md)
        - [Konfigurationsupdate bei einem Upgrade auf eine neue Version](configuration-update-when-upgrading-to-a-new-version.md)
        - [Erweiterungsmöglichkeiten](hooks-for-own-scripts.md)
        - [eMail Konfigurationsbeispiele](email-configuration-examples.md)
            - [msmtp konfigurieren für einen web.de Account](msmtp-configuration-for-web-de-account.md)
            - [exim4 konfigurieren](exim4-configuration.md)
            - [nullmailer konfigurieren](nullmailer-configuration.md)

    - [Restore](restore-intro.md)        
        - [Restore einzelner Dateien](how-to-retrieve-single-files-or-directories-from-the-backup.md)
        - [Manueller rsync Restore](manual-restore.md)
        - [Manueller tgz Restore](manual-restore-of-a-tgz-backup.md)

    - [Fragen und Antworten](more-questions-and-answers.md)
        - [Welches Fileystem kann auf der Backuppartition benutzt werden?](which-filesystem-can-be-used-on-the-backup-partition.md)
        - [Wie funktionieren Hardlinks zusammen mit rsync?](how-do-hardlinks-work-with-rsync.md)
        - [Warum sollte man dd als Backuptyp besser nicht benutzen?](why-shouldn-t-you-use-dd-as-backup-type.md)
        - [Wie kann man mit raspiBackup einen Clone erstellen?](how-to-create-a-cold-standby-clone-with-raspibackup.md)
        - [Umziehen des Raspberry Betriebssystems von SD Karte auf SSD, USB Platte oder USB Stick](migrate-the-raspberry-os-from-sd-card-to-ssd-usb-disk-or-usb-pen-drive.md)
        - [Wie kann ich die Betaversion installieren und ausprobieren?](how-can-i-install-and-test-the-beta-version.md)

- [Installation und erstes Backup](installation.md)
    - [Schnellstart - Installation in 5 Minuten](installation-in-5-minutes.md)
    - [Manuelle Installation und Konfiguration](manual-installation-and-configuration.md)
    - [Statistiken](statistics.md)
    - [Updates](updates.md)

- [Aufruf und Optionen](details.md)
    - [Backup](backup.md)
        - [Optionen](backup-options.md)
        - [Konfiguration](backup-config-options.md)
    - [Restore](restore.md)
        - [Optionen](restore-options.md)
        - [Konfiguration](restore-config-options.md)
    - [Allgemein](general.md)  
        - [Optionen](general-options.md)   
        - [Konfiguration](general-config-options.md)
    - [Thematisch sortierte Optionen](options-by-topic.md)

- [Häufige Fragen / FAQ](faq.md)

- [Fehlermeldungen und -suche](error-messages.md)

- [Hilfsprogramme](helper-scripts.md)
    - [raspiBackupDialog - ein komfortables Hilfsscript für raspiBackup](raspibackupdialog-a-convenient-helper-script-for-raspibackup.md)
    - [Nützliche Hilfsprogramme](useful-helper-scripts.md)

- [Backupziele](backup-targets.md)
    - [NFS als Backupziel](nfs-as-backupspace.md)
    - [SMB als Backupziel](smb-as-backupspace.md)
    - [AVM Fritzbox als Backupziel](avm-fritzbox-as-backupspace.md)
    - [WEBDAV als Backupziel](webdav-as-backupspace.md)

- [Tipps zur Homeautomation](tips-homeautomation.md)

- [Hilfreiche Links zum Thema Backup](helpful-links.md)
- [Andere Backuptools](other-raspberry-backup-tools.md)

- [Verschiedenes](any-other-business.md)
    - [Versionshistorie](version-history.md)
    - [raspiBackup hat ein neues Logo](raspibackup-has-a-new-logo.md)
    - [10 Jahre raspiBackup](10-years-raspibackup.md)
    - [Ausgeführte Regressiontests vor der Veröffentlichung einer neuen Release](regressiontests-executed.md)
    - [Entwicklungsumgebung](development-environment.md)
    - [Nutzer in aller Welt](list-of-countries-raspibackup-is-used-in-the-world.md)
    - [Version dieser Dokumentation](doc-version-info-automatically-generated.md)
    - [Markdown Spielwiese](markdown-playground.md)


```
TO CHECK/TRANSLATE!

  local-language-support-for-languages-other-than-de-and-en-l10n.md
  manual-restore-of-a-tgz-backup.md
```

[.status]: todo "Check the remaining english-only file(s)"

[.status]: translated
[.status]: z_SUMMARY
