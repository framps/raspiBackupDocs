# Ausgeführte Regressiontests vor der Veröffentlichung einer neuen Release

Jede neue Version von *raspiBackup* wird vor der Veröffentlichung einem
Regressionstest unterzogen. Bedingt durch die vielen Optionen und möglichen
Hardware- und Softwareumgebungen ist leider kein vollständiger Regressiontest
möglich.

Der Regressiontest wird in einer virtualisierten Umgebung auf einem Linux
Desktop, in der eine [Raspi per Qemu](https://linux-tips-and-tricks.de/de/raspberryd/22-wie-kann-man-raspberry-pi-unter-kvm-emulieren) simuliert, wird durchgeführt.
Ansonsten würde der Verschleiss von SD Karten sehr hoch sein.

Als Basis wird ein *RaspbianOS Lite* genommen.
Dieses wird mit den Standardoptionen mit *raspiBackup* per
`dd`, `tar` und `rsync` im normalen Modus gesichert. Das sowohl für ein reines SD
Kartensystem wie auch ein reines USB Bootsystem. Ausserdem wird ein `tar` und
`rsync` Backup im partitionsorientierten Modus erstellt.

Danach werden alle jeweiligen Backups mit *raspiBackup* wieder restored und die
Images per Qemu gestartet und die folgenden Tests durchgeführt:

  - Die Datei `/boot/cmdline.txt` wird aus der VM per `scp` auf den Host downloaded und geprüft.
  - Die Datei `/etc/fstab` wird aus der VM per `scp` auf den Host downloaded und geprüft.
  - Die IP 8.8.8.8 wird in der VM gepinged und getestet, ob der ping erfolgreich war.
  - Die Anzahl der aktiven Services des Original Images wird mit verfiziert `service --status-all`

Jedem Benutzer von *raspiBackup*, der darüberhinausgehende Optionen benutzt, wird
dringend nahegelegt, nach einem Versionsupgrade von *raspiBackup* den Backup und
Restore wieder sorgfältig zu testen. Es wird in diesem Kontext auf den
[Haftungsausschluss](introduction.md#haftungsausschluss) hingewiesen.


[.status]: rft
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/509-raspibackup-ausgefuehrte-regressiontests
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/510-raspibackup-regressiontests-executed
