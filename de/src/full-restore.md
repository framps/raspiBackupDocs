# Wiederherstellen - Restore mittels raspiBackup

*raspiBackup* stellt **komplette** Wiederherstellungen zur Verfügung, d.h. alle Partitionen werden i.d.R. wiederhergestellt.
Beim paritionsorientierten Modus kann man die zu restorenden Paritionen auswählen.

Bei einem Restore werden auf dem Ziel-Datenträger (SD-Karte, USB-Platte, ...)
neue Partitionen angelegt und dann mit dem entsprechenden Tool (`dd`, `tar` oder `rsync`)
die Daten dorthin restored.

Der Ziel-Datenträger darf also aktuell nicht vom Betriebssystem selbst benutzt werden.
Es muss eine weitere, mit einem Kartenleser angeschlossene Karte, USB-Platte, SSD oder NVMe Gerät sein..

Ein Restore benötigt ein **Linuxsystem**. Dazu sollte man i.d.R. eine Raspberry nehmen. Andere Linuxsysteme
funktionieren i.d.R. auch. Es ist aber nicht 100% garantiert dass es damit immer funktioniert.

Sollte ein externes Rootfilesystem gesichert worden sein, wird es auch wieder
auf ein externes Gerät zurückgespielt
(Nur bei normalem Backupmodus mit `tar` oder `rsync` Backup).

Bei USB Boot Systemen kann eine beliebige Anzahl von externen Partitionen restored
werden.

Ein [manueller Restore](manual-restore.md)  der Daten mit den zuvor benutzten Backuptools `dd`, `tar` oder `rsync`
ist natürlich auch möglich. Ebenso ist (manuell) auch die Wiederherstellung einzelner Dateien
möglich, insbesondere beim `rsync` Backup sehr einfach.

Das Backupscript kann auch genutzt werden, um Systeme zu kopieren: Es wird ein Backup erstellt und dann auf einem anderen Gerät restored.
Typische Anwendung ist eine SD Karte auf eine SSD oder NVMe zu kopieren und danach das System nicht mehr mit einer SD Karte zu betreiben.

------------------

Weitere Themen auf dieser Seite:

<!-- toc -->

------------------

## Wiederherstellungsszenario für Alle

Jedes Backup kann mit der/einer Raspberry Pi wiederhergestellt werden.

1. Ein *Raspberry Pi OS* auf der Raspberry starten

1. *raspiBackup* installieren

1. Das System, das wiederhergestellt werden soll, per USB anschließen.

1. Das Medium, welches das Backup enthält (z.B. eine Platte), anschließen
   und mounten bzw. ein Netzwerklaufwerk mit den Backupdaten mounten

1. Falls die Rootpartition ausgelagert wurde, eine weitere Platte anschließen,
   die die Rootpartition enthält, welche wiederhergestellt werden soll

