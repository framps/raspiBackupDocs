# Allgemeine Konfigurationsoptionen

<!-- toc -->

**Hinweis:** Optionen in der Konfigdatei, die ja/an oder nein/aus als Parameter
benötigen, müssen 0 für nein und 1 für ja sein. Kein Eintrag in
der Standardspalte bedeutet der Standard ist `""`

<div class="table-wrapper-for-options">


### DEFAULT_COLOR_CODES

Ab Version 0.6.7 können die html und VT100 Colorcodes definiert werden. Default
ist gelb für Warnungen und Rot für Fehler. Das erste Pärchen der Definition legt
die Codes für Warnung das zweite Pärchen die Definition für Fehler fest. Dabei
ist die erste Definition der HTML Colorocde und die zweite Definition der VT100
Colorcode.

| Config-Option              | Standard |
|----------------------------|----------|
| DEFAULT_COLOR_CODES        | ("#FF8000 33" "#FF0000 31")  |



### DEFAULT_PUSHOVER_*

Ab Version 0.6.8 können Benachrichtigungen per Pushover geschickt werden. Dazu
ist es notwendig, sich auf <https://pushover.net/> registriert zu haben und eine
application eingerichtet haben muss.

Mit den Notifications definiert man ob man in Erfolgs- und/oder Fehlerfalle
benachrichtigt werden will. Mögliche Optionen sind "S" für Erfolg (Success)
und/oder "F" für den Fehlerfall (Failure). Mit "M" werden die raspiBackup
Meldungen als Datei geschickt.. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SF" oder "SM".

Die Prioritäten entsprechen den verfügbaren Pushover Prioritäten.

Die Klänge entsprechen den verfügbaren Pushoverklängen.

| Config-Option              | Standard | Bemerkung |
|----------------------------|----------|-----------|
| DEFAULT_PUSHOVER_TOKEN     |          |  |
| DEFAULT_PUSHOVER_USER      |          |  |
| DEFAULT_PUSHOVER_NOTIFICATIONS |      |  |
| DEFAULT_PUSHOVER_SOUND_SUCCESS |      |  |
| DEFAULT_PUSHOVER_SOUND_FAILURE |      |  |
| DEFAULT_PUSHOVER_PRIORITY_SUCCESS |   |  |
| DEFAULT_PUSHOVER_PRIORITY_FAILURE |   |  |
| DEFAULT_PUSHOVER_ADDITIONAL_OPTIONS | |  ab Release 0.7.0 |
| DEFAULT_PUSHOVER_DEVICE             | |  ab Release 0.7.0 |


### DEFAULT_SEND_STATS

Ab Version 0.6.6.1 vom 13.2.2022: Es werden beim Versionscheck ein paar *raspiBackup*
Optionen übermittelt, die für [Statistikzwecke](statistics.md) genutzt werden.

| Config-Option              | Standard |
|----------------------------|----------|
| DEFAULT_SEND_STATS         | ja       |



### DEFAULT_SENDER_EMAIL

Die eMailAdresse des Versenders kann bei ssmtp und msmtp angegeben werden.

| Config-Option              | Standard |
|----------------------------|----------|
| DEFAULT_SENDER_EMAIL | root@$(hostname) |



### DEFAULT_SLACK_*

Ab Version 0.6.8 können Benachrichtigungen per Slack geschickt werden.

Mit den Notifications definiert man ob man in Erfolgs- und/oder Fehlerfalle
benachrichtigt werden will. Mögliche Optionen sind "S" für Erfolg (Success)
und/oder "F" für den Fehlerfall (Failure). Mit "M" werden die raspiBackup
Meldungen als Datei geschickt. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SF" oder "SM".

| Config-Option               | Standard |
|-----------------------------|----------|
| DEFAULT_SLACK_WEBHOOK_URL   |          |
| DEFAULT_SLACK_NOTIFICATIONS |          |

### DEFAULT_TELEGRAM_*

Ab Version 0.6.8 können Benachrichtigungen per TelegraTelegramm geschickt werden.

Mit den Notifications definiert man ob man in Erfolgs- und/oder Fehlerfalle
benachrichtigt werden will. Mögliche Optionen sind "S" für Erfolg (Success)
und/oder "F" für den Fehlerfall (Failure). Mit "M" werden die raspiBackup
Meldungen als Datei geschickt. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SF" oder "SM".

| Config-Option               | Standard |
|-----------------------------|----------|
| DEFAULT_TELEGRAM_TOKEN      |          |
| DEFAULT_TELEGRAM_CHATID     !          |
| DEFAULT_TELEGRAM_NOTIFICATIONS |        | 
| DEFAULT_TELEGRAM_THREADID      |          | ab Release 7.1.1 |


</div>

[.status]: review-needed

[.status]: restructured
