# Fehlermeldungen und -suche

- <https://www.linux-tips-and-tricks.de/de/raspibackupmeldungen>
- <https://www.linux-tips-and-tricks.de/en/raspibackupmessagese>

Die Fehlermeldungen sind i.d.Regel selbsterklärend. Informationsmeldungen haben
eine Nummer, die mit I endet. Warnungsmeldungen enden mit W und Fehlermeldungen
enden mit E. Eine Liste der am häufigsten auftretenden Fehlermeldungen mit
weiteren detailierten Informationen findet sich hier.

Es kann aber vorkommen dass raspiBackup nicht korrekt läuft und
Fehlernachrichten schreibt. Das liegt zu 90% Prozent an fehlerhaften
Konfigurationen oder Parametrisierung. Die Fehlermeldungen sollten auf die
konkrete Ursache hinweisen. Falls nicht helfen folgende Massnahmen den Fehler
genauer zu lokalisieren:

1) Start von raspiBackup in der Befehlszeile und nicht in der crontab um
Fehlkonfigurationen in der Crontab zu eliminieren
2) Es wird eine Logdatei raspiBackup.log bei jedem Lauf im Backupverzeichnis
erzeugt mit einer Menge detailierte Informationen und man kann man in der
Logdatei nach Fehlermeldungen und -ursachen suchen die helfen den Fehler zu
lokalisieren. Falls der Backup fehlerhaft abbricht wird die Logdatei vor dem
Aufräumen in das Homeverzeichnis des Aufrufers gesichert. Weiterhin kann auch
der Parameter -v weiterhelfen wenn Fehler in den Linux Backuptools auftreten.
3) Falls die Informationen in der Logdatei nicht helfen die Fehlerursache
selbst zu finden besteht die Möglichkeit den Fehler zu berichten. Siehe dazu
die [Hinweise](faq.md#faq12) wie Probleme berichtet werden können.



----------------------


``` admonish note title="Quelle"
<https://linux-tips-and-tricks.de/de/raspibackupmeldungen>
```

Es gibt drei Typen von Meldungen:

1) Informationen. Die Meldungsnummer endet mit dem Buchstaben I

2) Warnungen. Die Meldungsnummer endet mit dem Buchstaben W

3) Fehler. Die Meldungsnummer endet mit dem Buchstaben E

Die meisten Fehlermeldungen von raspiBackup weisen genau auf die Fehlerursache hin. In machen Fällen sind weitergehende Erklärungen notwendig die im Folgenden zu finden sind. raspiBackup hat ca 200 Fehlermeldungen und diese hier alle aufzuführen und im Detail zu erklären ist sehr viel Aufwand. Wer also eine Erklärung für eine Fehlermeldung sucht und hier nicht findet sollte erst einmal seine Suchmaschine benutzen und nach der Fehlermeldungsnummer suchen. Falls das nicht zum Erfolg fuehrt muss diese in einem Kommentar am Ende dieser Seite genau angeben werden und dann wird sie hier aufgenommen. So werden dann nach und nach alle häufigen und wichtigen Fehlermeldungen von raspiBackup hier gesammelt und erläutert.

Meldungen im Nummernbereich von 0-999 werden von raspiBackup geschrieben. Meldungen von 1000-1999 werden von den Beispielplugins geschrieben. Alle anderen Nummernbereiche werden von eigene Plugin Meldungen genutzt.

Ausserdem beendet sich raspiBackup mit einem Fehlercode der auf die Ursache hinweist. Eine Liste der Fehlercodes findet sich am Ende der Seite.

Sollte die Information zu einer Meldung nicht ausreichen hilft es oft wenn man die Meldungsnummer (RBK....) in einer Suchmaschine eingibt.


raspiBackup - Fehlermeldungen, Ursachen und Aktionen


Übersicht

RBK0005E: Backup fehlerhaft beendet. Siehe vorhergehende Fehlermeldungen.

RBK0013E: Es existieren mehr als zwei Partitionen, die nur mit dem Backuptype DD oder DDZ oder der Option -P gesichert werden können

RBK0015E: Es ist schon eine Instanz von raspiBackup aktiv.

RBK0019E: Option -a und -o nicht angegeben.

