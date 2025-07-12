# Aufrufsyntax und -optionen für ein Backup

*raspiBackup* muss als Benutzer *root* oder per `sudo` aufgerufen werden.

    raspiBackup Option1 Option2 Option3 ... Backupverzeichnis

**Hinweis**: Die Optionen für den **Restore** eines Backups sind [auf dieser Seite](full-restore.md) beschrieben.

Alle Optionen, die etwas ein- oder ausschalten, können durch
ein angehängtes `+` oder `-` beim Aufruf von raspiBackup gezielt ein oder ausgeschaltet werden.

Beispiel: Die Option `-z` sowie die Option `-z+` schaltet die Backupcompression ein.
Mit der Option `-z-` wird dagegen die Backupcompression ausgeschaltet. Unabhängig davon,
was in der Konfigurationsdatei in dem Parameter `DEFAULT_ZIP_BACKUP` steht. Damit kann eine
Option in der Befehlszeile ausgeschaltet werden, obwohl sie in der
Konfigurationsdatei eingeschaltet ist.

## Konfigurationsdatei(en)

<a name="configfiles"></a>
Neben `/usr/local/etc/raspiBackup.conf` gibt es weitere Konfigurationsdateien,
die, sofern vorhanden, gelesen werden.

Die Priorität der Optionsquellen ist aus folgender Tabelle ersichtlich:

| Priorität | Quelle |
|-----------|--------|
| 1         | Aufrufoptionen |
| 2         | -f <configFile> |
| 3         | $(pwd)/.raspiBackup.conf |
| 4         | ~/.raspiBackup.conf |
| 5         | /usr/local/etc/raspiBackup.conf |


**Hinweis:** Optionen in der Konfigdatei, die ja/an oder nein/aus als Parameter
benötigen, müssen 0 für nein und 1 für ja sein.
Kein Eintrag in der Standardspalte bedeutet der Standard ist `""`

------------------------------------------------------------------------

## Alphabetische Sortierung der Optionen

<!-- toc -->

<div class="table-wrapper-for-options">

<a name="parm_coloring"></a>
### --coloring: Kolorierungseinstellungen bei eMails und Konsolmeldungen

Ab der Version 0.6.5 können die Meldungen in der eMail sowie auf der Konsole
koloriert werden. Mögliche Werte sind `C` für Konsole und/oder `M` für eMail.
Falls postfix als emailClient genutzt wird siehe auch Option --eMailColoring.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --coloring | automatisch |  | DEFAULT_COLORING |


<a name="parm_dynamicMount"></a>
### --dynamicMount: Dynamisches Mounten der Backuppartition

Ab Version 0.6.6 wird damit vor dem Backup die angegebene Partition bzw. der
Mointpoint gemounted und am Ende wieder umounted. Falls sie schon gemounted ist
wird am Ende die Partition nicht umounted. Der Mountpoint muss in /etc/fstab
definiert sein und kann dann entweder der Mountpoint selbst sein (z.B. /backup)
oder die Backuppartition (z.B. /dev/sdb1).

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --dynamicMount | aus |  | DEFAULT_DYNAMIC_MOUNT |


<a name="parm_eMailColoring"></a>
### --eMailColoring: Steuerung wo der genutzte eMailClient Colorierungnsinformationen akzeptiert

Standardmaessig wird das eMailColoring über die Subject Zeile gesteuert, da
dieser Weg von den meisten eMail Clients genutzt wird. Wenn man aber postfix
als eMail Client benutzt, muss man OPTION als Parameter mitgeben, da postfix das
Coloring mit einer separaten Option steuert.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --eMailColoring | SUBJECT |  | DEFAULT_EMAIL_COLORING |


<a name="parm_ignoreAdditionalPartitions"></a>
### --ignoreAdditionalPartitions: Es werden mehr als zwei Partitionen toleriert wobei aber nur die ersten beiden Partitionen gesichert werden.

