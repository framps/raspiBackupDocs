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

------------------------------------------------------------------------



## Thematische Sortierung der Optionen (Auswahl)

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
  - [-D: Weitere Optionen für den dd Backup](#parm_D)
  - [--dynamicMount: Dynamisches Mounten der Backuppartition](#parm_dynamicMount)
  - [--ignoreAdditionalPartitions: Es werden mehr als zwei Partitionen toleriert wobei aber nur die ersten beiden Partitionen gesichert werden.](#parm_ignoreAdditionalPartitions)

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
  - [--eMailColoring: Steuerung wo der genutzte eMailClient Colorierungnsinformationen akzeptiert](#parm_eMailColoring)

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




## Alphabetische Sortierung der Optionen

<!-- toc -->

<br><br>

{{ #include usage-and-options.inc }}
<br><br>

----------

<a name="parm_k"></a>
### -k: Anzahl der vorzuhaltenden Backups

Anzahl der Backups, die pro Backuptyp vorzuhalten sind, sofern es nicht durch
folgende Option überschrieben wird. D.h., es werden 3 dd, 3 tar und 3 rsync
Backups vorgehalten.

Hinweis:Diese Option ist wirkungslos, wenn die intelligente Rotationsstrategie benutzt wird.

⇌ DEFAULT_KEEPBACKUPS [3] [im Installer setzbar]




<a name="parm_keepType"></a>
### --keep_dd: Anzahl der Backups für Backuptyp dd
### --keep_ddz: Anzahl der Backups für Backuptyp ddz
### --keep_rsync: Anzahl der Backups für Backuptyp rsync
### --keep_tar: Anzahl der Backups für Backuptyp tar
### --keep_tgz: Anzahl der Backups für Backuptyp tgz

Anzahl der Backups, die für den jeweiligen Backuptypen vorgehalten werden.

Hinweis:Diese Optionen sind wirkungslos, wenn die intelligente Rotationsstrategie benutzt wird.

⇌ DEFAULT_KEEPBACKUPS_{DD|DDZ|TAR|TGZ|RSYNC} [Parameter für Option -k] []


<a name="parm_l"></a>
### -l: Log level

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

⇌ DEFAULT_LOG_LEVEL [on] []



----

## Weitere Optionen (nur in der Konfigurationsdatei)

### DEFAULT_BEFORE_STOPSERVICES / DEFAULT_AFTER_STARTSERVICES

Ab Version 0.6.4.3: Die hier definierten Befehle werden vor bzw nach dem Backup
vor bzw nach dem Stoppen von Systemservices (Option -a und -o) ausgeführt.



### DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY

dd Backups sichern nur den von definierten Partitionen belegten Platz. Dadurch
benötigt eine 32GB SD Karte, die nur eine 8GB Partition definiert hat, für den
Backup nur 8GB und nicht 32GB. Dazu muss aber vermittels gparted oder resize2fs
die root Partition entsprechend verkleinert werden, denn üblicherweise füllt
die root Partition den gesamten Rest der SD Karte aus.

Siehe dazu auch [FAQ16](faq.md#faq16).



### DEFAULT_RSYNC_BACKUP_OPTIONS [--delete -aHAx]

Backupoptionen, die beim rsync Backup genutzt werden.

**Benutzung auf eigene Gefahr!**



### DEFAULT_RSYNC_BACKUP_ADDITIONAL_OPTIONS

Backupoptionen, die beim rsync Backup zusätzlich genutzt werden.

**Benutzung auf eigene Gefahr!**



### DEFAULT_TAR_BACKUP_ADDITIONAL_OPTIONS

Backupoptionen, die beim tar Backup zusätzlich genutzt werden.

**Benutzung auf eigene Gefahr!**



### DEFAULT_TAR_BACKUP_OPTIONS [-cpi]

Backupoptionen, die beim tar Backup genutzt werden.

**Benutzung auf eigene Gefahr!**



### DEFAULT_MAIL_ON_ERROR_ONLY

Nur im Fehlerfalle wird eine eMailbenachrichtigung gesendet. Hinweis: Sollte
*raspiBackup* wegen aussergewöhnlicher Umstände abstürzen, kann es durchaus sein,
dass keine eMail gesendet wird.



### DEFAULT_SENDER_EMAIL [root@$(hostname)]

Die eMailAdresse des Versenders kann bei ssmtp und msmtp angegeben werden.



### DEFAULT_RESTORE_REMINDER_INTERVAL [6]

Backup Restore Test Reminder Intervall (Einheit: Monate)



### DEFAULT_RESTORE_REMINDER_REPEAT [3]

Anzahl der Erinnerungen, einen Backup Restore Test durchzuführen.



### DEFAULT_SEND_STATS [ja]

Ab Version 0.6.6.1 vom 13.2.2022: Es werden beim Versionscheck ein paar *raspiBackup*
Optionen übermittelt, die für [Statistikzwecke](statistics.md) genutzt werden.



### DEFAULT_RESTORE_EXTENSIONS

Ab Version 0.6.7 gibt es auch für den Restore wie beim Backup die Möglichkeit,
auch pre und post Exits zu konfigurieren, um vor und nach dem Restore noch
irgendwelche Aktionen vorzunehmen. Die Syntax ist genauso wie für die Backup
Extensions.



### DEFAULT_COLOR_CODES [("#FF8000 33" "#FF0000 31")]

Ab Version 0.6.7 können die html und VT100 Colorcodes definiert werden. Default
ist gelb für Warnungen und Rot für Fehler. Das erste Pärchen der Definition legt
die Codes für Warnung das zweite Pärchen die Definition für Fehler fest. Dabei
ist die erste Definition der HTML Colorocde und die zweite Definition der VT100
Colorcode.



### DEFAULT_LINK_BOOTPARTITIONFILES

Sich selten ändernde Bootparition Backups werden mit Hardlinks verknüpft, um
Backupspace zu sparen. Voraussetzung: Der Backupspace unterstützt Hardlinks
(ext3/ext4 Filesystem).



### DEFAULT_PUSHOVER_*

Ab Version 0.6.8 können Benachrichtigungen per Pushover geschickt werden. Dazu
ist es notwendig, sich auf <https://pushover.net/> registriert zu haben und eine
application eingerichtet haben muss.

Der PUSHOVER_USER ist der Pushover User Key.

Der PUSHOVER_TOKEN ist der API Token Key den man für eine Application definiert
hat.

Mit den Notifications definiert man ob man in Erfolgs- und/oder Fehlerfalle
benachrichtigt werden will. Mögliche Optionen sind "S" für Erfolg (Success)
und/oder "F" für den Fehlerfall (Failure). Mit "M" werden die raspiBackup
Meldungen als Datei geschickt.. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SF" oder "SM".

Die Prioritäten entsprechen den verfügbaren Pushover Prioritäten.

Die Klänge entsprechen den verfügbaren Pushoverklängen.

  - DEFAULT_PUSHOVER_TOKEN
  - DEFAULT_PUSHOVER_USER
  - DEFAULT_PUSHOVER_NOTIFICATIONS
  - DEFAULT_PUSHOVER_SOUND_SUCCESS
  - DEFAULT_PUSHOVER_SOUND_FAILURE
  - DEFAULT_PUSHOVER_PRIORITY_SUCCESS
  - DEFAULT_PUSHOVER_PRIORITY_FAILURE

Ab Release 0.7.0

  - DEFAULT_PUSHOVER_ADDITIONAL_OPTIONS=
  - DEFAULT_PUSHOVER_DEVICE=""



### DEFAULT_SLACK_*

Ab Version 0.6.8 können Benachrichtigungen per Slack geschickt werden.

Mit den Notifications definiert man ob man in Erfolgs- und/oder Fehlerfalle
benachrichtigt werden will. Mögliche Optionen sind "S" für Erfolg (Success)
und/oder "F" für den Fehlerfall (Failure). Mit "M" werden die raspiBackup
Meldungen als Datei geschickt. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SF" oder "SM".

  - DEFAULT_SLACK_WEBHOOK_URL
  - DEFAULT_SLACK_NOTIFICATIONS


[.status]: review-needed
[.status]: todo "Check links"
[.source]: https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen
[.source]: https://www.linux-tips-and-tricks.de/en/invocation-and-options

