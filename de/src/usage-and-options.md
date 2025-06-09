# Aufrufsyntax und -optionen

Siehe diese Seiten:

- <https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen>
- <https://www.linux-tips-and-tricks.de/en/invocation-and-options>

[.status]: todo "externe Seiten hier einfügen"

*raspiBackup* muss als Benutzer *root* oder per `sudo` aufgerufen werden.

    raspiBackup Option1 Option2 Option3 ... Backupverzeichnis

``` admonish note title="Hinweis"
Vor Release 0.6.6 musste die Extension `.sh` mit angegeben werden:

    raspiBackup.sh Option1 Option2 Option3 ... Backupverzeichnis
```


Ab Version 0.6.3.2 können alle Optionen, die etwas ein- oder ausschalten, durch
ein angehängtes `+` oder `-` gezielt ein oder ausgeschaltet werden.

Beispiel: Die Option `-z` sowie die Option `-z+` schaltet die Backupcompression ein.
Mit der Option `-z-` wird dagegen die Backupcompression ausgeschaltet. Unabhängig davon,
was in der Konfigurationsdatei in dem Parameter `DEFAULT_ZIP_BACKUP` steht. Damit kann eine
Option in der Befehlszeile ausgeschaltet werden, obwohl sie in der
Konfigurationsdatei eingeschaltet ist.

Neben `/usr/local/etc/raspiBackup.conf` gibt es weitere Konfigurationsdateien,
die, sofern vorhanden, gelesen werden.

Die Priorität der Optionsquellen ist aus folgender Tabelle ersichtlich:

| Optionspriorität | Quelle |
|------------------|--------|
| 1                | Aufrufoptionen |
| 2                | -f <configFile> |
| 3                | $(pwd)/.raspiBackup.conf |
| 4                | ~/.raspiBackup.conf |
| 5                | /usr/local/etc/raspiBackup.conf |

------------------------------------------------------------------------

## Thematische Sortierung

