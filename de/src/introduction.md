``` admonish info title="Work in progress - In Arbeit"
Dies ist die Dokumentation zu *raspiBackup* in neuer Form.

Zum Wechseln der Sprache (deutsch/englisch) ist oben rechts ein kleines Globus-Icon vorhanden.

Infos zum aktuellen Stand und zur Möglichkeit der Mitarbeit an dieser Dokumentation
stehen auf der [Projektseite bei GitHub](https://github.com/framps/raspiBackupDoc).
```

<center>     <!-- The blank line before the image definition is required! -->
  
![Icon](images/icons/Icon_rot_blau_final_128.png)
</center>

# Einführung

> *raspiBackup* - Erstelle regelmäßig automatisch Sicherungsversionen Deiner Raspberries

Eine regelmäßige Sicherung von Raspberry Pis ist wichtig, um im Falle eines
Ausfalls des Systemspeichergerätes (SD Karte, USB Disk, SSD, NVMe ...) oder auch von
unbeabsichtigten Änderungen durch die das System nicht mehr oder fehlerhaft bootet, das System wieder auf einen vorherigen Zustand zurücksetzen zu können.

*raspiBackup* erstellt eine Sicherung eines Raspberry Pis **bei laufendem System**.
Das kann manuell oder automatisch in regelmäßigen Abständen per systemd oder crontab erfolgen. Optional kann man sich per eMail, Pushover, Slack oder Telegram über das Ergebnis des Backups informieren lassen.

Backups können auf alle Geräte, die an Linux gemounted werden können, gesichert
werden (USB Stick, USB Platte, SSD, NVMe, nfs, smb, sshfs, webdav usw).

Wer eine Synology oder andere Backupziele für den Backup benutzen möchte,
findet [hier](more-backupspaces.md) nützliche Tipps.

Es exitsieren zwei Backupmodi: Der **normale Backupmodus** sichert nur die Boot- und Rootpartition. Sollen weitere Partitionen gesichert werden, z.B. eine reine dritte Datenpartition, muss der **partitionsorientierte Modus** gewählt werden.

Folgende Linux Backuptools können genutzt werden: `dd` Backup, `tar` Backup, (beides auch gezipped) und ein `rsync` Backup mit Hardlinkbenutzung um Deltabackups zu erzeugen.
Die einzelnen Backuptypen sind im Detail [hier](backuptypes.md) nachzulesen.
Dort befindet sich auch ein Entscheidungsbaum, um schneller die richtige Backupmethode zu finden.

Zur **Installation und Konfiguration** von raspiBackup gibt es einen Installer mit dem,
wie bei raspi-config, menugesteuert, einfach und schnell die wichtigsten Optionen von raspiBackup konfiguriert werden können. Sollen spezielle Dinge bei raspiBackup konfiguriert werden muss eine Konfigurationsdatei manuell geändert werden.

raspiBackup kann natürlich nicht nur eine Sicherung erstellen sondern auch eine Sicherung **wiederherstellen**. Siehe dazu [Wiederherstellung](restore.md).

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
nur alle wichtigen Services die Daten im Speicher halten, vor dem Backup gestoppt und nach erfolgtem Backup wieder gestartet werden.

Die notwendigen Befehle dazu können manuell über Parameter in der Konfigurationsdatei definiert werden. Mit dem raspiBackup Installer können alle per Systemd gestarteten Services ausgewählt werden die dann vor dem Backup gestoppt werden und nach dem Backup werden sie wieder in umgekehrter Reihenfolge gestartet.

## Erweiterungspunkte

Weiterhin gibt es [Erweiterungspunkte](hooks-for-own-scripts.md) für Plugins in *raspiBackup*, um eigene Scripts an bestimmten Stellen im Backupscript einzubinden und kann somit die Funktionalität von raspiBackup den eigenen Bedürfnissen anpassen.

## Optional ausgelagerte Root-Partition

Eine eventuell ausgelagerte Rootpartition kann mitgesichert werden. Dieses ist nur notwendig wenn eine ältere Raspberry gesichert werden soll die noch kein USB Boot unterstützt.

Im normalen Backupmodus werden die beiden RaspbianOSppartitionen
/boot und /root. Sofern die Rootpartition auf eine externe
Partition (USB Stick, USB Platte, ...) ausgelagert wurde, wird diese externe
Partition gesichert.

