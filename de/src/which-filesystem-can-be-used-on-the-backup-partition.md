# Welches Dateisystem kann auf der Backuppartition benutzt werden?

Je nachdem, welche Backupmethode man bei *raspiBackup* benutzt, sollte man sich
für das richtige Dateisystem auf dem Backupgerät entscheiden. In der folgenden
Tabelle sind die verschiedenen Dateisysteme pro Backupmethode gekennzeichnet.

## Lokal angeschlossene Backuppartitionen

| Filesystem | dd        | tar       | rsync |
|------------|-----------|-----------|-------|
| fat16      | 4GB Limit | 4G Limit  | nein  |
| fat32      | ja        | ja        | nein  |
| exFat      | ja        | ja        | nein  |
| ntfs       | ja        | ja        | nein  |
| ext2/3/4   | **empfohlen** | **empfohlen** | **empfohlen** |

## Remote angeschlossene Backuppartitionen

| Filesystem | dd         | tar      | rsync      |
|------------|------------|----------|------------|
| smb/cifs   | ja   | ja | eingeschränkt <br> Geht über den Umweg mit der Nutzung eines Loopdevices. Siehe dazu auch [FAQ24](faq.md#faq24). |
| nfs        | ja   | ja | **empfohlen** <br> Die Sicherung von ACLs geht auch, aber nur über den Umweg der Nutzung eines Loopdevices. Siehe dazu auch [FAQ24](faq.md#faq24). |


[.status]: done
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/578-welches-dateisystem-kann-auf-dem-backupgeraet-benutzt-werden
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/580-which-filesystem-can-be-used-on-the-backup-partition