RBK0020E: Dateisystem des rsync Backupverzeichnisses %s unterstützt keine softlinks.

RBK0021E: Backupprogramm des Typs %s beendete sich mit RC %s.

RBK0027E: Kein externes Gerät an %1 verbunden. Die SD Karte würde für das Backup benutzt werden.

RBK0028E: %s ist kein Wiederherstellungsverzeichnis von raspiBackup.

RBK0030E: %s Datei Erzeugung mit dd endet fehlerhaft mit RC %s.

RBK0039E: Mail Program %s ist nicht installiert um eMail zu senden.

RBK0047E: Ein Fehler trat beim Starten von Services auf. RC %s.

RBK0048E: Ein Fehler trat beim Beenden von Services auf. RC %s.

RBK0051W: Ziel %s mit %s ist größer als 2TB und erfordert gpt statt mbr. Ansonsten werden nur 2TB genutzt.

RBK0061E: Keine Bootpartitionsdateien in %s gefunden die mit %s beginnen.

RBK0077E: Restore wurde fehlerhaft beendet. Siehe vorhergehende Fehlermeldungen.

RBK0086E: Wiederherstellungsgerät darf keine Partition sein.

RBK0087E: Restore directory %s was not created by raspiBackup.

RBK0105I: Neues Backupverzeichnis %s wird gelöscht.

RBK0109E: Nicht unterstütztes Filesystem %s auf Partition %s.

RBK0142E: Bootgerät kann nicht erkannt werden.

RBK0147E: Sicherung der Partition %s schlug fehl mit RC %s.

RBK0150W: Maximale Dateigröße im Backupverzeichnis %s ist auf 4GB begrenzt.

RBK0154E: Ein Restore ist nicht möglich wenn eine Partition von %s gemounted ist.

RBK0160E: Ziel %s mit %s ist kleiner als die Backupquelle mit %s.

RBK0164E: Es können keine Hardlinks erstellt werden. RC %s.

RBK0172E: Verzeichnis %s kann nicht erstellt werden.

RBK0178E: Erzeugung von %s Datei endet fehlerhaft mit RC %s.

RBK0196W: %s unterstützt keine Hardlinks.

RBK0197W: eMail mit %s versenden endet fehlerhaft mit RC %s.

RBK0203E: Boot device kann nicht erkannt werden. Bitte das Problem mit einem Debuglog welches mit Option '-l debug' erstellt wird berichten."

RBK0211E: Externe Partition %s die an %s gemounted ist wird mit Option -P nicht gesichert.

RBK0263E: Dateisystem auf %s unterstützt keine Linux Dateiattribute.

RBK0266E: Es fehlt die Berechtigung um Linux Dateiattribute auf %s zu erstellen (Dateisystem: %s)

RBK0268E: Es werden nur Raspberries mit Raspberry PI OS unterstützt.

RBK0273E: %s ungültige Backupverzeichnis(se) oder Dateien in %s gefunden.

RBK0274E: Das Restoregerät %s hat gemountete Partitionen. Hinweis: Ein Restore auf das aktive System ist nicht möglich.

RBK0277E: Restore ist nicht möglich wenn 'usbmount' installiert ist.

RBK1005E: bc nicht gefunden. bc muss installiert werden mit 'sudo apt-get install bc'.

Details



RBK0005E: Backup fehlerhaft beendet. Siehe vorhergehende Fehlermeldungen.

Ursache:

raspiBackup endete mit einem Fehler und hat kein Backup erstellt.

Weitere Aktionen:

Eine vorangehende Fehlermeldung beschreibt die genau Ursache des Abbruchs. Diese suchen und deren Ursache beheben.



RBK0013E: Es existieren mehr als zwei Partitionen, die nur mit dem Backuptype DD oder DDZ oder der Option -P gesichert werden können

Ursache:

raspiBackup sichert nur die ersten beiden Partitionen. Wenn mehr Partitionen existieren wird diese Meldung ausgegeben.

Weitere Aktionen:

Entweder löscht man die weiteren Partitionen oder man benutzt die Option --ignoreAdditionalPartitions.Damit wird explizit gesagt dass weitere Partitionen existieren dürfen aber NICHT gesichert werden. Alternativ kann man alles sichern mit dem backup Typ DD oder dem partitionsorientierten Modus.