Mit dieser Option sind Systeme mit mehr als
zwei Partitionen unterstützt im normalen Backupmodus wenn tar oder rsync Backup genutzt
wird. Allerdings werden nur die ersten beiden Paritionen, /boot und / gesichert
und wiederhergestellt. **Achtung**: Alle anderen Partitionen werden ignoriert.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --ignoreAdditionalPartitions | nein |  | DEFAULT_IGNORE_ADDITIONAL_PARTITIONS |


<a name="parm_ignoreMissingPartitions"></a>
### --ignoreMissingPartitions: 

Es wird im partitionsorientierten Backupmodus geprüft, ob alle Partitionen,
die im letzten Backup
gesichert wurden, auch wieder gesichert werden. Mit dieser Option wird der Test
ausgeschaltet.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --ignoreMissingPartitions | nein |  | DEFAULT_IGNORE_MISSING_PARTITIONS |


<a name="parm_keepType"></a>
### --keep_{type}: 

Anzahl der Backups, die für den jeweiligen Backuptypen vorgehalten werden.

{type} kann jeder Backuptyp sein, also dd, ddz, tar, tgz oder rsync

Hinweis: Diese Optionen sind wirkungslos, wenn die intelligente Rotationsstrategie benutzt wird.

Technischer Hinweis: Dieser Parameter wird i.d.R. manuell nacheditiert, um die einzelnen Optionen zeilenweise zu zeigen.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --keep_dd    | Parameter für Option -k | konfigurierbar | DEFAULT_KEEPBACKUPS_DD |
| --keep_ddz   | Parameter für Option -k | konfigurierbar | DEFAULT_KEEPBACKUPS_DDZ |
| --keep_rsync | Parameter für Option -k | konfigurierbar | DEFAULT_KEEPBACKUPS_RSYNC |
| --keep_tar   | Parameter für Option -k | konfigurierbar | DEFAULT_KEEPBACKUPS_TAR |
| --keep_tgz   | Parameter für Option -k | konfigurierbar | DEFAULT_KEEPBACKUPS_TGZ |


<a name="parm_notifyStart"></a>
### --notifyStart: 

Mit dieser Option wird eingeschalten, dass eine
eMail oder eine Telegram Benachrichtigung gesendet wird, wenn der Backup startet.
Normalerweise wird nur am Ende des Backups eine Benachrichtigung geschickt.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --notifyStart | nein |  | DEFAULT_NOTIFY_START |


<a name="parm_rebootSystem"></a>
### --rebootSystem: 

Duch diese Option eine Reboot des Systems am Ende des
Backuplaufes vorgenommen und somit werden alle Services wieder gestartet.
Deshalb werden Argumente der Option -a auch ignoriert.

**Hinweis**: Wird die Option -F benutzt, wird kein reboot durchgeführt.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --rebootSystem | aus |  | DEFAULT_REBOOT_SYSTEM |


<a name="parm_resizeRootFS"></a>
### --resizeRootFS: 

Mit dieser Option wird definiert, ob beim Restore die letzte Partition
verkleinert wird, um auf ein kleineres Device zu restoren oder vergrößert, um den
ganzen verfügbaren Platz des Devices zu nutzen. Ist das Device kleiner, muss es
aber noch gross genug sein, um die ganzen Daten des Backups aunehmen zu können.
Ansonsten bricht der Restore irgendwann ab.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --resizeRootFS | an |  | DEFAULT_RESIZE_ROOTFS |


<a name="parm_smartRecycle"></a>
### --smartRecycle: 

Diese Option schaltet die [intelligente Rotationsstrategie - Smart Recycle](smart-recycle.md) ein.
Damit werden auch die --keep Optionen ignoriert und müssen nicht auf 0 gesetzt werden.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --smartRecycle | aus | konfigurierbar | DEFAULT_SMART_RECYCLE |


<a name="parm_smartRecycleDryrun"></a>
### --smartRecycleDryrun: 

Diese Option schaltet den Testmodus der [intelligenten
Rotationsstrategie - Smart Recycle](smart-recycle.md) ein.


| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --smartRecycleDryrun | ja |  | DEFAULT_SMART_RECYCLE_DRYRUN |


