# Wiederherstellen - Restore

Restore

Ein Restore benötigt ein Linuxsystem. Windowsbenutzer oder Macbenutzer können
dafür einfach die Raspberry selbst benutzen. Dafür muss nur eine SD Karte mit
einem Raspbian gestartet werden, ein SD Kartenleser mit der neuen SD Karte die
das Restore erhalten soll angeschlossen werden, der Backup entweder per USB
oder Netzwerk gemounted werden und raspiBackup zum Restore gestartet werden.

Das dd Backup kann man auch unter [Windows zurückspielen](http://sourceforge.net/projects/win32diskimager/).
Weiterhin kann das Backupscript kann auch genutzt werden, um SD Karten zu kopieren:
Es wird ein Backup erstellt und dann auf einer anderen SD Karte restored.

Die genaue Aufrufsyntax für den Restore ist hier unten zu finden.


----------------------


raspiBackup kann erstellte Backups naürlich auch wieder restoren. Dabei werden auf der Ziel SD Karte neue Partitionen angelegt und dann mit dem entsprechenden Tool (dd, tar oder rsync) die Daten wieder restored. Das dd Backup kann man auch unter Windows restoren. Alle anderen Backuptypen benötigen eine Raspberry mit einem laufenden Raspbian oder ein anderes System, welches Linux als Betriebssystem hat. Ein manueller Restore der Daten mit den zuvor benutzten Backuptools dd, tar oder rsync ist natürlich auch möglich. Sollte ein externes Rootfilesystem gesichert worden sein wird es auch wieder auf ein externes Gerät zurückgespielt.

In der letzten Zeit bekomme ich immer wieder Issues in github weil der Restore abbricht. Ein Restore sollte immer mit demselben OS vorgenommen werden wie dem mit dem das Backup erstellt wurde. Oftmals kann ein jedes Linux OS genutzt um ein Backup zu restoren aber das kann dazu führen dass der Restore abbricht wenn die Linux Tools die zum Backup und Restore genutzt werden inkompatible Änderungen vorgenommen haben zu dem OS welches zum Restore genutzt wird. Aktuell gibt es eine inkompatible Änderung in sfdisk bei Bullseye zu den Vorgängerversionen. Deshalb lieber immer gleich dasselbe OS zum Restore nehmen!



raspiBackup - Wiederherstellen eines Backups


Funktionsübersicht

    Einfacher Restore der Sicherung für Windows, Mac oder Linux Benutzer mit der Raspberry selbst
    Meldungen in Deutsch und Englisch
    Externes Rootfilesystem kann gesichert und restored werden wenn der normale Backupmodus und ein tar oder rsync backup benutzt wurde. Bei USB boot Systemen kann eine beliebige Anzaahl von externen Partitionen restored werden ab der Release 0.6.6.
    Einsetzbar auch zum Klonen von einer Raspberry Pi
    Einfacher Update des Scripts durch die aktuellste Version (-U Parameter)
    Raspberry Pi kann sich selbst wiederherstellen
    Manuelle Wiederherstellung eines Backups


Inhaltsverzeichnis

Aufrufsyntax und -optionen

Wiederherstellungsszenario für Windows- und Macbenutzer

Wiederherstellungsszenario für Linuxbenutzer

Beispielaufrufe

    Restore auf eine SD Karte
    Restore auf eine SD Karte und eine externe Partition


Aufrufsyntax und -optionen



Hinweis

Für den Restore sollte immer dasselbe Operatingsystem benutzt werden auf welchem das Backup erstellt wurde. Es gibt Inkompatibiliäten bei geänderten Tools und der Restore bricht dadurch ab. Momentan ist es sfdisk welches sich zwischen Wheezy und Jessie geändert hat.

raspiBackup muss als Benutzer root oder per sudo aufgerufen werden.

raspiBackup.sh Option1 Option2 Option3 ... Backupverzeichnis

Ab der Release 0.6.6 kann man die Extension .sh auch weglassen

raspiBackup Option1 Option2 Option3 ... Backupverzeichnis



Je nachdem ob das Quellsystem nur die SD Karte benutzt oder sein Rootfilesystem extern ausgelagert hat sind zwei verschiedene Aufrufe des Restores zu unterscheiden, die durch den Parameter -R gesteuert werden.

Ab Version 0.6.3.2 können alle Optionen die etwas ein- oder ausschalten durch ein angehängtes + oder - gezielt ein oder ausgeschaltet werden. Beispiel: Die Option -z sowie die Option -z+ schaltet die Backupcompression ein. Mit der Option -z- wird dagegen die Backupcompression ausgeschaltet. Egal was in der Konfigurationsdatei in dem Parameter DEFAULT_ZIP_BACKUP steht. Damit kann eine Option in der Befehlszeile ausgeschaltet werden obwohl sie in der Konfigurationsdatei eingeschaltet ist.


Parameter 	Funktion 	Standard
-C 	Beim Formatieren wird mit der Option -c bei mkfs.ext4 auf Bad Blocks geprüft. Hinweis: Die Restorezeit wird dadurch erhöht. Verfügbar ab V0.6.3.2 	Aus
-d

Device auf dem der Backup restored wird.

Beispiel: /dev/sda

Hinweis:  Der Parameter muss ein Device sein und keine Partition. Es darf keine Partitionsnummer wie z.B. /dev/sda1 vorhanden sein.

Achtung: Dieses Device wird vollständig gelöscht und neu angelegt! Beim tar und rsync Backup wird automatisch die Größe der root Partition entsprechend verkleinert oder vergrößert wenn die SD Karte oder USB Stick eine andere Größe hat als die SD Karte des Backups.

Hinweis: Diese SD Karte darf nicht die aktuell vom Betriebssystem benutzte SD Karte sein. Es muss eine zweite mit einem Kartenleser angeschlossene Karte sein.
	Keiner
-g 	Anzeige des Restorefortschitts 	Aus
-R


Durch diese Option kann man Backups von Systemen restoren, die eine externe Partition als Rootpartition benutzen wie USB Sticks oder Festplatten. Dieses ist nur möglich wenn ein tar oder rsync Backup vorliegt. Der Parameter definiert die Partition auf welchem das root Verzeichnis restored werden soll. Beispiel: /dev/sdb1.

Hinweis: Diese Option nur benutzen wenn sowohl eine SD Karte als auch ein externes Rootfilesystem auf USB Stick benutzt wird. Sonst reicht die Option -d.

Achtung: Die Partition wird neu formatiert. Deshalb aufpassen, dass es die richtige Partition ist und dass die Partition gross genug ist um die Partition des Backups aufzunehmen!

Hinweis: Diese Option steht nur zur Verfuegung wenn der normale Backupmodus benuzt wurde. Im partitionsorientierten Modus (Option -P) kann keine externe Rootpartition mitgesichert werden.
	Keiner
-T 	Ab Release 0.7.0: Beim partitionsorientierten rsync Backup können damit geziuelt Partitionen ausgewählt werden die zu restoren sind. Mit "*" werden alle Partitionen restored. 	"1 2"
-Y

Standardmäßig wird vor dem Restore angezeigt wie das Restoredevice gerade aussieht und abgefragt ob man das Device wirklich überschreiben will. Soll der Restore automatisiert erfolgen wird mit dieser Option die Abfrage unterdrückt.

Achtung: Dadurch kann man u.U. unbeabsichtigt das falsche Device überschreiben und wichtige Daten löschen.

Zusätzlich muss noch die folgende Option in die Konfigurationsdatei aufgenommen werden und das Device, auf welches restored werden darf, eingetragen werden. Der Default ist das Loop Device.

# Use with care !
DEFAULT_YES_NO_RESTORE_DEVICE="loop"




--resizeRootFS




Ab Version 0.6.3.2:

Während der Wiederherstellung kann die Rootpartition auf die maximal verfügbare Größe der SD Karte oder der externen Partition ausgedehnt werden. Wird die Option ausgeschaltet mit --resizeRootFS- wird die Rootpartition so gross angelegt wie sie auf dem Originalsystem war. Diese Option wirkt nicht wenn die Option -P genutzt wurde beim Backup.
	Ein
--updateUUIDs 	 Verfuegbar ab Release 0.6.5: Beim Restore werden immer die PARTUUIDs und LABELs des Originals restored. Dieses erzeugt i.d.R. Probleme wenn man das restorte System am Originalsystem mounted. Mit dieser Option werden neue PARTUUIDs beim restore generiert. 	Aus
-0 	Es wird kein neues Paritionslayout auf der SD Karte erstellt sondern das existierende benutzt. Details dazu siehe FAQ #6 	Aus
-00 	Ab Release 0.7.0: Hiermit wird keine Formatierung der mit der Option -T ausgewählen Partitionen bei einem rsync partitionsorientierten Backup vorgenommen. Dadurch wird der Restoreprozess extrem beschleunigt da nur neue, geänderte oder gelöschte Dateien gesyncted werden. 	Aus
-1 	Das Partitionslayout wird auf der SD Karte erstellt so wie es auf der Original SD Karte existiert und dabei werden sämtliche Fehler die entdeckt werden - incl Fehler dass die Ziel SD Karte zu klein ist - ignoriert.  Siehe FAQ #6 für weitere Details. 	Aus


Hinweis: Diese Option kann unerwartete Ergebnisse haben. Benutze die Option nur wenn Du weisst was Du tust. Aus


Wiederherstellungsszenario für Windows- und Macbenutzer

Sofern eine DD Backup erstellt wurde kann das mit dem Windows32DiskImager restored werden. Alternativ kann jedes Backup mit der Pi wiederhergestellt werden. Soll ein TAR oder RSYNC Backup wiederhergestellt werden muss dieser alternative Weg beschritten werden. Die folgenden Schritte sind notwendig:

1) Ein raspbian auf der Raspberry starten