RBK0015E: Es ist schon eine Instanz von raspiBackup aktiv.

Ursache:

raspiBackup verhindert dass es mehrere Male parallel gestartet wird. Entweder läuft raspiBackup noch oder der vorherige raspiBackup Lauf terminierte mit einem Fehler und der Lock wurde nicht entfernt.

Weitere Aktionen:

Mit ps -ef | grep raspiBackup kann man überprüfen ob raspiBackup gerade läuft. Wenn ja muss man warten bis sich raspiBackup beendet hat. Wenn nein muss die Datei /var/lock/raspiBackup gelöscht werden mit sudo rm /var/lock/raspiBackup


RBK0019E: Option -a und -o nicht angegeben.

Ursache:

raspiBackup erlaubt ein laufendes System zu sichern. Vor dem Backup sollten alle wichtigen laufenden Services gestoppt und am Ende wieder gestartet werden um kein inkonsistentes Backup zu erstellen. Wenn man keine zu stoppenden und zu startenden Services per Installer definiert hat müssen die Services mit den beiden Optionen im Aufruf angegeben werden.

Weitere Aktionen:

Die beiden Optionen mit entsprechenden Parametern müssen beim Aufruf mitgegeben werden oder die Services müssen mit dem Installer in der Konfigurationsdatei definiert sein. Details dazu finden sich auf der FAQ Seite.



RBK0020E: Dateisystem des rsync Backupverzeichnisses %s unterstützt keine softlinks.

Ursache:

Ein Backupdateisystem welches ein rsync Backup aufnehmen soll muss Softlinks unterstützen. Das wird nur von EXT2, EXT3 und EXT4 unterstützt. FAT32 oder NTFS unterstützen die nicht. Details dazu finden sich in FAQ19

Weitere Aktionen:

Entwerder muss die Backuppartition mit EXT2, 3 oder 4 formatiert werden oder es muss ein anderer Backuptyp wie dd oder tar benutzt werden.



RBK0021E: Backupprogramm des Typs %1 beendete sich mit RC %2.

Ursache:

Ein Backupprogramm (dd, tar oder rsync) welches von raspiBackup benutzt wird hat einen Fehler bekommen. Der RC gibt den Fehlercode an. Üblicherweise schreibt das Backupprogramm noch eine detailiertere Meldung die hilft die Ursache zu finden.

Weitere Aktionen:

RC 1 bei dd Backup meldet eine Lese- oder Schreibfehler einer Datei. Ein RC 1 bei tar sowie RC 23 oder RC 24 bei rsync bedeutet dass sich eine Datei während der Sicherung verändert hat.

RC 2 bei tar bedeutet irgendein schlimmer Fehler trat auf. Es kann auch sein dass Berechtigungen auf dam Backupgeraet fehlen oder kein freier Speicherplatz auf der Backuppartition vorhanden ist.

RC23 bei rsync kann auch ein Zugriffsproblem oder ein ACL Problem mit nfs sein. Siehe FAQ24 zum ACL Problem und nfs.

Die entsprechenden Fehlermeldungen vom Backuptool findet man wenn im die auf executeCmd Command folgenden Zeilen im Debuglog untersucht und sie werden auch auf der Konsole bzw in der eMail angezeigt.

Vorhergehende Meldungen zeigen die genaue Fehlermeldung des Backupprogramms. Falls diese nicht helfen die Ursache zu finden kann die Option -v bei tar und rsync benutzt werden um detailierte Meldungen von den Backupprogrammen im Debuglog zu erhalten die weiterhelfen

oder man fügt

DEFAULT_RSYNC_BACKUP_ADDITIONAL_OPTIONS="--info=NAME0"

in der raspiBackup Configdatei hinzu bei rsync um nur Fehlermeldungen zu loggen und ein detailiertes Log welches man mit Option -v erhält zu vermeiden.

. Danach hilft es sehr häufig die Fehlermeldung in eine Suchmaschine einzugeben um die Ursache zu finden. Auf der FAQ Seite sind viele Fehlermeldungen, deren Ursache und Fehlerbehebungsmassnahmen beschrieben. Bei rsync findet man im Debuglog nach dem Aufruf des rsync alle Fehlermeldungen von rsync und kann daraus die Ursache des Abbruchs ersehen.