1. *raspiBackup* zum Restore starten, Aufruf siehe [unten](#devicenames).


Dabei wird üblicherweise

  - das Systemgerät `/dev/sda`
  - die Backuppartition `/dev/sdbx`
  - und eine eventuelle Rootpartition `/dev/sdcx`

genutzt.  

Wird ein Netzlaufwerk benutzt, ist die Rootpartition dann üblicherweise `/dev/sdbx`

Die aktuelle Gerätebelegung kann anders sein und sollte **immer** mit z.B.

    sudo parted -l

überprüft werden, um zu vermeiden, dass andere Partitionen irrtümlicherweise überschrieben werden.


## Wiederherstellungsszenario für Windowsbenutzer

Nur ein `dd` Backup lässt sich (auch) direkt unter Windows,
mit dem [Win32DiskImager](http://sourceforge.net/projects/win32diskimager/), restoren.


## Wiederherstellungsszenario für Linuxbenutzer

``` admonish note title="Hinweis"
Im Prinzip kann zwar jedes Linux OS genutzt werden, um ein Backup zu restoren.
Aber bei möglichen Inkompatibiliäten dessen Tools, im Vergleich zu den beim Backup
verwendeten Linux-Tools, kann es Probleme geben.
Ein gelegentlich auftauchender Kandidat dafür ist `sfdisk`,
das sich sowohl zu *Jessie* als auch zu *Bullseye* inkompatibel geändert hatte.

Deshalb:

**Ein Restore sollte immer mit demselben OS vorgenommen werden, mit dem auch
das Backup erstellt wurde**.
```

Es wird die SD Karte mit dem SD Kartenleser an das Linuxsystem angeschlossen,
die Backuppartition gemounted und eine Partition für ein eventuelles externes
Rootfilesystem bereitgestellt.

Dann *raspiBackup* zum Restore starten, Aufruf siehe [unten](#devicenames).

## Aufrufsyntax und -optionen

*raspiBackup* muss als Benutzer *root* oder per `sudo` aufgerufen werden.

    raspiBackup Option1 Option2 Option3 ... Backupverzeichnis


Alle Optionen, die etwas ein- oder ausschalten, können durch
ein angehängtes `+` oder `-` gezielt ein oder ausgeschaltet werden.

Beispiel: Die Option `-z` sowie die Option `-z+` schaltet die Backupcompression ein.
Mit der Option `-z-` wird dagegen die Backupcompression ausgeschaltet. Unabhängig davon,
was in der Konfigurationsdatei in dem Parameter `DEFAULT_ZIP_BACKUP` steht. Damit kann eine
Option in der Befehlszeile ausgeschaltet werden, obwohl sie in der
Konfigurationsdatei eingeschaltet ist.

Hier nun die möglichen Optionen einzeln erläutert:

### -C

Beim Formatieren wird mittels `mkfs.ext4 -c` auf Bad Blocks geprüft.  
Hinweis: Die Restorezeit wird dadurch erhöht. 

Default: Aus

### -d device

Device, auf dem der Backup restored wird.

Beispiel: `-/dev/sda`

Hinweis:  Der Parameter muss ein Device sein und keine Partition. Es darf keine
Partitionsnummer wie z.B. bei `/dev/sda1` vorhanden sein.

Achtung: Dieses Device wird i.d.R. vollständig gelöscht und neu angelegt! Beim `tar` und
`rsync` Backup wird automatisch die Größe der root Partition entsprechend
verkleinert oder vergrößert, wenn das Zielgerät eine andere Größe
hat als das gesicherte System. Dabei muss natürlich auf dem Zielgerät noch genügend Platz für die
Daten des Quellsystems vorhanden sein. Ist nicht genügend Platz wird der Restore abbrechen.

### -g

Anzeige des Restorefortschitts

Default: Aus

### -R

Durch diese Option kann man Backups von Systemen restoren, die eine externe
Partition als Rootpartition benutzen, wie USB Sticks oder Festplatten.
Dieses ist nur möglich, wenn ein `tar` oder `rsync` Backup vorliegt.
Der Parameter definiert die Partition, auf welchem das root Verzeichnis restored
werden soll.  Beispiel: `/dev/sdb1`.

Hinweis: Diese Option nur benutzen, wenn sowohl eine SD Karte als auch ein
externes Rootfilesystem auf USB Stick benutzt wird. Sonst reicht die Option `-d`.
Die Option ist nur sinnvoll bei älteren Raspberries die noch keinen USB Boot unterstützen.

Achtung: Die Partition wird **neu formatiert**. Deshalb aufpassen, dass es die
richtige Partition ist und dass die Partition gross genug ist, um die Partition
des Backups aufzunehmen!

Hinweis: Diese Option steht nur zur Verfuegung, wenn der normale Backupmodus
benuzt wurde. Im partitionsorientierten Modus (Option `-P`) kann keine externe
Rootpartition mitgesichert werden.

### -T

Beim partitionsorientierten `rsync` Backup können damit
gezielt Partitionen ausgewählt werden, die zu restoren sind. Mit `"*"` werden
alle Partitionen restored.

Default: `"1 2"`

### -Y

Standardmäßig wird vor dem Restore angezeigt, wie das Restoredevice gerade
aussieht und abgefragt, ob man das Device wirklich überschreiben will. Soll der
Restore automatisiert erfolgen, wird mit dieser Option die Abfrage unterdrückt.

Achtung: Dadurch kann man u.U. unbeabsichtigt das falsche Device überschreiben
und wichtige Daten löschen.

Zusätzlich muss noch die folgende Option in die Konfigurationsdatei aufgenommen
werden und das Device, auf welches restored werden darf, eingetragen werden.
Der Default ist das Loop Device.

**Use with care!**

DEFAULT_YES_NO_RESTORE_DEVICE="loop"

### --resizeRootFS

Während der Wiederherstellung kann die Rootpartition auf die maximal verfügbare
Größe des Zielgerätes der externen Partition ausgedehnt werden. Wird die
Option ausgeschaltet mit --resizeRootFS- wird die Rootpartition so gross
angelegt wie sie auf dem Originalsystem war. Nutze man die Option -P so wird die letzte
Partition auf dem Gerät erweitert. Liegen megr als 2 Paritionen vor ist es dann nicht die Rootpartition.

Default: Ein

### --updateUUIDs

Beim Restore werden immer die PARTUUIDs, UUIDs und LABELs
des Originals restored. Dieses erzeugt i.d.R. Probleme, wenn man das restorte
System am Originalsystem mounted. Mit dieser Option werden neue PARTUUIDs, UUIDs und LABEL beim
Restore generiert.

Default: Aus

### -0

Es wird kein neues Paritionslayout auf dem Zielgerät erstellt, sondern das
existierende benutzt. Somit kann man eine gewünschte Partitionierung vor dem Restore vornehmen
und dann ein Backup restoren. Details dazu siehe [FAQ #6](faq.md#faq6)

Default: Aus

### -00

Hiermit wird keine Formatierung der mit der Option `-T`
ausgewählen Partitionen bei einem `rsync` partitionsorientierten Backup
vorgenommen. Dadurch wird der Restoreprozess extrem beschleunigt, da nur neue,
geänderte oder gelöschte Dateien gesyncted werden.

Default: Aus

### -1

Das Partitionslayout wird auf der SD Karte erstellt so wie es auf dem Quellgerät
existiert und dabei werden sämtliche Fehler, die entdeckt werden - inklusive des
Fehlers, dass das Zielgerät zu klein ist - ignoriert.  Siehe [FAQ #6](faq.md#faq6) für
weitere Details.

Default: Aus

Hinweis: Diese Option kann unerwartete Ergebnisse haben.
Benutze die Option nur, wenn Du weisst, was Du tust.

## Beispielaufrufe

Notwendige Hardware für den Restore:

1. Eine laufende Raspberry Pi mit einem laufenden *Raspberry Pi OS* oder einem anderen
   Linux Betriebssystem oder ein anderer Linux Rechner mit installiertem *raspiBackup*.

1. Ein angeschlossenes Zielgerät des Backups

1. Ein angeschlossenes Backupdevice (per USB oder Netz)

1. Falls eine externe Rootpartition wiederherzustellen ist oder der USB Boot
   Mode benutzt wird, wo keine SD Karte mehr benutzt wird, muss noch per USB eine
   weitere Platte angeschlossen sein.

Gemeinsamkeiten der Beispieleaufrufe:

1. Das gesicherte System heisst im Beispielaufruf "raspberrypi".
1. Der **Ziel**-Datenträger, der den Restore der Boot-/bzw.
   Boot- und Root-Partition erhalten soll, ist im Beispiel als `/dev/sdf` verfügbar.  
   [Weiter unten](#devicenames) ist beschrieben, wie man den aktuellen Wert für `-d` herausfinden kann
1. **Achtung**: Alle bestehenden Daten der **Ziel**-Datenträger werden nach einer Sicherheitsabfrage
   von *raspiBackup* vor dem Restore gelöscht.
1. Das zu restorende Backup ist verfügbar unter
   `/remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/`


### Restore auf eine SD Karte

```
sudo raspiBackup.sh -d /dev/sdf /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/
```

### Restore auf ein USB Gerät ohne SD Karte (USB boot mode)

```
sudo raspiBackup.sh -d /dev/sdf /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/
```

### Restore auf eine SD Karte und eine externe Partition

1. Um den Restore der externe Rootpartition aufzunehmen, wurde auf `/dev/sda`
   eine entsprechend große Partition `/dev/sda1` angelegt. Eine Formatierung ist nicht notwendig.

```
sudo raspiBackup.sh -d /dev/sdf -R /dev/sda1 /remote/raspifix/disks/backup/rsync/raspberrypi/raspberrypi-rsync-backup-20141230-213032/
```

<a name="devicenames"></a>
## Wie kann man die Gerätenamen der externen SD Karte und externen Platte herausfinden?

Auf der Raspberry ist folgender Befehl einzugeben:

```
fdisk -l | egrep "^Disk /|^/dev"
```

Die Ausgabe sieht dann z.B. wie folgt aus:

```
pi@raspberrypi:~# sudo fdisk -l | egrep "^Disk /|^/dev"
Disk /dev/mmcblk0: 8011 MB, 8011120640 bytes
/dev/mmcblk0p1            8192      122879       57344    c  W95 FAT32 (LBA)
/dev/mmcblk0p2          122880    15646719     7761920   83  Linux
Disk /dev/sda: 15.5 GB, 15548284928 bytes
Disk /dev/sdb: 300.1 GB, 300069052416 bytes
/dev/sdb1               1   586072367   293036183+  ee  GPT
```

Hier sieht man, dass

  - die interne SD Karte `/dev/mmcblk0` 8GB gross ist
  - die neue externe SD Karte `/dev/sda` 16Gb gross ist
  - die externe Platte `/dev/sdb`, auf die die Rootpartition gebracht werden soll,
    300GB gross ist und eine Partition `/dev/sdb1` hat.

Somit ist der Parameter für  `-d` `/dev/sda` (Externe SD Karte).

Falls eine externe Rootpartition mitgesichert wurde, ist noch `-R /dev/sdb1` (Externe
Rootpartition) notwendig.

Die Parameter müssen natürlich den lokalen Gegebenheiten angepasst werden.


**Hinweis**:

Ein Backup sollte regelmäßig getestet werden: Ob der Restore immer noch
funktioniert und auch immer noch alle Daten beinhaltet.

Nichts ist so frustrierend, wenn man in dem Moment, wo man das Backup benötigt,
feststellt, dass das Backup korrupt ist oder nicht alle Daten enthält.
Ein Test ist bei der Raspberry recht einfach: Eine neue SD- Karte einlegen, das Backup restoren und
von der neuen SD-Karte booten.

Falls aus irgendwelchen Gründen der Restore mit dem Script fehlschlägt, kann man
natürlich jederzeit die vom Script gesicherten Daten mit den Standard
Linuxtools, die zum Backup genutzt wurden - `dd`, `tar` oder `rsync` - wieder
restoren. Allerdings geht das dann nicht ganz so bequem wie mit dem Script und es sind entsprechende Linux Kenntnisse erforderlich ;-)

[.status]: rft
[.source]: https://linux-tips-and-tricks.de/de/raspibackup#restore
[.source]: https://linux-tips-and-tricks.de/de/wiederherstellen

