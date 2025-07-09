## Weitere Optionen (nur in der Konfigurationsdatei)

<!-- toc -->

### DEFAULT_BEFORE_STOPSERVICES / DEFAULT_AFTER_STARTSERVICES

Ab Version 0.6.4.3: Die hier definierten Befehle werden vor bzw nach dem Backup
vor bzw nach dem Stoppen von Systemservices (Option -a und -o) ausgeführt.

| Config-Option               | Standard | Im Installer setzbar |
|-----------------------------|----------| :------------------: |
| DEFAULT_BEFORE_STOPSERVICES |          | nein |
| DEFAULT_AFTER_STARTSERVICES |          | nein |



### DEFAULT_COLOR_CODES

Ab Version 0.6.7 können die html und VT100 Colorcodes definiert werden. Default
ist gelb für Warnungen und Rot für Fehler. Das erste Pärchen der Definition legt
die Codes für Warnung das zweite Pärchen die Definition für Fehler fest. Dabei
ist die erste Definition der HTML Colorocde und die zweite Definition der VT100
Colorcode.

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_COLOR_CODES        | ("#FF8000 33" "#FF0000 31")  | nein |



### DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY

dd Backups sichern nur den von definierten Partitionen belegten Platz. Dadurch
benötigt eine 32GB SD Karte, die nur eine 8GB Partition definiert hat, für den
Backup nur 8GB und nicht 32GB. Dazu muss aber vermittels gparted oder resize2fs
die root Partition entsprechend verkleinert werden, denn üblicherweise füllt
die root Partition den gesamten Rest der SD Karte aus.

Siehe dazu auch [FAQ16](faq.md#faq16).

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY |          | nein |



### DEFAULT_LINK_BOOTPARTITIONFILES

Sich selten ändernde Bootparition Backups werden mit Hardlinks verknüpft, um
Backupspace zu sparen. Voraussetzung: Der Backupspace unterstützt Hardlinks
(ext3/ext4 Filesystem).

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_LINK_BOOTPARTITIONFILES |          | nein |



### DEFAULT_MAIL_ON_ERROR_ONLY

Nur im Fehlerfalle wird eine eMailbenachrichtigung gesendet. Hinweis: Sollte
*raspiBackup* wegen aussergewöhnlicher Umstände abstürzen, kann es durchaus sein,
dass keine eMail gesendet wird.

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_MAIL_ON_ERROR_ONLY |          | nein |



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


| Config-Option              | Standard | Im Installer setzbar | Bemerkung |
|----------------------------|----------| :------------------: |-----------|
| DEFAULT_PUSHOVER_TOKEN     |          | nein | |
| DEFAULT_PUSHOVER_USER      |          | nein | |
| DEFAULT_PUSHOVER_NOTIFICATIONS |      | nein | |
| DEFAULT_PUSHOVER_SOUND_SUCCESS |      | nein | |
| DEFAULT_PUSHOVER_SOUND_FAILURE |      | nein | |
| DEFAULT_PUSHOVER_PRIORITY_SUCCESS |   | nein | |
| DEFAULT_PUSHOVER_PRIORITY_FAILURE |   | nein | |
| DEFAULT_PUSHOVER_ADDITIONAL_OPTIONS | | nein | ab Release 0.7.0 |
| DEFAULT_PUSHOVER_DEVICE             | | nein | ab Release 0.7.0 |



### DEFAULT_SEND_STATS

Ab Version 0.6.6.1 vom 13.2.2022: Es werden beim Versionscheck ein paar *raspiBackup*
Optionen übermittelt, die für [Statistikzwecke](statistics.md) genutzt werden.

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_SEND_STATS         | ja       | nein |



### DEFAULT_SENDER_EMAIL

Die eMailAdresse des Versenders kann bei ssmtp und msmtp angegeben werden.

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_SENDER_EMAIL | root@$(hostname) | nein |



### DEFAULT_SLACK_*

Ab Version 0.6.8 können Benachrichtigungen per Slack geschickt werden.

Mit den Notifications definiert man ob man in Erfolgs- und/oder Fehlerfalle
benachrichtigt werden will. Mögliche Optionen sind "S" für Erfolg (Success)
und/oder "F" für den Fehlerfall (Failure). Mit "M" werden die raspiBackup
Meldungen als Datei geschickt. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SF" oder "SM".

| Config-Option               | Standard | Im Installer setzbar |
|-----------------------------|----------| :------------------: |
| DEFAULT_SLACK_WEBHOOK_URL   |          | nein |
| DEFAULT_SLACK_NOTIFICATIONS |          | nein |


### DEFAULT_RESTORE_EXTENSIONS

Ab Version 0.6.7 gibt es auch für den Restore wie beim Backup die Möglichkeit,
auch pre und post Exits zu konfigurieren, um vor und nach dem Restore noch
irgendwelche Aktionen vorzunehmen. Die Syntax ist genauso wie für die Backup
Extensions.

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_RESTORE_EXTENSIONS |          | nein |



### DEFAULT_RESTORE_REMINDER_INTERVAL

Backup Restore Test Reminder Intervall (Einheit: Monate)

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_RESTORE_REMINDER_INTERVAL | 6 | nein |



### DEFAULT_RESTORE_REMINDER_REPEAT

Anzahl der Erinnerungen, einen Backup Restore Test durchzuführen.

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_RESTORE_REMINDER_REPEAT | 3   | nein |



### DEFAULT_RSYNC_BACKUP_ADDITIONAL_OPTIONS

Backupoptionen, die beim rsync Backup zusätzlich genutzt werden.

**Benutzung auf eigene Gefahr!**

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_RSYNC_BACKUP_ADDITIONAL_OPTIONS |          | nein |




### DEFAULT_RSYNC_BACKUP_OPTIONS

Backupoptionen, die beim rsync Backup genutzt werden.

**Benutzung auf eigene Gefahr!**

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_RSYNC_BACKUP_OPTIONS | --delete -aHAx | nein |



### DEFAULT_TAR_BACKUP_ADDITIONAL_OPTIONS

Backupoptionen, die beim tar Backup zusätzlich genutzt werden.

**Benutzung auf eigene Gefahr!**

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_TAR_BACKUP_ADDITIONAL_OPTIONS |          | nein |



### DEFAULT_TAR_BACKUP_OPTIONS

Backupoptionen, die beim tar Backup genutzt werden.

**Benutzung auf eigene Gefahr!**

| Config-Option              | Standard | Im Installer setzbar |
|----------------------------|----------| :------------------: |
| DEFAULT_TAR_BACKUP_OPTIONS | -cpi     | nein |



[.status]: review-needed
