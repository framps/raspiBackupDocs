# Installation in 5 Minuten

https://linux-tips-and-tricks.de/de/installation

Hinweis: Es gibt auch eine von einem raspiBackup Nutzer erstellte [Installationsanleitung für raspiBackup](https://forum-raspberrypi.de/article/7-raspibackup-installation-grundeinstellungen-erstes-backup-und-restore/)
auf dem deutschen Raspberryforum.

Die Dokumentation von raspiBackup ist durch Erweiterungswünsche von Benutzern
mittlerweile sehr umfangreich geworden. Auf dieser Seite wird deshalb kurz und
knapp Schritt für Schritt erklärt wie man raspiBackup direkt benutzt um sofort
ein Backup zu erstellen oder in 5 Minuten raspiBackup installiert und
konfiguriert und dann ein Backup der Raspberry erstellen kann. Der Restore ist
dann hier für die unterschiedlichen Benutzer mit ihren jeweiligen primären
Platformen (Linux, Mac oder Windows) beschrieben. Nachdem man dann sowohl den
Backup als auch den Restore getestet hat und geprüft hat welche Services vor
dem Backup gestoppt werden müssen lässt man dann raspiBackup automatisch im
gewünschten Intervall per systemd timer laufen. Danach kann man in einer
stillen Stunde sämtliche Möglichkeiten von raspiBackup hier nachlesen und die
Konfiguration den speziellen Bedürfnissen anpassen. In jedem Falle sollte jeder
sich die [FAQs](faq.md) durchlesen. Der raspiBackup Installer ermöglicht auch raspiBackup
wieder komplett zu deinstallieren falls sich nach der Installation und beim
Test herausstellen sollte das raspiBackup nicht den Anforderungen genügt.

**Hinweis:**  5 Minuten braucht jemand der Basiskenntnisse von Linux hat. Wer diese
nicht hat braucht natürlich länger trotz dass der Installer hilft eine
raspiBackup Anfangskonfiguration schnell zu erstellen - leider.

Bitte erst lesen: [Unterstützte Hard- und Software]()

Supportkanäle: [Die sind hier beschrieben](kontaktmoeglichkeiten.md)



## Anwendungs- und Konfigurationsbeispiele

Auf dieser Seite werden verschiedene Beispiele gegeben wie man raspiBackup bei
sich einsetzen kann. Diese Beispiele sollten sich vor der eigentlichen
Installation angesehen werden um bei der Konfiguration während der Installation
die richtigen Parameter zu benutzen.


## raspiBackup installieren und automatisch regelmäßig ein Backup erstellen

raspiBackup hat einen UI installer, mit dem sich raspiBackup wie mit
raspi-config recht einfach installieren und die primären Optionen konfigurieren
lassen. Alle weiteren Optionen müssen in der Konfigurationsdatei
/usr/local/etc/raspiBackup.conf mit einem Editor konfiuriert werden. Ausserdem
lassen sich recht einfach jederzeit die primären Optionen durch erneuten Aufruf
von raspiBackupInstallUI nachträglich ändern. Dazu gehört auch eine
Updatefunktion für den Installer sowie für raspiBackup. Die
Installationsführung erfolgt über Menus sowie Auswahllisten. Die Menüsprache
kann Deutsch, Englisch. Finnisch, Chinesisch oder Französisch sein. Falls es
Probleme geben sollte bitte das Problem hier in einem Kommentar berichten oder
noch besser - im github einen Issue aufmachen (Gerne auch in Deutsch).

Wer raspiBackup einfach nur mit einer Standardkonfiguration ohne individuelle
Konfiguration schnell installieren will kann das mit den Aufrufoptionen -i und
-e starten (-h fuer Hilfe benutzen). Danach ist dann aber sämtliche raspiBackup
Konfiguration manuell vorzunehmen. Wer raspiBackup manuell installiere will
findet hier die Anleitung dazu. Auf Youtube existiert auch ein Video auf dem
raspiBackup vorgestellt wird sowie am Ende eine Demo der Installation von
raspiBackup gegeben wird.

![Screenshot Konfiguration (2019)](images/Screenshot_at_2019-04-10_07-52-15.png)



Zum Download, der Installation und Start des raspiBackup Installers folgendes auf der Raspberry in der Befehlszeile eingeben:

curl -o install -L https://raspibackup.linux-tips-and-tricks.de/install; sudo bash ./install



Hinweis: Es existiert auch eine Anleitung um raspiBackup manuell ohne sudo Nutzung zu installieren.



Danach kann man die Installation wählen bei der eine Standardkonfiguration
benutzt wird. Anschliessend ist es möglich die wesentlichen
Standardkonfigurationsoptionen im Konfigurationsmenu zu ändern. Zum Schluss
kann man die wöchentliche Sicherung mit raspiBackup einschalten.

In der Standardkonfiguration geht raspiBackup davon aus dass es einen
Mountpoint /backup gibt unter dem das Backupverzeichnis gemounted ist. Diesen
kann sollte man mit sudo mkdir /backup erstellen und dann dort das externe
Backupverzeichnis mounten.

Der Installer kann jederzeit wieder in der Befehlszeile mit sudo
raspiBackupInstallUI.sh aufgerufen werden um raspiBackup Konfigurationen zu
ändern oder auch raspiBackup zu deinstallieren.

Hinweis: Die raspiBackup Systemd Konfigurationsdatei ist
/etc/systemd/system/raspiBackup.timer. Die Systemdkonfiguration sollte immer
mit dem Installer geändert werden. Manuelle Änderungen in der Datei sollten
vorsichtig vorgenommen werden. Sie könnte dazu führen dass der Installer die
Konfigurationsdatei nicht mehr ändern kann.

Sollte es Probleme geben: Es wird vom Installer immer ein Debuglog
/root/raspiBackupInstallUI.log angelegt welches hilft die Problemursache zu
finden.

## Installationsdemo

Hinweis: Finnische, französische, englische und chinesische Sprachuntertützung steht ebenfalls zur Verfügung

![Installationsdemovideo](images/raspiBackupInstall_de.gif)

Hinweis

Benachrichtgungen per eMail benötigen einen korrekt konfigurierten lokalen MTA
wie postfix, nullmailer, msmtp oder exim4. Wird Pushover, Slack oder Telegram
genutzt muss die Konfigurationsdatei von raspiBackup vorher manuell
entsprechend mit den benötigten Konfigurationsdaten versehen werden. Ein
Benachrichtigungstest kann am schnellsten mit der Option -F durchgeführt
werden.

Achtung

Ein Backup nützt nichts wenn in dem Moment, wo man es einspielen möchte,
feststellt, das das Backup nicht zu gebrauchen ist. Desshalb sollte man nach
dem ersten erfolgreichen Backup auch sofort den Restore testen und immer wieder
von Zeit zu Zeit den ganzen Restoreprozess durchexerzieren und damit testen ob
die erstellten Backups OK sind und sich ein System damit funktionsfähig
restaurieren läßt. Ab der Version 0.6.4.1 erinnert raspiBackup in regelmäßigen
Abständen daran. Das Erinnerungsintervall ist konfigurierbar. Der Standardwert
ist alle 6 Monate.

Besonders wichtig ist das auch wenn ein neues System mit einem neuen
Betriebssystem wieder mit raspiBackup gesichert wird. Es gibt immer wieder
Änderungen bei neuen Betriebssystemversionen die dazu beitragen können dass der
Restore nicht mehr funktioniert.

## Downloadlinks auf raspiBackup und den raspiBackupInstaller

Wer sich vorher den Sourceode von raspiBackup und/oder den Installer
raspiBackupInstallUI ansehen will kann sich diese über den folgenden
Downloadlink ansehen:

Download raspiBackup

Download raspiBackupInstallUI


## Erstellen und Wiederherstellen eines Backups

Nachdem raspiBackup installiert wurde sind folgende Schritte notwendig um ein Backup zu erstellen.

Der Standardmountpunkt von raspiBackup wo die Backups abgelegt werden (Annahme dass der Standardmountpunkt benutzt wird) wird angelegt mit

sudo mkdir /backup

Anschließend muss ein externes Gerät (USB Platte, USB Stick, nfs Laufwerk, ...)
auf diesen Mountpoint gemounted werden. Im folgenden Beispiel wird eine externe
USB Platte bzw ein externer USB Stick gemountet.

sudo mount /dev/sda1 /backup

Dabei ist zu beachten dass die Partition je nach gewünschtem Backuptyp ein
gewisses Filesystem voraussetzt. Die Anhängigkeiten sind hier erklärt. Außerdem
sollte man wenn es denn nicht unbedingt möglich ist den Backuptyp dd vermeiden.
Details dazu finden sich hier.

Beim ersten Backup sollte man noch prüfen ob man auf das richtige Backupgerät
bzw die richtige Backuppartition sichert. Hilfreich sind dabei folgende
Befehle:

sudo blkid -o list
mount | grep backup

oder wenn man die Backuppartition lokal angeschlossen wurde und man ihr ein Label verpasst hat

sudo blkid -o list | grep <label>

Danach ist alles fertig konfiguriert um ein Backup zu erstellen. Dabei ist aber
zu berücksichtigen, dass, wenn man später raspiBackup regelmäßig einsetzt,
bestimmte Dienste gestoppt werden sollten, da sonst ein inkonsistentes Backup
entstehen könnte. Siehe dazu FAQ18. Braucht man keine Dienste zu stoppen oder
will man den Backup einmal schnell testen kann man wie folgt den Backup mit
raspiBackup erstellen. Das kann je nach Größe der Installation und der externen
Rootpartition beim normalen Backup etwas länger dauern.

sudo raspiBackup -m detailed



Danach sollte unbedingt ein Restoretest durchgeführt werden (Link zur
Restoredokumentation) um zu verifizieren dass ein konsistentes Backup erstellt
wird und um sich mit der Restoreprozedur vertraut zu machen.



## Standardkonfiguration und Ort der Konfigurationsdatei

Der Installer erstellt folgende Dateien:

1) Konfigurationsdatei /usr/local/etc/raspiBackup.conf

