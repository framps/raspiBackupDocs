# WEBDAV als Backupziel

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/12-networking/190-wie-kann-man-medienspeicher-oder-smartdrive-unter-linux-einbinden>
- <https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/644-nutzung-von-webdav-als-backupziel-fuer-raspibackup>
```

TODO: Formatieren und repariern, Links!


Seit ein paar Tagen besitze ich 25GB Speicherplatz von der t-com. Diese
bietet es in ihrem <a href="http://medien-center.t-online.de/index2.htm"
target="_self">Mediacenter</a> kostenlos für t-com bzw telekom Kunden
an. Da ich als Linuxer gewohnt bin meinen Speicherplatz zu mounten und
nicht per WebFrontend zu administrieren habe ich mich mal umgesehen
welche verschiedenen Möglichkeiten existieren und wie man das genau
unter Linux konfiguriert.

**Update 14.3.2012**:

*Mittlerweile bin ich Kunde von 1&1. Die bieten u.A. 15 GB Speicherplatz
an (1&1 SmartDrive) . Die Einbindung als webdav funktioniert genauso
schnell wie für die t-com- nur muss die url entsprechend angepasst
werden. Das 1&1 Smartdrive - Pendant zum Mediencenter bei t-com - ist
wesentlich besser. Bei der t-com kann man keine Daten in die Ordner
kopieren, die man für andere Personen freigegeben hat (Share), da diese
nicht im webdav sichtbar sind. Damit kann man das Mediencenter mit
webdav vergessen wenn man Daten mit anderen Leuten sharen will. Als
Backupmedium ist es aber gut zu benutzen. Dieses Problem hat man bei 1&1
nicht.*

**Update 16.10.2012**:

*Auf einer Raspberry Pi habe ich bei mir lokal auch einen privaten
Cloudspace mit Owncloud angelegt. Das funktioniert per davfs und cadaver
perfekt.*


**Update 3.11.2014**:

*Auf einer Raspberry Pi habe ich bei mir lokal wie auch aus dem Internet
zugreifbar einen privaten Cloudspace mit seafile angelegt. Das
funktioniert per davfs und cadaver perfekt und performt wesentlich
besser als Owncloud bei meiner 50/10 Mb VDSL Internetanbindung.*

Es gibt verschiedene Arten, den webdav Space einzubinden.

1. wdfs - Sehr einfach zu benutzen. Nur ein Befehlszeilenaufruf
   notwendig und man kann per Konsole oder Dateimanager auf den Space
   zugreifen.

2. davfs - Ist erst einmal zu konfigurieren. Danach funktioniert es
   genauso wie wdfs. Bindet den Space genauso wie alle anderen Laufwerke
   (Platten, nfs, smbfs) in Linux als Filesystem ein und ist der Standard
   Linux Weg Space für Linux verfügbar zu machen. Meine Empfehlung.

3. cadaver - Funktioniert ähnlich wie ein ftp oder smb client aus der
   Befehlszeile

4. gvfs - Gnome virtual filesystem


Verschiedene Filemanager wie Dolphin oder Krusader bieten auch die
Möglichkeit per dav auf Plattenspace zuzugreifen. Wer wdfs oder davfs
benutzt kann mit diesen Filemanagern auch transparent auf die Daten über
den Mountpoint zugreifen und mit ihnen arbeiten.


Ich persönlich benutze davfs weil es das webdav Laufwerk genauso
einbindet wie es für alle  anderen Laufwerke in Linux gemacht wird und
man dann sowohl per Befehlszeile als auch mit einem Dateimanager wie
dolphin oder krusader  drauf zugreifen kann.


In einem weiteren Artikeln habe ich beschrieben was man machen muss um
[webdav in den totalcommander einzubinden](https://www.linux-tips-and-tricks.de/de/component/content/12-networking/185-wie-webdav-in-den-totalcommander-einbinden-how-to-use-webdav-with-totalcommander?Itemid=106) .


## wdfs

Ist sehr schnell benutzbar. Wichtig ist, dass man die richtigen
Benutzerdaten (speziell das richtige Passwort) eingibt, denn dummerweise
bekommt man keine Fehlermeldung wenn das Passwort nicht stimmt sondern
alles läuft sehr langsam und letztendlich hat man doch keinen Zugriff
auf die Daten. Der folgende Befehl mountet den t-com mediacenter webdav
Speicherplatz. Dabei ist /home/framp/webdav das Verzeichnis, wo der
Speicherplatz gemountet wird und xxxxx die eigene t-com bzw 1&1 Userid
sowie yyyyyy das Passwort.


    wdfs https://webdav.mediencenter.t-online.de /home/framp/webdav/ -o username=Diese E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript eingeschaltet sein!
                    document.getElementById('cloakfbaf46a3fe43670231d4577ca884a8f3').innerHTML = '';
                    var prefix = '&#109;a' + 'i&#108;' + '&#116;o';
                    var path = 'hr' + 'ef' + '=';
                    var addyfbaf46a3fe43670231d4577ca884a8f3 = 'xxxxx' + '&#64;';
                    addyfbaf46a3fe43670231d4577ca884a8f3 = addyfbaf46a3fe43670231d4577ca884a8f3 + 't-&#111;nl&#105;n&#101;' + '&#46;' + 'd&#101;';
                    var addy_textfbaf46a3fe43670231d4577ca884a8f3 = 'xxxxx' + '&#64;' + 't-&#111;nl&#105;n&#101;' + '&#46;' + 'd&#101;';document.getElementById('cloakfbaf46a3fe43670231d4577ca884a8f3').innerHTML += '<a ' + path + '\'' + prefix + ':' + addyfbaf46a3fe43670231d4577ca884a8f3 + '\'>'+addy_textfbaf46a3fe43670231d4577ca884a8f3+'<\/a>';
             -o password=yyyyyy  -o accept_sslcert

bzw für 1&1

    wdfs https://sd2dav.1und1.de  /home/framp/webdav/ -o username=Diese E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript eingeschaltet sein!
                    document.getElementById('cloak6f662dffb605a3ad75e211d30f932a6f').innerHTML = '';
                    var prefix = '&#109;a' + 'i&#108;' + '&#116;o';
                    var path = 'hr' + 'ef' + '=';
                    var addy6f662dffb605a3ad75e211d30f932a6f = 'xxxxx' + '&#64;';
                    addy6f662dffb605a3ad75e211d30f932a6f = addy6f662dffb605a3ad75e211d30f932a6f + '&#111;nl&#105;n&#101;' + '&#46;' + 'd&#101;';
                    var addy_text6f662dffb605a3ad75e211d30f932a6f = 'xxxxx' + '&#64;' + '&#111;nl&#105;n&#101;' + '&#46;' + 'd&#101;';document.getElementById('cloak6f662dffb605a3ad75e211d30f932a6f').innerHTML += '<a ' + path + '\'' + prefix + ':' + addy6f662dffb605a3ad75e211d30f932a6f + '\'>'+addy_text6f662dffb605a3ad75e211d30f932a6f+'<\/a>';
             -o password=yyyyyy  -o accept_sslcert 

 

## davfs

Leider ist es mit wdfs nicht so ganz die Art wie man unter Linux
standardmäßig Speicherplatz mountet. Deshalb gibt es das davfs2 Paket.
Dieses muss man installieren. Bei Mint ist es im Softwaremanager
standardmäßig verfügbar und kann dort installiert werden. Danach muss
das Mountverzeichnis erstellt werden. Ausserdem ist ein Eintrag der
Zugangscredentials in /etc/davfs2/secrets notwendig.


    mkdir /media/webdav


 und ist die folgende Zeile für den jeweiligen Provider in der
/etc/fstab erforderlich:


    # t-online
    https://webdav.mediencenter.t-online.de        /media/webdav   davfs   rw,noauto,user  0       0 
    # 1&1
    https://sd2dav.1und1.de          /media/webdav   davfs   rw,noauto,user  0       0
    # owncloud
    https://cloud/owncloud/remote.php/webdav          /media/webdav   davfs   rw,noauto,user  0       0
    # seafile
    https://seafile/seafdav       /media/webdav  davfs   rw,noauto,user  0       0


und da<span class="postbody"> davfs das Programm zum Mounten in
/usr/sbin/mount.davfs ablegt und 'mount' ihn in /sbin erwartet muss man
den folgenden Link einrichten: </span>


    ln -s /usr/sbin/mount.davfs /sbin/mount.davfs


**Update 22.3.2012:** tomm.fa hat im Kommentar zu dieser Seite darauf
hingewiesen , dass bei Verwendung von davfs die Verknüpfung (ln -s
/usr/sbin/mount.davfs /sbin/mount.davfs) unter openSUSE 12.1 nicht
(mehr) notwendig ist.

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

        chmod u+s /usr/sbin/mount.davfs

2. Der Benutzer bbbbb welcher das webdav Laufwerk mounten können soll
   muss in die Gruppe davfs2 aufgenommen werden 

        usermod -aG davfs2 bbbbb

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


## cadaver

cadaver erlaubt es wie per ftpclient oder dem smbclient auf den webdav
Speicher zuzugreifen.  Allerdings geht es dann nicht mit einem normalen
Filemanager sonder nur aus der Befehlszeile. Nachdem man cadaver
installiert hat sind zwei Dinge noch zu konfigurieren:

1. ~/.netrc wobei xxxxx der t-com bzw 1&1 Benutzer ist und yyyyy das Passwort

<span style="color: #0000ff;">machine webdav.mediencenter.t-online.de
login <span id="cloakdb7909a9c576b44056e2e9c9958f9495">Diese
E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript
eingeschaltet sein!</span></span>

password yyyyy

bzw für 1&1 

<span style="color: #0000ff;">machine sd2dav.1und1.de</span>

<span style="color: #0000ff;"> login
<span id="cloak8284f3978ba04ddbd9f0d77e82c2d246">Diese E-Mail-Adresse
ist vor Spambots geschützt! Zur Anzeige muss JavaScript eingeschaltet
sein!</span></span>

password yyyyy

bzw für Owncloud

<span style="color: #0000ff;">machine cloud</span>
<span style="color: #0000ff;">login xxxxx</span>
<span style="color: #0000ff;">password yyyyy</span>

<span style="color: #0000ff;"><span style="color: #000000;">2)
.cadaverrc</span></span>


    open https://webdav.mediencenter.t-online.de

bzw für 1&1

    open https://sd2dav.1und1.de

bzw für owncloud

    open https://cloud/owncloud/remote.php/webdav


Das folgenden kurze Beispiel zeigt wie man Dateien hochladen bzw
runterladen kann und sich den Inhalt ansehen kann:


<span style="color: #0000ff;">framp@obelix:/framp\> cadaver
dav:/\> put netload
Uploading netload to \`/netload':
Progress: \[=============================\>\] 100.0% of 1197 bytes
succeeded.
dav:/\> get netload
Enter local filename for \`/netload': netload
Downloading \`/netload' to netload:
Progress: \[=============================\>\] 100.0% of 1197 bytes
succeeded.
dav:/\> ls
Listing collection \`/': succeeded.
        netload                             1197  Oct  8 18:22
dav:/\>
dav:/\> quit  </span>


## Filemanager

Es gibt diverse Filemanager wie Dolphin oder Krusader die eigene
eingebaute Möglichkeiten bieten auf webdav Daten zuzugreifen. Ich kann
nur jedem empfehlen diese Funktionen nicht zu benutzen sondern immer den
LinuxStandard um auf Filesysteme (webdav ist auch eine Filesystem für
Linux über davfs) über einen Mountpoint zuzugreifen.

## Alternative webdav Zugriffsmethoden unter Linux

Die folgenden Dateimanager erlauben es auch direkt in ihnen Verbindungen
zu webdav Space einzurichten. Ich finde es ehrlich gesagt wesentlich
transparenter den Space vorher vom System oder Benutzer zu mounten und
dann mit den Dateimanagern auf den webdav Space zuzugreifen. 

<a href="http://www.mandrivauser.de/forum/viewtopic.php?f=61&amp;t=28272" target="_self">dolphin</a>

<a href="http://linux-new-technology.at/mambo/index.php?option=com_content&amp;task=blogcategory&amp;id=41&amp;Itemid=59" target="_self">krusader</a> - Einfach
<span style="text-decoration: underline;">*webdavfs://webdav.mediencenter.t-online.de*</span>
eingeben, dann dieBenutzerid und das Kennwort

## Hilfreiche Links

<a
href="http://forums.gentoo.org/viewtopic-p-2661177.html?sid=2beab407040e32eab1f975c967753deb"
target="_self">dafvs - Bräuchte Hilfe</a> - Gentoo Forum

<a href="http://linux.die.net/man/8/mount.davfs" target="_self">davfs
man page</a>

[Onlinespeicher in Linux Dateisystem einbinden](https://blog.tausys.de/2011/04/26/onlinespeicher-ins-linux-dateisystem-einbinden/) - TauSys

<a href="http://foren.t-online.de/foren/" target="_self">t-com Forum</a>

<a href="http://www.linux-club.de/viewtopic.php?f=69&amp;t=114387"
target="_self">telecom cloud</a> - linux-club Forum

<a href="http://www.webdav.org/cadaver/" target="_self">cadaver</a>


[Owncloud - Accessing your files (WebDav)](http://doc.owncloud.org/server/6.0/user_manual/files/files.html)

[Owncloud installieren (nginx Webserver) -](http://www.forum-raspberrypi.de/Thread-tutorial-owncloud-5-server-installieren-nginx-webserver) Raspberry Pi Forum

[WeDAV Verbindung zur MagentaCLOUD unter Linux einrichten:](https://telekomhilft.telekom.de/t5/MagentaCLOUD/WebDAV-Verbindung-zur-MagentaCLOUD-unter-Linux-einrichten/ta-p/3770627)

## Fehler und Fehlermeldungen

<span style="color: #ff0000;">Im Fehlerfalle oder bei Fehlfunktionen ist
es hilfreich in der /etc/davfs2/davfs2.conf den debug modus
einzuschalten und im /var/log/messages die Meldungen/Fehlermeldungen zu
verfolgen.
</span>

<span style="color: #0000ff;"> mount -t davfs
</span><span style="color: #0000ff;">https://webdav.mediencenter.t-online.de/
-o username=<span id="cloak00a6b0f984ee2523e424d5f17d737668">Diese
E-Mail-Adresse ist vor Spambots geschützt! Zur Anzeige muss JavaScript
eingeschaltet sein!</span></span>

=yyyyy

<span style="color: #0000ff;"> mount: unknown filesystem type 'davfs' 
</span>

=\> Link  einrichten (s.o.)

<span style="color: #0000ff;">/sbin/mount.davfs: program is not setuid
root: No such file or directory</span>
=\> Das setuid Bit muss gesetzt werden (s.o.)


<span style="color: #0000ff;">cp: cannot create regular file
\`photo.jpg': File exists</span>
==\> Die Datei /etc/davfs2/davfs2.conf  wurde nicht geändert dass keine
locks erstellt werden (s.o.)


[.status]: review-needed