2) Die SD Karte auf die wiederhergestellt werden soll muss in einem SD Kartenlesen angeschlossen werden

3) Das Medium, welches das Backup enthält (z.B. eine Platte) muss angeschlossen und gemounted werden bzw ein Netzwerklaufwerk mit den Backupdaten muss gemounted werden

4) Falls die Rootpartition ausgelagert wurde muss eine weitere Platte angeschlossen werden, die die Rootpartition enthält, welche wiederhergestellt werden soll

Dabei wird üblicherweise die SD Karte /dev/sda, die Backuppartition /dev/sdbx und eine eventuelle Rootpartition /dev/sdcx. Wird ein Netzlaufwerk benutzt ist die Rootpartition dann üblicherweise /dev/sdbx

Die aktuelle Gerätebelegung kann anders sein und sollte immer mit

sudo parted -l

überprüft werden um zu vermeiden dass andere Partitionen irrtümlicherweise überschrieben werden.

Wiederherstellungsszenario für Linuxbenutzer

Dieses sieht genauso aus wie das für Windows- und Macbenutzer. Im Unterschied braucht aber die Raspberry Pi nicht benutzt sondern wird die SD Karte mit dem SD Kartenleser an das Linuxsystem angeschlossen, die Backuppartition gemounted und eine Partition für ein eventuelles externes Rootfilesystem bereitgestellt.


