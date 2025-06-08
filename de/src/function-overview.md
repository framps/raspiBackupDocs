# Funktionsübersicht

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/funktionsuebersicht> → <https://raspibackup.linux-tips-and-tricks.de/de/home-deutsch/>
- <https://www.linux-tips-and-tricks.de/en/features> → <https://raspibackup.linux-tips-and-tricks.de/en/home/>
```

[.status]: todo "konsolidieren"

Auf dieser Seite findet sich eine high Level übersicht zu raspiBackup.
Detailiertere Informationen zu raspiBackup finden sich auf der
[Github-Seite](https://github.com/framps/raspiBackup).

**Sichere Deine Raspberries**

**Mit raspiBackup erhältst Du schnell und sicher regelmäßig einen vollständigen Systembackup Deiner Raspberries und eine konfigurierbare Backuphistorie**

![Icon](images/icons/Icon_rot_blau_final_128.png)


Eigenschaften

Open source

raspiBackup ist unter der GNU Lizenz als OpenSource und somit kostenlos
verfügbar. Trinkgelder sind aber trotzdem gern gesehen 😉

Fragen zu raspiBackup werden auf github im Diskussionsbereich beantwortet.
Mögliche Fehler können als Issues im github berichtet werden.

Die Anmeldung zu github ist kostenlos. Möglichst in Englisch aber auch Deutsch wird akzeptiert.
Einfache Installation mit menügeführtem Installer

Die wichtigsten Optionen von raspiBackup können so wie bei raspi-config –
allerdings in Deutsch, Englisch, Finnisch, Chinesisch und Französisch
konfiguriert werden so dass die erste Sicherung in 5 Minuten erstellt werden
kann.

Alle weiteren z.T. sehr mächtigen Optionen sind im Nutzerhandbuch beschrieben
und können in einer Konfigurationsdatei definiert werden.

Vollständige und inkrementelle Sicherungen

Die Backuptypen dd und tar erstellen vollständige Sicherungen. Der Backuptyp
rsync erstellt inkrementelle Sicherungen.

Zwei Sicherungsstrategien

1) Eine definierte Anzahl von Sicherungen wird vorgehalten
2) Sicherungen werden nach der Grossvater, Vater und Sohn Sicherungsstrategie (GVS) vorgehalten.

Benachrichtigungen

Die Sicherungslaufmeldungen können von raspiBackup per eMail oder Telegram,
Slack oder PushOver verschickt werden. Smilies weisen auf Erfolg oder
Misserfolg des Sicherungslaufes hin. Andere Smilies informieren über andere
wichtige Ereignisse wie die Verfügbarkeit einer Beta oder eines neuen Releases
oder die Erinnerung daran mal wieder einen Restoretest durchzuführen um die
Sicherungsintegrität zu testen.

Alle Bootmodes sind unterstützt

1) Boot von der SD Karte: Beide Partitionen liegen auf der SD Karte (jedes Modell)
2) Gemischter Modus: Boot von der SD Karte und Nutzung der Rootpartition von einem USB Gerät. Das ist notwendig bei älteren Raspberries die noch keinen USB Boot unterstützen (2A und 2B)
3) Boot von einem USB Gerät oder SSD (USB boot Modus): Beide Partitionen liegen auf einem USB Gerät. Wird von den neueren Raspberries unterstützt, (3B, 4, 400 und 5)

Snapshots

Zu wichtigen Update- oder Installationszeitpunkten können Snapshots mit einer
Beschreibung erstellt werden. Im Falle eines größeren Fehlers oder eines nicht
mehr startenden Systems erlauben sie dort wieder aufzusetzen ohne mit dem
Update- oder der Neuinstallation wieder ganz von vorne anzufangen.

Aktive Social Media Kanäle

Fragen können auf github oder Facebook gestellt werden. Um Probleme zu
berichten gehe auf github. Videos gibt es auf dem raspiBackup Channel.

Neuigkeiten werden auf Facebook und Twitter publiziert.

Eine beliebige Anzahl von Backups aus der Vergangenheit können vorgehalten werden

Es wird nicht nur ein Backup erstellt sondern eine Backupversionshistorie.
Entweder definiert man eine Anzahl von Backups die vorgehalten werden sollen
oder man nutzt das GVS Prinzip (Intelligente Rotationsstrategie in raspiBackup
genannt)

Wiederherstellung einer Sicherung unter Windows

Eine Sicherung des Backuptyps dd kann auf einem Windows System
wiederhergestellt werden. win32diskimger oder ähnliche Tools können genutzt
werden.
tar und rsync benötigen ein Linuxsystem. Es wird empfohlen dazu eine
vorkonfigurierte SD Karte mit RaspbianOS zu nutzen und auf einer Raspberry zu
starten.

Benachrichtigungen bei neuen Releases

Sobald ein Beta oder eine neue Release verfügbar ist schreibt raspiBackup eine
Meldung die darauf hinweist. Ein Upgrade ist einfach vorzunehmen wie auch ein
Downgrade wieder auf eine vorhergehende Release einfach möglich ist.

Regressionstestsuite

Die Basisfunktionalität von raspiBackup (Sicherung und Wiederherstellung) wird
für alle Backuptypen und Modi automatisch getestet um sicherzustellen dass die
neue raspiBackup Release genauso zuverlässig funktioniert wie vorher.

Dokumentation

Benutzerhandbuch, FAQs, Konfigurationsbeispiele, NFS Konfiguration auf einer
Synology, Liste von Fehlermeldungen und wie man die Fehlermeldungen beseitigen
kann und vieles mehr. Es gibt schon raspiBackup Nutzer die beschweren sich dass
es zu viel Doku gibt. Es existiert auch ein raspiBackup Channel auf Youtube.

Hilfs- und Beispielscripte

Verschiedene Hilfs- und Beispielscripts stehen zur Verfügung auf github.

Z.B. wie pishrink genutzt werden kann um eine dd Sicherung noch zu verkleinern
oder wie parallel ein clone erstellt werden kann um einen aktuellen jederzeit
einsetzbares geclontes Bootmeidum zu haben. Und vieles, vieles mehr.

Sicherung von NVMe Speicher

Wird für Raspberry 5 und compute model 4 (CM4) unterstützt

Unterstütze Betriebssysteme

– RaspbianOS
– Ubuntu

Einfacher Systemumzug auf andere Speichermedien

Jede Sicherung kann auf eine SD Karte, USB Platte oder SSD sowie NVMe SSD
zurückgespielt werden. Schon ist das System auf ein anderes Gerät umgezogen.

Erweiterungspunkte

Vor und nach der Sicherung kann eigener Code ausgeführt werden um Vor- und
Nachbereitungen bei der Sicherung wie auch dem Zurücksichern auszuführen


# Funktionsübersicht Version 2

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/raspibackup>
- <https://www.linux-tips-and-tricks.de/en/backup>
```

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
