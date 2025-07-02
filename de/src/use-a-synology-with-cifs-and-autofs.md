Normalerweise wird empfohlen nfs statt cifs/samba zu nutzen um die Backups von raspiBackup abzulegen. Dann kann man den Backuptyp rsync nutzen und immer nur ein Detlabackup erstellen statt eines Vollbackups was bei cifs/samba notwendig ist. Aber trotzdem mag es Gründe geben warum man ein raspiBackup auf einem cifs/samba Laufwerk ablegen will. Im Folgenden wird beschrieben wie das bei einer Synology zu konfigurieren ist. Dabei wird AutoFS genutzt.

 

 

Um automatisch die CIFS BackupPartition zu mounten wenn raspiBackup sie nutzt muss natürlich auf der Synology ein shared folder definiert und konfiguriert sein. Im Folgenden wird der shared folder Name raspiBackup angenommen. Danach muss AutoFS installiert werden:

sudo apt install autofs

Danach muss autofs konfiguriert werden:

/etc/auto.cifs:

synoRaspiBackup -fstype=cifs,rw,credentials=/home/pi/scratch.conf,cache=none,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=3.1.1,soft,iocharset=utf8 ://<synologyIP>/raspiBackup

Damit wird ein CIFS shared folder der Synology mit dem Namen raspiBackup von der Synology definiert mit dem Mountpoint synoRaspiBackup

/etc/auto.master:

/mnt /etc/auto.cifs --timeout=600 --ghost

sorgt dafür dass in /mnt/synoRaspiBackup die CIFS Partition der Synology automatisch gemountet wird.

in /home/pi/raspiBackup.conf müssen noch die Zugangsdaten zur Synology definiert werden:

user=<AdministratorName>
password=<AdministratorKennwort>

/home/pi/raspiBackup.conf sollte dann noch mit chmod 600 /home/pi/raspiBackup.confnur für den Nutzer pi lesbar gemacht werden.

Danach muss noch final /mnt/synoRaspiBackup im raspiBackupInstaller als Backuppartition definiert werden.