Beispielaufrufe

Notwendige Hardware für den Restore:

1) Eine laufende Raspberry Pi mit einem laufenden raspbian oder einem anderen Linux Betriebssystem oder ein anderer Linux Rechner mit installiertem raspiBackup.

2) Einen angeschlossener SD Kartenleser und eingelegte neuer SD Karte

3) Ein angeschlossenes Backupdevice (per USB oder Netz)

4) Falls eine externe Rootpartition wiederherzustellen ist oder der USB Boot Mode benutzt wird wo keine SD Karte mehr benutzt wird muss noch per USB eine weitere Platte angeschlossen sein.


Restore auf eine SD Karte

    Das gesicherte System heisst im Beispielaufruf raspberrypi
    SD Karte die den Restore der Boot- und Rootpartition erhalten soll ist im Beispiel als sdf verfügbar. Achtung: Alle bestehenden Daten der SD Karte werden nach einer Sicherheitsabfrage von raspiBackup vor dem Restore gelöscht.
    Das zu restorende Backup ist unter /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/ verfügbar
    Hier ist beschrieben wie man den aktuellen Wert für -d herausfinden kann

sudo raspiBackup.sh -d /dev/sdf /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/


Restore auf eine SD Karte und eine externe Partition

    Das gesicherte System heisst raspberrypi
    Es wurde auf /dev/sda eine entsprechend grosse Partition /dev/sda1 angelegt um den Restore aufzunehmen. Eine Formatierung ist nicht notwendig.
    Die SD Karte die den Restore der Bootpartition erhalten soll ist im Beispiel als sdf verfügbar. Achtung: Alle bestehenden Daten der SD Karte werden nach einer Sicherheitsabfrage von raspiBackup vor dem Restore gelöscht.
    Die externe Rootpartition auf der das Rootfilesystem restored werden soll liegt im Beispiel auf sda1. Achtung: Alle Daten der Partition /dev/sda1 werden nach einer Sicherheitsabfrage von raspiBackup vor dem Restore gelöscht.
    Das zu restorende Backup ist unter /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi/-rsync-backup-20141230-213032/ verfügbar
    Hier ist beschrieben wie man den aktuellen Wert für -d und -R herausfinden kann