Alternativ kann man Fehler von tar und rsync ignorieren lassen. Siehe dazu FAQ32.

Häufig ist aber auch die Backuppartition - speziell wenn es eine über das Netz angebundene Partition (nfs, samba) ist - das Problem. Meist sind es Netzwerkprobleme oder -fehlkonfigurationen. Auch kam es schon vor dass die Partition auf einem Gerät lag, welches Schreibfehler hatte.

Sollte ein Lesefehler vorliegen ist das ein Hinweis darauf dass die SD Karte ersetzt werden sollte. Dazu dann das letzte Backup auf eine neue SD Karte restoren.

Falls die Backuppartition per nfs gemounted ist diesen Artikel lesen.

Falls Berechtigungsprobleme existieren muss sichergestellt sein dass der Benutzer root sämtliche Rechte auf dem Backupgerät hat.



RBK0027E: Kein externes Gerät an %1 verbunden. Die SD Karte würde für das Backup benutzt werden.

Ursache:

raspiBackup prüft ob eine externe Partition am Backuppfad gemounted ist, denn wenn nicht würde das Backup auf der SD Karte gespeichert werden was keinen Sinn macht und wenn die SD Karte klein ist wird sie überlaufen.

Weitere Aktionen:

Sei nun %1 /backup welches der Standardpfad ist. Die lokale Backuppartition von einerm USB Stick oder USB Platte muss an /backup gemounted werden. Benutze einen entsprechenden Eintrag in der /etc/fstab um den Mountpunkt /backup mit einer externen Partition zu verbinden. Man kann das prüfen mit

findmnt /backup



Wenn man weiss was man tut kann man die Fehlermeldung mit der Option -c ausschalten.



RBK0028E: %s ist kein Wiederherstellungsverzeichnis von $MYNAME."

Ursache:

Es darf keine Datei angegeben werden wie z.B. die tar Datei. Es muss das Backupverzeichnis sein.

Weitere Aktionen:

Den Dateinamen weglassen und nur das Backupverzeichnis angeben.



RBK0030E: %s Datei Erzeugung mit dd endet fehlerhaft mit RC %s.

Ursache:

Beim Erstellen einer Datei mit dd trat ein Fehler auf. RC 1 bedeutet ein Lese- oder Schreibfehler.

Weitere Aktionen:

Beim Restore ist ziemlich sicher die SD Karte korrupt und eine andere SD Karte sollte benutzt werden. Beim Backup gibt es Schreibprobleme auf das Backupmedium welche gelöst werden müssen. Vorhergehende Meldungen vom Backuptool geben weitere Hinweis auf die Fehlerursache.



RBK0039E: Mail Program %s ist nicht installiert um eMail zu senden.

Ursache:

Es wurde das konfigurierte Mailprogramm zum Senden von eMails zu nutzen nicht gefunden. Ueblicherweise tritt der Fehler auf wenn man Postfix oder den Nullmailer als MTA aufgesetzt hat.

Weitere Aktionen:

Das konfigurierte eMailprogramm installieren oder bsd-mailx oder mailutils installieren.


RBK0047E: Ein Fehler trat beim Starten von Services auf. RC %s.

RBK0048E: Ein Fehler trat beim Beenden von Services auf. RC %s.

Ursache:

Die Befehle der Option -a/-o bzw des Konfigurationsparameters DEFAULT_STARTSERVICES/DEFAULT_STOPSERVICES die Services starten/stoppen sollen erzeugen einen Fehler.

Weitere Aktionen:

Man muss herausfinden welcher der Startbefehle/Stopbefehle einen Fehler hat. Deshalb gibt man jeden Startbefehl/Stopbefehl einmal per sudo ein und achtet auf Fehlermeldungen. Danach ist die Ursache der Fehlermeldung zu beseitigen.



RBK0051W: Ziel %s mit %s ist größer als 2TB und erfordert gpt statt mbr. Ansonsten werden nur 2TB genutzt.

Ursache:

Die Zielpartition ist größer als 2TB und deshalb ist darauf ein gpt notwendig. Wenn das Backup nur ein mbr hat kann die Zielpartition nur bis 2TB erweitert werden.

Weitere Aktionen:

Sofern im Backup schon ein gpt genutzt wird kann die Meldung ignoriert werden. Ansonsten muss die Zielpartition manuell mit einem gpt versehen werden und die Partitionen entsprechend manuell angelegt werden. Danach kann dann das Backup mit der Option -0 restoren und die Zielpartition wird auf die maximale Kapazität erweitert.


RBK0061E: Keine Bootpartitionsdateien in %s gefunden die mit %s beginnen.

Ursache:

raspiBackup sucht in dem Backupverzeichnis nach dem Bootpartitionsbackup und findet es nicht.

Weitere Aktionen:

Es wurde ein Verzeichnis als Backupverzeichnis angegeben welche keine oder unvollständige Backupdaten enthält. Siehe hier welche Dateien sich im Backupverzeichnis befinden müssen. Ein Backupverzeichnis beginnt immer mit dem Hostnamen der Raspberry gefolgt von dem Backuptyp und dem Erstellungsdatum des Backups. Beispiele: raspberrypi-dd-backup-20160415-222900 oder raspberrypi-rsync-backup-20160416-094106



RBK0077E: Restore wurde fehlerhaft beendet. Siehe vorhergehende Fehlermeldungen.

Ursache:

Es gab beim Restore Fehler. Das kann entweder beim Anlegen der Partitionen sein oder beim eigentlichen Restoren der Backupdaten.

Weitere Aktionen:

Zuerst eventuelle vorhergehende Fehlermledungen prüfen. Danach das Debuglog prüfen ob es beim Anlegen der Partitionen Probleme gab.  Dazu nach Checking that no-one is using this disk right now suchen und Fehlermeldungen. Es existiert ein bekanntes Problem mit einer neuen sfdisk Version in Bullseye wenn ein Backup von einem solchen System auf einem Linux mit einer älteren sfdisk version restored wird. Die Fehlermeldung ist

>>> line 5: unsupported command

Die Lösung dazu ist entweder ein Linux mit der sfdisk Version von Bullseye zu nehmen

sfdisk --version
sfdisk from util-linux 2.36.1

oder manuell die 5te Zeile in der Datei mit der Extension .sfdisk im Backupverzeichnis zu loeschen.


RBK0086E: Wiederherstellungsgerät darf keine Partition sein.

Ursache:

raspiBackup will beim Wiederherstellen des Backups auf der SD Karte Partitionen anlegen. Dazu muss die ganze SD Karte als Zielgerät angegeben werde. Eine einzelne Partition ist nicht erlaubt.

Weitere Aktionen:

Anstelle von z.B. /dev/sdb1, was eine einzelne Partition ist, muss z.B. /dev/sdb angegeben werden. Aber ACHTUNG: Sämtliche Daten auf der SD Karte werden dann überschrieben. Also vorher sicherstellen, dass keine anderen Daten auf anderen Partitionen noch benötigt werden. Siehe auch diese Seite zur Wiederherstellung.



RBK0087E: Restore directory %s was not created by raspiBackup.

Ursache:

raspiBackup generiert ein Backupverzeichnis welches einem bestimmten Format gehorcht. Sein Format muss wie folgt aussehen: <hostname>-<backuptyp>-backup-<datum>-<zeit>. Siehe dazu auch hier.

Weitere Aktionen:

Das Backupverzeichnis muss gemäß der o.g. Form umbenannt werden.



RBK0105I: Neues Backupverzeichnis %1 wird gelöscht.

Ursache:

Es trat ein Fehler auf und raspiBackup löscht das leere oder inkonsistente neue Backupverzeichnis.

Weitere Aktionen:

Eine vorhergehende Meldung weist auf einen Fehler hin der beseitigt werden muss.



RBK0109E: Nicht unterstütztes Filesystem %s auf Partition %s.

Ursache:

raspiBackup unterstützt dieses Filesystemformat nicht

Weitere Aktionen:

Erstelle einen Issue in github und es kann sein dass dann der Filesystem Support in raspiBackup eingebaut wird.



RBK0142E: Bootgerät kann nicht erkannt werden.

Ursache:

