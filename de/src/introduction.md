``` admonish info title="Work in progress - In Arbeit"
Diese Dokumentation entsteht gerade.
Und zwar initial durch Übertragung der Original-Texte von der [Webseite von framp](https://linux-tips-and-tricks.de/de/raspibackup).

 - Die **Struktur ist noch nicht final**.
 - Manche Seiten enthalten noch Formatierungsfehler.
 - Einige Seiten sind noch unvollständig und enthalten nur
   einen Link zur Originalseite.

Es gibt zwei Sprachversionen, *deutsch* und *englisch*, zwischen denen dynamisch
mit dem Sprachwähler oben rechts umgeschaltet werden kann.
(*Englisch* ist aktuell ebenfalls noch ziemlich "leer".)
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

---

Weitere Abschnitte auf dieser Seite:

<!-- toc -->

---

## Unterstützte Hard- und Software

Dazu gibt es extra Kapitel: [Unterstützte Hard- und Software](supported-hardware-and-software.md)

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


## Optional ausgelagerte Root-Partition

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



## Kontaktmöglichkeiten

* Klicke [![Github](images/icons/GitHub-Mark-32px.png)](https://github.com/framps/raspiBackup/issues),
  um auf Github Fragen oder Probleme zu *raspiBackup* als Issues zu erstellen.
  Die Issues können gerne auch in Deutsch erstellt werden.
  So kann ich Fragen und Problemberichte tracken und Du bekommst eine Benachrichtigung über meine Antworten.

* Klicke [![Facebook](images/icons/FB-f-Logo__blue_29.png)](https://www.facebook.com/raspiBackup/),
  um auf Facebook aktuelle Aktivitäten und Randinformationen zu *raspiBackup* zu erfahren.
  Fragen zu *raspiBackup* sind auch möglich. Probleme bitte nur im [github](https://github.com/framps/raspiBackup/issues) melden.

* Klicke [![Twitter](images/icons/Twitter-f-Logo__blue_29.png)](https://www.twitter.com/linuxframp),
  um *raspiBackup* auf Twitter zu folgen.

* Klicke [![Youtube](images/icons/Youtube.png)](https://www.youtube.com/channel/UCnFHtfMXVpWy6mzMazqyINg),
  um auf Youtube Videos zu *raspiBackup* zu sehen.

* Klicke [![Kommentar](images/icons/Question_29.png)](https://linux-tips-and-tricks.de/de/raspibackup#Comments),
  um eine Frage zu *raspiBackup* in einem Kommentar zu erstellen. Probleme bitte nur im [github](https://github.com/framps/raspiBackup/issues) melden.

* Klicke [![RaspberryForum](images/icons/RaspberryForumSmall.png)](https://forum-raspberrypi.de/forum/board/153-backup/),
  um im deutschen Raspberryforum Fragen zu Raspberry Backups im Allgemeinen und *raspiBackup* im Speziellen zu stellen oder
  existierende Threads zu *raspiBackup* zu lesen.

``` admonish info title="Hinweis"
Jegliche anderen Kommunikationswege wie z.B. eMails, die leider gerne genutzt werden, werden ignoriert!
```

## Trinkgeld

Eine Anerkennung des Entwicklungs- und Wartungsaufwands sowie Supports für
*raspiBackup* ist gerne gesehen und wie folgt möglich:

1. Werde ein [github sponsor](https://github.com/sponsors/framps) für *raspiBackup*
2. Paypal: Die eMail `framp att linux-tips-and-tricks dott de` ist PayPal bekannt
   und ein jeder kann mit einem PayPal Konto an diese eMail ein Trinkgeld geben.
3. Keines von beidem: Einfach bei der o.g. eMail nachfragen. Es findet sich
   gewiss eine Alternative. Z.B. wurde mir Trinkgeld schon mehrmals auf die
   gute alte Art per Brief zugeschickt :-)

Die letzte Spende kam am 25.2.2024.


## Danksagungen

Es haben im Laufe der Zeit sehr viele Leute aus der Community durch Kommentare,
Erweiterungsvorschläge und Beta- und Fixtests zu *raspiBackup* beigetragen.
In Anbetracht der grossen Anzahl ist es leider nicht möglich, jeden einzelnen aufzuführen.

Daher einfach: Vielen Dank euch allen!


## Lizenz und GitHub-Link

Der Code von *raspiBackup* ist reiner bash Code und steht unter der GPL auf [github](https://github.com/framps/raspiBackup) zur Verfügung.


## Haftungsausschluss

Das Backup- und Restorescript *raspiBackup* wurde für den persönlichen Gebrauch
erstellt und, da es sich als sehr nützlich erwies, der Allgemeinheit zur
Verfügung gestellt.

Es wird im Rahmen des Möglichen die korrekte Funktionalität getestet
aber es kann nicht ausgeschlossen werden, dass durch Fehler in
*raspiBackup* die erwartete Funktionalität nicht gewährleistet ist.
Jeder, der *raspiBackup* benutzt, tut das auf sein eigenes Risiko.

Der Ersteller von *raspiBackup* ist in keiner Weise haftbar für
irgendwelche Fehlfunktionen des Scripts.


[.status]: todo "update or delete last donation info?"
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackup
[.source]: https://www.linux-tips-and-tricks.de/en/backup
[.source]: https://linux-tips-and-tricks.de/de/trinkgeld

