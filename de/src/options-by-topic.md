## Thematische Sortierung aller Optionen

<a name="backup"></a>
### Backupoptionen

  - [-a: Befehle die Services nach dem Backup starten](backup-options.html#-a-befehle-die-services-nach-dem-backup-starten.md)
  - [-A: Das Laufzeitlog wird in der eMail mitgeschickt](general-options.html#-a-das-laufzeitlog-wird-bei-der-email-benachrichtigung-mitgeschickt.md)
  - [-b: Definition der Blocksize die beim dd Backup genutzt wird](backup-options.md#parm_b)
  - [-B: Bootpartition wird als tar gesichert statt per dd](backup-options.md#parm_B)
  - [-c: Erlaube lokale Backupseicherung](backup-options.html#-c-erlaube-lokale-backupspeicherung)
  - [-D: Weitere Optionen für den dd Backup](backup-options.md#parm_D)
  - [--dynamicMount: Dynamisches Mounten der Backuppartition](backup-options.md#parm_dynamicMount)
  - [--ignoreAdditionalPartitions: Es werden mehr als zwei Partitionen toleriert wobei aber nur die ersten beiden Partitionen gesichert werden.](backup-options.md#parm_ignoreAdditionalPartitions)
  - [--ignoreMissingPartitions: Test ob alle Partitionen gesichert werden](backup-options.html#--ignoremissingpartitions.md)
  - [-k : Anzahl der Backups die vorgehalten werden sollen](backup-options.md#parm_k)
  - [--keep_{type}: Anzahl der jeweiligen Backuptypen, die vorgehalten werden sollen](backup-options.md#parm_keepType)
  - [-M: Erstellen eines *raspiBackup* Snapshots](backup-options.md#parm_M)
  - [-o: Befehle, die Services vor dem Backup stoppen](backup-options.md#parm_o)
  - [-p:]
  - [-P : Partitionsorientierter Backupmodus](backup-options.md#parm_P)
  - [--smartRecycle:]
  - [--smartRecycleDryrun:]
  - [--smartRecycleOptions:]
  - [--systemStatus:]
  - [-t : Typ des Backups (dd, tar, rsync)](backup-options.md#parm_t)
  - [-T: Zu sichernde Partitionen](backup-options.md#parm_T)
  - [-u: Ermöglicht weitere Verzeichnisse aus dem Backuprozess auszuschliessen](backup-options.md#parm_u)
  - [-z: Kompression des Backups bei dd oder tar](backup-options.md#parm_z)
  - [-0:]
  - [-00:]
  - [-1:]

<a name="restore"></a>
### Restoreoptionen

  - [-C: Auf Badblock prüfen](restore-options.md#parm_c)
  - [-d: Restoredevice](restore-options.md#parm_d)
  - [-r:]
  - [-R: Externe Rootpartition](restore-options.md#parm_R)
  - [-T: Zu restorende Partitionen](restore-options.md#parm_T)
  - [-Y: Automatisierter Restore](restore-options.md#parm_Y)
  - [--resizeRootFS: Rootfilesystem Anpassung](restore-options.md#parm_resizeRootFS)
  - [--rebootSystem:]
  - [--updateUUIDs: UUID Generierung](restore-options.md#parm_resizeRootFS)
 
<a name="messages-and-log"></a> 
### Optionen, die die Meldungen und das Log betreffen

  - [-A: Das Laufzeitlog wird bei der eMail Benachrichtigung mitgeschickt](general-options.md#parm_A)
  - [--coloring: Kolorierungseinstellungen bei eMails und Konsolmeldungen](general-options.md#parm_coloring)
  - [-G: Sprache der Meldungen (Deutsch oder English)](ganeraloptions.md#parm_G)
  - [-l: Einschalten des detailierten Loglevels](general-options.md#parm_l)
  - [-L: Verzeichnis wo das Debuglog sowie die Laufzeitmeldungen gespeichert werden](general-options.md#parm_L)
  - [-m: Meldungsdetails](general-options.md#parm_m)
  - [--timestamps: Alle Meldungen werden mit einem führenden Zeitstempel ausgegeben](general-options.md#parm_timestamps)
  - [-v: Alle Meldungen des verwendeten Backuptools werden protokolliert](backup-options.md#parm_v)

<a name="notifications"></a> 
### Optionen, die Benachrichtigungen steuern

  - [--coloring:]
  - [-e: eMailAdresse an die die Benachrichtigung geschickt wird](general-options.md#parm_e)
  - [-E: Optionale Parameter für die eMailClientProgramme](general-options.md#parm_E)
  - [--eMailColoring: Steuerung wo der genutzte eMailClient Colorierungnsinformationen akzeptiert](general-options.md#parm_eMailColoring)
  - [-F: Simuliert den Backuplauf und hilft die eMailBenachrichtgung schnell zu testen](backup-options.md#parm_F)
  - [-s: eMailClientProgramm welches benutzt wird um die eMail zu verschicken](general-options.md#parm_s)

<a name="maintenance"></a> 
### Optionen, die den Update, Restore und lokale Verteilung von *raspiBackup* steuern

  - [-S:]
  - [-U: Update von *raspiBackup* mit der aktuellsten Version und Sicherung der alten Version](general-options.md#parm_U)
  - [-V: Reaktivierung einer vorhergehenden *raspiBackup* Version](general-options.md#parm_V)
  - [-y: Kopie der aktuellen *raspiBackup* Version auf vordefinierte lokale Hosts per scp](general-options.md#parm_y)

<a name="start-stop-extensions"></a> 
### Optionen, die Services vor dem Backup starten und stoppen sowie Erweiterungen

  - [-o: Befehle, die Services vor dem Backup stoppen](backup-options.md#parm_o)
  - [-a: Befehle, die Services nach dem Backup starten](backup-options.md#parm_a)
  - [-N: Erweiterungen, die vor und nach dem Backup aufgerufen werden sollen](backup-options.md#parm_N)

<a name="miscellaneous"></a> 
### Weitere Optionen

  - [-f: Angabe einer Konfigurationsdatei](usage-and-options.md#parm_f)
  - [-g: Fortschrittsanzeige](general-options.md#parm_g)
  - [--unsupportedEnvironment:]
  - [--updateConfig:]

[.status]: restructured
[.source]: https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen
[.source]: https://www.linux-tips-and-tricks.de/en/invocation-and-options
