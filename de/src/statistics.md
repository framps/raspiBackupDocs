# Statistiken

 *raspiBackup* prüft bei jedem Start einmal pro Tag, ob es eine neue *raspiBackup*
 Release oder eine Beta gibt und weist dann mit einer Meldung darauf hin, so
 dass ein Upgrade geplant und durchgeführt werden kann. Bei dieser Prüfung
 werden auch ein paar Informationen übermittelt, die es ermöglichen, allgemeine
 Nutzungsdaten von *raspiBackup* zu ermitteln und sich einen Überblick über die
 jeweilige Nutzung zu verschaffen. Z.B. gibt es für den Januar 2022 folgende
 Nutzungsdaten von raspiBackup:

  - 1500 Aufrufe pro Tag im Mittel
  - 2300 Aufrufe am Sonntag im Mittel
  - `rsync` und `dd` werden jeweils zu 40% genutzt. `tar` wird zu 20% genutzt
  - Partitionsorientierter Modus wird so gut wie nicht genutzt


Die Informationen, die übertragen werden sind

  - Release
  - Backuptyp
  - Backupmodus
  - Backup- oder Restoreaufruf
  - Keep
  - Parameter der intelligenten Rotationsstrategie sofern sie genutzt wird
  - OS: *Raspberry Pi OS* oder *Ubuntu*


Das Senden dieser o.g. Informationen kann mit der Option

    DEFAULT_SEND_STATS=0

in der Konfigurationsdatei `/usr/local/etc/raspiBackup.conf` ausgeschaltet werden.



Im Monat Mai 2024 sehen die Nutzungsdaten wie folgt aus:

  - 1900 Aufrufe pro Tag im Mittel
  - 3057 Aufrufe am Sonntag im Mittel
  - `rsync` wird zu 48% genutzt. `dd` zu 32% und `tar` wird zu 20% genutzt
  - Partitionsorientierter Modus wird zu 4% genutzt
  - Keep Strategie wird zu 64% genutzt und smart recycle Strategie zu 36%


[.status]: done
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackup#stats

