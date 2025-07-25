# Konfigurationsupdate bei einem Upgrade auf eine neue Version

Wann immer ein Upgrade einer *raspiBackup* Version vorgenommen wird,
erfolgt sofort eine Prüfung, ob die neue Version ein
neues Konfigurationsversion benötigt. Sofern eine neue
Konfigurationsversion benutzt wird, erfolgt eine automatische
Zusammenführung der lokalen Konfiguration mit der neuen Konfiguration in
einer neuen Konfigurationsdatei von *raspiBackup* beim Upgrade. Im
Folgenden wird im Detail beschrieben wie diese Zusammenführung
vorgenommen wird.

**Hinweis**
Beim Upgrade einer Version, die kleiner ist als 0.6.5, muss die
Zusammenführung der Konfiguration nach dem Upgrade auf 0.6.5 leider
manuell angestossen werden. Der Aufruf dazu ist

    sudo raspiBackup.sh --updateConfig


Beim Zusammenführen der beiden Konfigurationen schreibt *raspiBackup*
verschiedene Informationsmeldungen. Die folgenden Meldungen werden
beispielsweise geschrieben, wenn von *raspiBackup* 0.6.4.3 auf *raspiBackup*
0.6.5 upgraded wird.

    --- RBK0241I: Aktuelle Konfiguration v0.1.3 wird mit der neuen Konfiguration v0.1.4 in /usr/local/etc/raspiBackup.conf.merged zusammengefügt.
    --- RBK0248I: Option DEFAULT_SMART_RECYCLE=0 wurde zugefügt.
    --- RBK0248I: Option DEFAULT_SMART_RECYCLE_DRYRUN=1 wurde zugefügt.
    --- RBK0248I: Option DEFAULT_SMART_RECYCLE_OPTIONS="7 4 12 1" wurde zugefügt.
    --- RBK0248I: Option DEFAULT_TELEGRAM_TOKEN="" wurde zugefügt.
    --- RBK0248I: Option DEFAULT_TELEGRAM_CHATID="" wurde zugefügt.
    --- RBK0248I: Option DEFAULT_TELEGRAM_NOTIFICATIONS="F" wurde zugefügt.
    --- RBK0248I: Option DEFAULT_NOTIFY_START=0 wurde zugefügt.
    --- RBK0248I: Option DEFAULT_COLORING="CM" wurde zugefügt.
    --- RBK0243I: Konfigurationszusammenfügung wurde erfolgreich beendet aber nicht aktiviert.
    !!! RBK0245W: Soll die aktuelle Konfiguration in /usr/local/etc/raspiBackup.conf.bak gesichert werden und die aktualisierte Konfiguration aktiviert werden? j/N


Man sieht, dass eine neue Konfigurationsdatei
`/usr/local/etc/raspiBackup.conf.merged` erstellt wird und in dieser die
Zusammenfügung der aktuellen Konfigurationsdatei
`/usr/local/etc/raspiBackup.conf `mit der neuen Konfigurationsdatei
vorgenommen wird. Welche Änderungen vorgenommen werden, kann in den
Meldungen `RBK248` abgelesen werden. Zum Schluss wird man gefragt, ob die
zusammengefügte Konfigurationsdatei aktiviert werden soll. Natürlich
wird vorher ein Backup der existierenden Konfigurationsdatei in
`/usr/local/etc/raspiBackup.conf.bak `vorgenommen. Antwortet man mit "ja",
ist die Konfigurationszusammenfügung beendet und bekommt noch folgende
Meldungen:

    --- RBK0240I: Aktuelle Konfiguration /usr/local/etc/raspiBackup.conf wird in /usr/local/etc/raspiBackup.conf.bak gesichert.
    --- RBK0244I: Zusammengefügte Konfiguration /usr/local/etc/raspiBackup.conf.merged nach /usr/local/etc/raspiBackup.conf kopiert und aktiviert.

Das ist die einfachste Methode, um die Konfigurationsdatei zu
aktualisieren und ist schnell vorgenommen.

Man kann aber auch mit "nein" antworten und die zusammengefügte
Konfigurationsdatei nicht sofort aktivieren. Man erhält dann folgende
Meldung:

    --- RBK0247I: Nun die zusammengefügte Konfigurationsdatei /usr/local/etc/raspiBackup.conf.merged überprüfen und nach /usr/local/etc/raspiBackup.conf kopieren um den Konfigurationsupdate zu beenden.

Innerhalb der zusammengefügten Konfigurationsdatei sind die neuen
Optionen wie folgt gekennzeichnet und somit schnell zu erkennen:

    # Smart recycle
    # >>>>> NEW OPTION added in config version "0.1.4" <<<<<
    DEFAULT_SMART_RECYCLE=0
    # Smart recycle dryrun
    # >>>>> NEW OPTION added in config version "0.1.4" <<<<<
    DEFAULT_SMART_RECYCLE_DRYRUN=1
    # Smart recycle parameters (daily, weekly, monthly and yearly)
    # >>>>> NEW OPTION added in config version "0.1.4" <<<<<
    DEFAULT_SMART_RECYCLE_OPTIONS="7 4 12 1"`

D.h. nun kann man sich manuell mit einem Editor die zusammengeführte
Konfigurationsdatei `/usr/local/etc/raspiBackup.conf.merged` ansehen,
kontrollieren und wenn nötig ändern. Zum Schluss muss die Datei dann
noch nach `/usr/local/etc/raspiBackup.conf` kopiert werden, um die neue
Konfiguration zu aktivieren.

Zum Schluss sollte man wie immer nach einem Upgrade einen Backup/Restore
Zyklus durchführen, um zu testen ob noch alles wie vorher funktioniert.

*raspiBackup* unterstützt auch die Benutzung von unterschiedlichen
Konfigurationsdateien. Der automatische Konfigurationsupgrade wird nur
für die Standardkonfiguration `/usr/local/etc/raspiBackup.conf`
vorgenommen. Alle anderen Konfigurationsdateien müssen manuell erweitert
werden. Dazu muss man die als neu gekennzeichneten Konfigurationszeilen
nehmen und in die anderen Konfigurationsdateien kopieren.

[.status]: rft
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/567-raspibackup-konfigurationsupdate-nach-einem-upgrade-auf-eine-neue-version
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/570-raspibackup-configuration-update-when-upgrading-to-a-new-version