sudo raspiBackup.sh -d /dev/sdf -R /dev/sda1 /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/


Restore auf eine USB Platte ohne SD Karte (USB boot mode)

    Das gesicherte System heisst im Beispielaufruf raspberrypi
    USB Platte die den Restore der Boot- und Rootpartition erhalten soll ist im Beispiel als sdf verfügbar. Achtung: Alle bestehenden Daten der USB Platte werden nach einer Sicherheitsabfrage von raspiBackup vor dem Restore gelöscht.
    Das zu restorende Backup ist unter /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/ verfügbar
    Hier ist beschrieben wie man den aktuellen Wert für -d herausfinden kann

sudo raspiBackup.sh -d /dev/sdf /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/


Wie kann man die Gerätenamen der externen SD Karte und externen Platte herausfinden?

Auf demr raspberry muss man folgenden Befehl eingeben:

fdisk -l | egrep "^Disk /|^/dev"

Die Ausgabe sieht dann z.B. wie folgt aus:

pi@raspberrypi:~# sudo fdisk -l | egrep "^Disk /|^/dev"
Disk /dev/mmcblk0: 8011 MB, 8011120640 bytes
/dev/mmcblk0p1            8192      122879       57344    c  W95 FAT32 (LBA)
/dev/mmcblk0p2          122880    15646719     7761920   83  Linux
Disk /dev/sda: 15.5 GB, 15548284928 bytes
Disk /dev/sdb: 300.1 GB, 300069052416 bytes
/dev/sdb1               1   586072367   293036183+  ee  GPT

Nun sieht man dass die interne SD Karte /dev/mmcblk0 8GB gross ist, die neue externe SD Karte /dev/sda 16Gb gross ist und die externe Platte /dev/sdb auf die die Rootpartition gebracht werden soll ist 300GB gross und hat eine Partition /dev/sdb1.

Somit sind ist der Parameter für  -d /dev/sda (Externe SD Karte). Falls eine externe Rootpartition mitgesichert wurde ist noch -R /dev/sdb1 (Externe Rootpartition) notwendig. Die Parameter müssen natürlich den lokalen Gegebenheiten angepasst werden.


Hinweis

EIn Backup sollte regelmäßig getestet werden ob der Restore immer noch funktioniert und auch immer noch alle Daten beinhaltet. Nichts ist so frustrierend wenn man in dem Moment, wo man das Backup benötigt, feststellt, dass das Backup korrupt ist oder nicht alle Daten enthält. Ein Test ist bei der Raspberry recht einfach. Eine neue SD- Karte einlegen, das Backup restoren und von der neuen SD-Karte booten.

Falls aus irgendwelchen Gründen der Restore mit dem Script fehlschlägt kann man natürlich jederzeit die vom Script gesicherten Daten mit den Standard Linuxtools, die zum Backup genutzt wurden - dd, tar oder rsync - wieder restoren. Allerdings geht das dann nicht so bequem wie mit dem Script.

