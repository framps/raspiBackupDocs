# Nutzung von Samba/CIFS als Backupspace mit autoFS

Eigentlich wird empfohlen nfs statt cifs/samba zu nutzen um die Backups
von raspiBackup abzulegen.
Dann kann man den Backuptyp rsync nutzen und immer nur ein Deltabackup
erstellen statt eines Vollbackups was bei cifs/samba notwendig ist.
Aber trotzdem mag es Gründe geben warum man ein raspiBackup auf einem
cifs/samba Laufwerk ablegen will.
Im Folgenden wird beschrieben wie das bei einer Synology zu
konfigurieren ist. Dabei wird AutoFS genutzt. 
Nutzt man nicht schon autoFS erreicht man für raspiBackup mit der
Option DynamicMount dasselbe Verhalten.

Um automatisch die CIFS BackupPartition zu mounten wenn raspiBackup sie
nutzt,ist natürlich auf der Synology
ein shared Folder zu definieren und konfigurieren. 

In der folgenden Anleitung wird der shared folder Name *raspiBackup*
 angenommen. 

### Installation von autoFS:

  ```
  sudo apt install autofs
  ```
  
### AutoFS konfiguration

  - `/etc/auto.cifs`: 
  
  ```
  synoRaspiBackup -fstype=cifs,rw,credentials=/home/pi/scratch.conf,cache=none,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=3.1.1,soft,iocharset=utf8 ://<synologyIP>/raspiBackup
  ```

Damit wird ein CIFS shared folder der Synology mit dem Namen raspiBackup
von der Synology definiert mit dem Mountpoint synoRaspiBackup.

  - `/etc/auto.master`: 
  
  ```
  /mnt /etc/auto.cifs --timeout=600 --ghost
  ```

sorgt dafür dass in /mnt/synoRaspiBackup die CIFS Partition der Synology
automatisch gemountet wird wenn darauf zugegriffen wird.

### Definition der cifs/samba Zugangsdaten

  - `/home/pi/raspiBackup.conf`: 
	```
	user=<AdministratorName>
	password=<AdministratorKennwort>
	```

### `/home/pi/raspiBackup.conf` nur für den Nutzer pi lesbar machen:
  ```
  chmod 600 /home/pi/raspiBackup.conf
  ```

### Definition der Backuppartition in raspiBackup:
   Aufruf des raspiBackupInstallers mit `sudo raspiBackupInstallUI` 
und Definition von `/mnt/synoRaspiBackup` (`M3 -> C2`)

[.status]: rft
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/687-raspibackup-nutzung-einer-synology-als-backupspace-mit-cifs-samba-und-autofs

