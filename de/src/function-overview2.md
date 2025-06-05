# Funktionsübersicht Version 2

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/raspibackup>
- <https://www.linux-tips-and-tricks.de/en/backup>
```

TODO: Mit der anderen Funktionsbeschreibung konsolidieren.

- Automatische regelmäßige Sicherung einer laufenden Raspberry Pi (Sie sichert sich selbst)
- Raspberry3 und Folgende wenn sie ohne SD Karte im USB boot mode betrieben werden sind unterstützt
- Sicherung und Wiederherstellung ist unabhängig davon welches Betriebssystem (Linux, Windows oder Mac) für den Zugriff auf die Raspberry Pi benutzt wird
- Windows oder Mac Benutzer nutzen einfach zur Wiederherstellung des Backups die Raspberry
- Windows Benutzer können dd Backups mit win32diskimager restoren
- Linux Benutzer können das Backup auf ihrem Linux System wiederherstellen oder auch die Raspberry benutzen
- Beliebige Backupziele möglich, z.B.
    - Externer USB Stick
    - Externe USB Platte
    - Synology
    - cifs/samba Netzwerklaufwerk
    - nfs Netzwerklaufwerk
    - sshfs Netzwerklaufwerk
    - webdav Netzwerklaufwerk
    - ftpfs Netzwerklaufwerk
    - Generell jedes Device welches unter Linux gemounted werden kann
- Einfacher Restore der Sicherung und Anpassung von /etc/fstab und /boot/cmdline.txt an neue UUIDs, PARTUUIDs oder LABELs damit das System sofort wieder startet..
- Ein externes Rootfilesystem auf einer Platte oder einem USB Stick wird automatisch beim normalen Backupmodus mitgesichert und restored bei tar oder rsync backup.
- Einsetzbar auch zum Klonen einer Raspberry Pi
- Einfache Installation. Die wichtigsten Optionen werden abgefragt und in die Konfigurationsdatei geschrieben.
- Meldungen in Deutsch und Englisch
- Diverse Aufrufparameter um den Backup zu steuern
- dd, tar und rsync Backup möglich (-t Option). rsync benutzt bei einer ext3/ext4 Partition Hardlinks um den benötigten Plattenplatz zu minimieren
- dd und tar kann gezippt werden um die Sicherung noch zu verkleinern (-z Option)
- pishrink kann zur Verkleinerung von dd Images über ein Wrapperscript benutzt werden
- dd Backup sichert per Option einschaltbar nur den von den Partitionen belegten Platz und nicht die ganze SD Karte
- Boot backup benutzt per Option einschaltbar Hardlinks für die sich selten ändernde Bootpartition und spart dadurch Backupspeicherplatz
- Verschiedene Backuptypen können pro System gemischt werden (z.B. pro Tag ein rsync Backup, jeder Woche ein dd Backup)
- Automatisches Stoppen und Starten von aktiven Services vor und nach dem Backup (-a und -o Option)
- Automatisches Anpassen der zweiter Rootpartition wenn die Restore SD Karte kleiner oder größer als die Original SD Karte ist
- Automatische benachrichtigung wenn eine neue Release verfügbar ist
- Ein Beispielscript hilft um vor und nach der Backup weitere Aktionen vorzunehmen wie z.B. das Mounten und Unmounten des Backupspaces
- Einfache Erweiterung der Scriptfunktion durch Plugins (Option -N)
- Anzahl der vorzuhaltenden Backups ist konfigurierbar (-k Option)
- Intelligente Backupstrategie steht zur Verfügung (Backups der letzen 7 Tage, der letzten 4 Wochen, der letzten 12 Monate und der letzten n Jahre werden aufgehoben)
- eMail Benachrichtigung über den Backuplauf und Backupverlaufsstatus (-e Option)
- Telegram Benachrichtigung über den Backuplauf und Backupverlaufsstatus (--telegram Optionen)
- Unterstützte eMailClients: mailx/mail, sendEmail, ssmtp und msmtp (-s Option)
- Nicht unterstützte eMailClients können durch ein eMailPlugin eingebunden werden
- rsync benutzt Hardlinks um die Backupgröße zu reduzieren
- Automatische Benachrichtigung, wenn eine neue Scriptversion verfügbar ist (-n Option)
- Einfacher Update von raspiBackup durch die aktuellste Version (-U Option)
- Einfache Wiederherstellung einer älteren Scriptversion sofern sie mit der Updatefunktion installiert wurde (-V Option)
- Einfache Verteilung von neuen Scriptversionen auf eine größere Menge von Hosts (-y Option)
- Beliebige Verzeichnisse und Dateien können aus dem Backup ausgeschlossen werden (-u Option)
- Sicherung von einer beliebigen Anzahl von Raspberries in einem Backupverzeichnis
- Unterstuetzung von Volumio

![Übersichtsbild](images/raspiBackupOverview.jpg)
