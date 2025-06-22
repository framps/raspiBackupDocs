# Wiederherstellen - Restore

*raspiBackup* kann erstellte Backups naürlich auch wieder restoren.

Dabei handelt es sich um [**komplette** Wiederherstellungen.](full-restore.md) bei dem normalen Backupmodus bei dem alle Partitionen restored werden.
Bei einem partitionsorientierten Modus kann dagegen beim Restore ausgewählt werden welche Paritionen restored werden sollen. Wird beim partitionsorientierten Modus
der rsync Backuptyp genutzt kann bei einem Restore auch ein Deltarestore gewählt werden. D.h. es werden mit rsync nur die geänderten Dateien und gelöschte Dateien aus dem Backup
kopiert sowie nicht im Backup vorhandene Dateien - also neu erstellte Dateien - gelöscht. 

Unabhängig von *raspiBackup* ist auch ein [manueller Restore](manual-restore.md)
der Daten mit den zuvor benutzten Backuptools `dd`, `tar` oder `rsync` möglich. Dazu sind dann entsprechende Kenntnisse der Linux Backuptools notwendig.

Ebenso ist manuell auch die [Wiederherstellung einzelner Dateien/Verzeichnisse](how-to-retrieve-single-files-or-directories-from-the-backup.md) möglich.

[.status]: rft "Ready for translation"
