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

Bei den Optionen wird zusätzlich - wenn vorhanden - angegeben: der Name in der
Konfigurationsdatei, der [Defaultwert] und "@inst", wenn im Installer setzbar.

<!-- toc -->


<a name="parm_a"></a>
### -a ⇌ DEFAULT_STARTSERVICES [keine]

[@inst]

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

<a name="parm_A"></a>
### -A ⇌ DEFAULT_APPEND_LOG [aus]

Das Laufzeitlog wird bei der eMail Benachrichtigung mitgeschickt.



<a name="parm_b"></a>
### -b ⇌ DEFAULT_DD_BLOCKSIZE [1 MB]

Blocksize, die beim dd Backup benutzt wird



<a name="parm_B"></a>
### -B ⇌ DEFAULT_TAR_BOOT_PARTITION_ENABLED ]aus]

Die Bootpartition wird nicht per dd sondern per tar gesichert.

Hinweis: Diese Option hat keine Funktion wenn der partitionsorientierte Modus
benutzt wird, also Option -P benutzt wird oder DEFAULT_PARTITIONBASED_BACKUP=1
in der Konfiguration gesetzt ist.


<a name="parm_c"></a>
### -c ⇌ DEFAULT_SKIPLOCALCHECK [aus]

Es kann kein Backup auf der Rootpartition erstellt werden, um vor
unbeabsichtigtem Vollschreiben der Rootpartition durch das Backup zu schützen.

Mit dieser Option wird der Test ausgeschaltet und es kann ein Backup auf der
Rootpartition erstellt werden. **ACHTUNG**: Es wird nicht geprüft, ob das Backup
noch auf die Rootparition passt.


<a name="parm_coloring"></a>
### --coloring ⇌ DEFAULT_COLORING [automatisch]

Ab der Version 0.6.5 können die Meldungen in der eMail sowie auf der Konsole
koloriert werden. Mögliche Werte sind `C` für Konsole und/oder `M` für eMail.
Falls postfix als emailClient genutzt wird siehe auch Option --eMailColoring.



<a name="parm_D"></a>
### -D ⇌ DEFAULT_DD_PARMS [automatisch]

Weitere Aufrufoptionen für das dd Backup (z.B. "conv=notrunc,noerror,sync")



<a name="parm_dynamicMount"></a>
### --dynamicMount ⇌ DEFAULT_DYNAMIC_MOUNT [aus]

Ab Version 0.6.6 wird damit vor dem Backup die angegebene Partition bzw. der
Mointpoint gemounted und am Ende wieder umounted. Falls sie schon gemounted ist
wird am Ende die Partition nicht umounted. Der Mountpoint muss in /etc/fstab
definiert sein und kann dann entweder der Mountpoint selbst sein (z.B. /backup)
oder die Backuppartition (z.B. /dev/sdb1).



<a name="parm_e"></a>
### -e ⇌ DEFAULT_EMAIL [keine]

[@inst]

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



<a name="parm_E"></a>
### -E ⇌ DEFAULT_EMAIL_PARMS [keine]

Optionale weitere Parameter, die im eMailProgrammaufruf mitgegeben werden. Für
sendEmail muss er z.B. wie folgt aussehen: "-f absender.mail@absenderdomain -s
smtp-server:587 -xu Username -xp Password".

**Achtung**: Die Parameter für -E müssen in Anführungszeichen " eingeschlossen
sein. Speziell zum Testen der eMail Benachrichtigungsfunktion ist der Parameter
-F hilfreich.

**Achtung**: Wenn der Parameter -l 1 benutzt wird, steht das Password im Log und
sollte vor Verschicken des Logs manuell maskiert werden.



<a name="parm_eMailColoring"></a>
### --eMailColoring ⇌ DEFAULT_EMAIL_COLORING [SUBJECT]

Standardmaessig wird das eMailColoring über die Subject Zeile gesteuert, da
dieser Weg von den meisten eMail Clients genutzt wird. Wenn man aber postfix
als eMail Client benutzt, muss man OPTION als Parameter mitgeben, da postfix das
Coloring mit einer separaten Option steuert.



<a name="parm_f"></a>
### -f