raspiBackup kann das Bootgerät erkennen. Das pasiert normalerweise wenn eine andere Hardware als eine Raspberry benutzt wird oder ein anderes Operatingsystem als Raspbian benutzt wird.

Weitere Aktionen:

Das Problem auf github oder in einem Kommentar am Ende dieser Seite berichten.



RBK0147E: Sicherung der Partition %1 schlug fehl mit RC %2.

Ursache:

raspiBackup hat einen Fehler vom benutzten Backupprogramm bekommen beim Sichern einer Parition im partitioneorientierten Modus.

Weitere Aktionen:

Siehe RBK0021E



RBK0150W: Maximale Dateigröße im Backupverzeichnis %s ist auf 4GB begrenzt.

Ursache:

Das Filesystem der Backuppartition erlaubt nur Dateigrößen von 4GB und ist so gut wie nicht nutzbar für Backups.



Weitere Aktionen:

Es muss ein anderes Filesystem auf dem Backupspace angelegt werden. Welches das sein muss hängt von der Backupmethode ab. Auf dieser Seite findet man in einer Tabelle aus der das richtige Filesystem entnommen werden kann.


RBK0154E: Ein Restore ist nicht möglich wenn eine Partition von %1 gemounted ist.

Ursache:

Wenn eine Partition neu beschrieben wird darf sie nicht gemounted sein.

Weitere Aktionen:

Mit dem Befehl sudo mount | grep <device> (<device> ist in der Meldung genannt) rausfinden welche Partition gemounted ist und mit sudo umount <partition> wobei <partition> die gemountete Partition sein muss, die Partition (z.B. /dev/sda1) freigeben.



RBK0160E: Ziel %1 mit %2 ist kleiner als die Backupquelle mit %3.

Ursache:

Das Backup ist größer als die SD Karte auf die es zurückgespielt werden soll und kann deshalb nicht zurückgespielt werden. Die Meldung kommt nur beim dd Backup. Bei tar oder rsync Backup wird automatisch die Größe angepasst.

Weitere Aktionen:

Es muss eine größere SD Karte benutzt werden. Alternativ kann man mit dem Tool pishrink das dd Image verkleinern und dann mit raspiBackup zurückspielen. Siehe auch FAQ26.



RBK0164E: Es können keine Hardlinks erstellt werden. RC %s.

Ursache:

Hardlinks die von rsync benötigt werden werden nur von einem ext3 oder ext4 Dateisystem unterstützt. Siehe dazu auch diese Seite.

Weitere Aktionen:

Entweder einen anderen Backuptyp wie tar oder dd wählen oder eine Backuppartition nutzen die ext3 oder ext4 formatiert ist.



RBK0172E: Verzeichnis %s kann nicht erstellt werden.

Ursache:

Es fehlt die Berechtigung für den Nutzer root das neue Backupverzeichnis zu erstellen.

Weitere Aktionen:

Ist das Backupverzeichnis per nfs gemounted fehlt meist die Option NO_ROOT_SQUASH in der Datei /etc/exports des nfs Servers. Ansonsten ist das Backupverzeichnis mit nicht ausreichenden Rechten gemounted.



RBK0178E: Erzeugung von %s Datei endet fehlerhaft mit RC %s."

Ursache:

dd Backup der Bootpartition schlägt mit einem Fehlercode fehl. Fehlercode RC1 ist ein Eingabe-/Ausgabefehler.

Weitere Aktionen:

Sieh nach was der Fehlercode von dd bedeutet. Wenn es RC1 ist prüfe die Bootpartition und/oder die Backuppartition.



RBK0196W: %1 unterstützt keine Hardlinks.

Ursache:

rsync benutzt Hardlinks um Backup Zeit und Space zu reduzieren. Hardlinks werden vom ext3/ext4 Filesystems welche lokal oder via nfs gemounted sind unterstützt. Samba und sshfs unterstützen keine Hardlinks.

Weitere Aktionen:

Benutze entweder eine Backuppartition welche Hardlinks unterstützt oder nutze den tar oder dd backup. Berücksichtige aber dass jeder Backup ein Vollbackup ist und entsprechend mehr Zeit und Platz benötigt.



