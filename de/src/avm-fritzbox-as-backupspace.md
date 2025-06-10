# AVM Fritzbox als Backupziel

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/643-nutzung-einer-avm-fritzbox-als-backupziel-fuer-raspibackup>
```

TODO: Weiter formatieren. Ich-Form umschreiben.

Wer keine NAS besitzt aber seine Raspberries mit *raspiBackup* sichern möchte,
kann natürlich auch den NAS Speicher einer Fritzbox nutzen. Allerdings muss
dazu der Backuptyp tar genommen werden, da das genutzte Sambaprotokoll keine
Hardlinks unterstützt und somit auch kein rsync Backuptyp genutzt werden kann,
bei dem man inkrementelle Backups erhält.

Ich empfehle immer den rsync Backuptyp zu nutzen, da es der beste Weg ein Backup zu erstellen ist.

Deshalb sollte sich jeder überlegen ob er nicht besser eine Raspberry mit einem nfs-
Server aufsetzt und dort seine Backup ablegt.

Die längste Zeit habe ich damit verbracht, meiner Fritzbox 7590 beizubringen,
einen angeschlossenen USB Stick per Samba zu exportieren und auf der Raspberry
die richtige Zeile zusammenzubauen, damit der Speicher gemountet werden kann.
Sehr hilfreich dazu war ein [Artikel von andwil.de](https://www.andwil.de/weblog/linux-fritznas-mounten-cifs).
Dort wird sehr schön erklärt was man alles auf der Fritzboxseite und Raspberryseite konfigurieren muss.

Zum Testen mountete ich den Fritzboxspeicher unter /mnt statt /backup. Danach
rief ich mein schon konfiguriertes *raspiBackup* - welches den Backup
normalerweise auf meiner NAS per rsync erstellt - wie folgt auf:

```
sudo raspiBackup -t tar /mnt
```

D.h. ich überschrieb in der Befehlszeile zum Einen den Backuptyp von rsync auf
tar und zum Anderen nutze ich nicht dem Mountpoint /backup meiner Synology
sondern /mnt wo ich die Fritzbox gemountet habe.



Anbei meine Zeile in der /etc/fstab:

```
//192.168.0.1/FRITZ.NAS/USB-Sandisk3-2Gen1-01 /mnt cifs noauto,user,vers=3.0,credentials=/home/pi/.smbcredentials,noserverino,uid=1000,gid=1000 0 0
```

Ausserdem habe ich mit

```
chmod 600 .sambcredentials
```

dafür gesorgt, dass die Firtzboxzugangsdaten nur vom Nutzer gelesen werden
können. Ist zwar bei der Raspberry, wo normalerweise nur ein Nutzer drauf
arbeitet nicht unbedingt nötig. Aber es ist gute Practice, Zugangsdaten immer
nur für den jeweiligen Nutzer les- und änderbar zu machen.

D.h., ich müsste jetzt nur den Eintrag in meiner /etc/fstab so ändern dass der
Mount nicht auf /mnt sondern /backup stattfindet und per raspiBackupInstallUI
den Backuptyp von rsync auf tar ändern und schon würde meine Backups zukünftig
auf der Fritte ablegen.



Zum Vergleich habe ich mal meine Netzwerkraspi, die 2.3G Daten besitzt einmal
auf die Fritzbox NAS wie aucf meine Synology NAS gesichert. Beide NASen sind
per Kabel angeschlossen. Per Wifi sehen die Zahlen natürlich anders aus.

So sieht der tar Backup mit *raspiBackup* auf der Fritzbox aus:

![FritzNAS raspiBackup](images/FritzNAS-raspiBackup.png)


Backup auf die Fritzbox dauert 23 Minuten

Backup auf die Synology dauert 16 Minuten

D.h. der Backup dauert auf der Fritzbox um die 50% länger als bei der Synology
und wichtige Services (Hausautomation et al), die in der Backupzeit gestoppt
werden müssen, sind länger nicht verfügbar.
