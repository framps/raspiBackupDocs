# Wie funktionieren Hardlinks zusammen mit rsync

Immer wieder wird gefragt, wie der rsync Backup funktioniert und wie Hardlinks
dazu eingesetzt werden. Der folgende Artikel beschreibt, wann Dateien im
Dateisystem erstellt und gelöscht werden, sowie, wann Hardlinks erstellt und
entfernt werden.

Hardlinks sind eine Filesystemfähigkeit, die von dem Linux ext3 und ext4
Filesystem unterstützt werden. Es sind Zeiger, die einen Dateinamen mit seinem
Inhalt auf dem Filesystem verbinden. D.h. mit Hardlinks können auf Dateien mit
unterschiedlichen Namen aus unterschiedlichen Positionen im Dateibaum verwiesen
werden. Der Linux Befehl `ln` kann z.B. dazu benutzt werden.

Bei einem ersten rsync Backup werden alle Dateien kopiert und im
Backupverzeichnis gesichert. Bei dem zweiten und jedem folgenden Backup werden
nur die Dateien erneut kopiert, die neu sind oder sich geändert haben, sowie
gelöschte Dateien gelöscht.

Dadurch sind i.d.R. alle rsync Backups bis auf den
ersten relativ schnell, sofern sich die geänderte Datenmenge in Grenzen hält.
Für alle anderen Dateien, die sich nicht geändert haben, werden im
Backupverzeichnis Hardlinks auf die Dateien erstellt, die in vorherigen Backups
gesichert wurden. Werden Dateien gelöscht, wird der Hardlink auf die vorher
gesicherte Datei, die im vorherigen Backup existiert, im neuen Backup nicht mehr
angelegt und somit die Datei im neuen Backup entfernt. Dadurch hat man
jederzeit immer vollen Zugriff auf einen Backupstand und sich nicht ändernde
Dateien werden nicht immer wieder gesichert und belegen Plattenplatz. Dadurch
spart man Backupzeit und -platz. Eine Datei wird erst dann gelöscht, wenn sie
keine Hardlinks mehr auf sich hat. D.h. solange es ein Backup gibt, welche auf
die Datei per Hardlink verweist, wird die Datei nicht gelöscht und steht für ein
Restore zur Verfügung. In der nachfolgenden Graphik wird gezeigt, wann F2 in BD6
im Filesystem gelöscht wird. Das stimmt aber nur, wenn vorher alle Backups, die
F2 beinhalteten, gelöscht wurden - also BD1 - BD5.


Das folgende Bild zeigt noch einmal graphisch wann Hardlinks und Dateien
erstellt bzw gelöscht werden. Es gibt auch ein zugehöriges [Youtube Video](https://www.youtube.com/watch?v=pIhSca_q2lo), in dem
erklärt wird wie Hardlinks funktionieren inklusive einer Demo am System.

![raspiBackup rsync](images/raspiBackup_rsync.png)

In den raspiBackup [FAQ17](faq.md#faq17) ist beschrieben, wie der wirklich belegte
Speicherplatz bei der Nutzung von Hardlinks aussieht. Viele Dateimanager
zeigen leider den genutzten Speicherplatz an ohne Berücksichtigung der Platzeinsparung
durch Hardlinks und somit als viel zu hoch an.

## Weblinks

- [du counting harldinks towards filesize](https://stackoverflow.com/questions/19951883/du-counting-hardlinks-towards-filesize) - Ein Artikel, der erklärt, warum der Befehl du über mehrere Verzeichnisses ausgeführt werden muss, um die Einsparungen durch Hardlinks zu sehen

[.status]: review-needed
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/571-wie-funktioniert-der-rsync-backup-typ-mit-hardlinks
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/572-how-do-hardlinks-work-with-rsync