<a name="parm_smartRecycleOptions"></a>
### --smartRecycleOptions: 

Diese Option definiert Parameter der [intelligenten Rotationsstrategie - Smart Recycle](smart-recycle.md).

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --smartRecycleOptions | "7 4 12 1" | konfigurierbar | DEFAULT_SMART_RECYCLE_OPTIONS |


<a name="parm_systemstatus"></a>
### --systemstatus: 

Es wird eine Liste der aktiven Services und offenen Dateien
in der Debugdatei erstellt

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --systemstatus | aus |  |  |


<a name="parm_telegram"></a>
### --telegramChatID: Benachrichtigungen werden per Telegram verschickt

Benachrichtigungen können per Telegram verschickt werden.
Dazu sind folgende Konfigurationen notwendig:

Das Telegramtoken sowie die ChatID. Mit den Notifications definiert man ob man
in Erfolgs- und/oder Fehlerfalle benachrichtigt werden will. Mögliche Optionen
sind "S" für Erfolg (Success) und/oder "F" für den Fehlerfall (Failure). Mit
"M" werden die *raspiBackup* Meldungen als Datei geschickt.. Mit "m" werden die
*raspiBackup* Meldungen mitgeschickt. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SFm" oder "Sm". Die Optionen "m" und "M" können nicht
zusammen angegeben werden.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --telegramChatID | None |  | DEFAULT_TELEGRAM_CHATID |


<a name="parm_telegram"></a>
### --telegramNotifications: Benachrichtigungen werden per Telegram verschickt

Benachrichtigungen können per Telegram verschickt werden.
Dazu sind folgende Konfigurationen notwendig:

Das Telegramtoken sowie die ChatID. Mit den Notifications definiert man ob man
in Erfolgs- und/oder Fehlerfalle benachrichtigt werden will. Mögliche Optionen
sind "S" für Erfolg (Success) und/oder "F" für den Fehlerfall (Failure). Mit
"M" werden die *raspiBackup* Meldungen als Datei geschickt.. Mit "m" werden die
*raspiBackup* Meldungen mitgeschickt. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SFm" oder "Sm". Die Optionen "m" und "M" können nicht
zusammen angegeben werden.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --telegramNotifications | F |  | DEFAULT_TELEGRAM_NOTIFICATIONS |


<a name="parm_telegram"></a>
### --telegramToken: Benachrichtigungen werden per Telegram verschickt

Benachrichtigungen können per Telegram verschickt werden.
Dazu sind folgende Konfigurationen notwendig:

Das Telegramtoken sowie die ChatID. Mit den Notifications definiert man ob man
in Erfolgs- und/oder Fehlerfalle benachrichtigt werden will. Mögliche Optionen
sind "S" für Erfolg (Success) und/oder "F" für den Fehlerfall (Failure). Mit
"M" werden die *raspiBackup* Meldungen als Datei geschickt.. Mit "m" werden die
*raspiBackup* Meldungen mitgeschickt. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SFm" oder "Sm". Die Optionen "m" und "M" können nicht
zusammen angegeben werden.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --telegramToken | None |  | DEFAULT_TELEGRAM_TOKEN |


<a name="parm_timestamps"></a>
### --timestamps: Alle Meldungen werden mit einem führenden Zeitstempel ausgegeben

Durch diese Option wird vor jeder Meldung ein Zeitstempel ausgegeben.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --timestamps | aus |  | DEFAULT_TIMESTAMPS |


<a name="parm_unsupportedEnvironment"></a>
### --unsupportedEnvironment: 

Wird *raspiBackup* auf nicht [unterstützten Umgebungen](supported-hardware-and-software.md)
gestartet muss diese Option angegeben werden.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --unsupportedEnvironment | aus |  |  |


<a name="parm_version"></a>
### --version: 

Die Version von *raspiBackup* wird im folgenden Format ausgegeben:

```
Version: 0.6.3.2 CommitSHA: 8fbcd1a CommitDate: 2018-02-19 CommitTime: 19:18:31#
```

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| --version | aus |  |  |


