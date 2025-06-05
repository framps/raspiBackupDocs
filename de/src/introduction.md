``` admonish info title="Work in progress - In Arbeit"
Diese Dokumentation entsteht gerade erst.
Und zwar initial aus den Original-Texten der Webseite von framp.

Aktuell ist die **Struktur noch nicht final** und auch viele Seiten noch "kaputt",
insbesondere bezüglich Formatierung und Verlinkung.

Es gibt zwei Sprachversionen, *deutsch* und *englisch*, zwischen denen dynamisch
mit dem Sprachwähler oben rechts umgeschaltet werden kann.
(*Englisch* ist aktuell noch ziemlich "leer".)

Während des Aufbaus befindet auf den meisten Seiten eine Quellenangabe, so wie hier direkt unterhalb.

Wenn die Seiten dann (irgendwann) fertig sind, verschwinden diese Quellenabgaben
in einem HTML-Kommentar. `<!-- ... -->`, so dass sie nur noch für den Entwickler
aber nicht mehr für den Leser sichtbar sind.
```

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/raspibackup>
- <https://www.linux-tips-and-tricks.de/en/backup>
```


# Einführung

raspiBackup - Erstelle regelmäßig automatisch Sicherungsversionen Deiner Raspberries

raspiBackup ermöglicht eine Sicherung von Raspberries manuell oder automatisch
in regelmäßigen Abständen von einem laufenden System zu erstellen. D.h. es wird
die SD Karte im laufenden Betrieb gesichert. Eine ausgelagerte Rootpartition
wird dabei mitgesichert. Dabei muss die Raspberry nicht angehalten und manuell
eingegriffen werden sondern nur alle wichtigen Services vor dem Backup gestoppt
und nach erfolgtem Backup wieder gestartet werden. Backups können auf alle
Geräte, die an Linux gemounted werden können, gesichert werden (USB Stick, USB
Platte, nfs, samba, sshfs, ...). Als Backupmethoden stehen dd, tar und rsync
mit und ohne Hardlinks zur Verfügung. Die erstellten Backups können mit
raspiBackup auf beliebigen SD Karten unter Windows oder Linux wiederhergestellt
werden. Auf der Quelle können die Raspbian Partitionen entweder beide auf der
SD Karte liegen oder die Bootpartition auf SD Karte und die Root Partition auf
einem externen Gerät wie z.B. ein USB Stick oder eine per USB angeschlossene
SSD. Auch können beide Partitionen ausschliesslich auf einem USB Gerät liegen
und mit dem USB Boot Modus gestartet werden.


Bitte erst lesen: [Unterstützte Hard- und Software](supported-hardware-and-software.md)

-------------------

# Zusammenfassung

Eine regelmäßige Sicherung von Raspberry Pis ist wichtig um im Falle von einem
SD Kartenausfall oder auch unbeabsichtigten Änderungen immer wieder das System
auf einen vorherigen Zustand zurücksetzen zu können. raspiBackup ermöglicht es,
dass die Raspberry regelmäßig von sich selbst ein Backup erstellt und auf einem
extern angebundenen Speichermedium wie usb Stick und -platte, nfs Server,
smbfs/cifs/Samba Laufwerk, sshfs, davfs/webdav (Cloud) usw. (Siehe dazu Wie
kann man von der Raspberry Pi auf externe Daten zugreifen) ablegt. Die
Benutzung einer Synology als Backupspace ist ebenfalls möglich.

Eine einfache Wiederherstellung des gesicherten Backups nimmt raspiBackup
natürlich auch vor.

Vor der Sicherung sollten alle aktiven Services gestoppt und nach dem Backup
wieder gestartet werden um einen konsistenten Backup zu erhalten. Die
notwendigen Befehle dazu können entweder über Parameter definiert werden oder
es kann ein Beispielwrapperscript benutzt werden, welches dann wesentlich mehr
und programmatisch gesteuerter Aktionen vor und und nach dem Backup vornehmen
kann. Das automatische Mounten und Unmounten des Backupspaces ist schon im
Beispielwrapperscript enthalten. Weiterhin gibt es Erweiterungspunkte für
Plugins in raspiBackup um eigene Scripts vor und nach dem Backupvorgang
einzubinden.

Im normalen Backupmodus werden die beiden SD Kartenpartitionen mmcblk0p1und
mmcblk0p2 gesichert. Sofern die Rootpartition mmcblk0p2 auf eine externe
Partition (USB Stick, USB Platte, ...) ausgelagert wurde wird diese externe
Partition anstatt mmcblk0p2 gesichert. Ein USB Boot System kann mit einer
beliebigen Anzahl von externen Partitionen gesichert werden ab der release
0.6.6.

Als Backupmethoden stehen zur Auswahl: dd Backup, tar Backup, (beides auch
gezipped) und ein rsync Backup. Die einzelnen Backupmethoden sind im Detail
hier nachzulesen. Dort befindet sich auch ein Entscheidungsbaum um schneller
die richtige Backupmethode zu finden. Die maximale Anzahl von vorzuhaltenen
Backups ist konfigurierbar. Zur Aktivierung von raspiBackup muss man, nachdem
man das Script entsprechend ausgetestet hat, den Scriptaufruf in die Crontab
der Raspberry Pi aufnehmen. Danach bekommt man regelmäßig eine eMail
zugeschickt, die einen über das Ergebnis des Backups informiert. Die Meldungen
von raspiBackup erfolgen in Deutsch oder Englisch

------------

# Einführungsvideo

Nun habe ich (framp) mich endlich dazu durchgerungen, auch mal ein
[Video zu raspiBackup](https://youtu.be/PuK_FNK674s) zu erstellen und auf Youtube zu veröffentlichen.

Behandelte Themen sind

  * Vorstellung von raspiBackup mit seinen wichtigsten Fähigkeiten
  * Besuch der wichtigstens Webseiten zu raspiBackup
  * Vorstellung von github als Fragen- und Probleminteraktionstool
  * Liveinstallation von raspiBackup mit dem menuegesteuerten Installer

Die dort verwendeten Slides können zum Lesen [hier](https://www.linux-tips-and-tricks.de/de/downloads/raspibackup-de-pdf/download) runtergeladen werden.

Nachdem ich das Einführungsvideo erstellt hatte, habe ich Gefallen am Erstellen von Videos gefunden
und viele weitere Vidoes zu allen möglichen Themen zu raspiBackup erstellt.

Sie finden sich [hier auf YouTube](https://www.youtube.com/@raspiBackup).

TODO: Check [Alter Link auf YouTube](https://www.youtube.com/watch?v=VP5N_cDrUNU).
