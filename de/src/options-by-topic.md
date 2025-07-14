## Thematische Sortierung der Optionen (Auswahl)

### Backupoptionen

  - [-k : Anzahl der Backups die vorgehalten werden sollen](backup-options.md#parm_k)
  - [--keep_{type}: Anzahl der jeweiligen Backuptypen, die vorgehalten werden sollen](backup-options.md#parm_keepType)
  - [-t : Typ des Backups (dd, tar, rsync)](backup-options.md#parm_t)
  - [-P : Partitionsorientierter Backupmodus](backup-options.md#parm_P)
  - [-z: Kompression des Backups bei dd oder tar](backup-options.md#parm_z)
  - [-u: Ermöglicht weitere Verzeichnisse aus dem Backuprozess auszuschliessen](backup-options.md#parm_u)
  - [-T: Angabe der Partitionen die beim partitionsorientierten Backup gesichert werden sollen](backup-options.md#parm_T)
  - [-M: Erstellen eines *raspiBackup* Snapshots](backup-options.md#parm_M)
  - [-B: Bootpartition wird als tar gesichert statt per dd](backup-options.md#parm_B)
  - [-b: Definition der Blocksize die beim dd Backup genutzt wird](backup-options.md#parm_b)
  - [-D: Weitere Optionen für den dd Backup](backup-options.md#parm_D)
  - [--dynamicMount: Dynamisches Mounten der Backuppartition](backup-options.md#parm_dynamicMount)
  - [--ignoreAdditionalPartitions: Es werden mehr als zwei Partitionen toleriert wobei aber nur die ersten beiden Partitionen gesichert werden.](backup-options.md#parm_ignoreAdditionalPartitions)

### Restoreoptionen

  - [-g: Fortschrittsanzeige beim Restore](restore-options.md#parm_g)

### Optionen, die die Meldungen und das Log betreffen

  - [-m: Meldungsdetails](general-options.md#parm_m)
  - [-L: Verzeichnis wo das Debuglog sowie die Laufzeitmeldungen gespeichert werden](general-options.md#parm_L)
  - [-l: Einschalten des detailierten Loglevels](general-options.md#parm_l)
  - [-G: Sprache der Meldungen (Deutsch oder English)](ganeraloptions.md#parm_G)
  - [-A: Das Laufzeitlog wird bei der eMail Benachrichtigung mitgeschickt](general-options.md#parm_A)
  - [-v: Alle Meldungen des verwendeten Backuptools werden protokolliert](backup-options.md#parm_v)
  - [--coloring: Kolorierungseinstellungen bei eMails und Konsolmeldungen](general-options.md#parm_coloring)
  - [--timestamps: Alle Meldungen werden mit einem führenden Zeitstempel ausgegeben](general-options.md#parm_timestamps)

### Optionen, die Benachrichtigungen steuern

  - [-e: eMailAdresse an die die Benachrichtigung geschickt wird](usage-and-options.md#parm_e)
  - [-s: eMailClientProgramm welches benutzt wird um die eMail zu verschicken](usage-and-options.md#parm_s)
  - [-E: Optionale Parameter für die eMailClientProgramme](usage-and-options.md#parm_E)
  - [-F: Simuliert den Backuplauf und hilft die eMailBenachrichtgung schnell zu testen](usage-and-options.md#parm_F)
  - [--eMailColoring: Steuerung wo der genutzte eMailClient Colorierungnsinformationen akzeptiert](usage-and-options.md#parm_eMailColoring)

### Optionen, die den Update, Restore und lokale Verteilung von *raspiBackup* steuern

  - [-U: Update von *raspiBackup* mit der aktuellsten Version und Sicherung der alten Version](usage-and-options.md#parm_U)
  - [-V: Reaktivierung einer vorhergehenden *raspiBackup* Version](usage-and-options.md#parm_V)
  - [-y: Kopie der aktuellen *raspiBackup* Version auf vordefinierte lokale Hosts per scp](usage-and-options.md#parm_y)

### Optionen, die Services vor dem Backup starten und stoppen sowie Erweiterungen

  - [-o: Befehle, die Services vor dem Backup stoppen](usage-and-options.md#parm_o)
  - [-a: Befehle, die Services nach dem Backup starten](usage-and-options.md#parm_a)
  - [-N: Erweiterungen, die vor und nach dem Backup aufgerufen werden sollen](usage-and-options.md#parm_N)

### Weitere Optionen

  - [-f: Angabe einer Konfigurationsdatei](usage-and-options.md#parm_f)
  - [-g: Fortschrittsanzeige](general-options.md#parm_g)

[.status]: rft
[.source]: https://www.linux-tips-and-tricks.de/de/aufruf-und-optionen
[.source]: https://www.linux-tips-and-tricks.de/en/invocation-and-options