In dieser werden folgende Standardwerte eingestellt und können mit dem
Installer geändert werden. Alle anderen Optionen müssen mit einem Editor
geändert werden oder mit einer Aufrufoption überschrieben werden.

Option 	Einstellung
Backuppfad 	/backup
Backupmode 	normal
Backuptyp 	rsync
Sprache 	Sprache des Systems
Zip 	nein
Meldungsdetail 	normal
Backupanzahl 	3
Services start 	keine
Services stop 	keine
Wöchentlicher Backup 	nein
Backuptag 	Sonntag
Backupzeit

05:00 Uhr

Details zu den Optionen finden sich hier.

 2) Systemd timer Konfiguration wird in /etc/systemd/system/raspiBackup.timer vorgenommen.

Diese Datei steuert den Aufruf von raspiBackup und im Standardfall ist der wöchentliche Backup ausgeschaltet. Er kann aber mit dem Installer eingeschaltet werden.

3) raspiBackup.sh wird in /usr/local/bin installiert

4)raspiBackupInstallUI.sh wird in /usr/local/bin installiert


## Weitere Schritte

Nachdem das erste Backup erfolgreich erstellt und wiederhergestellt wurde sollte man sich in einer ruhigen Stunde über alle weiteren Optionen von raspiBackup hier informieren und je nach Bedarf einsetzen. Eine hilfreiche Option ist z.B. -e <eMailAdresse>. Dadurch schickt raspiBackup nach jedem Backuplauf seine Meldungen per eMail an die angegebene Adresse. Weiterhin kann man bestimmte Verzeichnisse vom Backup ausschliessen sowie dd Backups verkleinern und damit beschleunigen und diverses mehr.