<a name="parm_A"></a>
### -A: Das Laufzeitlog wird bei der eMail Benachrichtigung mitgeschickt

Das Laufzeitlog wird bei der eMail Benachrichtigung mitgeschickt.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -A | aus |  | DEFAULT_APPEND_LOG |


<a name="parm_B"></a>
### -B: Bootpartition wird als tar gesichert statt per dd

Die Bootpartition wird nicht per dd sondern per tar gesichert.

Hinweis: Diese Option hat keine Funktion wenn der partitionsorientierte Modus
benutzt wird, also Option -P benutzt wird oder DEFAULT_PARTITIONBASED_BACKUP=1
in der Konfiguration gesetzt ist.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -B | aus |  | DEFAULT_TAR_BOOT_PARTITION_ENABLED |


<a name="parm_D"></a>
### -D: Weitere Optionen für den dd Backup

Weitere Aufrufoptionen für das dd Backup (z.B. "conv=notrunc,noerror,sync")

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -D | automatisch |  | DEFAULT_DD_PARMS |


<a name="parm_E"></a>
### -E: Optionale Parameter für die eMailClientProgramme

Optionale weitere Parameter, die im eMailProgrammaufruf mitgegeben werden. Für
sendEmail muss er z.B. wie folgt aussehen: "-f absender.mail@absenderdomain -s
smtp-server:587 -xu Username -xp Password".

**Achtung**: Die Parameter für -E müssen in Anführungszeichen " eingeschlossen
sein. Speziell zum Testen der eMail Benachrichtigungsfunktion ist der Parameter
-F hilfreich.

**Achtung**: Wenn der Parameter -l 1 benutzt wird, steht das Password im Log und
sollte vor Verschicken des Logs manuell maskiert werden.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -E | keine |  | DEFAULT_EMAIL_PARMS |


<a name="parm_F"></a>
### -F: Simuliert den Backuplauf und hilft die eMailBenachrichtgung schnell zu testen

Fake backup. Diese Option ist hilfreich beim initialen Testen von *raspiBackup*.
Der eigentliche lange Backup wird dadurch nicht angestossen - aber sämtliche
Optionsprüfungen wie auch das Senden der BenachrichtigungseMail.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -F | None |  | None |


<a name="parm_G"></a>
### -G: Sprache der Meldungen (Deutsch oder English)

Festlegung der Sprache der Meldungen. Mögliche Sprachen sind DE (Deutsch) und
EN (English). Interessenten, die die Meldungen in andere Sprachen übersetzen
wollen können sich gerne melden

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -G | Systemsprache oder EN | konfigurierbar | DEFAULT_LANGUAGE |


<a name="parm_L"></a>
### -L: Verzeichnis wo das Debuglog sowie die Laufzeitmeldungen gespeichert werden

Definiert das Ziel der Logdatei `raspiBackup.log`.

- varlog: Die Logdatei wird in /var/log geschrieben
- backup: Die Logdatei wird in das erzeugte Backup geschrieben
- current: Die Logdatei wird in das aktuelle Verzeichnis geschrieben.

<Dateinamenprefix>:  Das Debuglog wird dort mit der Extension `.log` und die
Messagedatei mit der Extension `.msg` abgelegt.

Beispiel: `/home/pi/raspiBackup`

Am Ende existiert `/home/pi/raspiBackup.log` sowie `/home/pi/raspiBackup.msg`

Im Backupverzeichnis werden keine Logs abgelegt.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -L | backup |  | DEFAULT_LOG_OUTPUT |


<a name="parm_M"></a>
### -M: Erstellen eines *raspiBackup* Snapshots

Mit der Option wird ein *raspiBackup* Snapshot erstellt, welcher nicht im
Backuprecycleprozess berücksichtigt wird und somit nicht gelöscht wird. Der
Snapshot erhält am Ende des Verzeichnisnamens den angegebenen Text. Siehe auch
[diese Seite zu Snapshots](snapshots.md).

