# Funktionsübersicht

Auf dieser Seite findet sich eine High Level Übersicht zu *raspiBackup*.

Detailliertere Informationen finden sich hier in der weiteren Dokumentation
und auf der [*GitHub*-Seite](https://github.com/framps/raspiBackup).

**Mit *raspiBackup* erhältst Du schnell und sicher regelmäßig ein vollständiges Systembackup Deiner Raspberries und eine konfigurierbare Backuphistorie
und kannst somit Deine Raspberry vollständig wiederherstellen, so dass sie wieder mit einem alten Backupstand bootet**.
 
  - Open source

    *raspiBackup* ist unter der GNU Lizenz als OpenSource und kostenlos verfügbar.
    Ein [Trinkgeld](introduction.md#donation) ist aber trotzdem gern gesehen 😉

  - Einfache [Installation](installation.md) mit menügeführtem Installer (vergleichbar mit `raspi-config`)

    Die wichtigsten Optionen von *raspiBackup* können in Deutsch, Englisch, Finnisch,
    Chinesisch und Französisch konfiguriert werden, so dass die erste [Sicherung
    in 5 Minuten](installation-in-5-minutes.md) erstellt werden kann.

  - Alle weiteren z.T. sehr mächtigen Optionen sind [ausführlich dokumentiert](details.md)
    und können in einer Konfigurationsdatei definiert werden.

  - Vollständige und inkrementelle Sicherungen

      - Der Backuptyp `rsync` erstellt vollständige und dann inkrementelle Sicherungen
      - Die Backuptypen `dd` und `tar` erstellen immer vollständige Sicherungen  
        Hinweis: Beim `dd` Backup ist per Option einschaltbar, dass nur der von den Partitionen
        belegte Platz und nicht die gesamte SD Karte gesichert wird.

  - Zwei Sicherungsstrategien

      - Eine definierte Anzahl von Sicherungen wird vorgehalten
      - Sicherungen werden nach der Großvater-Vater-Sohn Sicherungsstrategie (GVS) vorgehalten.

  - Beliebige Verzeichnisse und Dateien können aus dem Backup ausgeschlossen werden (`-u` Option)

  - Automatische regelmäßige Sicherung einer laufenden Raspberry Pi (sie sichert sich selbst)

  - Verschiedene Backuptypen können pro System gemischt werden (z.B. pro Tag ein `rsync` Backup, jeder Woche ein `dd` Backup)

  - Automatisches Stoppen und Starten von aktiven Services vor und nach dem Backup (`-a` und `-o` Option)

  - Sicherung einer beliebigen Anzahl von Raspberries in einem Backupverzeichnis

  - Meldungen in Deutsch und Englisch

  - Benachrichtigungen

    Die Sicherungslaufmeldungen können von *raspiBackup* per eMail oder *Telegram*,
    *Slack* oder *PushOver* verschickt werden. Smilies weisen auf Erfolg oder
    Misserfolg des Sicherungslaufes hin. Andere Smilies informieren über andere
    wichtige Ereignisse wie die Verfügbarkeit einer Beta oder eines neuen Releases
    oder die Erinnerung daran, mal wieder einen Restoretest durchzuführen, um die
    Sicherungsintegrität zu testen.

  - Unterstützte eMail-Clients: *mailx*/*mail*, *sendEmail*, *ssmtp* und *msmtp*.
    Nicht unterstützte eMail-Clients können durch ein eMail-Plugin eingebunden werden.

  - Einfaches Update von *raspiBackup* auf die aktuelle Version
  - Einfache Verteilung von neuen Scriptversionen auf eine größere Menge von Hosts

  - Alle Bootmodi werden unterstützt

      1. Boot von der SD Karte: Beide Partitionen liegen auf der SD Karte
         (jedes Modell)
      2. Gemischter Modus: Boot von der SD Karte und Nutzung der Rootpartition
         von einem USB Gerät. Das ist notwendig bei älteren Raspberries, die
         noch keinen USB Boot unterstützen.
      3. Boot von einem USB Gerät oder SSD (USB boot Modus): Beide Partitionen
         liegen auf einem USB Gerät. Wird von den neueren Raspberries
         unterstützt.

  - Beliebige Backupziele sind möglich, z.B.

      - Externer USB Stick
      - Externe USB Platte
      - Synology NAS
      - *smb* Netzwerklaufwerk
      - *nfs* Netzwerklaufwerk
      - *sshfs* Netzwerklaufwerk
      - *webdav* Netzwerklaufwerk
      - *ftpfs* Netzwerklaufwerk
      - Generell jedes Device, welches unter Linux gemounted werden kann

  - Ein externes Rootfilesystem auf einer Platte oder einem USB Stick wird
    automatisch beim normalen Backupmodus mitgesichert und restored bei `tar`
    oder `rsync` Backup.

  - Snapshots

    Zum Beispiel zu wichtigen Update- oder Installationszeitpunkten können
    Snapshots mit einer Beschreibung erstellt werden. Im Falle eines größeren
    Fehlers oder eines nicht mehr startenden Systems erlauben sie, dort wieder
    aufzusetzen, ohne mit der Update- oder der Neuinstallation wieder ganz von
    vorne anfangen zu müssen.

  - Eine beliebige Anzahl von Backups aus der Vergangenheit können vorgehalten werden

    Es wird nicht nur ein einzelnes Backup erstellt, sondern eine Backuphistorie.
    Entweder definiert man eine Anzahl von Backups, die vorgehalten werden sollen,
    oder man nutzt das *GVS*-Prinzip (in *raspiBackup* "Intelligente Rotationsstrategie"
    genannt)

  - Eine intelligente Backupstrategie steht zur Verfügung
    (Backups der letzten 7 Tage, der letzten 4 Wochen, der letzten 12 Monate und der letzten n Jahre werden aufgehoben)

  - Einfache Wiederherstellung einer Sicherung

    Eine Sicherung des Backuptyps `dd` kann auch auf einem Windows System wiederhergestellt werden.
    *Win32Diskimager* oder ähnliche Tools können genutzt werden.
    `tar` und `rsync` benötigen zur Wiederherstellung ein Linuxsystem.
    Es wird empfohlen, dazu eine vorkonfigurierte SD Karte mit *Raspberry Pi OS*
    zu nutzen und auf einer Raspberry zu starten.

  - Anpassung von `/etc/fstab` und `/boot/cmdline.txt` an neue UUIDs, PARTUUIDs
    oder LABELs, damit das System sofort wieder startet.

  - [Aktive Social Media Kanäle](introduction.md#kontakt)

  - Benachrichtigungen bei neuen Releases

    Sobald ein Beta oder eine neue Release verfügbar ist, schreibt *raspiBackup* eine
    Meldung, die darauf hinweist. Ein Upgrade ist einfach vorzunehmen. Ebenso ein
    Downgrade zurück auf eine vorhergehende Release.

  - Regressionstestsuite

    Die Basisfunktionalität von *raspiBackup* (Sicherung und Wiederherstellung) wird
    für alle Backuptypen und Modi automatisch getestet, um sicherzustellen, dass die
    neue *raspiBackup* Release genauso zuverlässig funktioniert wie vorher.

  - Dokumentation

    Benutzerhandbuch, FAQs, Konfigurationsbeispiele, NFS Konfiguration auf einer
    Synology, Liste von Fehlermeldungen und wie man die Fehlermeldungen beseitigen
    kann und vieles mehr.

  - Hilfs- und Beispielscripts

    Verschiedene Hilfs- und Beispielscripts stehen zur Verfügung.

    Zum Beispiel, wie *pishrink* genutzt werden kann, um eine `dd` Sicherung noch zu verkleinern
    oder wie parallel ein Clone erstellt werden kann, um ein aktuelles, jederzeit
    einsetzbares Bootmedium zu haben. Und vieles, vieles mehr.

    Ein Beispielscript hilft, um vor und nach dem Backup weitere Aktionen vorzunehmen,
    wie z.B. das Mounten und Unmounten des Backupspaces.

  - Erweiterungspunkte

    Vor und nach der Sicherung kann eigener Code ausgeführt werden, um Vor- und
    Nachbereitungen bei der Sicherung wie auch dem Zurücksichern auszuführen.

  - Sicherung von *NVMe* Speicher

    Wird für Raspberry 5 und Compute Model 4 (CM4) unterstützt

  - Unterstütze Betriebssysteme

      - RaspbianOS / Raspberry Pi OS
      - Ubuntu

  - Einfacher Systemumzug auf andere Speichermedien

    Jede Sicherung kann auf eine SD Karte, USB Platte oder SSD sowie NVMe SSD
    zurückgespielt werden. Schon ist das System auf ein anderes Gerät umgezogen.

  - Unterstützung von *Volumio*

  - Unterstützung von *gpt* Partitionen


![Übersichtsbild](images/raspiBackupOverview.jpg)


[.status]: rst
[.source]: https://www.linux-tips-and-tricks.de/de/funktionsuebersicht
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackup
[.source]: https://www.linux-tips-and-tricks.de/en/features
[.source]: https://www.linux-tips-and-tricks.de/en/backup