Jede Option kann man in der Konfigurationsdatei /usr/local/etc/raspiBackup.conf definieren so dass beim Aufruf keine weitere Optionen angegeben werden müssen. Es existieren auch Optionen, die sich nur über die Konfigurationsdatei einstellen lassen. Details dazu finden sich auf der Optionsbeschreibungsseite.

Es gibt ein nützliches Script mit dem Namen raspiBackupDialog welches die Nutzung und den Aufruf von raspiBackup vereinfacht. Einfach hier nachlesen wie man raspiBackupDialog installiert und nutzen kann.


## Deinstallation

raspiBackup kann auch wieder deinstalliert werden. Entweder benutzt man den Installer zum deinstallieren oder folgenden Befehl:

sudo raspiBackupInstallUI.sh -u


## Aufruf des Installers ohne Menus direkt von der Befehlszeile

Wer keine menugesteuerte Installation haben möchte kann die Installation von raspiBackup, den Beispielextensions oder die Deinstallation von raspiBackup von der Befehlszeile direkt aufrufen. Dabei wird die Standardkonfiguration installiert. Der Aufruf dazu ist

curl https://raspibackup.linux-tips-and-tricks.de/install | sudo bash -s -- -i

Jedwede Änderungen an der Konfiguration können nun manuell mit einem Editor vorgenommen werden. Ebenso das Einschalten des wöchentlichen Backup in der crontab. Man kann aber auch den Installer mit seinen Menus benutzen um die Konfiguration der primären Optionen anzupassen sowie den regulären Backup ein- oder auszuschalten. Der Aufruf dazu ist

sudo raspiBackupInstallUI.sh

Weitere Details zu den verschiedenen Funktionen des Installationsskriptes erfährt man durch den Aufruf der Hilfefunktion

sudo raspiBackupInstallUI.sh -h

Ab Release 0.4.8 des Installers gibt es die Option -t mit der man den Daemon auswählen kann der die regelmäßigen Backups steuert. Es ist entweder crond oder systemd. Systemd ist der Default.


## raspiBackup soll ohne Installation direkt aufgerufen werden um sofort ein Backup zu erstellen

1) Download von raspiBackup curl -sSLO  https://www.linux-tips-and-tricks.de/raspiBackup.sh

2) Mount der Backuppartition unter /backup oder Angabe der Backuppartition als letzer Parameter im Aufruf, also z.B. sudo bash ./raspiBackup.sh /media/pi

3) Start des Backups:  sudo bash ./raspiBackup.sh

4) Falls kein dd Backup gewünscht wird muss der Backuptyp tar oder rsync mit Option -t mitgegeben werden, also sudo bash ./raspiBackup.sh -t tar oder sudo bash ./raspiBackup.sh -t rsync

5) Kurzinfo zu allen Aufrufoptionen von raspiBackup erhält man mit bash ./raspiBackup.sh -


## Manuelle Installation und Konfiguration von raspiBackup

siehe [hier](manuelle-installation-und-konfiguration.md)