Beispiel: Der Hostname ist "idefix" und der Parameter für -M ist "Initial boot
from SD". Dann wird folgendes Verzeichnis angelegt:

```
idefix/idefix-rsync-backup-20170103-170717_idefix-Initial_boot_from_SD
```

**Hinweis**: *raspiBackup* Snapshots sind normale Backups und keine "richtigen"
Snapshots wie die bei LVM oder btrfs. Es werden aber beim rsync Backup Hardlinks
genutzti um die Snapshotzeit zu reduzieren.

**Hinweis**: Da dieses Verzeichnis nicht im Backuprecycleprozess berücksichtigt wird,
muss es bei Bedarf manuell gelöscht werden.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -M | keiner |  |  |


<a name="parm_N"></a>
### -N: Erweiterungen, die vor und nach dem Backup aufgerufen werden sollen

Aktivierung von eigenen Scripterweiterungen (Plugins). Siehe dazu [diese Seite](hooks-for-own-scripts.md),
die auch zwei Beispielerweiterungen anbietet, die die CPU Temperatur und die
Speicherbelegung vor und nach dem Backuplauf ausgeben.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -N | keine |  | DEFAULT_EXTENSIONS |


<a name="parm_P"></a>
### -P: Partitionsorientierter Backupmodus

Partitionsorientierter Modus. Damit wird im Gegensatz zum normalen Modus, wo nur
die ersten beiden Partitionen gesichert werden, eine beliebige Anzahl von
Partitionen gesichert. Mit der Option -T wird definiert, welche Partitionen zu
sichern sind.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -P | aus | konfigurierbar | DEFAULT_PARTITIONBASED_BACKUP |


<a name="parm_S"></a>
### -S: 

Ein Update mit der Option -U wird auch vorgenommen, wenn die Versionen
übereinstimmen. Sie bewirkt, dass sowohl eine lokale Betaversion wie auch eine
lokale normale Version mit dem aktuellsten Codestand ersetzt wird. Primär ist
sie dafür gedacht, den Codestand einer existierenden lokalen Betaversion zu
aktualisieren.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -S | aus |  |  |


<a name="parm_T"></a>
### -T: Angabe der Partitionen die beim partitionsorientierten Backup gesichert werden sollen

Falls der partitionsorientierte Backupmodus mit der Option -P gewählt wurde,
kann mit dieser Option definiert werden, welche Partitionen gesichert werden
sollen. Beispiel: -T "1 2 5" sichert die ersten beiden und die fünfte
Partition. Mit * werden alle Partitionen gesichert.

**Historisch**:
- Bis Release 0.6.5.1: [*]
- Bis Release 0.7.0: DEFAULT_PARTITIONS_TO_BACKUP

[.status]: todo "Check 'historisch'"

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -T | "1 2" | konfigurierbar | DEFAULT_PARTITIONS_TO_RESTORE |


<a name="parm_U"></a>
### -U: Update von *raspiBackup* mit der aktuellsten Version und Sicherung der alten Version

Die lokale *raspiBackup* Version wird durch die letzte aktuelle Version ersetzt
sofern eine neue Version existiert. Die vorherige Version wird als
raspiBackup.sh.n.m gesichert wobei n und m die Versionsnumer von *raspiBackup*
ist. Siehe Parameter -V, um eine vorhergehende Version wiederherzustellen.

**Achtung**: Vorher sollte man [diese Seite](version-history.md) lesen
und sich über die Änderungen und Neuerungen informieren.

Zusätzlich gibt es noch die option -S, mit der Betaversionen auf den letzten
Stand gebracht werden können.

Mit der Option -V kann auf eine ältere Version zurückgegangen werden.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -U | aus |  |  |


<a name="parm_V"></a>
### -V: Reaktivierung einer vorhergehenden *raspiBackup* Version

Es wird eine Liste aller existierenden Vorgängerversionen angezeigt und man
kann die Version auswählen, die wiederhergestellt werden soll. Die aktuelle
Version wird gesichert und kann dann auch mit dieser Option später
wiederhergestellt werden (Siehe auch -U Parameter)

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -V | None |  | None |