Ein USB Boot System kann mit einer beliebigen Anzahl von Partitionen
gesichert werden. Dazu muss der partitionsorientierte Modus genutzt werden.

## Einführungsvideo und Youtube-Channel

Es gibt ein [Einführungsvideo zu raspiBackup](https://youtu.be/PuK_FNK674s) auf Youtube.

Behandelte Themen sind

  * Vorstellung von *raspiBackup* mit seinen wichtigsten Fähigkeiten
  * Besuch der wichtigstens Webseiten zu *raspiBackup*
  * Vorstellung von github als Fragen- und Probleminteraktionstool
  * Liveinstallation von *raspiBackup* mit dem menuegesteuerten Installer

Die dort verwendeten Slides können zum Lesen [hier](https://www.linux-tips-and-tricks.de/de/downloads/raspibackup-de-pdf/download) runtergeladen werden.

Viele weitere Videos zu allen möglichen Themen zu *raspiBackup* finden sich im [raspiBackup-Channel](https://www.youtube.com/@raspiBackup).



<a name="kontakt"></a>
## Kontaktmöglichkeiten

* Klicke [![Github](images/icons/GitHub-Mark-32px.png)](https://github.com/framps/raspiBackup/issues),
  um auf Github Fragen oder Probleme zu *raspiBackup* als Issues zu erstellen.
  Die Issues können gerne auch in Deutsch erstellt werden.
  So lassen sich Fragen und Problemberichte tracken und man bekommt eine Benachrichtigung über Antworten.

* Klicke [![Facebook](images/icons/FB-f-Logo__blue_29.png)](https://www.facebook.com/raspiBackup/),
  um auf Facebook aktuelle Aktivitäten und Randinformationen zu *raspiBackup* zu erfahren.
  Fragen zu *raspiBackup* sind auch möglich. Probleme bitte nur im [github](https://github.com/framps/raspiBackup/issues) melden.

* Klicke [![Twitter](images/icons/Twitter-f-Logo__blue_29.png)](https://www.twitter.com/linuxframp),
  um *raspiBackup* auf Twitter zu folgen.

* Klicke [![Youtube](images/icons/Youtube.png)](https://www.youtube.com/channel/UCnFHtfMXVpWy6mzMazqyINg),
  um auf Youtube Videos zu *raspiBackup* zu sehen.

* Klicke [![RaspberryForum](images/icons/RaspberryForumSmall.png)](https://forum-raspberrypi.de/forum/board/153-backup/),
  um im deutschen Raspberryforum Fragen zu Raspberry Backups im Allgemeinen und *raspiBackup* im Speziellen zu stellen oder existierende Threads zu *raspiBackup* zu lesen.

* Klicke [![Reddit](images/icons/reddit-icon.png)](https://www.reddit.com/r/raspiBackup/),
  um auf Reddit *raspiBackup* zu folgen.

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
   gewiss eine Alternative. Z.B. wurde Trinkgeld schon mehrmals auf die
   gute alte Art per Brief zugeschickt :-)


## Danksagungen

Es haben im Laufe der Zeit sehr viele Leute aus der Community durch Kommentare,
Erweiterungsvorschläge und Beta- und Fixtests zu *raspiBackup* beigetragen.
In Anbetracht der grossen Anzahl ist es leider nicht möglich, jeden einzelnen aufzuführen.

Daher einfach: Vielen Dank Euch allen!


## Lizenz und GitHub-Link

Der Code von *raspiBackup* ist reiner bash Code und steht unter der GPL auf [github](https://github.com/framps/raspiBackup) zur Verfügung.


## Haftungsausschluss

*raspiBackup* wurde für den persönlichen Gebrauch erstellt und, da es sich als sehr nützlich erwies, der Allgemeinheit zur
Verfügung gestellt.

Es wird im Rahmen des Möglichen die korrekte Funktionalität getestet
aber es kann nicht ausgeschlossen werden, dass durch Fehler in
*raspiBackup* die erwartete Funktionalität nicht gewährleistet ist.
Jeder, der *raspiBackup* benutzt, tut das auf sein eigenes Risiko.

Der Ersteller von *raspiBackup* ist in keiner Weise haftbar für
irgendwelche Fehlfunktionen des Scripts.

[.source]: https://www.linux-tips-and-tricks.de/de/raspibackup
[.source]: https://www.linux-tips-and-tricks.de/en/backup
[.source]: https://linux-tips-and-tricks.de/de/trinkgeld
[.status]: wip "Review by framp ongoing"
