# Updates

# Updatestrategie

Von Zeit zu Zeit wird eine neue Version von raspiBackup zum Download
bereitgestellt die neue Funktionen, Erweiterungen und kleine Fixes enthält. Auf
dieses wird von raspiBackup beim Aufruf und in der gesendeten eMail hingewiesen
und man kann dann mit dem Parameter -U die neueste Version runterladen und
aktivieren. Die aktuelle Version wird dabei gesichert und mit dem Parameter -V
kann jederzeit wieder die vorherige Version aktiviert werden. Vor dem Update
sollte man nachlesen welche Änderungen und Neuerungen in der neuen Version
enthalten sind. Diese Information dazu findet sich in der Versionshistorie.
Sollte einmal ein gravierender Fehler entdeckt werden, wird eine neue Version
sofort bereitgestellt.

Jede neue Version wird vor der Veröffentlichung regression getestet. Details
zum Regressiontest finden sich hier.

## Versionshistorie

Quelle: https://linux-tips-and-tricks.de/de/raspibackupcategoried/432-raspibackup-versionshistorie

Die aktuelle Liste der raspiBackup Releases sowie deren Neuerungen und Bugfixe finden sich [hier](https://github.com/framps/raspiBackup/releases).

## Regressiontests

Quelle: https://linux-tips-and-tricks.de/de/raspberryd/509-raspibackup-ausgefuehrte-regressiontests

Jede neue Version von raspiBackup wird vor der Veröffentlichung einem Regressionstest unterzogen. Bedingt durch die vielen Optionen und möglichen Hardware- und Softwareumgebungen ist leider kein vollständiger Regressiontest möglich. Anbei die Beschreibung wie und was genau im Regressiontest getestet wird.





Der Regressiontest wird in einer virtualisierten Umgebung auf einem Linux Desktop in der eine Raspi per Qemu simuliert wird durchgeführt. Ansonsten würde der Verschleiss von SD Karten sehr hoch sein. Als Basis wird ein Stretch-Lite Raspbian genommen. Dieses wird mit den Standardoptionen mit raspiBackup per dd, tar und rsync im normalen Modus gesichert. Das sowohl fuer ein reines SD Kartensystem wie auch ein reines USB Bootsystem. Ausserdem wird ein tar und rsync Backup im partitionsorientierten Modus erstellt. Danach werden alle jeweiligen Backups mit raspiBackup wieder restored und die Images per Qemu gestartet und danach die folgenden Tests durchgeführt:

    Die Datei /boot/cmdline.txt wird aus der VM per scp auf den Host downloaded und geprüft.
    Die Datei /etc/fstab wird aus der VM per scp auf den Host downloaded und geprüft.
    Die IP 8.8.8.8 wird in der VM gepinged und getestet ob der ping erfolgreich war.
    Die Anzahl der aktiven Services des Original Images wird mit verfiziert service --status-all

Jedem Benutzer von raspiBackup der darüberhinausgehende Optionen benutzt wird dringend nahegelegt nach einem Versionsupgrade von raspiBackup den Backup und Restore wieder sorgfältig zu testen. Es wird in diesem Kontext auf den Haftungsausschluss hingewiesen.