### Optionen, die das Backup beschreiben

  - [-k : Anzahl der Backups die vorgehalten werden sollen](#parm_k)
  - [--keep\_\<type\>: Anzahl der jeweiligen backuptypen, die vorgehalten werden sollen](#parm_keepType)
  - [-t : Typ des Backups (dd, tar, rsync)](#parm_t)
  - [-P : Partitionsorientierter Backupmodus](#parm_P)
  - [-z: Kompression des Backups bei dd oder tar](#parm_z)
  - [-u: Ermöglicht weitere Verzeichnisse aus dem Backuprozess auszuschliessen](#parm_u)
  - [-T: Angabe der Partitionen die beim partitionsorientierten Backup gesichert werden sollen](#parm_T)
  - [-M: Erstellen eines *raspiBackup* Snapshots](#parm_M)
  - [-B: Bootpartition wird als tar gesichert statt per dd](#parm_B)
  - [-b: Definition der Blocksize die beim dd Backup genutzt wird](#parm_b)
  - [-D: Weitere Optionen für den dd Backup](#parm_DD)
  - [--dynamicMount: Dynamisches Mounten der Backuppartition](#parm_dynamicmount)
  - [--ignoreAdditionalPartitions: Es werden mehr als zwei Partitionen toleriert wobei aber nur die ersten beiden Partitionen gesichert werden.](#parm_ignoreadditionalpartitions)

### Optionen, die den Restore beschreiben

  - [-g: Fortschrittsanzeige beim Restore](#parm_g)

### Optionen, die die Meldungen und das Log betreffen

  - [-m: Meldungsdetails](#parm_m)
  - [-L: Verzeichnis wo das Debuglog sowie die Laufzeitmeldungen gespeichert werden](#parm_L)
  - [-l: Einschalten des detailierten Loglevels](#parm_l)
  - [-G: Sprache der Meldungen (Deutsch oder English)](#parm_G)
  - [-A: Das Laufzeitlog wird bei der eMail Benachrichtigung mitgeschickt](#parm_A)
  - [-v: Alle Meldungen des verwendeten Backuptools werden protokolliert](#parm_v)
  - [--coloring: Kolorierungseinstellungen bei eMails und Konsolmeldungen](#parm_coloring)
  - [--timestamps: Alle Meldungen werden mit einem führenden Zeitstempel ausgegeben](#parm_timestamps)

### Optionen, die Benachrichtigungen steuern

  - [-e: eMailAdresse an die die Benachrichtigung geschickt wird](#parm_e)
  - [-s: eMailClientProgramm welches benutzt wird um die eMail zu verschicken](#parm_s)
  - [-E: Optionale Parameter für die eMailClientProgramme](#parm_E)
  - [-F: Simuliert den Backuplauf und hilft die eMailBenachrichtgung schnell zu testen](#parm_F)
  - [--telegramToken, --telegramChatID, --telegramNotifications : Benachrichtigungen werden per Telegram verschickt](#parm_telegram)
  - [--eMailColoring: Steuerung wo der genutzte eMailClient Colorierungnsinformationen akzeptiert](#parm_emailcoloring)

### Optionen, die den Update, Restore und lokale Verteilung von *raspiBackup* steuern

  - [-U: Update von *raspiBackup* mit der aktuellsten Version und Sicherung der alten Version](#parm_U)
  - [-V: Reaktivierung einer vorhergehenden *raspiBackup* Version](#parm_V)
  - [-y: Kopie der aktuellen *raspiBackup* Version auf vordefinierte lokale Hosts per scp](#parm_y)

### Optionen, die Services vor dem Backup starten und stoppen sowie Erweiterungen

  - [-o: Befehle, die Services vor dem Backup stoppen](#parm_o)
  - [-a: Befehle, die Services nach dem Backup starten](#parm_a)
  - [-N: Erweiterungen, die vor und nach dem Backup aufgerufen werden sollen](#parm_N)

### Weitere Optionen

  - [-f: Angabe einer Konfigurationsdatei](#parm_f)


## Alphabetische Sortierung

<table style="width: 60%;" data-border="1">
<colgroup>
<col style="width: 10%" />
<col style="width: 60%" />
<col style="width: 10%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr class="odd">
<td style="text-align: center;"><strong>Option</strong></td>
<td style="text-align: center;"><strong>Funktion</strong></td>
<td style="text-align: center;"><strong>Standard</strong></td>
<td style="text-align: center;"><strong>Option im Installer
setzbar</strong></td>
</tr>
<tr class="even">
<td style="text-align: center;"><span
style="color: #ff0000;"><strong>-a</strong></span></td>
<td style="text-align: center;"><p><span
style="color: #ff0000;"><strong><span
id="parm_a"></span></strong></span>Befehle um Services nach dem Backup
wieder zu starten. Z.B. bei Samba <strong>"service smbd start"</strong>
(Achtung: Anführungszeichen an Anfang und Ende). Diese Option ist
zusammen mit der Option -o obligatorisch.</p>
<p>Mehrere Befehle müssen durch &amp;&amp; getrennt werden. Alternativ
kann ein Wrapperscript benutzt werden (Beispiel <a
href="https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen#wrapper">siehe
unten</a>). Diese Befehle sollten die exakte umgekehrte Reihenfolge
haben wie die Befehle beim Parameter -o.</p>
<p><strong>Beispiel:</strong></p>
<p><code>-a "service nfs-kernel-server start &amp;&amp; service samba"</code></p>
<p>Soll wirklich kein Service gestartet werden muss der Doppelpunkt ":"
als Argument mitgegeben werden.</p>
<p>Siehe dazu auch <a
href="https://www.linux-tips-and-tricks.de/de/faq#a1">FAQ #1</a> und <a
href="https://www.linux-tips-and-tricks.de/de/faq#a18">FAQ #18</a></p>
<p><strong>Achtung: </strong></p>
<p>Die Befehle werden als root ausgeführt. Es ist kein sudo
notwendig.</p></td>
<td style="text-align: center;">Keiner</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong>-b</strong></span></td>
<td style="text-align: center;">Blocksize die beim dd Backup benutzt
wird</td>
<td style="text-align: center;">1MB</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>-B</strong></td>
<td style="text-align: center;"><p><strong><span
id="parm_B"></span></strong>Die Bootpartition wird nicht per dd sondern
per tar gesichert.</p>
<p><strong>Hinweis: </strong>Diese Option hat keine Funktion wenn der
partitionsorientierte Modus benutzt wird, also Option -P benutzt wird
oder DEFAULT_PARTITIONBASED_BACKUP=1 in der Konfiguration gesetzt
ist.</p></td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>-c</strong></td>
<td style="text-align: center;">Es kann kein Backup auf der
Rootpartition erstellt werden um vor unbeabsichtigtem Vollschreiben der
Rootpartition durch das Backup zu schützen. Mit dieser Option wird der
Test ausgeschaltet und es kann ein Backup auf der Rootpartition erstellt
werden. ACHTUNG: Es wird nicht geprüft ob das Backup noch auf die
Rootparition passt.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>--coloring</strong></td>
<td style="text-align: center;"> <span id="parm_coloring"></span>Ab der
Version 0.6.5 können die Meldungen in der eMail sowie auf der Konsole
koloriert werden. Mögliche Werte sind C für Konsole und/oder M für
eMail. Falls postfix als emailClient genutzt wird siehe auch Option
--eMailColoring.</td>
<td style="text-align: center;">automatisch</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong> <strong>-D</strong></strong></span></td>
<td style="text-align: center;"><span id="parm_DD"></span>Weitere
Aufrufoptionen für das dd Backup (z.B. "conv=notrunc,noerror,sync")</td>
<td style="text-align: center;">automatisch</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p><strong>--dynamic</strong></p>
<p><strong>Mount</strong></p></td>
<td style="text-align: center;"><strong><strong><span
id="parm_dynamicMount"></span></strong><span
id="parm_dynamicmount"></span></strong>Ab Version 0.6.6 wird damit vor
dem Backup die angegebene Partition bzw der Mointpoint gemounted und am
Ende wieder umounted. Falls sie schon gemounted ist wird am Ende die
Partition nicht umounted. Der Mountpoint muss in /etc/fstab definiert
sein und kann dann entweder der Mountpoint selbst sein (z.B. /backup)
oder die Backuppartition (z.B. /dev/sdb1).</td>
<td style="text-align: center;">Keiner</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong> <strong>-e</strong></strong>
</span></td>
<td style="text-align: center;"><p>email Addresse, die eine Status-email
sowie die Meldungen des Backuplaufs zugesendet bekommt</p>
<p><strong>Achtung:</strong> Die Benachrichtigungsemail wird vom root
Nutzer gesendet. D.h. der eMailClient auf dem System muss so
konfiguriert werden dass</p>
<pre><code>echo &quot;eMail-Text&quot; | sudo mail -s &quot;Betreff&quot; &quot;Empfänger eMail&quot;</code></pre>
<p>die eMail erfolgreich gesendet wird.</p>
<p>Mit der Konfigurationsoption</p>
<p>DEFAULT_SENDER_EMAIL kann die Standardsenderadresse  <a
href="mailto:root@$(hostname">root@$(hostname)</a> falls notwendig
geändert werden.</p>
<p><strong><span style="color: #ff0000;">Hinweis: </span></strong><span
style="color: #ff0000;"><span style="color: #000000;">Die eMail
Benachrichtigung funktioniert nur wenn ein MTA wie z.B. nullmailer,
msmtp, postfix oder exim4 entsprechend korrekt konfiguriert wurde. Siehe
dazu <a
href="https://www.linux-tips-and-tricks.de/de/faq#a47">FAQ47</a>. Die
eMailfunktion kann relativ einfach mit der Fakeoption -F getestet
werden. Außerdem sind weitere Benachrichtigungsmöglichkeiten wie
Pushover, Slack oder Telegram unterstützt.</span></span></p></td>
<td style="text-align: center;"> Keiner</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><span
style="color: #000000;"><strong><strong>-E</strong></strong></span></td>
<td style="text-align: center;"><p>Optionale weitere Parameter die im
eMailProgrammaufruf mitgegeben werden. Für sendEmail muss er z.B. wie
folgt aussehen: "-f <a
href="mailto:absender.mail@absenderdomain%20-m">absender.mail@absenderdomain</a>
-s smtp-server:587 -xu Username -xp Password".</p>
<p><strong>Achtung:</strong> Die Parameter für -E müssen in
Anführungszeichen " eingeschlossen sein. Speziell zum Testen der eMail
Benachrichtigungsfunktion ist der Parameter -F hilfreich.</p>
<p><span style="color: #ff0000;"><strong>Achtung:</strong> <span
style="color: #000000;">Wenn der Parameter -l 1 benutzt wird steht das
Password im Log und sollte vor Verschicken des Logs manuell maskiert
werden.</span></span></p></td>
<td style="text-align: center;">Keiner</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p><strong>--eMail</strong></p>
<p><strong>Coloring</strong></p></td>
<td style="text-align: center;"><span
id="parm_emailcoloring"></span>Standardmaessig wird das eMailColoring
über die Subject Zeile gesteuert da dieser Weg von den meisten eMail
Clients genutzt wird. Wenn man aber postfix als eMail Client benutzt
muss man <em>OPTION</em> als Parameter mitgeben da postfix das Coloring
mit einer separaten Option steuert.</td>
<td style="text-align: center;">SUBJECT</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>-f</strong></td>
<td style="text-align: center;"><span id="parm_f"></span>Angabe einer
Konfigurationsdatei die als letztes eingelesen wird. Siehe <a
href="https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen#configfiles">hier</a>
alle möglichen Konfigurationsdateien und ihre Einlesereihenfolge.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong><strong>-F</strong></strong></span></td>
<td style="text-align: center;"><span
style="color: #000000;"><strong><strong><span
id="parm_F"></span></strong></strong></span>Fake backup. Diese Option
ist hilfreich beim initialen Testen von *raspiBackup*. Der eigentliche
lange Backup wird dadurch nicht angestossen - aber sämtliche
Optionsprüfungen wie auch das Senden der BenachrichtigungseMail.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong><span
id="parm_g"></span>-g</strong></td>
<td style="text-align: center;">Mit dieser Option wird beim Backup und
Restore eine Fortschrittsanzeige angezeigt. Beim tar Backup steht keine 
Fortschrittssanzeige zur Verfügung.</td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #339966;"><strong><span
style="color: #000000;"><strong><strong>-G</strong></strong></span></strong>
</span></td>
<td style="text-align: center;">Festlegung der Sprache der Meldungen.
Mögliche Sprachen sind DE (Deutsch) und EN (English). Interessenten, die
die Meldungen in andere Sprachen übersetzen wollen können <a
href="https://www.linux-tips-and-tricks.de/de/kontakt/">sich gerne
melden</a></td>
<td style="text-align: center;"><p><span
style="color: #339966;"><strong><span
style="color: #000000;"><strong><strong><span
id="parm_G"></span></strong></strong></span></strong></span>Eingestellte
Systemsprache auf der Raspi.</p>
<p>EN (Englisch) wird benutzt falls die Systemsprache nicht unterstützt
wird</p></td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><span
style="color: #339966;"><strong> <span style="color: #000000;">-h<span
id="parm_h"></span></span></strong> </span></td>
<td style="text-align: center;">Ausgabe der Aufrufsyntax mit seinen
Parametern</td>
<td style="text-align: center;"> Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p><strong>--ignore</strong></p>
<p><strong>Additional</strong></p>
<p><strong>Partitions</strong></p></td>
<td style="text-align: center;"><strong><span
id="parm_ignoreadditionalpartitions"></span></strong>Ab Version 0.6.5
erlaubt *raspiBackup* mit dieser Option Systeme mit mehr als zwei
Partitionen auf der SD Karte zu haben wenn tar oder rsync Backup genutzt
wird. Allerdings werden nur die ersten beiden Paritionen, /boot und /
gesichert und wiederhergestellt. <span
style="color: #ff0000;"><strong>Achtung:</strong></span> Alle anderen
Partitionen werden ignoriert.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p><strong>--ignore</strong></p>
<p><strong>Missing</strong></p>
<p><strong>Partitions</strong></p></td>
<td style="text-align: center;">Ab Version 0.7.0 wird geprüft ob alle
Partitionen die im letzten Backup gesichert wurden auch wieder gesichert
werden. Mit dieser Option wird der Test ausgeschaltet.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #ff0000;"><strong> -k</strong></span></td>
<td style="text-align: center;"><p> Anzahl der Backups, die pro
Backuptyp vorzuhalten sind sofern es nicht durch folgende Option
überschrieben wird. D.h. es werden 3 dd, 3 tar und 3 rsync Backups
vorgehalten.</p>
<p><strong><span style="color: #ff0000;">Hinweis:</span></strong><span
style="color: #ff0000;"></span><span style="color: #ff0000;"><span
style="color: #000000;">Diese Option ist wirkungslos wenn die
intelligente Rotationsstrategie benutzt wird.</span></span></p></td>
<td style="text-align: center;"> 3</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p><strong>--<span
style="color: #000000;">keep_</span>&lt;type&gt;</strong></p>
<p><strong> </strong></p></td>
<td style="text-align: center;"><p><strong><span
id="parm_keepType"></span></strong>Ab Version 0.6.4.3: Anzahl der
Backups die für den jeweiligen Backuptypen vorgehalten werden.</p>
<p>&lt;type&gt; kann jeder Backuptyp sein, also dd, ddz, tar, tgz oder
rsync</p>
<p><strong><span style="color: #ff0000;">Hinweis:</span></strong><span
style="color: #ff0000;"></span><span style="color: #ff0000;"><span
style="color: #000000;">Diese Optionen sind wirkungslos wenn die
intelligente Rotationsstrategie benutzt wird.</span></span></p></td>
<td style="text-align: center;">Parameter für Option -k</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #339966;"><strong> <span
style="color: #000000;">-l</span></strong> </span></td>
<td style="text-align: center;"><p><span
style="color: #339966;"><strong><span style="color: #000000;"><span
id="parm_l"></span></span></strong></span>Log level definiert ob ein
Debuglog erstellt wird:</p>
<p>- off  -&gt; Es wird kein Debuglog erstellt</p>
<p>- debug -&gt; Es wird ein Debuglog erstellt</p>
<p><strong><span style="color: #ff0000;">Achtung:</span></strong><span
style="color: #ff0000;"> </span><span style="color: #ff0000;"><span
style="color: #000000;">Die Logausgabe kann in manchen Fällen sensitive
Informationen enthalten (Z.B. externe statische IP Adressen,
eMailAdressen, Kennwörter für mount Befehle oder email Server, ...) .
Das Debuglog wird immer im Backupverzeichnis abgelegt. Falls es Fehler
gibt und das Backupverzeichnis wieder gelöscht werden wird wird das Log
vorher in das Homeverzeichnis des Aufrufers gesichert damit es
analysiert werden kann.<br />
</span></span></p></td>
<td style="text-align: center;"> on</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>-L</strong></td>
<td style="text-align: center;"><p><span id="parm_L"></span>Definiert
das Ziel der Logdatei die *raspiBackup*.log heisst.</p>
<p><strong>varlog:</strong> Die Logdatei wird in /var/log
geschrieben</p>
<p><strong>backup:</strong> Die Logdatei wird in das erzeugte Backup
geschrieben</p>
<p><strong>current:</strong> Die Logdatei wird in das aktuelle
Verzeichnis geschrieben.</p>
<p><strong>&lt;Dateinamenprefix&gt;</strong>:  Das Debuglog wird dort
mit der Extension .log und die Messagedatei mit der Extension .msg
abgelegt.</p>
<p>Beispiel: /home/pi/raspiBackup.</p>
<p>Am Ende existiert /home/pi/raspiBackup.log sowie
/home/pi/raspiBackup.msg</p>
<p>Im Backupverzeichnis werden keine Logs abgelegt.</p></td>
<td style="text-align: center;">backup</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong>-m</strong></span></td>
<td style="text-align: center;"><p><span
style="color: #000000;"><strong><span
id="parm_m"></span></strong></span>Meldungsdetails </p>
<p>- minimal -&gt; Nur wichtige Meldungen werden ausgegeben</p>
<p>- detailed -&gt; Viele Meldungen über den Fortschrit werden
ausgegeben</p></td>
<td style="text-align: center;">minimal</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>-M</strong></td>
<td style="text-align: center;"><p>  <span id="parm_M"></span> Mit der
Option wird ein *raspiBackup* Snapshot erstellt welcher nicht im
Backuprecycleprozess berücksichtigt wird und somit nicht gelöscht wird.
Der Snapshot erhält am Ende des Verzeichnisnamens den angegebenen Text.
Siehe auch <a
href="https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/638-raspibackup-schnappschuesse-snapshots">diese
Seite</a> zu Snapshots.</p>
<p>Beispiel: Der Hostname ist idefix und der Parameter für -M ist
"Initial boot from SD". Dann wird folgendes Verzeichnis angelegt:</p>
<p>idefix/idefix-rsync-backup-20170103-170717_idefix-Initial_boot_from_SD</p>
<p><strong>Hinweis:</strong> *raspiBackup* Snapshots sind normale Backups
und keine richtigen Snapshots wie die bei LVM oder btrfs.</p>
<p><strong><span style="color: #ff0000;">Hinweis:</span></strong></p>
<p>Da dieses Verzeichnis nicht im Backuprecycleprozess berücksichtigt
wird und muss manuell gelöscht werden.</p></td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong>-N</strong></span></td>
<td style="text-align: center;">Aktivierung von eigenen
Scripterweiterungen (Plugins). Siehe dazu <a
href="https://www.linux-tips-and-tricks.de/de/13-raspberry/442-raspibackup-erweiterungen">diese
Seite</a> die auch zwei Beispielerweiterungen anbietet, die die CPU
Temperatur und die Speicherbelegung vor und nach dem Backuplauf
ausgeben.</td>
<td style="text-align: center;">Keiner</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span> </td>
</tr>
<tr class="even">
<td style="text-align: center;"><p><strong>--notify</strong></p>
<p><strong>Start</strong></p></td>
<td style="text-align: center;">Ab der Version 0.6.5 kann man mit dieser
Option einschalten dass man eine eMail oder eine Telegram
Benachrichtigung bekommt wenn der Backup startet. Normalerweise wird nur
am Ende des Backups eine Benachrichtigung geschickt.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #ff0000;"><strong><strong><strong><strong>-o</strong></strong></strong></strong></span></td>
<td style="text-align: center;"><p><span
style="color: #ff0000;"><strong><strong><strong><strong><span
id="parm_o"></span></strong></strong></strong></strong></span>Befehle um
Services vor dem Backup zu stoppen damit kein inkonsistentes Backup
erzeugt wird. Z.B. bei Samba "service smbd stop" (Achtung:
Anführungszeichen an Anfang und Ende). Diese Option ist zusammen mit der
Option -a obligatorisch.</p>
<p>Mehrere Befehle müssen durch &amp;&amp; getrennt werden. Alternativ
kann ein Wrapperscript benutzt werden (Beispiel <a
href="https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen#wrapper">siehe
unten</a>). Diese Befehle sollten die exakte umgekehrte Reihenfolge
haben wie die Befehle beim Parameter -a.</p>
<p><strong>Beispiel:</strong></p>
<p><code>-o "service samba stop &amp;&amp; service nfs-kernel-server stop"</code></p>
<p>Soll wirklich kein Service gestoppt werden muss der Doppelpunkt ":"
als Argument mitgegeben werden.</p>
<p>Siehe dazu auch <a
href="https://www.linux-tips-and-tricks.de/de/faq#a1">FAQ #1</a> und <a
href="https://www.linux-tips-and-tricks.de/de/faq#a18">FAQ #18</a></p>
<p><strong>Achtung: </strong></p>
<p>Die Befehle werden als root ausgeführt. Es ist kein sudo
notwendig.</p></td>
<td style="text-align: center;">Keiner</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>-P</strong></td>
<td style="text-align: center;">Partitionsorientierter Modus. Damit kann
im Gegensatz zum normalen Modus wo nur die ersten beiden Partitionen
gesichert werden eine beliebige Anzahl von Partitionen gesichert. Mit
der Option -T wird definiert welche Partitionen zu sichern sind.</td>
<td style="text-align: center;">aus</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p><strong>--reboot</strong></p>
<p><strong>System</strong></p></td>
<td style="text-align: center;"><p><strong><span
id="parm_rebootSystem"></span></strong>Ab Release 0.6.7 wird duch diese
Option eine Reboot des Systems am Ende des Backuplaufes vorgenommen und
damit werden alle Services wieder gestartet. Deshalb werden Argumente
der Option -a auch ignoriert.</p>
<p><strong>Hinweis:</strong> Wird die Option -F benutzt wird kein reboot
durchgeführt.</p></td>
<td style="text-align: center;">aus</td>
<td style="text-align: center;"><span style="color: #008000;"><span
style="color: #ff0000;">nein</span></span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>--resizeRootFS</strong></td>
<td style="text-align: center;">Mit dieser Option wird definiert ob beim
Restore die letzte Partition verkleinert wird um auf ein kleineres
Device zu restoren oder vergrößert um den ganzen verfügbaren Platz des
Devices zu nutzen. Ist das Device kleiner muss es aber noch gross genug
sein um die ganzen Daten des Backups aunehmen zu können, Ansonsten
bricht der Restore irgendwann ab.</td>
<td style="text-align: center;">an</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong><strong><strong>-s</strong></strong></strong></span></td>
<td style="text-align: center;"><p><span
style="color: #000000;"><strong><strong><strong><span
id="parm_s"></span></strong></strong></strong></span>email Program
welches benutzt wird {mail|sendEmail|ssmtp|msmtp}. Für postfix und
nullmailer muss <em>mail</em> benutzt werden und die <em>mailtools</em>
installiert werden. Für sendEmail muss der Parameter -E zusätzlich
genutzt werden für weitere obligatorische Parameter (Siehe Parameter -E
Beschreibung für Details).</p>
<p>Es kann auch ein eMailPlugin benutzt werden um eMails zu verschicken.
Damit können beliebige weitere eMailClients in *raspiBackup* eingebunden
werden. Der -s Parameter muss dann mailext sein. Details zum eMailPlugin
siehe <a
href="https://www.linux-tips-and-tricks.de/de/13-raspberry/442-raspibackup-erweiterungen">diese
Seite</a></p></td>
<td style="text-align: center;">mail</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>-S</strong></td>
<td style="text-align: center;">Ein Update mit der Option -U wird auch
vorgenommen wenn die Versionen übereinstimmen. Sie bewirkt dass sowohl
eine lokale Betaversion wie auch eine lokale normale Version mit dem
aktuellsten Codestand ersetzt wird. Primär ist sie dafür gedacht den
Codestand einer existierenden lokalen Betaversion zu aktualisieren.</td>
<td style="text-align: center;">aus</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p><strong>--smart</strong></p>
<p><strong>Recycle</strong></p></td>
<td style="text-align: center;"><strong><span
id="parm_smartrecycle"></span></strong>Ab Version 0.6.5 schaltet diese
Option die intelligente Rotationsstrategie ein. Details dazu sind <a
href="https://www.linux-tips-and-tricks.de/de/rotationsstrategie">hier</a>
beschrieben. Damit werden auch die --keep Optionen ignoriert  und müssen
nicht auf 0 gesetzt werden.</td>
<td style="text-align: center;">aus</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p><strong>--smart</strong></p>
<p><strong>Recycle</strong></p>
<p><strong>Dryrun</strong></p></td>
<td style="text-align: center;">Ab Version 0.6.5 schaltet diese Option
den Testmodus der intelligenten Rotationsstrategie ein. Details dazu
sind <a
href="https://www.linux-tips-and-tricks.de/de/rotationsstrategie">hier</a>
beschrieben.</td>
<td style="text-align: center;">ja</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p><strong>--smarte</strong></p>
<p><strong>Recycle</strong></p>
<p><strong>Options</strong></p></td>
<td style="text-align: center;">Ab Version 0.6.5 definiert diese Option
Parameter der intelligenten Rotationsstrategie. Details dazu sind <a
href="https://www.linux-tips-and-tricks.de/de/rotationsstrategie">hier</a>
beschrieben.</td>
<td style="text-align: center;">"7 4 12 1"</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p><strong>--system</strong></p>
<p><strong>status</strong></p></td>
<td style="text-align: center;"> Ab Version 0.6.3.4 wird eine Liste der
der aktiven Services und offenen Dateien in der Debugdatei erstellt</td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #ff0000;"><strong><strong>-t</strong></strong>
</span></td>
<td style="text-align: center;"><p><span
style="color: #ff0000;"><strong><strong><span
id="parm_t"></span></strong></strong></span>Typ des Backups, der
entweder dd, tar oder rsync sein kann. rsync benutzt bei einer ext3/ext4
Partition Hardlinks um dien benötigten Speicherplatz zu minimieren.</p>
<p><strong>Achtung:</strong> Bei rsync darf keine Backuppartition mit
NTFS Filesystem benutzt werden da NTFS nicht die Rechte eines ext3/4
Filesystems übernehmen kann. Dadurch können bei einem Restore nicht mehr
die korrekten Rechte gesetzt werden und der Restore ist nicht nutzbar.
Weiterhin werden nur bei einem ext3/4 Filesystem Hardlinks genutzt um
die Datenmenge der Backups zu reduzieren.</p>
<p><a
href="https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen#vornach">Detailinformationen
zu den Backuptypen</a> Ein externes Rootfilesystem wird automatisch bei
tar oder rsync Backup mitgesichert sofern nicht die Option -P benutzt
wird. Mit der Option -z werden die Backups zusätzlich noch gezippt bzw
verkleinert.</p>
<p><strong>Hinweis:</strong> Beim dd Backup kann durch den
Konfigurationsparameter DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY
Backup-zeit und -platz gespart werden. Details zu dem Parameter siehe am
Ende der Tabelle.</p>
<p>Siehe dazu auch <a
href="https://www.linux-tips-and-tricks.de/de/faq#a16">FAQ
#16</a></p></td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p><strong>--telegram</strong></p>
<p><strong>Token</strong></p>
<p><strong>--telegram</strong></p>
<p><strong>ChatID</strong></p>
<p><strong>--telegram</strong></p>
<p><strong>Notifications</strong></p></td>
<td style="text-align: center;"><p><strong><span
id="parm_telegram"></span></strong>Ab Version 0.6.5 können
Benachrichtigungen nicht nur per eMail sondern auch per oder Telegram
verschickt werden. Dazu sind folgende Konfigurationen notwendig:</p>
<p>Das Telegramtoken sowie die ChatID. Mit den Notifications definiert
man ob man in Erfolgs- und/oder Fehlerfalle benachrichtigt werden will.
Mögliche Optionen sind "S" für Erfolg (Success) und/oder "F" für den
Fehlerfall (Failure). Mit "M" werden die *raspiBackup* Meldungen als Datei
geschickt.. Mit "m" werden die *raspiBackup* Meldungen mitgeschickt. Es
können die Optionen beliebig kombiniert werden. Beispiel: "SFm" oder
"Sm". Die Optionen "m" und "M" können nicht zusammen angegeben
werden.</p></td>
<td style="text-align: center;"><p>aus</p>
<p>F</p></td>
<td style="text-align: center;"><span style="color: #008000;"><span
style="color: #ff0000;">nein</span></span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>--timestamps</strong></td>
<td style="text-align: center;"><strong><span
id="parm_timestamps"></span></strong> Durch diese Option wird vor jeder
Meldung ein Zeitstempel ausgegeben.</td>
<td style="text-align: center;">Keiner</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><span
style="color: #000000;"><strong><strong>-T</strong></strong></span></td>
<td style="text-align: center;"><p><span
style="color: #ff0000; font-family: arial, helvetica, sans-serif;"><span
style="color: #000000;">Falls der partitionsorientierte Backupmodus mit
der Option -P gewählt wurde kann mit dieser Option definiert werden
welche Partitionen gesichert werden sollen. Beispiel: -T "1 2 5" sichert
die ersten beiden und die fünfte Partition. Mit * werden alle
Partitionen gesichert.</span></span></p></td>
<td style="text-align: center;"><p>* bis Release 0.6.5.1</p>
<p>"1 2" ab Release 0.6.6</p></td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong><strong>-u</strong></strong></span></td>
<td style="text-align: center;"><div data-align="left">
<span style="color: #000000;"><strong><strong><span
id="parm_u"></span></strong></strong></span>Erweiterung der Excludeliste
beim Backup um bestimmte Verzeichnisse beim Backup zu ignorieren. <span
style="color: #ff0000;"> </span>
</div>
<div data-align="left">
 &#10;</div>
<div data-align="left">
<span style="color: #ff0000;"><strong>Achtung:</strong> <span
style="color: #000000;">Die Parameter müssen der jeweiligen Syntax des
Backuptools gehorchen und führen sonst zum Abbruch des Backups. Für
rsync oder tar <span
style="font-family: arial, helvetica, sans-serif;">könnte die Liste wie
folgt aussehen: </span></span></span>
</div>
<pre data-align="left"><code>&quot;--exclude=/backup/* --exclude=/rsnapshot/* --exclude=/www-data*/* --exclude=/home/pi/.local/share/Trash&quot;</code></pre>
<div data-align="left">
<span style="color: #ff0000;"><span style="color: #000000;"><span
style="font-family: arial, helvetica, sans-serif;">Die
Anfuehrungszeichen sind wichtig! Weitere Informationen zu der Syntax
finden sich auf der man Page der jeweiligen Backuptools.</span></span>
</span>
</div>
<div data-align="left">
 &#10;</div>
<div data-align="left">
Folgende Verzeichnisse werden niemals gesichert:
</div>
<div data-align="left">
Der Backupfad der im Aufruf angegeben wurde, /proc/* , /lost+found/* ,
/sys/* , /dev/* , /tmp/*, /boot/*, /run/* , /proc/* , /lost+found/* ,
/sys/* , /dev/* , /tmp/* , /boot/* , /run/*
</div>
<div data-align="left">
Ausserdem werden alle gemounteten Verzeichnisse von externen Geräten,
die nicht auf / gemounted sind, nicht gesichert. Es wird nur die Boot
Partition /dev/mmcblk0p1 und die Root Partition /dev/mmcblk0p2 bzw das
ausgelagerte Rootverzeichnis auf z.B. /dev/sda1 gesichert.
</div>
<div data-align="left">
 &#10;</div>
<div data-align="left">
<strong>Hinweis für den partitionsorientierten Mode:</strong>
</div>
<div>
 &#10;</div>
<div data-align="left">
Wenn die Option -P benutzt wird werden in allen Partitionsbackups die
o.g. Verzeichnisse ausgenommen.
</div>
<div>
 &#10;</div>
<div>
<strong>rsync:</strong>
</div>
<div>
   */verzeichnis/* - Excluded verzeichnis auf allen Partitionen
</div>
<div>
   mmcblk0p2/verzeichnis/* - Excluded verzeichnis auf Partition
mmcblk0p2
</div>
<div>
 &#10;</div>
<div>
<strong>tar:</strong>
</div>
<div>
   verzeichnis/* - Excluded Verzeichnis auf allen Partitionen
</div>
<div>
 &#10;</div></td>
<td style="text-align: center;">Keiner</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p><strong>--unsupported</strong></p>
<p><strong>Environment</strong></p></td>
<td style="text-align: center;">Ab der Release 0.6.7 started *raspiBackup*
auch auf nicht unterstützten Umgebungen. Siehe dazu auch <a
href="https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/608-unterstuetzte-hard-und-software">hier.</a></td>
<td style="text-align: center;">Aus</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><span
style="color: #000000;"><strong>-U</strong></span></td>
<td style="text-align: center;"><p><span
style="color: #000000;"><strong><span
id="parm_U"></span></strong></span>Die lokale *raspiBackup* Version wird
durch die letzte aktuelle Version ersetzt sofern eine neue Version
existiert Die vorherige Version wird als *raspiBackup*.sh.n.m gesichert
wobei n und m die Versionsnumer von *raspiBackup* ist. Siehe Parameter -V
um eine vorhergehende Version wiederherzustellen.</p>
<p><strong><span style="color: #ff0000;">Achtung: </span></strong><span
style="color: #ff0000;"><span style="color: #000000;">Vorher sollte man
<a
href="https://www.linux-tips-and-tricks.de/de/versionshistorie/">diese
Seite lesen</a> </span></span>und sich über die Änderungen und
Neuerungen informieren.</p>
<p>Zusätzlich gibt es noch die option -S mit der Betaversionen auf den
letzten Stand gebracht werden können.</p>
<p>Mit der Option -V kann auf eine ältere Version zurrückgegangen
werden.</p></td>
<td style="text-align: center;">Aus</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><span
style="color: #000000;"><strong>-v</strong></span></td>
<td style="text-align: center;"><strong><span
id="parm_v"></span></strong><span style="color: #000000;"></span>Die
verwendeten Backuptools tar und rsync zeigen detailierte Informationen
an (Verbose mode). Die Option ist besonders nützliche bei initialen
manuellen Backuptests um den Backupfortschritt verfolgen zu können.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>-V</strong></td>
<td style="text-align: center;"><strong><span
id="parm_V"></span></strong>Es wird eine Liste aller existierenden
Vorgängerversionen angezeigt und man kann die Version auswählen, die 
wiederhergestellt werden soll. Die aktuelle Version wird gesichert und
kann dann auch mit dieser Option später wiederhergestellt werden (Siehe
auch -U Parameter) <span
style="color: #ff0000; font-family: arial, helvetica, sans-serif;"><span
style="color: #000000;"><span style="color: #000000;"></span></span>
</span></td>
<td style="text-align: center;"> Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>--version</strong></td>
<td style="text-align: center;"><p>Die Version von *raspiBackup* wird im
folgenden Format ausgegeben:</p>
<p>Version: 0.6.3.2 CommitSHA: 8fbcd1a CommitDate: 2018-02-19
CommitTime: 19:18:31#</p>
<p>Das dient im Wesentlichen dazu programmatisch die
Versionsinformationen von *raspiBackup* abzufragen.</p></td>
<td style="text-align: center;">Aus</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>-y</strong></td>
<td style="text-align: center;"><strong><span
id="parm_y"></span></strong>Mit dieser Option wird das aktuelle Script
auf alle Hosts kopiert, die in der Konfigurationsdatei definiert sind.
Der Zugriff muss per authorized_keys ohne Kennwort möglich sein. Somit
lässt sich *raspiBackup* schnell auf einer größeren Menge von Hosts nach
einem Versionsupdate verteilen.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"><span
style="color: #000000;"><strong>-z</strong></span></td>
<td style="text-align: center;"><strong><span
id="parm_z"></span></strong><span style="color: #000000;"></span>Backup
verkleinern mit gzip bei dd oder tar Backup</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #008000;">ja</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> <span
id="parm_mailonerroronly"></span></td>
<td style="text-align: center;">Nur im Fehlerfalle wird eine
eMailbenachrichtigung gesendet. <strong>Hinweis:</strong> Sollte
*raspiBackup* wegen aussergewöhnlicher Umstände abstürzen kann es durchaus
sein dass keine eMail gesendet wird.</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p>Backupoptionen, die beim rsync Backup
genutzt werden. <span style="color: #000000;"></span><strong><span
style="color: #ff0000;"><br />
</span></strong></p>
<p><strong><span style="color: #ff0000;">Benutzung auf eigene Gefahr
!</span></strong></p></td>
<td style="text-align: center;">--delete -aHAx</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p>Backupoptionen, die beim tar Backup
genutzt werden. </p>
<p><strong><span style="color: #ff0000;">Benutzung auf eigene Gefahr
!</span></strong></p></td>
<td style="text-align: center;">-cpi</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p>Backupoptionen, die beim rsync Backup
zusätzlich genutzt werden. </p>
<p><strong><span style="color: #ff0000;">Benutzung auf eigene Gefahr
!</span></strong></p></td>
<td style="text-align: center;">Keine</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p>Backupoptionen, die beim tar Backup
zusätzlich genutzt werden. </p>
<p><strong><span style="color: #ff0000;">Benutzung auf eigene Gefahr
!</span></strong></p></td>
<td style="text-align: center;">Keine</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;">Sich selten ändernde Bootparition
Backups werden mit Hardlinks verknüpft um Backupspace zu sparen.
Voraussetzung: Der Backupspace unterstützt Hardlinks (ext3/ext4
Filesystem).</td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p><span
id="parm_saveusedpartitionsonly"></span>dd Backups sichern nur den von
definierten Partitionen belegten Platz. Dadurch benötigt eine 32GB SD
Karte, die nur eine 8GB Partition definiert hat, für den Backup nur 8GB
und nicht 32GB. Dazu muss aber vermittels gparted oder resize2fs die
root Partition entsprechend verkleinert werden, denn üblicherweise füllt
die root Partition den gesamten Rest der SD Karte aus.</p>
<p>Siehe dazu auch <a
href="https://www.linux-tips-and-tricks.de/de/faq#a16">FAQ
#16</a></p></td>
<td style="text-align: center;">Nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;">Die eMailAdresse des Versenders kann bei
ssmtp und msmtp angegeben werden.</td>
<td style="text-align: center;"><a
href="mailto:root@$(hostname">root@$(hostname</a>)</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p>Backup Restore Test Reminder
Intervall (Einheit: Monate)</p>
<p> </p></td>
<td style="text-align: center;">6</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;">Anzahl der Erinnerungen einen Backup
Restore Test durchzuführen.</td>
<td style="text-align: center;">3</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> </td>
<td style="text-align: center;">Ab Version 0.6.4.3: Die hier definierten
Befehle werden vor bzw nach dem Backup vor bzw nach dem Stoppen von
Systemservices (Option -a und -o) ausgeführt.</td>
<td style="text-align: center;">nein</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;">Ab Version 0.6.6.1 vom 13.2.2022: Es
werden ein paar genutzte *raspiBackup* Optionen die für Statistikzwecke
genutzt werden beim Versionscheck übermittelt. Details dazu siehe <a
href="https://www.linux-tips-and-tricks.de/de/raspibackup#stats">hier</a>.</td>
<td style="text-align: center;">ja</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> </td>
<td style="text-align: center;">Ab Version 0.6.7 gibt es auch für den
Restore wie beim Backup die Möglichkeit auch pre und post Exits zu
konfigurieren um vor und nach dem Restore noch irgendwelche Aktionen
vorzunehmen. Die Syntax ist genauso wie für die Backup Extensions.</td>
<td style="text-align: center;">keine</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p>Ab Version 0.6.7 können die html und
VT100 Colorcodes definiert werden. Default ist gelb für Warnungen und
Rot für Fehler. Das erste Pächen der Definition legt die Codes für
Warnung das zweite Pächen die Definition für Fehler fest. Dabei ist die
erste Definition der HTML Colorocde und die zweite Definition der VT100
Colorcode.</p></td>
<td style="text-align: center;">("#FF8000 33" "#FF0000 31")</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p>Ab Version 0.6.8 können
Benachrichtigungen per Pushover geschickt werden. Dazu ist es notwendig
sich auf <a href="https://pushover.net/">https://pushover.net/</a>
registriert zu haben und eine applicationeingerichtet haben muss.</p>
<p>Der PUSHOVER_USER ist der Pushover User Key.</p>
<p>Der PUSHOVER_TOKEN ist der API Token Key den man für eine Application
definiert hat.</p>
<p>Mit den Notifications definiert man ob man in Erfolgs- und/oder
Fehlerfalle benachrichtigt werden will. Mögliche Optionen sind "S" für
Erfolg (Success) und/oder "F" für den Fehlerfall (Failure). Mit "M"
werden die *raspiBackup* Meldungen als Datei geschickt.. Es können die
Optionen beliebig kombiniert werden. Beispiel: "SF" oder "SM".</p>
<p>Die Prioritäten entsprechen den verfügbaren Pushover Prioritäten.</p>
<p>Die Klänge entsprechen den verfügbaren Pushoverklängen.</p></td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;">Details siehe <a
href="https://www.linux-tips-and-tricks.de/de/raspibackup#stats">hier</a></td>
<td style="text-align: center;">ja</td>
<td style="text-align: center;"><span
style="color: #ff0000;">nein</span></td>
</tr>
<tr class="odd">
<td style="text-align: center;"> </td>
<td style="text-align: center;"><p>Ab Version 0.6.8 können
Benachrichtigungen per Slack geschickt werden.</p>
<p>Mit den Notifications definiert man ob man in Erfolgs- und/oder
Fehlerfalle benachrichtigt werden will. Mögliche Optionen sind "S" für
Erfolg (Success) und/oder "F" für den Fehlerfall (Failure). Mit "M"
werden die *raspiBackup* Meldungen als Datei geschickt. Es können die
Optionen beliebig kombiniert werden. Beispiel: "SF" oder "SM".</p></td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"> <span
style="color: #ff0000;">nein</span></td>
</tr>
</tbody>
</table>

 

**Hinweis:** Optionen in der Konfigdatei, die ja oder nein als Parameter
benötigen müssen 0 für nein und 1 für ja sein.

<div align="left">

Die Optionen für den Restore eines Backups sind [auf dieser
Seite](https://www.linux-tips-and-tricks.de/de/13-raspberry/240-restore-eines-mit-raspibackup-sh-erstellten-backups)
beschrieben.

