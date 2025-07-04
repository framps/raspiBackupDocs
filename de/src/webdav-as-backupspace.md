# WEBDAV als Backupziel


Für **raspiBackup** muss davfs genutzt werden weil es das webdav Laufwerk genauso
einbindet wie es für alle  anderen Laufwerke in Linux gemacht wird und
dann sowohl per Befehlszeile als auch mit einem Dateimanage
darauf zugreifen kann.


## Installation von davfs2

`sudo apt install davfs2

## Anlegen des Mountpoints

`sudo mkdir -p /remote/webdav`

## Definieren der Zugangscredentials

   - `/etc/davfs2/secrets`

   ```
   /remote/webdav	<Userid> 	<Password>
   ```

## Zugangscredentials nur für den Nutzer pi lesbar machen

`sudo chmod 600 /etc/davfs2/secrets`
`sudo chown root:root /etc/davfs2/secrets`


## Einträge in der /etc/fstab

```
    # t-online
    https://webdav.mediencenter.t-online.de        /media/webdav   davfs   rw,noauto,user  0       0 
    # 1&1
    https://sd2dav.1und1.de          /media/webdav   davfs   rw,noauto,user  0       0
    # owncloud
    https://cloud/owncloud/remote.php/webdav          /media/webdav   davfs   rw,noauto,user  0       0
    # seafile
    https://seafile/seafdav       /media/webdav  davfs   rw,noauto,user  0       0
