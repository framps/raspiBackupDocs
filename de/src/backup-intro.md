# Backup Einführung

*raspiBackup* erstellt im normalen Backupmodus immer ein vollständiges Backup des Systems.
Beim partitionsorientierten Backupmodus können die zu sichernden Partitionen gewählt werden.

Wurde *raspiBackup* gerade installiert und konfiguriert sollte man die ersten Backups
von der Befehlszeile erstellen und testen. Erst danach sollte der automatische Backup
konfiguriert werden.

Bei der Konfiguration der Benachrichtigungen per eMail oder den anderen Pushdiensten
hilft es sehr die Option `-F` zu nutzen denn dadurch wird kein Backup erzeugt, aber
Benachrichtigungen geschickt. So sind schnell Fehlkonfigurationen zu erkennen und
können behoben werden ohne immer auf die Beendigung eine längeren Backuplaufes
warten zu müssen.

[.status]: rst
