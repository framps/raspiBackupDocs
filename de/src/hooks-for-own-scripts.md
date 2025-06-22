# Erweiterungsmöglichkeiten von *raspiBackup*

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/raspibackup#wrapper>
```

Es bestehen folgende Möglichkeiten, die Funktionalität des Backupscripts durch eigenen Code zu erweitern.

1. Benutzung eines selbstgeschriebenen Scriptes, welches das Backupscript
   aufruft und Aktionen vor und nach dem Aufruf vornimmt

   Dazu gibt es das folgende Beispielscript, welches individuelle
   Anpassungsmöglichkeiten bietet und muss nur geringfügig an den gekennzeichneten
   Stellen den lokalen Gegebenheiten angepasst werden. Es enthält schon Code, der
   automatisch Geräte mounted und unmounted. Das Script kann [hier](https://github.com/framps/raspiBackup) runtergeladen
   werden.

   Voraussetzung ist, dass der Mountpoint in der `/etc/fstab` bereits definiert
   wurde. Anschliessend muss das Script noch an ein paar Stellen den jeweiligen
   lokalen Gegebenheiten mit einem Editor angepasst werden und dann aktiviert
   werden mit

       sudo mv raspiBackupWrapper.sh /usr/local/bin
       sudo chmod +x /usr/local/bin/raspiBackupWrapper.sh

   und dann ist `raspiBackupWrapper.sh` anstelle von `raspiBackup.sh` in der `crontab`
   aufzurufen. Der Quellcode vom Wrapperscript findet sich auch auf [github](https://github.com/framps/raspiBackup/blob/master/raspiBackupWrapper.sh)
   und kann durch einen Pull Request erweitert werden.

2. Benutzung von Plugins in die eigene Scripts eingehängt werden

   Vor und nach dem eigentlichen Backup wie auch dem Restore können Scripte als
   Plugins eingehängt werden. Details dazu finden sich in der Detailbeschreibung
   zu Plugins:

## Details


**TODO**: Zusammenfassen oder trennen?

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/442-raspibackup-erweiterungen>
- <https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/443-raspibackup-extensions>
```

Es besteht die Möglichkeit, eigene Codeerweiterungen vor und nach dem
Backupprozess des Scripts einzubinden. Dieses ist sinnvoll, wenn
eigentlich Änderungen im Backupscript notwendig sind, aber dann natürlich
nach jedem Update von *raspiBackup* auf eine neue Version wieder neu
eingepflegt werden müssen. Die Extensions (Plugins) sind unabhängig vom
jeweiligen Codestand von *raspiBackup* und deshalb in diesem Falle zu
empfehlen.

Verschiedene Plugins stehen zur Verfügung und dienen als Beispiele für
eigene Erweiterungen. Durch die ersten wird die CPU Temperatur sowie
die Hauptspeicher- und Backuppartitionsbelegung sowie die
Partitionsbelegung vor und nach dem Backup ausgegeben. Die letzte
Erweiterung wird nur am Ende des Backups aufgerufen und kann bei Erfolg
bzw Misserfolg des Backups unterschiedliche Aktionen auslösen.

Wer nützliche Plugins für die Community erstellt hat kann sie gerne im
Forum (TODO Link) vorstellen und die Downloadlocation nennen. Sollten
Fähigkeiten der Plugins fehlen, bitte einen Isuu bei GitHub (TODO Link) anlegen.

### Pluginaufrufstellen beim Backup

Die verschiedenen Plugins werden an folgenden Stellen im Backupverlauf
aufgerufen:

  - eMail Plugin (mem)
  - Notification (notify) Plugin wenn eingeschaltet (DEFAULT_NOTIFY_START)
  - Slack, Pushover und Telegram Notifications falls konfiguriert und wenn
    eingeschaltet (DEFAULT_NOTIFY_START)
  - BEFORE_STOPSERVICES (Definierte Befehle werden ausgeführt)
  - STOP_SERVICES (Definierte Befehle werden ausgeführt)
  - PRE_BACKUP_EXTENSION
  - READY_BACKUP_EXTENSION

