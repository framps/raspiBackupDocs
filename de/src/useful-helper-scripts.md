# Nützliche Hilfsprogramme

Mittlerweile sind verschiedene Hilfsprogramme zu *raspiBackup* entstanden.
Sie stehen auf [github](https://github.com/framps/raspiBackup/tree/master/helper) zum Download zur Verfügung:

1. **raspiBackupWrapper.sh**: Damit kann man vor und nach dem Aufruf von
   *raspiBackup* verschiedene Dinge erledigen lassen. Der Code mounted schon die
   Backuppartition und unmounted sie falls sie vorher nicht gemounted war. Es
   ist etwas bash Script Kenntnis notwendig um das Script dem eigenen Bedarf
   anzupassen.

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

[.status]: review-needed
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/507-raspibackup-nuetzliche-hilfsprogramme
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/508-raspibackup-nuetzliche-hilfsprogramme-2

