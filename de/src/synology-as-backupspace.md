# Synology NAS als Backupziel

Das Backupscript *raspiBackup* wird immer mehr benutzt, um die Backups auf
einem *Synology*-NAS abzulegen. Lange besaß ich (*framp*) keine Synology und konnte keinerlei
Tests vornehmen, um bei Problemen zu helfen.s

Deshalb entstand diese Webseite, um allen Nutzern einer Synology eine Möglichkeit des
Informationsaustausches über Kommentare zu dieser Seite zu geben. Wer eine
Synology besitzt, konnte kurz einen Kommentar posten und sich damit an der
Diskussion beteiligen.

Ergebnisse und Empfehlungen, die aus Diskussionen entstehen, wurden natürlich
hier dokumentiert.

Mittlerweile ist eine Synology DS418play im Gerätepark und es ist möglich,
genauer zu beschreiben, was zu tun ist, um mit *raspiBackup* seine Raspberries
auf einer Synology sichern zu können. Die Beschreibung erklärt, wie man die mit
der empfohlenen Backupmethode rsync auf nfs Backupspace sichert.

## *raspiBackup* - Nutzung von Synology als Backupspace

**Wichtig**: Die Partition auf der Synology muss mit no_root_squash exportiert werden,
damit rsync genutzt werden kann. Im UI muss dann bei Squash No-mapping eingetragen
werden.

![Synology Konfiguration](images/synology-nfs-defs.png)

Es darf **NICHT** *NFS4* aktiviert werden wie im Screenshot zu sehen ist!!! Es muss
*NFS3* genutzt werden. Mit *NFS4* habe ich es nicht hinbekommen.

![Synology NFS Konfiguration](images/synologyNFSAddtlSettings.png)



## Konfiguration einer Synology und der Raspberry, um ein rsync Backup per nfs auf einer Synology zu sichern

Im Wesentlichen sind folgende Schritte durchzuführen:

1) Gemeinsamen nfs Ordner auf der Syno erstellen
2) mount des gemeinsamen nfs Ordners auf der Raspi in der fstab
3) Installation und Konfiguration von *raspiBackup* per Installer (keinen automatischen Backup konfigurieren)
4) Test des Backups und Restores von der Commandline
5) Einrichten des regelmaessigen Backups in der Crontab per Installer



Es empfielt sich, vor dem Beginn die [FAQ](faq.md) zu lesen, wo die wichtigsten
Fragen und Antworten zu *raspiBackup* zusammengestellt sind.

### Gemeinsamen nfs Ordner auf der Syno erstellen

Im DSM, Systemsteuerung -> Gemeinsamer Ordner -> Erstellen erstellt man einen
gemeinsamen Ordner z.B. mit dem Namen raspiBackups. Eine Papierkorb braucht man
nicht. Die nfs Berechtigungen muessen wie folgt eingestellt werden (Hinweis:
*raspiBackup* laeuft als root). Hostname oder IP: Hostname oder IP des nfs
Clients, z.B. 192.168.0.10. Privileg: lesen/schreiben, Squash: keine Zuordnung,
Sicherheit: sys.

### Eintrag des gemeinsamen nfs Ordners auf der Raspi in der fstab

Folgender Eintrag in der /etc/fstab bewirkt das Mounten des Synology nfs Orders
unter dem Mountpoint /backup unter der Annahme, dass 192.168.0.11 die Synology
ist:

```
192.168.0.11:/volume1/raspiBackups /backup nfs rw,nfsvers=3 0 0
```

Es ist dringend zu empfehlen, den Mountpoint /backup zu nutzen und nicht z.B.
/home/pi/backup oder andere Verzeichnisse.

### Manueller mount des gemeinsamen nfs Ordners

Jetzt kann man prüfen ob der Backupspace auf der Synology freigegeben ist mit
showmount -e 192.168.0.11 . Danach kann man mit sudo mount /backup den nfs
Ordner manuell mounten.Durch den obigen Eintrag in der /etc/fstab wird der
Mount nach jedem Neustart automatisch vorgenommen und es ist kein manueller
Mount mehr notwendig.

### Test des Schreibzugriffs

Den Schreibzugriff kann man nun testen mit sudo bash -c 'echo "Raspberry war
hier" > /backup/killroy.txt' und sudo cat /backup/killroy.txt Falls es Probleme
gibt Hinweise von erfahrenen Synologybenutzern zu Synology und *raspiBackup*
lesen.

### Installation und Konfiguration von *raspiBackup*

Installation von *raspiBackup* gemäß [dieser Anleitung](installation-in-5-minutes.md).
Dabei dann rsync als Backupmethode und /backup als Backuppfad angeben.
Den regelmäßigen Backup noch nicht konfigurieren.

### Test des Backups und Restores von der Commandline

[Test des Backups]() und [Restores](restore.md)  TODO: Links!

### Einrichten des regelmässigen Backups in der Crontab

Aufruf des Installers und Konfiguration des regelmäßigen Backupzeitpunktes.

