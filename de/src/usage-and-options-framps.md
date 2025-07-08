# Aufrufsyntax und -optionen für ein Backup

**Hinweis:** Optionen in der Konfigdatei, die ja/an oder nein/aus als Parameter
benötigen, müssen 0 für nein und 1 für ja sein.

------------------------------------------------------------------------

## [Thematische Sortierung der Aufrufoptionen (Auswahl)](#thematisch)

## Alphabetische Sortierung der Aufrufoptionen

<!-- toc -->

<a name="parm_k"></a>
### -k: Anzahl der vorzuhaltenden Backups

Hiermit wird definiert welche Anzahl Backups für alle Backuptypen vorzuhalten ist sofern sie nicht durch
die folgende Optionen [--keep_\<type\>](#parm_keepType) überschrieben wird. 

| Option | Standard| Im Installer setzbar | Konfigurationsname |
|--------|---------|----------------------|--------------------|
|  -k    | 3       |        ja            | DEFAULT_KEEPBACKUPS|


**Hinweis:** Diese Option ist wirkungslos, wenn die intelligente Rotationsstrategie benutzt wird.


<a name="parm_keepType"></a>
### --keep_\_\<type\>: Anzahl der jeweiligen Backuptypen, die vorgehalten werden sollen

Hiermit wird definiert welche Anzahl Backups pro Backuptyp vorzuhalten ist und überschreibt
den Wert der Option [-k](#parm_k).

**Hinweis:** Diese Optionen sind wirkungslos, wenn die intelligente Rotationsstrategie benutzt wird.

| Option           | Standard| Im Installer setzbar | Konfigurationsname |
|------------------|---------|----------------------|--------------------|
| --keep_dd        | keiner  | nein                 | DEFAULT_KEEPBACKUPS_DD |
| --keep_ddz       | keiner  | nein                 | DEFAULT_KEEPBACKUPS_DDZ |
| --keep_tar       | keiner  | nein                 | DEFAULT_KEEPBACKUPS_TAR |
| --keep_tgz       | keiner  | nein                 | DEFAULT_KEEPBACKUPS_TGZ |
| --keep_rsync     | keiner  | nein                 | DEFAULT_KEEPBACKUPS_RSYNC |

<a name="parm_l"></a>
### -l: Log level

Log level definiert ob ein Debuglog erstellt wird:

  - off  -> Es wird kein Debuglog erstellt
  - debug -> Es wird ein Debuglog erstellt

**Achtung**: Die Logausgabe kann sensitive Informationen
enthalten. raspiBackup maskiert Z.B. externe statische IP Adressen, eMailAdressen, Kennwörter für
mount Befehle oder email Server u.V.m. Es können aber immer noch sensitive Informationen
im Debuglog enthalten sein die noch manuell maskiert werden sollten.

Das Debuglog wird bei einem erfolgreichen Backup im Backupverzeichnis abgelegt. 
Falls es Fehler gibt befindet sich da Debuglog im Homeverzeichnis des
Aufrufers. Während des Backuplaufes befindet sich das Debuglog in `/tmp`.

| Option           | Standard| Im Installer setzbar | Konfigurationsname |
|------------------|---------|----------------------|--------------------|
| -l               | debug   | nein                 | DEFAULT_LOGLEVEL   |


<a name="thematisch"></a>
## Thematische Sortierung der Aufrufoptionen (Auswahl)

### Optionen, die das Backup beschreiben

  - [-k : Anzahl der Backups die vorgehalten werden sollen](#parm_k)
  - [--keep\_\<type\>: Anzahl der jeweiligen Backuptypen, die vorgehalten werden sollen](#parm_keepType)
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

[.status]: review-needed
[.status]: todo "Check links"
[.source]: https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen
[.source]: https://www.linux-tips-and-tricks.de/en/invocation-and-options

