## Thematische Sortierung der Optionen (Auswahl)

### Optionen, die das Backup beschreiben

  - [-k : Anzahl der Backups die vorgehalten werden sollen](usage-and-options-simonz3.md#parm_k)
  - [--keep_{type}: Anzahl der jeweiligen Backuptypen, die vorgehalten werden sollen](usage-and-options-simonz3.md#parm_keepType)
  - [-t : Typ des Backups (dd, tar, rsync)](usage-and-options-simonz3.md#parm_t)
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