<a name="parm_a"></a>
### -a: Befehle, die Services nach dem Backup starten

Befehle, um Services nach dem Backup wieder zu starten. Z.B. bei Samba "service
smbd start" (Achtung: Anführungszeichen an Anfang und Ende). Diese Option ist
zusammen mit der Option -o obligatorisch.

Mehrere Befehle müssen durch && getrennt werden. Alternativ kann ein
Wrapperscript benutzt werden (Beispiel siehe [unten](#wrapper)). Diese Befehle sollten die
exakte umgekehrte Reihenfolge haben wie die Befehle beim Parameter -o.

**Beispiel**:

```
-a "service nfs-kernel-server start && service samba"
```

Soll wirklich **kein** Service gestartet werden, muss ein Doppelpunkt ":" als Argument mitgegeben werden.

Siehe dazu auch [FAQ1](faq.md#faq1) und [FAQ18](faq.md#faq18)

**Achtung**: Die Befehle werden als root ausgeführt. Es ist kein sudo notwendig.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -a | keine | konfigurierbar | DEFAULT_STARTSERVICES |


<a name="parm_b"></a>
### -b: Definition der Blocksize die beim dd Backup genutzt wird

Blocksize, die beim dd Backup benutzt wird

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -b | 1 MB |  | DEFAULT_DD_BLOCKSIZE |


<a name="parm_c"></a>
### -c: 

Es kann kein Backup auf der Rootpartition erstellt werden, um vor
unbeabsichtigtem Vollschreiben der Rootpartition durch das Backup zu schützen.

Mit dieser Option wird der Test ausgeschaltet und es kann ein Backup auf der
Rootpartition erstellt werden. **ACHTUNG**: Es wird nicht geprüft, ob das Backup
noch auf die Rootparition passt.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -c | aus |  | DEFAULT_SKIPLOCALCHECK |


<a name="parm_e"></a>
### -e: eMailAdresse an die die Benachrichtigung geschickt wird

email Addresse, die eine Status-email sowie die Meldungen des Backuplaufs
zugesendet bekommt

**Achtung**: Die Benachrichtigungsemail wird vom root Nutzer gesendet.
D.h. der eMailClient auf dem System muss so konfiguriert werden, dass mit

```
echo "eMail-Text" | sudo mail -s "Betreff" "Empfänger eMail"
```

die eMail erfolgreich gesendet wird.

Mit der Konfigurationsoption DEFAULT_SENDER_EMAIL kann die
Standardsenderadresse  root@$(hostname) falls notwendig geändert werden.

Hinweis: Die eMail Benachrichtigung funktioniert nur wenn ein MTA wie z.B.
nullmailer, msmtp, postfix oder exim4 entsprechend korrekt konfiguriert wurde.
Siehe dazu FAQ47. Die eMailfunktion kann relativ einfach mit der Fakeoption -F
getestet werden. Außerdem sind weitere Benachrichtigungsmöglichkeiten wie
Pushover, Slack oder Telegram unterstützt.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -e | keine | konfigurierbar | DEFAULT_EMAIL |


<a name="parm_f"></a>
### -f: Angabe einer Konfigurationsdatei

Angabe einer Konfigurationsdatei, die als letztes eingelesen wird. Siehe [oben](#configfiles).
alle möglichen Konfigurationsdateien und ihre Einlesereihenfolge.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -f | None |  | None |


<a name="parm_g"></a>
### -g: Fortschrittsanzeige beim Restore

Mit dieser Option wird beim Backup und Restore eine Fortschrittsanzeige
angezeigt. Beim tar Backup steht keine  Fortschrittssanzeige zur Verfügung.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -g | None |  | None |


<a name="parm_h"></a>
### -h: 

Ausgabe der Aufrufsyntax mit seinen Parametern

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -h | None |  | None |


<a name="parm_k"></a>
### -k: Anzahl der Backups die vorgehalten werden sollen

Anzahl der Backups, die pro Backuptyp vorzuhalten sind, sofern es nicht durch
folgende Option überschrieben wird. D.h., es werden 3 dd, 3 tar und 3 rsync
Backups vorgehalten.

Hinweis: Diese Option ist wirkungslos, wenn die intelligente Rotationsstrategie benutzt wird.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -k | 3 | konfigurierbar | DEFAULT_KEEPBACKUPS |


<a name="parm_l"></a>
### -l: Einschalten des detailierten Loglevels

Log level definiert ob ein Debuglog erstellt wird:

- off  -> Es wird kein Debuglog erstellt
- debug -> Es wird ein Debuglog erstellt

**Achtung**: Die Logausgabe kann sensitive Informationen
enthalten. raspiBackup maskiert Z.B. externe statische IP Adressen, eMailAdressen, Kennwörter für
mount Befehle oder email Server,u.V.M. Es  können aber immer noch sensitive Informationen
im Debuglog enthalten sein die inoch manuell maskiert werden sollten.
Das Debuglog wird immer im Backupverzeichnis abgelegt. Falls es Fehler gibt und das Backupverzeichnis
wieder gelöscht werden wird, wird das Log vorher in das Homeverzeichnis des
Aufrufers gesichert.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -l | on |  | DEFAULT_LOG_LEVEL |


<a name="parm_m"></a>
### -m: Meldungsdetails

Meldungsdetails

- minimal -> Nur wichtige Meldungen werden ausgegeben
- detailed -> Viele Meldungen über den Fortschrit werden ausgegeben

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -m | minimal | konfigurierbar | DEFAULT_MSG_LEVEL |


<a name="parm_o"></a>
### -o: Befehle, die Services vor dem Backup stoppen

Befehle, um Services vor dem Backup zu stoppen, damit kein inkonsistentes Backup
erzeugt wird. Z.B. bei Samba "service smbd stop" (Achtung: Anführungszeichen an
Anfang und Ende). Diese Option ist zusammen mit der Option -a obligatorisch.

Mehrere Befehle müssen durch `&&` getrennt werden. Alternativ kann ein
Wrapperscript benutzt werden (Beispiel siehe [unten](#wrapper)). Diese Befehle sollten die
exakte umgekehrte Reihenfolge haben wie die Befehle beim Parameter -a.

Beispiel:

```
-o "service samba stop && service nfs-kernel-server stop"
```

Soll wirklich **kein** Service gestoppt werden, muss der Doppelpunkt ":" als Argument mitgegeben werden.

Siehe dazu auch [FAQ1](faq.md#faq1) und [FAQ18](faq.md#faq18)

**Achtung**: Die Befehle werden als root ausgeführt. Es ist kein sudo notwendig.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -o | keine | konfigurierbar | DEFAULT_STOPSERVICES |


<a name="parm_s"></a>
### -s: eMailClientProgramm welches benutzt wird um die eMail zu verschicken

email Program, welches benutzt wird {mail|sendEmail|ssmtp|msmtp}. Für postfix
und nullmailer muss mail benutzt werden und die mailtools installiert werden.
Für sendEmail muss der Parameter -E zusätzlich genutzt werden für weitere
obligatorische Parameter (Siehe [Parameter -E Beschreibung](#parm_E) für Details).

Es kann auch ein eMailPlugin benutzt werden, um eMails zu verschicken. Damit
können beliebige weitere eMailClients in *raspiBackup* eingebunden werden. Der -s
Parameter muss dann mailext sein. Details zum eMailPlugin siehe [diese Seite](hooks-for-own-scripts.md).

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -s | mail |  | DEFAULT_MAIL_PROGRAM |


<a name="parm_t"></a>
### -t: Typ des Backups (dd, tar, rsync)

Typ des Backups, der entweder dd, tar oder rsync sein kann. rsync benutzt bei
einer ext3/ext4 Partition Hardlinks, um den benötigten Speicherplatz zu
minimieren.

[Detailinformationen zu den Backuptypen](#TODO#vornach) Ein externes Rootfilesystem wird
automatisch bei tar oder rsync Backup mitgesichert sofern nicht die Option -P
benutzt wird. Mit der Option -z werden die dd und tar Backups zusätzlich noch gezippt bzw
verkleinert.

**Hinweis**: Beim dd Backup kann durch den Konfigurationsparameter
DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY Backup-zeit und -platz gespart
werden. Details zu dem Parameter siehe am Ende der Tabelle.

Siehe dazu auch [FAQ16](faq.md#faq16).

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -t | rsync | konfigurierbar | DEFAULT_BACKUPTYPE |


<a name="parm_u"></a>
### -u: Ermöglicht weitere Verzeichnisse aus dem Backuprozess auszuschliessen

Erweiterung der Excludeliste beim Backup um bestimmte Verzeichnisse beim Backup
zu ignorieren.

**Achtung**: Die Parameter müssen der jeweiligen Syntax des Backuptools
gehorchen und führen sonst zum Abbruch des Backups. Für rsync oder tar könnte
die Liste wie folgt aussehen:

```
"--exclude=/backup/* --exclude=/rsnapshot/* --exclude=/www-data*/* --exclude=/home/pi/.local/share/Trash"
```

Die Anfuehrungszeichen sind wichtig! Weitere Informationen zu der Syntax finden
sich auf der man Page der jeweiligen Backuptools.

Folgende Verzeichnisse werden niemals gesichert:

- Der Backupfad, der im Aufruf angegeben wurde
- /proc/*
- /lost+found/*
- /sys/*
- /dev/*
- /tmp/*
- /boot/*
- /run/*
- /proc/*
- /lost+found/*
- /sys/*
- /dev/*
- /tmp/*
- /boot/*
- /run/*

Ausserdem werden alle gemounteten Verzeichnisse von externen Geräten, die nicht
auf / gemounted sind, nicht gesichert. Es wird nur die Boot Partition
/dev/mmcblk0p1 und die Root Partition /dev/mmcblk0p2 bzw. das ausgelagerte
Rootverzeichnis auf z.B. /dev/sda1 gesichert.

**Hinweis für den partitionsorientierten Mode**:
Wenn die Option -P benutzt wird, werden in allen Partitionsbackups die o.g. Verzeichnisse ausgenommen.

**rsync**:

- */verzeichnis/* - Excluded verzeichnis auf allen Partitionen
- mmcblk0p2/verzeichnis/* - Excluded verzeichnis auf Partition mmcblk0p2

**tar**:

- verzeichnis/* - Excluded Verzeichnis auf allen Partitionen

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -u | keine |  | DEFAULT_EXCLUDE_LIST |


<a name="parm_v"></a>
### -v: Alle Meldungen des verwendeten Backuptools werden protokolliert

Die verwendeten Backuptools tar und rsync zeigen detailierte Informationen an
(Verbose mode). Die Option ist besonders nützliche bei initialen manuellen
Backuptests, um den Backupfortschritt verfolgen zu können.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -v | aus |  | DEFAULT_VERBOSE |


<a name="parm_y"></a>
### -y: Kopie der aktuellen *raspiBackup* Version auf vordefinierte lokale Hosts per scp

Mit dieser Option wird das aktuelle Script auf alle Hosts kopiert, die in der
Konfigurationsdatei definiert sind. Der Zugriff muss per authorized_keys ohne
Kennwort möglich sein. Somit lässt sich *raspiBackup* schnell auf einer größeren
Menge von Hosts nach einem Versionsupdate verteilen.

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -y | None |  | DEFAULT_DEPLOYMENT_HOSTS |


<a name="parm_z"></a>
### -z: Kompression des Backups bei dd oder tar

Backup verkleinern mit gzip bei dd oder tar Backup

| Optionsname | Standard | Im Installer | Konfigurationsname |
|-------------|----------|--------------|--------------------|
| -z | aus | konfigurierbar | DEFAULT_ZIP_BACKUP |


</div>


[.status]: review-needed
[.status]: todo "Add missing short description in some titles"

[.source]: https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen
[.source]: https://www.linux-tips-and-tricks.de/en/invocation-and-options
