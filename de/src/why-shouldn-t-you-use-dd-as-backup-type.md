# Warum sollte man dd als Backuptyp besser nicht benutzen?

Viele Benutzer von *raspiBackup* nutzen `dd` als Backuptyp.
Insbesondere Nutzer, die mehr mit Windows als mit Linux arbeiten, da
sie einen dd Backup unter Windows mit *win32imager* oder ähnlichen Tools restoren
können. dd kann schon als Backuptool benutzt werden, aber es gibt ein gewisses
Risiko dabei, welches es bei den Backupmethoden tar und rsync nicht gibt.
Deshalb empfehle ich jedem Benutzer von *raspiBackup*, doch lieber tar oder rsync
zu benutzen.

## Warum?

1. dd sichert eine ganze Partition 1 zu 1 auf Bitebene. Dabei werden Fehler
   gemeldet, wenn die Bits nicht gelesen werden können. Es kommt aber auch immer
   mal wieder vor, dass es Filesystemfehler gibt. Diese entstehen i.d.R. durch
   plötzlichen Stromausfall. Diese Fehler bemerkt dd nicht. D.h. dd sichert
   eine Parition mit Filesystemfehlern, die dann beim Restore auch
   wiederhergestellt werden. Somit hat man eine exakte Kopie des Systems mit
   Filesystemfehlern. Man legt immer weiter Backups an, im Glauben das alles OK
   ist und löscht dann irgendwann auch alte Backups. Somit werden nach und nach
   unbemerkt Backups ohne Filesystemfehler durch Backups mit Filesystemfehlern
   ersetzt. Wenn dann ein Restore benötigt wird, hat man kein Backup mehr ohne
   Filesystemfehler und kann nur hoffen, dass die Filesystemfehler keine
   wichtigen Daten des Systems beschädigt haben. Ansonsten ist das Backup
   unbrauchbar.

2. Beim Restore eines dd Backups wird das Backup 1 zu 1 auf Bitebene
   zurückgespielt. Wenn die SD Karte nicht OK ist, wird oftmals kein Fehler von
   dd gemeldet. Bootet man dann das System, startet es nicht oder es gibt
   Fehlermeldungen von Systemservices. Dann melden sich die Benutzer und
   erstellen einen Problembericht, weil *raspiBackup* nicht korrekt funktioniert.
   Nachdem sie dann gebeten werden, doch mal einen Restore auf eine neue SD Karte
   vorzunehmen, ist das Problem verschwunden. Diese Problemberichte sind
   unnötiger Aufwand, der vermieden werden sollte.

3. Will man den restorten Backup parallel zum laufenden System verfügbar haben,
   bekommt man dadurch i.d.R. Bootprobleme, da das wiederhergestellte Backup
   dieselben UUIDs und PARTUUIDs hat.

## Was nun?

Eine Umstellung auf tar ist schnell gemacht. Es kann dasselbe Filesystem auf
der Backuppartition genutzt werden wie für dd. Nur kann kein Restore mehr mit
Windowsprogrammen wie Win32DiskImager oder Etcher vorgenommen werden. Dazu kann
man aber *raspiBackup* auf einer Raspberry starten. Hat man nur eine Raspberry
muss man sich einmal eine Not-SD Karte mit Raspbian und *raspiBackup* erstellen
und in den Schrank legen, bis man sie braucht.

Für rsync benötigt man ein etx2/3/4 Filesystem auf der Backuppartition. Dieses
kann unter Linux erstellt werden. Den Restore muss man auch wieder mit
*raspiBackup* auf einer Raspberry vornehmen.


## Weitere Nachteile von einem dd Backup

Bei einem dd Backup wird immer die gesamte Partition gesichert - selbst wenn
nur ein Bruchteil der Partition (z.B. 33%) genutzt wird. Dass heisst bei einer
64GB Partition werden immer 42GB umsonst gesichert, der Sicherungsprozess
dauert unnötigerweise 66% länger und die Sicherung belegt unnütz 66% mehr
Speicherplatz.


## Welchen Backuptyp empfehle ich?

Die effizienteste Backuptyp ist rsync. Durch die Benutzung von Hardlinks
werden nur Dateien kopiert, die sich geändert haben und somit ist jeder ausser
dem ersten Backupvorgang relativ schnell beendet. Ausserdem liegen die
Backupdateien entpackt vor und auf sie kann sofort zugegriffen werden, wenn nur
mal ein paar Dateien aus dem Backup benötigt werden. Bei tar und dd muss man
die Backups erst umständlich entpacken. Wer eine Synology als Backupsystem
benutzen will, sei hier auf Benutzung von [Synology als Backupspace](synology-as-backupspace.md) verwiesen.


## Weiterführende Informationen

  - [Wie funktionieren Hardlinks?](how-do-hardlinks-work-with-rsync.md)
  - [Welches Dateisystem kann auf dem Backupgerät benutzt werden?](which-filesystem-can-be-used-on-the-backup-partition.md)


[.status]: done
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/579-warum-sollte-man-dd-als-backupmethode-besser-nicht-benutzen
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/581-why-shouldn-t-you-use-dd-as-backup-method
