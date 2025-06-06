# Snapshots

*raspiBackup* bietet mit der Option `-M` die Möglichkeit, eine Art Snapshot zu erzeugen.
Dieses sind normale Backups, die aber zwei Besonderheiten haben:

  - Snapshots werden nicht automatisch gelöscht durch die gewählte Backupstrategie
  - Snapshots muss man eine Beschreibung als Parameter zur Option `-M` mitgeben.
    Diese wird  am Ende des Verzeichnisnamens angehängt.

Somit kann man sehr leicht mal eben ein Snapshot ausser der normalen Reihe
erstellen und durch die Beschreibung kann der Grund des Snapshots am
Backupverzeichnisnamen erkannt werden. Das ist sehr hilfreich bevor man einen
Softwareupdate vornimmt oder eine andere größere Änderung plant. Wenn der
Update schief geht, hat man schnell wieder den vorherigen Stand hergestellt.
Wenn er erfolgreich war löscht man den Snapshot im Backupverzeichnis.

Es gibt auch ein [Youtube Video](https://www.youtube.com/watch?v=8BlF9B8EX6k),
in dem die *raspiBackup* Snapshots erklärt werden sowie eine Demo gegeben wird.

[.status]: done
[.source]: https://linux-tips-and-tricks.de/de/snapshots