Angabe einer Konfigurationsdatei, die als letztes eingelesen wird. Siehe [oben](#configfiles).
alle möglichen Konfigurationsdateien und ihre Einlesereihenfolge.


<a name="parm_F"></a>
### -F

Fake backup. Diese Option ist hilfreich beim initialen Testen von *raspiBackup*.
Der eigentliche lange Backup wird dadurch nicht angestossen - aber sämtliche
Optionsprüfungen wie auch das Senden der BenachrichtigungseMail.


<a name="parm_g"></a>
### -g

Mit dieser Option wird beim Backup und Restore eine Fortschrittsanzeige
angezeigt. Beim tar Backup steht keine  Fortschrittssanzeige zur Verfügung.


<a name="parm_G"></a>
### -G ⇌ DEFAULT_LANGUAGE [Systemsprache oder EN]

[@inst]

Festlegung der Sprache der Meldungen. Mögliche Sprachen sind DE (Deutsch) und
EN (English). Interessenten, die die Meldungen in andere Sprachen übersetzen
wollen können sich gerne melden



<a name="parm_h"></a>
### -h

Ausgabe der Aufrufsyntax mit seinen Parametern



<a name="parm_ignoreAdditionalPartitions"></a>
### --ignoreAdditionalPartitions ⇌ DEFAULT_IGNORE_ADDITIONAL_PARTITIONS [nein]

Mit dieser Option sind Systeme mit mehr als
zwei Partitionen unterstützt im normalen Backupmodus wenn tar oder rsync Backup genutzt
wird. Allerdings werden nur die ersten beiden Paritionen, /boot und / gesichert
und wiederhergestellt. **Achtung**: Alle anderen Partitionen werden ignoriert.

<a name="parm_ignoremissingpartitions"></a>
### --ignoreMissingPartitions ⇌ DEFAULT_IGNORE_MISSING_PARTITIONS [nein]

Es wird im partitionsorientierten Backupmodus geprüft, ob alle Partitionen,
die im letzten Backup
gesichert wurden, auch wieder gesichert werden. Mit dieser Option wird der Test
ausgeschaltet.

<a name="parm_k"></a>
### -k ⇌ DEFAULT_KEEPBACKUPS [3]

[@inst]

Anzahl der Backups, die pro Backuptyp vorzuhalten sind, sofern es nicht durch
folgende Option überschrieben wird. D.h., es werden 3 dd, 3 tar und 3 rsync
Backups vorgehalten.

Hinweis:Diese Option ist wirkungslos, wenn die intelligente Rotationsstrategie benutzt wird.




<a name="parm_keepType"></a>
### --keep_<type> ⇌ DEFAULT_KEEPBACKUPS_{DD|DDZ|TAR|TGZ|RSYNC} [Parameter für Option -k]

Anzahl der Backups, die für den jeweiligen Backuptypen vorgehalten werden.

<type> kann jeder Backuptyp sein, also dd, ddz, tar, tgz oder rsync

Hinweis:Diese Optionen sind wirkungslos, wenn die intelligente Rotationsstrategie benutzt wird.


<a name="parm_l"></a>
### -l ⇌ DEFAULT_LOG_LEVEL [on]

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

<a name="parm_L"></a>
### -L ⇌ DEFAULT_LOG_OUTPUT [backup]

Definiert das Ziel der Logdatei `raspiBackup.log`.

  - varlog: Die Logdatei wird in /var/log geschrieben
  - backup: Die Logdatei wird in das erzeugte Backup geschrieben
  - current: Die Logdatei wird in das aktuelle Verzeichnis geschrieben.

<Dateinamenprefix>:  Das Debuglog wird dort mit der Extension `.log` und die
Messagedatei mit der Extension `.msg` abgelegt.

Beispiel: `/home/pi/raspiBackup`

Am Ende existiert `/home/pi/raspiBackup.log` sowie `/home/pi/raspiBackup.msg`

Im Backupverzeichnis werden keine Logs abgelegt.



<a name="parm_m"></a>
### -m ⇌ DEFAULT_MSG_LEVEL [minimal]

[@inst]

Meldungsdetails

  - minimal -> Nur wichtige Meldungen werden ausgegeben
  - detailed -> Viele Meldungen über den Fortschrit werden ausgegeben



<a name="parm_M"></a>
### -M ⇌ [keiner]

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


<a name="parm_N"></a>
### -N ⇌ DEFAULT_EXTENSIONS ]keine]

Aktivierung von eigenen Scripterweiterungen (Plugins). Siehe dazu [diese Seite](hooks-for-own-scripts.md),
die auch zwei Beispielerweiterungen anbietet, die die CPU Temperatur und die
Speicherbelegung vor und nach dem Backuplauf ausgeben.


<a name="parm_notify"></a>
### --notify ⇌ DEFAULT_NOTIFY_START [nein]

Start

Mit dieser Option wird eingeschalten, dass eine
eMail oder eine Telegram Benachrichtigung gesendet wird, wenn der Backup startet.
Normalerweise wird nur am Ende des Backups eine Benachrichtigung geschickt.


<a name="parm_o"></a>
### -o ⇌ DEFAULT_STOPSERVICES [keine]

[@inst]

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



<a name="parm_P"></a>
### -P ⇌ DEFAULT_PARTITIONBASED_BACKUP [aus]

[@inst]

Partitionsorientierter Modus. Damit wird im Gegensatz zum normalen Modus, wo nur
die ersten beiden Partitionen gesichert werden, eine beliebige Anzahl von
Partitionen gesichert. Mit der Option -T wird definiert, welche Partitionen zu
sichern sind.


<a name="parm_rebootsystem"></a>
### --rebootSystem ⇌ DEFAULT_REBOOT_SYSTEM [aus]

Duch diese Option eine Reboot des Systems am Ende des
Backuplaufes vorgenommen und somit werden alle Services wieder gestartet.
Deshalb werden Argumente der Option -a auch ignoriert.

**Hinweis**: Wird die Option -F benutzt, wird kein reboot durchgeführt.

<a name="parm_resizerootfs"></a>
### --resizeRootFS ⇌ DEFAULT_RESIZE_ROOTFS [an]

Mit dieser Option wird definiert, ob beim Restore die letzte Partition
verkleinert wird, um auf ein kleineres Device zu restoren oder vergrößert, um den
ganzen verfügbaren Platz des Devices zu nutzen. Ist das Device kleiner, muss es
aber noch gross genug sein, um die ganzen Daten des Backups aunehmen zu können.
Ansonsten bricht der Restore irgendwann ab.

<a name="parm_s"></a>
### -s ⇌ DEFAULT_MAIL_PROGRAM [mail]

email Program, welches benutzt wird {mail|sendEmail|ssmtp|msmtp}. Für postfix
und nullmailer muss mail benutzt werden und die mailtools installiert werden.
Für sendEmail muss der Parameter -E zusätzlich genutzt werden für weitere
obligatorische Parameter (Siehe [Parameter -E Beschreibung](#parm_E) für Details).

Es kann auch ein eMailPlugin benutzt werden, um eMails zu verschicken. Damit
können beliebige weitere eMailClients in *raspiBackup* eingebunden werden. Der -s
Parameter muss dann mailext sein. Details zum eMailPlugin siehe [diese Seite](hooks-for-own-scripts.md).

<a name="parm_S"></a>
### -S ⇌ [aus]

Ein Update mit der Option -U wird auch vorgenommen, wenn die Versionen
übereinstimmen. Sie bewirkt, dass sowohl eine lokale Betaversion wie auch eine
lokale normale Version mit dem aktuellsten Codestand ersetzt wird. Primär ist
sie dafür gedacht, den Codestand einer existierenden lokalen Betaversion zu
aktualisieren.



<a name="parm_smartRecycle"></a>
### --smartRecycle ⇌ DEFAULT_SMART_RECYCLE [aus]

[@inst]

Diese Option schaltet die [intelligente Rotationsstrategie - Smart Recycle](smart-recycle.md) ein.
Damit werden auch die --keep Optionen ignoriert und müssen nicht auf 0 gesetzt werden.

<a name="parm_smartRecycleDryrun"></a>
### --smartRecycleDryrun ⇌ DEFAULT_SMART_RECYCLE_DRYRUN [ja]

Diese Option schaltet den Testmodus der intelligenten
Rotationsstrategie ein. Details dazu sind hier beschrieben.

[.todo] Check "Here muss gesetzt werden"

<a name="parm_smartRecycleOptions"></a>
### --smartRecycleOptions ⇌ DEFAULT_SMART_RECYCLE_OPTIONS ["7 4 12 1"]

[@inst]

Diese Option definiert Parameter der [intelligenten Rotationsstrategie](smart-recycle.md).

<a name="parm_systemstatus"></a>
### --systemstatus ⇌ [aus]

Es wird eine Liste der aktiven Services und offenen Dateien
in der Debugdatei erstellt


<a name="parm_t"></a>
### -t ⇌ DEFAULT_BACKUPTYPE [rsync]

[@inst]

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


<a name="parm_telegram"></a>
### --telegramToken ⇌ DEFAULT_TELEGRAM_TOKEN
### --telegramChatIDDEFAULT_TELEGRAM_CHATID
### --telegramNotifications DEFAULT_TELEGRAM_NOTIFICATIONS [F]

Benachrichtigungen können per Telegram verschickt werden.
Dazu sind folgende Konfigurationen notwendig:

Das Telegramtoken sowie die ChatID. Mit den Notifications definiert man ob man
in Erfolgs- und/oder Fehlerfalle benachrichtigt werden will. Mögliche Optionen
sind "S" für Erfolg (Success) und/oder "F" für den Fehlerfall (Failure). Mit
"M" werden die *raspiBackup* Meldungen als Datei geschickt.. Mit "m" werden die
*raspiBackup* Meldungen mitgeschickt. Es können die Optionen beliebig kombiniert
werden. Beispiel: "SFm" oder "Sm". Die Optionen "m" und "M" können nicht
zusammen angegeben werden.



<a name="parm_timestamps"></a>
### --timestamps ⇌ DEFAULT_TIMESTAMPS [aus]

Durch diese Option wird vor jeder Meldung ein Zeitstempel ausgegeben.


<a name="parm_T"></a>
### -T ⇌ DEFAULT_PARTITIONS_TO_RESTORE ["1 2"]

[@inst]

Falls der partitionsorientierte Backupmodus mit der Option -P gewählt wurde,
kann mit dieser Option definiert werden, welche Partitionen gesichert werden
sollen. Beispiel: -T "1 2 5" sichert die ersten beiden und die fünfte
Partition. Mit * werden alle Partitionen gesichert.

**Historisch**:
  - Bis Release 0.6.5.1: [*]
  - Bis Release 0.7.0: DEFAULT_PARTITIONS_TO_BACKUP

[.todo] Check "Checi historisch"

<a name="parm_u"></a>
### - u ⇌ DEFAULT_EXCLUDE_LIST [keine]

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



<a name="parm_unsupportedEnvironment"></a>
### --unsupportedEnvironment ⇌ [aus]

Wird *raspiBackup* auf nicht [unterstützten Umgebungen](supported-hardware-and-software.md)
gestartet muss diese Option angegeben werden.


<a name="parm_U"></a>
### -U ⇌ [aus]

Die lokale *raspiBackup* Version wird durch die letzte aktuelle Version ersetzt
sofern eine neue Version existiert. Die vorherige Version wird als
raspiBackup.sh.n.m gesichert wobei n und m die Versionsnumer von *raspiBackup*
ist. Siehe Parameter -V, um eine vorhergehende Version wiederherzustellen.

**Achtung**: Vorher sollte man [diese Seite](version-history.md) lesen
und sich über die Änderungen und Neuerungen informieren.

Zusätzlich gibt es noch die option -S, mit der Betaversionen auf den letzten
Stand gebracht werden können.

Mit der Option -V kann auf eine ältere Version zurückgegangen werden.



<a name="parm_v"></a>
### -v ⇌ DEFAULT_VERBOSE [aus]

Die verwendeten Backuptools tar und rsync zeigen detailierte Informationen an
(Verbose mode). Die Option ist besonders nützliche bei initialen manuellen
Backuptests, um den Backupfortschritt verfolgen zu können.


<a name="parm_V"></a>
### -V ⇌

Es wird eine Liste aller existierenden Vorgängerversionen angezeigt und man
kann die Version auswählen, die wiederhergestellt werden soll. Die aktuelle
Version wird gesichert und kann dann auch mit dieser Option später
wiederhergestellt werden (Siehe auch -U Parameter)

<a name="parm_version"></a>
### --version ⇌ [aus]

Die Version von *raspiBackup* wird im folgenden Format ausgegeben:

```
Version: 0.6.3.2 CommitSHA: 8fbcd1a CommitDate: 2018-02-19 CommitTime: 19:18:31#
```


<a name="parm_y"></a>
### -y ⇌ DEFAULT_DEPLOYMENT_HOSTS

Mit dieser Option wird das aktuelle Script auf alle Hosts kopiert, die in der
Konfigurationsdatei definiert sind. Der Zugriff muss per authorized_keys ohne
Kennwort möglich sein. Somit lässt sich *raspiBackup* schnell auf einer größeren
Menge von Hosts nach einem Versionsupdate verteilen.


<a name="parm_z"></a>
### -z ⇌ DEFAULT_ZIP_BACKUP [aus]

Backup verkleinern mit gzip bei dd oder tar Backup 	Nein 	ja



----

## Weitere Optionen (nur in der Konfigurationsdatei)

### DEFAULT_MAIL_ON_ERROR_ONLY

Nur im Fehlerfalle wird eine eMailbenachrichtigung gesendet. Hinweis: Sollte
*raspiBackup* wegen aussergewöhnlicher Umstände abstürzen, kann es durchaus sein,
dass keine eMail gesendet wird.


### DEFAULT_RSYNC_BACKUP_OPTIONS [--delete -aHAx]

Backupoptionen, die beim rsync Backup genutzt werden.

**Benutzung auf eigene Gefahr!**



### DEFAULT_TAR_BACKUP_OPTIONS [-cpi]

Backupoptionen, die beim tar Backup genutzt werden.

**Benutzung auf eigene Gefahr!**



### DEFAULT_RSYNC_BACKUP_ADDITIONAL_OPTIONS

Backupoptionen, die beim rsync Backup zusätzlich genutzt werden.

**Benutzung auf eigene Gefahr!**



### DEFAULT_TAR_BACKUP_ADDITIONAL_OPTIONS

Backupoptionen, die beim tar Backup zusätzlich genutzt werden.

**Benutzung auf eigene Gefahr!**



### DEFAULT_LINK_BOOTPARTITIONFILES

Sich selten ändernde Bootparition Backups werden mit Hardlinks verknüpft, um
Backupspace zu sparen. Voraussetzung: Der Backupspace unterstützt Hardlinks
(ext3/ext4 Filesystem).



### DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY

dd Backups sichern nur den von definierten Partitionen belegten Platz. Dadurch
benötigt eine 32GB SD Karte, die nur eine 8GB Partition definiert hat, für den
Backup nur 8GB und nicht 32GB. Dazu muss aber vermittels gparted oder resize2fs
die root Partition entsprechend verkleinert werden, denn üblicherweise füllt
die root Partition den gesamten Rest der SD Karte aus.

Siehe dazu auch [FAQ16](faq.md#faq16).


### DEFAULT_SENDER_EMAIL [root@$(hostname)]

Die eMailAdresse des Versenders kann bei ssmtp und msmtp angegeben werden.



### DEFAULT_RESTORE_REMINDER_INTERVAL [6]

Backup Restore Test Reminder Intervall (Einheit: Monate)



### DEFAULT_RESTORE_REMINDER_REPEAT [3]

Anzahl der Erinnerungen, einen Backup Restore Test durchzuführen.



### DEFAULT_BEFORE_STOPSERVICES / DEFAULT_AFTER_STARTSERVICES

Ab Version 0.6.4.3: Die hier definierten Befehle werden vor bzw nach dem Backup
vor bzw nach dem Stoppen von Systemservices (Option -a und -o) ausgeführt.



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