... erstellen des Backups ...

  - POST_BACKUP_EXTENSION
  - START_SERVICES (Definierte Befehle werden ausgeführt
  - AFTER_STARTSERVICES (Definierte Befehle werden ausgeführt)

... Aufräumarbeiten wie das Löschen von obsoleten Backups (kann länger dauern)

  - FINAL_COMMANDS (ab Release 0.6.8) (Definierte Befehle werden ausgeführt)
  - eMail (mail) Plugin
  - Notification (notify) Plugin
  - Slack, Pushover und Telegram Notifications falls konfiguriert

... Final housekeeping

  - Exit

 

### Pluginaufrufstellen beim Restore

(Verfügbar ab Releae 0.6.7)

Die verschiedenen Plugins werden an folgenden Stellen im Restoreverlauf
aufgerufen:

  - PRE_RESTORE_EXTENSION

... restoren des Backups ...

  - POST_RESTORE_EXTENSION
 

### Beispielplugins

 

1.  Der einfachste Weg ist die Beispielplugins mit dem [Installer](https://www.linux-tips-and-tricks.de/de/installation) zu
    installieren und zu aktivieren. Entweder über die Menufolge
    **Installiere Komponenten-\>Installiere Beispielerweiterungen** oder
    direkt über die Befehlszeile (Benutze die Option `-e`)

        raspiBackupInstallUI.sh

    oder

        raspiBackupInstallUI.sh -e

2.  Wer die Beispielplugins manuell installieren will, kann das `tar` mit
    [diesem Link mit einem Browser downloaden](https://www.linux-tips-and-tricks.de/de/downloads/raspibackupsampleextensions-tgz/download)
    oder auch direkt wie folgt auf die Raspberry downloaden und nach
    `/usr/local/bin` auspacken.

        wget http://www.linux-tips-and-tricks.de/raspiBackupSampleExtensions.tgz -O raspiBackupSampleExtensions.tgz
        tar -xzf raspiBackupSampleExtensions.tgz -C /usr/local/bin

Dadurch werden die folgenden Scripte in `/usr/local/sbin` kopiert:

1. `raspiBackup_mem_pre.sh` und `raspiBackup_mem_post.sh` -
   Berichtet Memory Usage der Raspberry vor und nach dem Backup

2. `raspiBackup_temp_pre.sh` und `raspiBackup_temp_post.sh` -
   Berichtet die CPU Temperatur der Raspberry vor und nach dem Backup

3. `raspiBackup_disk_pre.sh` und `raspiBackup_disk_post.sh` -
   Berichtet die Plattennutzung vor und nach dem Backup

4. `raspiBackup_execute_post.sh` - Wird am Ende des Backups aufgerufen.
   Hilfreich, wenn eine eigene Erfolg/Fehler Benachrichtigungsfunktion
   genutzt werden soll.
 

Um die Plugins zu aktivieren ist noch folgender zusätzlicher
Aufrufparameter bei *raspiBackup* notwendig:

    -N "temp mem disk execute"

 bzw in die Konfigurationsdatei ist folgende Zeile aufzunehmen

    DEFAULT_EXTENSIONS="temp mem disk execute"

Details zu den Aufrufparametern bzw den Konfigurationsparametern siehe
[hier](https://www.linux-tips-and-tricks.de/de/13-raspberry/23-pi-erstellt-automatisch-backups-von-sich-selbst-pi-creates-automatic-backups-of-itself)

There is no need for notification extensions for slack, pushover and
telegram. Just configure the corresponding config definitions. If you
want to use your own notification extension provide a script called
`raspiBackup_notify.sh`.

Die folgenden Extensions können ein `pre` und/oder `post` Script haben und
müssen raspiBackup\_\<extension\>\_pre.sh und/oder
raspiBackup\_\<extension\>\_post.sh heissen. 

  1.  temp
  2.  mem
  3.  disk

Alle anderen Extensions müssen kein \_pre and \_post am Ende haben.

For details of the parameters and config file see [this page.](https://www.linux-tips-and-tricks.de/de/13-raspberry/303-pi-creates-automatic-backups-of-itself)

Die Plugins erzeugen folgende Meldungen:

    --- RBK1001I: Memory usage - Pre backup - Used: 97 MB Free: 130 MB - Post backup - Used: 98 MB Free: 121 MB
    --- RBK1000I: CPU temperature pre and post backup: 53.2'C - 55.8'C
    --- RBK1002I: Disk usage pre backup: Used: 1.30 TiB Free: 2.18 TiB
    --- RBK1003I: Disk usage post backup: Used: 1.30 TiB Free: 2.18 TiB
    --- RBK1004I: Free change: -256.00 KiB (0.00 %)

### Meldungen

Die Beispielplugins benutzen Meldungen, die ab dem Nummernbereich 1000
beginnen wie z.B. RBK1000I. Wer eigene Plugins erstellt, sollte, sofern
sie Meldungen schreiben, diese bei 2000 beginnen lassen und nicht den
Bereich unter 1999 benutzen.


### Interface

Das Plugin bekommt im Aufruf den aktuellen Statuscode von *raspiBackup*
mitgegeben. Ein Statuscode von 0 bedeutet in den Postplugins der Backup
war erfolgreich. Jeder andere Statuscode bedeutet, dass der Backup
beendet wurde.

 

### eMailPlugin

Ab der Version 0.6.1.1 gibt es ein emailPlugin. D.h., man kann die
email-Versendung selbst programmieren. Das ist dann besonders hilfreich,
wenn die vom Script unterstützen eMailProgramme den eigenen eMailClient
nicht unterstützen. Ausserdem kann das Aussehen der eMail beliebig
geändert werden. Ein Beispielplugin, das `mailx` benutzt, befindet sich in
den Beispielplugins.

Das Mailplugin wird dadurch aktiviert, dass für den Parameter `-s mailext`
definiert wird. Dann wird das Mailplugin mit dem Namen
`raspiBackup_mail.sh` aufgerufen, die dann den Mailversand vornehmen muss.
Die folgenden Parameter werden dem Mailplugin Script übergeben:

    email="$1"        # target email address
    subject="$2"      # email subject
    content="$3"      # email contents
    parms="$4"        # addtl email parms passed with -E
    append="$5"       # file to append

Wenn jemand ein eMailPlugin schreibt, wäre es gut, wenn dieses Plugin in
einem Kommentar am Ende dieser Seite erläutert wird, so dass der Code
vielleicht mit anderen ausgetauscht werden kann.


### Hinweise

1. **Achtung:** Die Extensions laufen mit **root** Rechten und können
deshalb bei Fehlern das laufende System schädigen oder sogar zerstören!

2. Es sind nicht beide Scripts (`pre` und `post`) notwendig. Es reicht,
wenn eines existiert.

3. Zum Testen von Plugins ist der Parameter `-F` sehr hilfreich. Dadurch
wird der eigentliche Backupprozess übersprungen und somit der
Scriptdurchlauf sehr schnell.

4. Der Rückgabewert des Backupprozesses wird an das Plugin als
Parameter weitergereicht. 0 \<=\> OK, \<\>0 Fehler

5. Da die Plugins im Scope von *raspiBackup* aufgerufen werden, besteht
Zugriff auf interne Scriptvariablen. Davon ist abzuraten, da sich die
Internas jederzeit ändern können. Aus diesem Grunde ist es auch ratsam,
eigene Variablen mit einem pluginspzifischen Prefix zu versehen umd
mögliche Konflikte mit Variablennamen, die von *raspiBackup* benutzt werden
zu vermeiden.

6. Wenn jemand seinen Plugincode sharen möchte, geht das einfach über
einen Pullrequest auf [github.](https://github.com/framps/raspiBackup)
Dort ist aller Plugins im Quellcode verfügbar um ihn zu erweitern und
neuen zuzufügen.


[.status]: todo "Formatierung und Text"
