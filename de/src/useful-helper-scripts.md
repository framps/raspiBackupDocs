# Nützliche Hilfsprogramme

Mittlerweile sind verschiedene Hilfsprogramme zu *raspiBackup* entstanden.
Sie stehen auf [github](https://github.com/framps/raspiBackup/tree/master/helper) zum Download zur Verfügung:

1. **raspiBackupWrapper.sh**: Damit kann man vor und nach dem Aufruf von
   *raspiBackup* verschiedene Dinge erledigen lassen. Der Code mounted schon die
   Backuppartition und unmounted sie falls sie vorher nicht gemounted war. Es
   ist etwas bash Script Kenntnis notwendig um das Script dem eigenen Bedarf
   anzupassen.

   **Hinweis**
   Dieses Script entstand als raspiBackup noch keine Erweiterungspunkte hatte. Normalerweise
   reicht es die vorhandenen [Erweiterungspunkte](https://framps.github.io/raspiBackupDoc/de/hooks-for-own-scripts.md)
   zu nutzen um die Funktionalität von raspiBackup für die eigenen Bedürfnisse zu erweitern.

2. **raspiBackupNfsWrapper.sh**: Es wird von dem Script geprüft, ob ein NFS Server
   verfügbar ist und nur dann *raspiBackup* gestartet. Ausser ein paar
   Definitionen des NFS Servers ist nichts anzupassen.

3. **raspiBackupRestore2Image.sh**: Mit diesem Script kann ein tar oder rsync
   Backup, welches in normalen Backupmodus erstellt wurde, in ein dd Backup
   umgewandelt werden. Dazu wird pishrink benutzt, um die Größe des dd Images
   minimal zu halten. kmbach hat die Erstellung des Scripts angeregt.
   Das Script erfordert keine Änderungen.

4. **raspiImageMail.sh**: Dieses Script wurde von dem *raspiBackup* Benutzer kmbach
   erstellt, weil er wollte, dass er am Ende von dem Aufruf von
   raspiBackupRestore2Image.sh eine eMail erhalten wollte. Dazu werden die
   *raspiBackup* eMail Konfigurationsparameter benutzt.
   Das Script erfordert keine Änderungen.

5. **raspiBackupAndClone.sh**: Dieses Script erstellt eine Backupversion mit raspiBackup
   und restored anschliessend das aktuelle Backup auf ein angeschlossenens Device. Somit hat
   man nach dem Backup immer sofort ein aktuelles Backupsystem von welchem man booten kann
   wenn das Systemdevice korrupt wurde. Nimmt man den partitionsorientierten Backup mit rsync
   ist der Restore nur eine Synchronisation der Änderungen zum vorherigen Stand und das geht
   wesentlich schneller als ein Vollrestore mit tar oder dd.

   **Hinweis**: Falls das System durch irgendwelche Fehlconfiguration nicht mehr bootet hilft das geclonte Backup
   natürlich nicht denn darin befindet sich dieselbe Fehlkonfiguration. In diesem Falle muss man ein
   älteres noch funktionierendes Backup manuell restoren.

6. **raspiBackupAndJSON.sh**: Wer die von raspiBackup erzeugten Meldungen nach dem Backup untersuchen will
   kann mit diesem Script die Mledungen im JSON Format erzeugen lassen und kann sie dadurch wesentlich einfacher parsen
   wie z.B. mit jq.

7. **raspiBackupDialog.sh**: Dieses von [Franjo](https://github.com/franjo-G) erstellte Script ist ein raspiBackup vorgeschaltetes
   Script mit welchem einfacher Backups erstellt wie auch restored werden können.
   Details dazu finden sich im Kapitel [raspiBackupDialog - ein komfortables Hilfsscript für raspiBackup](https://framps.github.io/raspiBackupDoc/de/raspibackupdialog-a-convenient-helper-script-for-raspibackup.md).

``` admonish info title="Hinweis"
   Es ist empfehlenwert raspiBackupDialog nach erfolgreicher Installation und Konfiguration von raspiBackup einfach mal downizuloaden und auszuprobieren.
```

[.status]: rft
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/507-raspibackup-nuetzliche-hilfsprogramme
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/508-raspibackup-nuetzliche-hilfsprogramme-2

