``` admonish info title="Work in progress - In Arbeit"
Diese Dokumentation entsteht gerade.
Und zwar initial aus den Original-Texten der Webseite von framp.

Aktuell ist die **Struktur noch nicht final** und auch einige Seiten noch "kaputt",
insbesondere bezüglich Formatierung und Verlinkung.

Es gibt zwei Sprachversionen, *deutsch* und *englisch*, zwischen denen dynamisch
mit dem Sprachwähler oben rechts umgeschaltet werden kann.
(*Englisch* ist aktuell noch ziemlich "leer".)

Während des Aufbaus befindet auf den meisten Seiten eine Quellenangabe.

Wenn die Seiten dann fertig sind, verschwinden diese Quellenabgaben
in einem Kommentar, so dass sie nur noch für den Entwickler
aber nicht mehr für den Leser sichtbar sind.
```


# Einführung

> *raspiBackup* - Erstelle regelmäßig automatisch Sicherungsversionen Deiner Raspberries

Eine regelmäßige Sicherung von Raspberry Pis ist wichtig, um im Falle eines
SD Kartenausfalls oder auch von unbeabsichtigten Änderungen das System wieder
auf einen vorherigen Zustand zurücksetzen zu können.

*raspiBackup* erstellt eine Sicherung eines Raspberry Pis **bei laufendem System**.
Das kann manuell oder automatisch in regelmäßigen Abständen (per `crontab`) erfolgen.
Optional bekommt man eine eMail zugeschickt, die einen über das
Ergebnis des Backups informiert.

Backups können auf alle Geräte, die an Linux gemounted werden können, gesichert
werden (USB Stick, USB Platte, nfs, samba, sshfs, usw.).

Wer eine Synology oder andere Backupziele für den Backup benutzen möchte,
findet [hier](more-backupspaces.md) nützliche Tipps.

Als Backupmethoden stehen zur Auswahl: `dd` Backup, `tar` Backup, (beides auch
gezipped) und ein `rsync` Backup mit und ohne Hardlinks.
Die einzelnen Backupmethoden sind im Detail [hier](backuptypes.md) nachzulesen.
Dort befindet sich auch ein Entscheidungsbaum, um schneller die richtige Backupmethode zu finden.

Eine einfache [Wiederherstellung](restore.md) eines gesicherten Backups nimmt *raspiBackup*
natürlich auch vor.

Alle Funktionen und Einsatzgebiete von *raspiBackup* sind tabellarisch in der
[Funktionsübersicht](function-overview.md) zusammengetragen.

Bitte lesen: [Unterstützte Hard- und Software](supported-hardware-and-software.md)


## Stoppen und Starten von Diensten/Services

Um eine konsistente Sicherung bei laufendem System zu ermöglichen, müssen
nur alle wichtigen Services vor dem Backup gestoppt und nach erfolgtem
Backup wieder gestartet werden (konfigurierbar und damit automatisch).

Die notwendigen Befehle dazu können entweder über Parameter definiert werden oder
es kann ein Beispielwrapperscript benutzt werden, welches dann wesentlich mehr
und programmatisch gesteuerter Aktionen vor und und nach dem Backup vornehmen
kann. Das automatische Mounten und Unmounten des Backupspaces ist schon im
[Beispielwrapperscript](https://github.com/framps/raspiBackup/blob/master/helper/raspiBackupWrapper.sh) enthalten.

Weiterhin gibt es [Erweiterungspunkte](hooks-for-own-scripts.md) für Plugins in *raspiBackup*,
um eigene Scripts vor und nach dem Backupvorgang einzubinden.


## optional ausgelagerte Root-Partition

Eine eventuell ausgelagerte Rootpartition kann mitgesichert werden.

Im normalen Backupmodus werden die beiden SD Kartenpartitionen `mmcblk0p1`
und `mmcblk0p2` gesichert. Sofern die Rootpartition `mmcblk0p2` auf eine externe
Partition (USB Stick, USB Platte, ...) ausgelagert wurde, wird diese externe
Partition anstatt `mmcblk0p2` gesichert.

Ein USB Boot System kann mit einer beliebigen Anzahl von externen Partitionen
gesichert werden ab der release 0.6.6.

## Einführungsvideo und Youtube-Channel

Nun habe ich (framp) mich endlich dazu durchgerungen, auch mal ein
[Video zu raspiBackup](https://youtu.be/PuK_FNK674s) zu erstellen und auf Youtube zu veröffentlichen.

Behandelte Themen sind

  * Vorstellung von *raspiBackup* mit seinen wichtigsten Fähigkeiten
  * Besuch der wichtigstens Webseiten zu *raspiBackup*
  * Vorstellung von github als Fragen- und Probleminteraktionstool
  * Liveinstallation von *raspiBackup* mit dem menuegesteuerten Installer

Die dort verwendeten Slides können zum Lesen [hier](https://www.linux-tips-and-tricks.de/de/downloads/raspibackup-de-pdf/download) runtergeladen werden.

Nachdem ich das Einführungsvideo erstellt hatte, habe ich Gefallen am Erstellen von Videos gefunden
und viele weitere Vidoes zu allen möglichen Themen zu *raspiBackup* erstellt.

Sie finden sich [hier auf YouTube](https://www.youtube.com/@raspiBackup).

[.status]: todo "Check [Alter Link auf YouTube](https://www.youtube.com/watch?v=VP5N_cDrUNU)"


## Danksagungen

Es haben im Laufe der Zeit sehr viele Leute aus der Community durch Kommentare,
Erweiterungsvorschläge und Beta- und Fixtests zu *raspiBackup* beigetragen.
In Anbetracht der grossen Anzahl ist es leider nicht möglich, jeden einzelnen aufzuführen.

Daher einfach: Vielen Dank euch allen!


## Lizenz und GitHub-Link

Der Code von *raspiBackup* ist reiner bash Code und steht unter der GPL auf [github](https://github.com/framps/raspiBackup) zur Verfügung.


[.source]: https://www.linux-tips-and-tricks.de/de/raspibackup
[.source]: https://www.linux-tips-and-tricks.de/en/backup