RBK0197W: eMail mit %s versenden endet fehlerhaft mit RC %s.

Ursache:

Eine eMail kann nicht gesendet werden.

Weitere Aktionen:

Fast immer liegt die Ursache beim Aufsetzen der benachrichtigung meist in einer Fehlkonfiguration des genutzten MTAs. Häufig bekommt raspiBackup auch keinen Fehler beim Sensden der eMail aber sie kommt trotzdem nicht an. Die Konfiguration eines MTAs ist sehr oft kompliziert und ist kein Problem von raspiBackup. Im Log des verwendeten MTAs findet man Fehlermeldungen die helfen die Ursache zu finden. Es wird hier in dem Kontext auf FAQ47 verwiesen. In jedem Falle sollte man nachsehen was der RC des Mailclients bedeutet und kann daraus Hinweise finden wo die Ursache liegt. Z.B. kann es auch sein dass der Mailempfänger Probleme hat die eMail zu empfangen.


RBK0203E: Boot device kann nicht erkannt werden. Bitte das Problem mit einem Debuglog welches mit Option '-l debug' erstellt wird berichten."

Ursache:

raspiBackup versucht das Bootdevice zu erkennen und kann das aus irgendwelchen Gründen nicht.

Weitere Aktionen:

Es sollte in github Issue erstellt werden in dem das Debuglog angehängt ist um die Ursache zu finden.

Hinweis: NVMe Speicher ist nicht unterstützt. Für die Entwicklung des NVME Supports sowie einen sorgfältigen Test fehlt NVMe Speicher sowie ein Adapter. Wer will kann für den NVMe Support in raspiBackup spenden. Details dazu finden sich hier.



RBK0211E: Externe Partition %s die an %s gemounted ist wird mit Option -P nicht gesichert.

Ursache:

Mit der Option -P kann mit raspiBackup nur eine SD Karte gesichert werden.

Weitere Aktionen:

Mit der Benutzung des normalen Backup Modus kann auch ein Backup bei einem USB Boot vorgenommen werden. Sollten mehr als 2 Partitionen vorhanden sein kann mit der Option --ignoreAdditionalPartitionsdie Sicherung der weiteren Partitionen ausgeschlossen werden.



RBK0263E: Dateisystem auf %s unterstützt keine Linux Dateiattribute.

Ursache:

Die rsync Backupmethode erfordert dass die Backupparition in der Lage ist Linux Dateiattribute zu speichern. Das aktuelle Dateisystem unterstützt dieses nicht. I.d.R. ist es ein NTFS Filesystem. Falls die Backuppartition per nfs eingebunden ist ist diese Fehlermeldung ein Zeichen dafür dass die nfs Partition nicht mit no_root_squash exportiert wird.



Weitere Aktionen:

Entweder muss die Backupmethode dd oder tar gewählt werden oder es muss eine Backuppartition genutzt werden werden die Linux Dateiattribute unterstützt. Details dazu finden sich auf dieser Seite.



RBK0266E: Es fehlt die Berechtigung um Linux Dateiattribute auf %s zu erstellen (Dateisystem: %s)

Ursache:

Einer per nfs eingebundene Backuppartition fehlt die notwendige Berechtigung für root Alle Dateiattributes zu setzen. I.d.R. exportiert der NFS Server die Backuppartition nicht mit no_root_squash. Diese Option muss in der Datei /etc/exports auf dem NFS Server für die exportierte Partition genutzt werden. Auch muss ein Dateisystem exportiert werden welches Linuxdateiattribute unterstützt - also ext3 oder ext4. ntfs oder fat32 kann nicht genutzt werden.



Weitere Aktionen:

Mit no_root_squash die Backuppartition auf dem NFS Server exportieren.



RBK0268E: Es werden nur Raspberries mit Raspberry PI OS unterstützt.

Ursache:

raspiBackup wird nur für Raspberries und Raspbian unterstützt. Man kann mit der Option --unsupportedEnvironment trotzdem versuchen raspiBackup zu nutzen denn es läuft auch unter vielen anderen Linux Distributionen und raspberrykompatibler Hardware. Bei Fehlern wird aber wegen fehlender Testhard- und Software und -zeit kein Support geliefert. Siehe dazu auch hier