### Siehe auch folgende DSM Hilfsseiten

  - [Gemeinsamen Ordner erstellen](https://www.synology.com/de-de/knowledgebase/DSM/help/DSM/AdminCenter/file_share_create)
  - [nfs Ordner konfigurieren](https://www.synology.com/de-de/knowledgebase/DSM/tutorial/File_Sharing/How_to_access_files_on_Synology_NAS_within_the_local_network_NFS)


## Hinweis zu ACLs

Eigentlich kann man ACLs mit nfs V3 sichern. Das klappt z.B. wenn man eine
Raspberry als nfs Server aufsetzt (Siehe hier). Allerdings funktioniert das
nicht mit einer Synology - auch wenn sie nsf V3 nutzt.

Eine Anfrage bei Synology am 13.5.2022 lieferte folgende Antwort:

    Unfortunately, I have to inform you that both Linux ACL and setfacl are not supported by DSM.
    I would be pass this on as feedback to our development department as a function request.


## Hinweise und Tipps von *raspiBackup* Benutzern die eine Synology als Backupspace benutzen

### Beitrag von Udo (Kommentar #45)

Udo hat im Kommentar beschrieben was man tun muss dass der Automount der
Synology beim Booten der Raspberry funktioniert.


Es wurde verschiedentlich berichtet, dass es mit Synologies Probleme mit
Hardlinks geben kann, die von rsync benutzt werden, wenn nfs4 benutzt wird. Mit

192.168.0.42:/backup /backup nfs rw,nfsvers=3 0 0

wird das nfs3 Protokoll benutzt so dass das Backupskript dann erfolgreich durchläuft.
Weiterhin werden Softlinks mit CIFS nicht unterstützt wenn nicht wenigstens CIFS Version 3 benutzt wird.

### Beitrag von Markus (Kommentar #2)

Bei mir läuft das Backup mit *raspiBackup* in folgender Konfiguration:

* Raspberry mit Rasbian Whezzy
* *raspiBackup*.sh, Version 0.5.7.10e
* Synology NAS DS213, mit aktueller DSM Version

Synology NAS Share: /volume1/backup
Synology NAS Share NFS Regeln: Hostname oder IP: *, Privileg: Lesen/Schreiben, Squash: Keine Zuordnung
Synology NAS Share Berechtigungen (Konsole): d---------    5 root     root          4096 Dec 15 06:01 backup
Raspberry Pi Mountpoint: /media/nas-backup

Raspberry Pi fstab Einträge für NFS3 und NFS4

```
# Entry for the NAS backup, mount with NFS version 3
192.168.X.XXX:/volume1/backup /media/nas-backup nfs rw,nfsvers=3 0 0
# Entry for the NAS backup, mount with NFS version 4
#192.168.X.XXX:/volume1/backup /media/nas-backup nfs rw 0 0
```

Anmerkung zum Mounten mit NFS4:
Der Benutzer Jean hat auf der englischen Seite von raspibackup beschrieben wie
man das Backup auf ein Share welches mit NFS4 eingebunden ist durchführen kann.
Konnte es bisher noch nicht testen. Hier der Permalink

Auszug aus der raspiBackup.conf abgelegt unter /usr/local/etc/

```
cat /usr/local/etc/raspiBackup.conf
# path to store the backupfile
DEFAULT_BACKUPPATH="/media/nas-backup"
# how many backups to keep
DEFAULT_KEEPBACKUPS=4
# type of backup: dd, tar, xbmc or rsync
DEFAULT_BACKUPTYPE="rsync"
```

Ich hoffe das einigen Synology Benutzern hiermit geholfen ist.


### Entdeckungen von Alfred

Alfred bekam folgende Fehlermeldung von rsync

```
rsync: chown "/mnt/nas/arami nta/araminta-rs ync-backup-2016 1029-190948/mmc blk0p1/overlays /.w1-gpio-overl ay.dtb.ansSC4" failed: Operation not permitted (1)"
```

Dann benutze er den rsync Befehl, den er im *raspiBackup*.log fand, den
*raspiBackup* ausführt um das Backup zu erstellen um das Problem zu
reproduzieren und gezielt ohne *raspiBackup* zu debuggen. Da er den -P Modus
benutzt musste er vorher noch folgende Befehle ausführen:

```
sudo mkdir /tmp/mmcblk0p1
sudo mount /dev/mmcblk0p1 /tmp/mmcblk0p1
```


Ich machte dann zufällig einen Fehler der zur Lösung führte: Das ist der rsync
Befehl den ich ausführte:

```
rsync --exclude="/mnt/nas" --exclude=/proc/* --exclude=/lost+found/* --exclude=/sys/* --exclude=/dev/* --exclude=/boot/* --exclude=/tmp/* --exclude=/run/* --exclude=mmcblk0p1/overlays/* --numeric-ids -aHAXx -v /tmp/mmcblk0p1 "/mnt/nas/test.backup"
```

Dieser Befehl funktionierte ohne Fehlermeldung. Es lag aber daran dass ich
vergessen hatte 'sudo' zu benutzen. Als ich den Befehl dann nochmal mit sudo
ausführte kam die Fehlermeldung wieder. Das weist IMHO auf ein Zugriffsproblem
auf der Synology NAS hin. Nachdem ich dann auf der NAS die NFS permissions von
'map all users to admin' auf 'no mapping' geändert hatte, bingo, funktionierte
es auch mit sudo.

### Kommentar von Chris

„Ich habe es so eben auch mit einem TAR-Backup via NFS 4.1 auf ein QNAP-NAS geschafft.


Inhalt - /etc/fstab:

```
<NAS-IP/-Hostname>:/<Share name>  /backup   nfs4    defaults,_netdev,noatime    0    2
```


QNAP-NAS seitig (share):

```
Zugriffsrecht -> sync = "no wdelay"
Zugriffsrecht -> secure (Ja)
Host: IP vom Raspi
Sicherheit: sys,
Squash-Option: lesen/schreiben
Squash-Option: "Nur root-Benutzer zuordnen"
Anonymer GID: guest
Anonymer UID: guest
```


[.status]: todo "Prüfen/Formatieren"
[.source]: https://linux-tips-and-tricks.de/de/synology
[.source]: https://www.linux-tips-and-tricks.de/en/synology


