# WEBDAV als Backupziel


Für **raspiBackup** muss davfs genutzt werden weil es das webdav Laufwerk genauso
einbindet wie es für alle  anderen Laufwerke in Linux gemacht wird und
dann sowohl per Befehlszeile als auch mit einem Dateimanage
darauf zugreifen kann. Andere verfügbare Tools um auf Webdav zuzugreifen 
können nicht genutzt werden.

## Installation von davfs2

`sudo apt install davfs2`

## Anlegen des Mountpoints

`sudo mkdir -p /remote/webdav`

## Definieren der Zugangdaten

   - `/etc/davfs2/secrets`

     ```
     /remote/webdav	<Userid> 	<Password>
     ```

## Zugangsdaten nur für den Nutzer pi lesbar machen

```
sudo chmod 600 /etc/davfs2/secrets
sudo chown root:root /etc/davfs2/secrets
```


## Einträge in der /etc/fstab erstellen

```
# t-online
https://webdav.mediencenter.t-online.de        /remote/webdav   davfs   rw,noauto,user  0       0 
# 1&1
https://sd2dav.1und1.de          /remote/webdav   davfs   rw,noauto,user  0       0
# owncloud
https://cloud/owncloud/remote.php/webdav          /remote/webdav   davfs   rw,noauto,user  0       0
# seafile
https://seafile/seafdav       /remote/webdav  davfs   rw,noauto,user  0       0
```


und da davfs das Programm zum Mounten in
/usr/sbin/mount.davfs ablegt und 'mount' ihn in /sbin erwartet muss man
den folgenden Link einrichten: 


`sudo ln -s /usr/sbin/mount.davfs /sbin/mount.davfs`

Durch einen Fehler in der webdav Implementierung bei t-online können
keine Dateien angelegt werden. Es kommt immer die Meldung dass die Datei
existiert - obwohl sie es nicht tut. Deshalb muss in der
/etc/davfs2/davfs2.conf die folgende Zeile eingefügt werden um die locks
auszuschalten.


    use_locks       0


Wenn man den Speicherplatz automatisch beim Booten des Systems mounten
möchte muss man noch das noauto in der /etc/fstab entfernen. Das ist für
**raspiBackup** nicht notwendig wenn die dynamicmount Option genutzt wird.

[.status]: rft 
[.source]: https://www.linux-tips-and-tricks.de/de/12-networking/190-wie-kann-man-medienspeicher-oder-smartdrive-unter-linux-einbinden>
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/644-nutzung-von-webdav-als-backupziel-fuer-raspibackup>