Weitere Aktionen:

Nutzung der Option --unsupportedEnvironment und hoffen dass raspiBackup mit der vorhandenen Software und Hardware umgehen kann.



RBK0273E: %s ungültige Backupverzeichnis(se) oder Dateien in %s gefunden."

Ursache:

Es dürfen im Backupverzeichnis eines Systems nur von raspiBackup erstellte Backupverzeichnisse existieren. Jegliche anderen Verzeichnisse oder Dateien erzeugen diese Fehlermeldung. Das passiert normalerweise wenn man manuell Backupverzeichnisse manuell umbenennt.



Weitere Aktionen:

Löschen oder Verschieben der nicht von raspiBackup erstellten Verzeichnisse oder Dateien an andere Plätze.



RBK0274E: Das Restoregerät %s hat gemountete Partitionen. Hinweis: Ein Restore auf das aktive System ist nicht mögich.

Ursache:

Ein Restore darf nicht auf ein laufendes System vorgenommen werden. Auch darf das Restorgerät nicht gemounted sein. Dieser Check verhindert dass aus Versehen ein aktives und anderweitig genutztes Gerät überschrieben wird. Falls usbmount aktiv ist muss dieses erst deaktiviert werden.



Weitere Aktionen:

Das Restoregerät muss mit umount freigegeben werden oder usbmount deaktiviert werden.



RBK0277E: Restore ist nicht möglich wenn 'usbmount' installiert ist.

Ursache:

usbmount stört beim Restore eines Backups und darf nicht installiert sein.



Weitere Aktionen:

Deinstallation von usbmount mit dem Befehl sudo apt-get remobe usbmountNoch besser ist es eine dedizierte SD Karte mit einem kleinen RaspbianOS (RaspbianOS lite) vorzubereiten und diese SD Karte zum Restore nutzen. Dort ist kein usbmount installiert.



RBK1005E: bc nicht gefunden. bc muss installiert werden mit 'sudo apt-get install bc'.

Ursache:

Die Diskbeispielsextension benoetigt bc zum berechnen.

Weitere Aktionen:

Installiere bc mit 'sudo apt-get install bc' damit die Diskbeispielextension gueltige Werte ausgibt.

Exitcodes

Im Normalfall terminiert raspiBackup mit einem Fehlercode 0. Im Falle eines Fehlers terminiert raspiBackup mit einem der folgenden Fehlercodes. Eine Fehlermeldung gibt noch genauere Informationen zu der Fehlerursache aus.

RC_ASSERTION=101
RC_MISC_ERROR=102
RC_CTRLC=103
RC_EXTENSION_ERROR=104
RC_STOP_SERVICES_ERROR=105
RC_START_SERVICES_ERROR=106
RC_PARAMETER_ERROR=107
RC_MISSING_FILES=108
RC_NATIVE_BACKUP_FAILED=109
RC_LINK_FILE_FAILED=110
RC_COLLECT_PARTITIONS_FAILED=111
RC_CREATE_PARTITIONS_FAILED=112
RC_DD_IMG_FAILED=114
RC_SDCARD_ERROR=115
RC_RESTORE_FAILED=116
RC_NATIVE_RESTORE_FAILED=117
RC_DEVICES_NOTFOUND=118
RC_CREATE_ERROR=119
RC_MISSING_COMMANDS=120
RC_NO_BOOT_FOUND=121
RC_BEFORE_START_SERVICES_ERROR=122
RC_BEFORE_STOP_SERVICES_ERROR=123
RC_EMAILPROG_ERROR=124
RC_MISSING_PARTITION=125
RC_UUIDS_NOT_UNIQUE=126
RC_INCOMPLETE_PARMS=127
RC_CONFIGVERSION_MISMATCH=128
RC_TELEGRAM_ERROR=129
RC_FILE_OPERATION_ERROR=130
RC_MOUNT_FAILED=131

RC_UNSUPPORTED_ENVIRONMENT=132
RC_RESTORE_EXTENSION_FAILS=133
RC_BACKUP_EXTENSION_FAILS=134
RC_DOWNLOAD_FAILED=135
RC_BACKUP_DIRNAME_ERROR=136
RC_RESTORE_IMPOSSIBLE=137


