# Erweiterungsmöglichkeiten von raspiBackup

Es bestehen folgende Möglichkeiten die Funktionalität des Backupscripts durch eigenen Code zu erweitern.

1) Benutzung eines selbstgeschriebenen Scriptes welches das Backupscript aufruft und Aktionen vor und nach dem Aufruf vornimmt

   Dazu gibt es das folgende Beispielscript welches individuelle
   Anpassungsmöglichkeiten bietet und muss nur geringfügig an den gekennzeichneten
   Stellen den lokalen Gegebenheiten angepasst werden. Es enthält schon Code, der
   automatisch Geräte mounted und unmounted. Das Script kann hier runtergeladen
   werden.

   Voraussetzung ist dass der Mountpoint in der /etc/fstab bereits definiert
   wurde. Anschliessend muss das Script noch an ein paar Stellen den jeweiligen
   lokalen Gegebenheiten mit einem Editor angepasst werden und dann aktiviert
   werden mit

       sudo mv raspiBackupWrapper.sh /usr/local/bin
       sudo chmod +x /usr/local/bin/raspiBackupWrapper.sh

   und dann ist raspiBackupWrapper.sh anstelle von raspiBackup.sh in der Crontab
   aufzurufen. Der Quellcode vom Wrapperscript findet sich auch auf github und
   kann durch einen Pull Request erweitert werden.

2) Benutzung von Plugins in die eigene Scripts eingehängt werden

   Vor und nach dem eigentlichen Backup wie auch dem Restore können Scripte als
   Plugins eingehängt werden. Details dazu finden sich in der Detailbeschreibung
   zu Plugins