```


und da<span class="postbody"> davfs das Programm zum Mounten in
/usr/sbin/mount.davfs ablegt und 'mount' ihn in /sbin erwartet muss man
den folgenden Link einrichten: </span>


`sudo ln -s /usr/sbin/mount.davfs /sbin/mount.davfs`


Durch einen Fehler in der webdav Implementierung bei t-online können
keine Dateien angelegt werden. Es kommt immer die Meldung dass die Datei
existiert - obwohl sie es nicht tut. Deshalb muss in der
/etc/davfs2/davfs2.conf die folgende Zeile eingefügt werden um die locks
auszuschalten.


    use_locks       0


Wenn man den Speicherplatz automatisch beim Booten des Systems mounten
möchte muss man noch das noauto in der /etc/fstab entfernen. Allerdings
wird man i.d.R. den Speicherplatz nur mounten wenn man ihn benötigt und
dieses als normaler Benutzer - nicht als root. Deshalb muss man noch
folgende Dinge konfigurieren:


1. Damit normale User mount aufrufen können muss das suid bit gesetzt werden

        `sudo chmod u+s /usr/sbin/mount.davfs`

2. Der Benutzer bbbbb welcher das webdav Laufwerk mounten können soll
   muss in die Gruppe davfs2 aufgenommen werden 

        `sudo usermod -aG davfs2 bbbbb`

3. Normalerweise muss der Benutzer immer die Zugangsdaten beim Mounten
   manuell eingeben


<span style="color: #0000ff;">framp@obelix:~/.davfs2\> mount
/media/webdav/
Please enter the username to authenticate with server
https://webdav.mediencenter.t-online.de/ or hit enter for none.
  Username: <span id="cloakc8e44cf6f3bbcc400ee49baa92dedc1a">Diese
E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript
eingeschaltet sein!</span></span>


Please enter the password to authenticate user
<span id="cloakb42d66e1b056682d2eae2d9ba76201bc">Diese E-Mail-Adresse
ist vor Spambots geschützt! Zur Anzeige muss JavaScript eingeschaltet
sein!</span>

with server
https://webdav.mediencenter.t-online.de/ or hit enter for none.
  Password: 

bzw für 1&1

<span style="color: #0000ff;">framp@obelix:~/.davfs2\> mount
/media/webdav/
Please enter the username to authenticate with server
https://sd2dav.1und1.de/  or hit enter for none.
  Username: <span id="cloakfd8eaf89a5a7caa6ab8f48291b804b5e">Diese
E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript
eingeschaltet sein!</span></span>


Please enter the password to authenticate user
<span id="cloak62d5d7a83cc23814092c177f52f1bee8">Diese E-Mail-Adresse
ist vor Spambots geschützt! Zur Anzeige muss JavaScript eingeschaltet
sein!</span>

with server
https://sd2dav.1und1.de/  or hit enter for none.
  Password: 


Diese Daten kann man in ein davfs Profile ablegen. Z.B. in
~/.davfs2/secrets den folgenden Inhalt ablegen:

    https://webdav.mediencenter.t-online.de/    Diese E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript eingeschaltet sein!
                    document.getElementById('cloak4d790b2dc648eeeb6e6e7723183a75d3').innerHTML = '';
                    var prefix = '&#109;a' + 'i&#108;' + '&#116;o';
                    var path = 'hr' + 'ef' + '=';
                    var addy4d790b2dc648eeeb6e6e7723183a75d3 = 'xxxxx' + '&#64;';
                    addy4d790b2dc648eeeb6e6e7723183a75d3 = addy4d790b2dc648eeeb6e6e7723183a75d3 + 't-&#111;nl&#105;n&#101;' + '&#46;' + 'd&#101;';
                    var addy_text4d790b2dc648eeeb6e6e7723183a75d3 = 'xxxxx' + '&#64;' + 't-&#111;nl&#105;n&#101;' + '&#46;' + 'd&#101;';document.getElementById('cloak4d790b2dc648eeeb6e6e7723183a75d3').innerHTML += '<a ' + path + '\'' + prefix + ':' + addy4d790b2dc648eeeb6e6e7723183a75d3 + '\'>'+addy_text4d790b2dc648eeeb6e6e7723183a75d3+'<\/a>';
                yyyyy 

bzw für 1&1

    https://sd2dav.1und1.de/    Diese E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript eingeschaltet sein!
                    document.getElementById('cloakc1eb4501a8ce16edb1e0862c82858b55').innerHTML = '';
                    var prefix = '&#109;a' + 'i&#108;' + '&#116;o';
                    var path = 'hr' + 'ef' + '=';
                    var addyc1eb4501a8ce16edb1e0862c82858b55 = 'xxxxx' + '&#64;';
                    addyc1eb4501a8ce16edb1e0862c82858b55 = addyc1eb4501a8ce16edb1e0862c82858b55 + '&#111;nl&#105;n&#101;' + '&#46;' + 'd&#101;';
                    var addy_textc1eb4501a8ce16edb1e0862c82858b55 = 'xxxxx' + '&#64;' + '&#111;nl&#105;n&#101;' + '&#46;' + 'd&#101;';document.getElementById('cloakc1eb4501a8ce16edb1e0862c82858b55').innerHTML += '<a ' + path + '\'' + prefix + ':' + addyc1eb4501a8ce16edb1e0862c82858b55 + '\'>'+addy_textc1eb4501a8ce16edb1e0862c82858b55+'<\/a>';
                yyyyy  

bzw für Owncloud

    https://cloud/owncloud/remote.php/webdav xxxxx yyyyy

wobei xxxxx die eigene t-com bzw 1&1 Userid bzw Owncloud Userid sowie
yyyyyy das Passwort ist. Die Datei muss die Rechte 600 bekommen.
Natürlich kann man die Daten auch für das System global ablegen so dass
jeder Benutzer den Speicherplatz ohne Passwort mounten kann. Details
stehen dazu in den man
<a href="http://linux.die.net/man/8/mount.davfs" target="_self">Page zu davfs</a>  


### Erfahrungen mit MagentaCloud und webdav

Guenter/gNeandr hat freundlicherweise unten in Kommentaren verschiedene
Erfahrungen die er mit MagentaCloud und FreeFileSync und webdav gemacht
hat geteilt:


[WeDAV Verbindung zur MagentaCLOUD unter Linux
einrichten:](https://www.linux-tips-and-tricks.de/de/12-networking/://telekomhilft.telekom.de/t5/MagentaCLOUD/WebDAV-Verbindung-zur-MagentaCLOUD-unter-Linux-einrichten/ta-p/3770627)

Mit Thunar Dateimanager kann ohne zusätzlichen Eingriff im
Lese/Schreibzugriff (wie zB auch löschen) auf
davs://webdav.magentacloud.de/ gearbeitet werden.
Mit sudo umount /media/magentacloud sind die Rechte mit chmod
anzupassen, sonst besteht nur Lesezugriff für FreeFileSync, dann nur
vergleichen (read), aber nicht synchronisieren (write).

 

## gvfs

gvfs erlaubt neben samba, ssh, nfs, ftp usw auch dav und davs als
Protokoll zu benutzen. Zum mounten benutzt man

    gio mount davs://seafile <<< "Diese E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript eingeschaltet sein!
                    document.getElementById('cloak71ecec6fd3ebac73e730dfe476f49c85').innerHTML = '';
                    var prefix = '&#109;a' + 'i&#108;' + '&#116;o';
                    var path = 'hr' + 'ef' + '=';
                    var addy71ecec6fd3ebac73e730dfe476f49c85 = 'p&#101;t&#101;r_t&#97;&#117;b&#101;' + '&#64;';
                    addy71ecec6fd3ebac73e730dfe476f49c85 = addy71ecec6fd3ebac73e730dfe476f49c85 + 'gmx' + '&#46;' + 'd&#101;';
                    var addy_text71ecec6fd3ebac73e730dfe476f49c85 = 'USERID';document.getElementById('cloak71ecec6fd3ebac73e730dfe476f49c85').innerHTML += '<a ' + path + '\'' + prefix + ':' + addy71ecec6fd3ebac73e730dfe476f49c85 + '\'>'+addy_text71ecec6fd3ebac73e730dfe476f49c85+'<\/a>';
            "$'\n'"PASSWORD"$'\n'

Danach ist der Webspace unter dem Verzeichnis /run/user/$UID/gvfs
gemounted und kann entsprechend genutzt werden. Umount funktioniert mit

    gio mount -u davs://seafile


[.status]: review-needed
[.source]: https://www.linux-tips-and-tricks.de/de/12-networking/190-wie-kann-man-medienspeicher-oder-smartdrive-unter-linux-einbinden>
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/644-nutzung-von-webdav-als-backupziel-fuer-raspibackup>
`
