# Häufige Fragen (FAQ)

``` admonish note title="Quelle"
<https://linux-tips-and-tricks.de/de/faq>
```

Häufige Fragen zu raspiBackup. Jeder neue Benutzer von raspiBackup sollte sich einmal alle Fragen und Antworten durchlesen.


## Übersicht

* [Wie entstand raspiBackup?](#faq0)
<!-- Workaround für not allowed ordered-list-entry "0" -->

1. [Ist ein Backup eines laufenden Systems zuverlässig? Sollte nicht das gesamte System vor dem Backup gestoppt werden?](#faq1)
2. [Wie kann ich ein Backup wiederherstellen](#faq2)?
3. [Was kann raspiBackup alles sichern und wiederherstellen?](#faq3)
4. [Welche Linux Sicherungsmethoden stehen zur Verfügung?](#faq4)
5. [Kann man die Sicherung auch ohne raspiBackup wiederherstellen?](#faq5)
6. [Kann man die Sicherungen mit raspiBackup auch auf kleiner und größere SD Karten wiederherstellen?](#faq6)
7. [Wie kann ich die Partitionierung der Ziel SD Karte beeinflussen?](#faq7)
8. [Auf welchen Medien kann man mit raspiBackup die Backups ablegen?](#faq8)
9. [Wie kann ich die Funktion von raspiBackup noch erweitern und zusätzlich etwas vor oder nach dem Backup und/oder Restore ausführen lassen?](#faq9)
10. [Welche eMailClients werden von raspiBackup unterstützt?](#faq10)
11. [Mein eMailClient wird leider nicht von raspiBackup unterstützt. Wie kann ich trotzdem eMails erhalten?](#faq11)
12. [Ich habe eine Frage zu oder Problem mit raspiBackup. Wie bekomme ich Hilfe?](#faq12)
13. [Ich habe einen Fehler in raspiBackup gefunden. Wo kann ich den Fehler melden und wann bekomme ich einen Fix dafür?](#faq13)
14. [Bekomme ich irgendwie automatisch mit dass es eine neue Version von raspiBackup gibt?](#faq14)
15. [Wie kann ich auf eine vorhergehende raspiBackup Version zurückgehen wenn ich nach einem Upgrade bemerke, dass die neue Version nicht so funktioniert wie ich es erwarte?](#faq15)
16. [Ich habe eine 32GB SD Karte wovon ich nur 8GB benötige. Ein dd Backup sichert aber immer 32GB, d.h 24GB zu viel.](#faq16)
17. [Wie kann ich feststellen, dass der rsync tatsächlich Backup Hardlinks benutzt um Speicherplatz zu sparen?](#faq17)
18. [Welche Services muss man vor dem Backup stoppen und anschliessend wieder starten?](#faq18)
19. [Welche Formatierung muss eine Partition haben auf der ein Backup abgelegt wird?](#faq19)
20. [Ich habe Probleme beim Sichern meiner Backups auf einer Synology. Wie kann ich die beseitigen?](#faq20)
21. [Der Inhalt der Bootpartition ändert sich doch nicht. Warum wir trotzdem immer die Bootpartition bei jedem Backup neu gesichert?](#faq21)
22. [Wie kann man verschiedene Backupkonfigurationen in verschiedenen Backupläufen benutzen?](#faq22)
23. [Ich möchte den Backupfortschritt verfolgen. Gibt es eine Option um einen Fortschrittsbalken zu erhalten?](#faq23)
24. [raspiBackup meldet einen Fehler `ACL_TYPE_ACCESS, Operation not supported` bei der Benutzung des Backuptypen rsync](#faq24)
25. [Fehlermeldung `dev/... has unsupported feature(s): metadata_csum E2FSCK: Get a newer version of e2fsck`](#faq25)
26. [Wieso bekommen ich die die Meldung `??? RBK0160E: Ziel /dev/sda mit xx GiB ist kleiner als die Backupquelle mit yy GiB`, obwohl beide SD Karten gleich gross sind?](#faq26)
27. [Ich habe ein tar oder rsync Backup und möchte das in ein dd Backup umwandeln. Geht das?](#faq27)
28. [Wieso verschwinden Dateiänderungen nach einem Reboot wieder von einem zurückgespieltem Backup?](#faq28)
29. [Ich bekomme die Meldung rsync: chown "(datei-fad)" failed: Operation not permitted (1). Wie kann ich das lösen?](#faq29)
30. [Mir gefällt raspiBackup und ich möchte die Entwicklung und den Support honorieren. Wie kann ich das tun?](#faq30)
31. [Ich bekomme eine Fehlermeldung von raspiBackup. Was kann ich tun um sie zu beseitgen?](#faq31)
32. [Nach dem Upgrade auf v0.6.3.2 bekomme ich Fehlermeldungen RBK0021E: Backupprogramm des Typs tar beendete sich mit RC 1 oder RBK0021E: Backupprogramm des Typs rsync beendete sich mit RC 23.](#faq32)
33. [Ich habe einen Cubieboard, Banana Pi, Odroid, Hummingboard, oder Beagle Board. Kann nraspiBackup diese auch sichern?](#faq33)
34. [Ich möchte mein 16GB dd Backup zurückspielen und bekommen die Meldung dass die Ziel SDKarte zu klein ist. Wieso?](#faq34)
35. [Ich möchte mein Rootfilesystem auf eine USB Platte verschieben. Kann ich das mit raspiBackup beim Restore machen?](#faq35)
36. [Was bedeuten die Returncodes (RC) mit denen raspiBackup im Fehlerfalle endet?](#faq36)
37. [Der eMail Betreff hat manchmal am Anfang ein Smiley. Was bedeuten sie?](#faq37)
38. [Wo kann ich Fragen stellen und Hilfe bekommen zu Linuxfragen und -problemen die im eigentlichen Sinne nichts mit raspiBackup zu tun haben?](#faq38)
39. [Wo finde ich das Debuglog von raspiBackup?](#faq39)
40. [Wie kann ich meine Konfigurationsdatei nach einem Versionsupdate auf den neuesten Stand bringen?](#faq40)
41. [Wo finde ich das Debuglog von raspiBackup?](#faq41)
42. [Wo können die /boot und /root Partition liegen (SD Karte und SSD bzw Platte)](#faq42)
43. [Wie finde ich alle Dokumentationsseiten zu raspiBackup bzw Seiten zu einem speziellen Thema?](#faq43)
44. [Warum startet das Image mit dem restorten Backup nicht.?](#faq44)
45. [Wie kann ich temporär im Aufruf Optionen an- und ausschalten?](#faq45)
46. [Warum ist es nicht zu empfehlen den Backuptyp dd zu benutzen?](#faq46)
47. [Wo bekomme ich Hilfe bei Linuxfragen oder -problemen die nichts mit raspiBackup im eigentlichen Sinne zu tun haben?](#faq47)
48. [Kann ich einen Backup auf ein laufendes System zurückspielen?](#faq48)
49. [Mein Backup welche ist auch SD Karte restored habe startet nicht. Warum nicht?](#faq49)
50. [Mein Backup dauert ewig. Woran kann das liegen?](#faq50)
51. [Wie werden die Statistiken der Fortschrittsanzeige berechnet ?](#faq51)
52. [Wie kann ich eine Testversion oder einen temporären Fix aus dem github downloaden und ausführen?](#faq52)
53. [Was sind raspiBackup Snapshots?](#faq53)
54. [Wie kann ich auf die boot Partitionsdateien im Backupverzeichnis zugreifen?](#faq54)
55. [Warum habe ich pötzlich PARTUUIDs doppelt auf meinem System?](#faq55)
56. [Wie kann ich raspiBackup auf einem unsupporteten System automatisch starten lassen?](#faq56)
57. [Wie kann ich raspiBackup auf ein neues Release updaten?](#faq57)
58. [Was muß ich beachten wenn ich mit rsync auf eine nfs gemountete Backuppartition sichern will?](#faq58)
59. [rsync meldet dass Dateien während des Backuprozesses am System verschwunden sind und bricht mit Returncode 24 ab. Wie kann ich das verhindern?](#faq59)




## Details

* <a name="faq0"></a>
   **Wie entstand raspiBackup?**

   Bei mir laufen zu Hause drei Raspis. Zwei davon 7/24 - also rund um die Uhr.
   Ein jeder Server sollte regelmäßig gesichert werden denn es können immer mal
   unvorhergesehene Umstände eintreten, die eine Wiederherstellung eines
   vorherigen Standes erfordern. Speziell die SD Karte der Raspberry neigt dazu
   immer mal wieder auszufallen. Um dafür gewappnet zu sein habe ich mir ein
   kleines Script geschrieben, welches zuerst ein dd Backup, dann später, da
   ein dd Backup ja immer die gesamte SD Karte sichert obwohl nur Bruchteile
   davon benutzt werden, ein tar Backup automatisch erstellte. Zum Schluss
   wurde dann ein rsync Backup implementiert um durch die Hardlinks Backupzeit
   und -space zu sparen. Nachdem ich dann mehrere Male eine Wiederherstellung
   vornehmen musste und alles gut klappte dachte ich mir dass es vielleicht
   auch anderen Raspberryfreunden hilfreich sein könnte und publizierte
   raspiBackup. Siehe auch 10 Jahre raspiBackup


1. <a name="faq1"></a>
   **Ist ein Backup eines laufenden Systems zuverlässig?
   Sollte nicht das gesamte System vor dem Backup gestoppt werden ?**

   Die sicherste Methode ist natürlich das System vollständig zu stoppen. Das
   kann man aber leider nicht regelmäßig und automatisch von cron gesteuert
   vornehmen. Wenn man alle aktiven Services wie mysql, samba, nfs, seafile,
   Owncloud, Webserver und alle anderen aktiven Services immer vor dem Backup
   stoppt um keine Dateninkonsistenzen zu erzeugen kann das Backup zum
   Wiederherstellen der Raspi genutzt werden. Stoppt man die Servies nicht
   besteht eine hohe Wahrscheinlichkeit dass das Backup inkonsistent werden
   wird. Dazu gibt es die Parameter -a und -o um die entsprechenden Stop- und
   Startbefehle vor bzw nach dem Backup auszuführen. Siehe auch FAQ 18 dazu.
   Alternativ kann ein Beispielwrapperscript erweitert werden (Siehe hier).


2. <a name="faq2"></a>
   **Wie kann ich ein Backup wiederherstellen?**

   Mit raspiBackup kann jedes Backup wieder zurückgespielt werden (Siehe hier
   die Details). Es wird aber ein Linux benötigt. Als Windowsbenutzer kann man
   win32diskimager benutzen um dd Backups wiederherzustellen. Für andere
   Backuptypen wie tar oder rsync ist ein Linux notwendig.

   Allerdings kann man dazu die Raspberry benutzen: Man bespielt eine neue SD
   Karte mit Raspbian und kopiert darauf raspiBackup. Dann schließt man einen
   externen SD Kartenleser, in die man eine SD Karte, die den Restore erhalten
   soll, einschiebt - sowie das Medium mit dem Backup an die Raspberry an.
   Danach ruft man raspiBackup auf und läßt ein gewünschtes Backup auf die
   externe SD Karte zurückschreiben. Anschliessend fährt man das System runter,
   legt die SD Karte mit dem zurückgespielten Backup ein und startet die
   Raspberry wieder.


3. <a name="faq3"></a>
   **Was kann raspiBackup alles sichern und wiederherstellen?**

   Im normalen Modus kann raspiBackup entweder zwei Partitionen sichern mit tar
   oder rsync: Die Boot und die Rootpartition die auf der SD Karte liegen. Wenn
   die Rootpartition auf ein externes Medium verlagert wurde wird auch die
   externe Rootpartition gesichert. Mit dem dd Backup wird die gesamte SD Karte
   gesichert. Dann wird aber keine externe root Partition mitgesichert.

   Im partitionsorientierten Modus werden beliebig viele Partitionen der SD
   Karte gesichert. Weitere externe Partitionen werden aber nicht gesichert.


4. <a name="faq4"></a>
   **Welche Linux Sicherungsmethoden stehen zur Verfügung?**

   Es steht der dd Backup sowie der tar und rsync Backup zur Verfügung. dd und
   tar Backups können noch mit zip komprimiert werden. Auf dieser Seite können
   die Vor- und Nachteile der jeweiligen Backupmethoden nachgelesen werden.


5. <a name="faq5"></a>
   **Kann man die Sicherung auch ohne raspiBackup wiederherstellen?**

   Das ist eine Grundvoraussetzung für raspiBackup gewesen: Es muss möglich
   sein das Backup mit entprechenden Linuxkenntnissen zu Fuss restoren zu
   können.

   Die Sicherung legt Dateien an, die die lesbaren Ausgaben von den Linux
   Befehlen sfdisk, blkid und fdisk von der SD Karte enhält. Damit läßt sich
   zuerst die Partitionsstruktur des Backups mit den entsprechenden Linuxtools
   wiederherstellen. Danach kann man die Partitionsbackups mit den
   entsprechenden Linuxtools wieder auf die Partitionen zurückspielen.


6. <a name="faq6"></a>
   **Kann man die Sicherungen mit raspiBackup auch auf kleiner und größere SD Karten wiederherstellen?**

   Beim dd Backuptyp muss man nach den Restore auf eine größere SD Karte mit
   Linux Repartitionierungstools nach der Wiederherstellung die Paritionsgröße
   anpassen wenn man für die zweite Parition sämtlichen Platz nutzen will. Ein
   dd Restore auf eine kleiner SD Kart geht nicht.

   Ohne Probleme funktioniert es bei einer kleineren oder größeren SD karte
   sofern tar oder rsync Backup und der normale Backupmodus benutzt wird. Es
   wird automatisch die Größe der root Partition entsprechend angepasst, d.h.
   entsprechend verkleinert oder vergrößert. Bei einer Vergrößerung wird die
   gesamte SD Karte benutzt. Wird von der Backup SD Karte mehr Platz benutzt
   als die Restore SD Karte hat gibt es natürlich Fehler beim Restore.
   Beispiel: Backup SD Karte ist 32GB gross und 24GB werden benutzt. Die
   Restore SD Karte ist nur 16GB gross.

   Mit der Option -0 (Null) wird keine Partitionierung der neuen SD Karte
   vorgenommen sondern die existierende Partitionierung der SD Karte genutzt.
   Man hat damit vollständige Kontrolle über die Größe der Wiederhergestellten
   Partitionen. D.h. man kann dadurch vor dem Restore genau festlegen, wie
   gross die Partitionen auf der neuen SD Karte sein sollen und somit auch auf
   kleiner SD Karten restoren. Das geht auch für partitionsorientierte Backups.

   Ein dd Backup kann nicht auf eine kleiner Karte restored werden. Vorher muss
   es verkleinert werden. Das geht z.B. so. Oder man benutzt pishrink

   Einen partitionsorientierten Backup kann man auf kleinere SD Karten restoren
   indem man die SD Karte mit ihren Partitionen vorformatiert und dann mit der
   Option -0 das Backup wiederherstellt.


7. <a name="faq7"></a>
   **Wie kann ich die Partitionierung der Ziel SD Karte beeinflussen?**

   Es gibt zwei Optionen die das Partitionierungsverhalten von raspiBackup
   beeinflussen: Option -1 (eins) zwingt raspiBackup die Partitionierung der
   Backup SD Karte auf die Ziel SD Karte zu erstellen auch wenn die Partitionen
   kleiner oder größer als die Ziel SD Karte sind. Mit der Option -0 (Null)
   nimmt raspiBackup keine Paritionierung vor und verwendet die existiernde
   Partition der Ziel SD Karte. Somit kann man vor dem Restore die Partitionen
   anlegen und formatieren wie man sie haben möchte und diese wird dann von
   raspiBackup benutzt.


8. <a name="faq8"></a>
   **Auf welchen Medien kann man mit raspiBackup die Backups ablegen?**

   Generell auf jedem Device welches unter Linux gemounted werden kann

    Externer USB Stick
    Externe USB Platte
    Synology
    cifs/samba Netzwerklaufwerk
    nfs Netzwerklaufwerk
    sshfs Netzwerklaufwerk
    webdav Netzwerklaufwerk
    ftpfs Netzwerklaufwerk


9. <a name="faq9"></a>
   **Wie kann ich die Funktion von raspiBackup noch erweitern und zusätzlich
   etwas vor oder nach dem Backup und/oder Restore ausführen lassen?**

   Da gibt es verschiedene Möglichkeiten:

   - Ein Wrapperscript (Siehe hier) wird benutzt und nimmt vor und nach dem
     Backuplauf weitere Aktionen vor wie z.B. weitere Dinge zu sichern.

   - Beliebige Erweiterungspunkte (Extensions) können vor und nach dem Backup
     und/oder restore von raspiBackup aufgerufen werden. Zwei
     Beispielerweiterungen (Siehe hier) melden zusätzlich die CPU Temperatur vor
     und nach dem Backuplauf sowie den belegten Hauptspeicher. Eine
     eMailExtension erlaubt es beliebige andere eMailClients anzusteuern.


10. <a name="faq10"></a>
    **Welche eMailClients werden von raspiBackup unterstützt?**

    raspiBackup unterstützt exim4, postfix und nullmailer, ssmtp, msmtp und
    sendEmail. Andere eMailClients können über ein eMail Erweiterung (Extension)
    angesprochen werden (Details siehe hier).


11. <a name="faq11"></a>
    **Mein eMailClient wird leider nicht von raspiBackup unterstützt. Wie kann ich trotzdem eMails erhalten?**

    raspiBackup kann eine eMailErweiterung (extension plugpoint) zum Senden der
    eMail benutzen. Dazu muss ein kleines Script geschrieben werden, welches die
    eMailParameter entsprechende dem verwendeteten eMailClient aufbereitet und
    den eMailClient mit der korrekten Syntax aufruft. Eine Beispielerweiterung
    für mailx ist bei den Erweiterungsbeispielen enthalten.


12. <a name="faq12"></a>
    **Ich habe eine Frage zu oder ein Problem mit raspiBackup. Wie bekomme ich Hilfe?**

    Eines vorweg: Die Betonung liegt auf raspiBackup Fragen. Für Linuxfragen
    oder -probleme siehe FAQ38 und FAQ47.

    Es gibt verschiedene Optionen:

    - In Github koennen Problemberichte (Issues) erstellt werden bei Fragen oder
      Problemen. Das ist meine präferierte Option. Dazu ist eine einmalige
      Registrierung notwendig. Diese sowie die Benutzung von github ist kostenlos.

    - Im Raspberry Forum gibt es ein Unterforum zu Backups wo Fragen zu
      raspiBackup gestellt und Probleme berichtet werden können. Ich werde über
      alle neuen Threads informiert und werde mich dem Thread widmen.

    - Am Ende jeder Webseite können Kommentare erstellt werden. Diese sind ideal
      um Fragen zu stellen aber für Problemberichte ungeeignet. Um Spam zu
      vermeiden werden die Kommentare manuell kontrolliert und deshalb dauert es
      i.d.R. einen Tag bis der Kommentar veröffentlicht und beantwortet wird.
      Leider gibt es wegen der DSGVO keine automatische Benachrichtigung mehr
      wenn es eine Antwort gegeben hat. Deshalb muss man nach einer gewissen
      Zeit nachsehen ob und was jemand geantwortet hat.

    - Auf Facebook können Fragen erstellt werden. Keine Problemberichte. Eine
      Registrierung ist dafür notwendig.

    Siehe auch diese Hinweise

    Hinweis: Jegliche andere Kontaktwege werden ignoriert.


13. <a name="faq13"></a>
    **Ich habe einen Fehler in raspiBackup gefunden. Wo kann ich den Fehler melden und wann bekomme ich einen Fix dafür?**

    Wie in jeder Software kann es vorkommen, dass auch raspiBackup Fehler hat.
    Die verschiedenen Kanäle über die Probleme berichtet werden können sind
    hier beschrieben.


14. <a name="faq14"></a>
    **Bekomme ich irgendwie automatisch mit dass es eine neue Version von raspiBackup gibt?**

    raspiBackup prüft bei jedem Aufruf ob es eine neuere Version gibt. Wenn ja
    wird eine entsprechende Meldung ausgegeben und die Benachrichtigungsemail
    weist im Titel mit einem Smiley ;-) darauf hin. Dann kann man auf dieser
    Seite nachlesen was die neue Version bringt und dann mit dem Parameter -U
    einen Versionsupdate vornehmen lassen.


15. <a name="faq15"></a>
    **Wie kann ich auf eine vorhergehende raspiBackup Version zurückgehen,
    wenn ich nach einem Upgrade bemerke, dass die neue Version nicht so funktioniert wie ich es erwarte?**

    raspiBackup erstelt jedes mal wenn mit der Option -U eine neue Version
    aktiviert wird eine Sicherungskopie. Mit der Option -V kann man jederzeit
    auf eine vorhergehende Version zurückgehen. Es wird eine Liste von alle
    gesicherten raspiBackup Versionen angezeigt und man kann die Version, die
    zurückgespielt werden soll daraus auswählen.


16. <a name="faq16"></a>
    **Ich habe eine 32GB SD Karte wovon ich nur 8GB benötige.
    Ein dd Backup sichert aber immer 32GB, d.h 24GB zu viel.**

    Der dd Backup sichert immer die ganze SD Karte. Es gibt den
    Konfigurationsparameter DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY, der
    dafür sorgt, dass nur die definierten Partitionen gesichert werden. D.h.
    man muss mit gparted oder einem anderen Partitionierungstool nur eine
    kleinere Partition von 8GB erstellen. Die aktuellen Partitionsgrößen kann
    man mit dem Befehl lsblk kontrollieren.

    Alternativ kann man per raspiBackupWrapper Script nach dem Backup mit
    raspiBackup pishrink aufrufen lassen und das dd Image auf das möglichste
    Minimum verkleinern.


17. <a name="faq17"></a>
    **Wie kann ich feststellen, dass der rsync Backup tatsächlich Hardlinks benutzt, um Speicherplatz zu sparen?**

    Hardlinks werden erfolgreich von raspiBackup benutzt wenn ein lokaler USB
    Stick, eine lokale USB Platte oder auch eine per nfs gemountete Partition,
    die mit ext3/ext4 formatiert ist, benutzt wird. Samba sowie sshfs
    unterstützt keine Hardlinks.

    Hinweis: Der Windows Explorer ignoriert Hardlinks und zeigt deshalb eine
    falsche effektive Belegung an. Es muss deshalb ein Linuxsystem genutzt
    werden um die Belegung zu prüfen. Die Raspberry bietet sich dafür an.

    Der Befehl sudo du -sh * zeigt den tatsächlich benutzen Speicherplatz an
    und sudo du -shl * zeigt den Speicherplatz an, der belegt werden würde,
    wenn keine Hardlinks benutzt werden würden (Das was Windows
    fälschlicherweise anzeigt) .

    Beispiel:

        root@raspberrypi:/media/nas-backup/raspberrypi# du -sh *
        4,5G raspberrypi-rsync-backup-20160822-184617
        4,5M raspberrypi-rsync-backup-20160822-190436
        5,2M raspberrypi-rsync-backup-20160822-195250
        5,7M raspberrypi-rsync-backup-20160822-201610

        root@raspberrypi:/media/nas-backup/raspberrypi# du -shl *
        4,7G raspberrypi-rsync-backup-20160822-184617
        4,7G raspberrypi-rsync-backup-20160822-190436
        4,7G raspberrypi-rsync-backup-20160822-195250
        4,7G raspberrypi-rsync-backup-20160822-2016

    Hinweis: Wie Hardlinks funktionieren ist im Detail hier im Detail
    beschrieben. Ein Youtube Video dazu findet sich hier.


18. <a name="faq18"></a>
    **Welche Services muss man vor dem Backup stoppen und anschliessend wieder starten?**

    Alle Services die irgendwelche Systemzustände in Datenbanken oder im
    Speicher oder auf dem Dateisystem speichern sollten gestoppt werden damit
    nicht während des Backups inkonsistente Datenstände entstehen die dann erst
    beim wiederhergestellten System bemerkt werden und das Backup unbrauchbar
    machen.

    Systemd Services können mit dem Installer konfiguriert werden der in der
    Konfigurationsdatei DEFAULT_STARTSERVCIES und DEFAULT_STOPSERVCIES
    entsprechend setzt. Anwendungen die nicht als Systemservices laufen müssen
    manuell mit den beiden Optionen in der Konfigdatei hinzugefügt werden.
    Danach kann der Installer nicht mehr zur Konfiguration dieser beiden
    Optionen genutzt werden.

    Folgende Services sollten auf alle Fälle gestoppt werden:

    | Service   | Stop Befehl |
    |-----------|-------------|
    | nfs       | systemctl stop nfs-kernel-server |
    | Samba     | systemctl stop samba |
    | Pilight   | systemctl stop pilight |
    | Cups      | systemctl stop cups |
    | Minidlna  | systemctl stop minidlna |
    | Apache    | systemctl stop apache2 |
    | Wordpress | systemctl stop wordpress |
    | nginx     | systemctl stop nginx |
    | mysql     | systemctl stop mysql |
    | seafile   | systemctl stop seafile |
    | Owncloud  | Siehe Apache |
    | FHEM      | systemctl stop fhem |
    | iobroker  | systemctl stop iobroker |
    | cron      | systemctl stop cron |

    Die Services sollten dann per Option DEFAULT_STARTSERVICES wieder gestartet
    werden. Die Reihenfolge sollte dann genau umgekehrt sein zu der
    Stopreihenfolge.

    Der Installer sorgt automatisch dafür dass die ausgewählten Systemd
    kontrollierten Services in der entsprechenden Reihenfolge gestoppt bzw
    gestartet werden. Leider garantiert Systemd nicht dass die Abhängigkeiten
    der Services berücksichtigt werden. Zu ein paar Anwendungen gibt es auch
    weitere Tipps auf dieser Seite die man berücksichtigen sollte.

    Beispiel für -a

        -a "systemctl startpilight && systemctlstartsamba && systemctl startnfs-kernel-server"

    Beispiel für -o

        -o "systemctl stop nfs-kernel-server && systemctl stop pilight && systemctl stop samba"

    In der Konfigurationsdatei sieht es dann z.B. wie folgt aus:

        DEFAULT_STOPSERVICES="systemctl stop nfs-kernel-server && systemctl stop pilight && systemctl stop samba"

    bzw

        DEFAULT_STARTSERVICES="systemctl startsamba&& systemctl startpilight && systemctl  startnfs-kernel-server"

    Achtung: Die Befehle werden als root ausgeführt. Es ist kein sudo
    notwendig.

    Mit der Option --systemstatuswird in das Debuglog die Liste der gestarteten
    System Services sowie der offenen Dateien vor den Start des Backups
    ausgegeben.

    Möchte man ausdrücklich keine Services stoppen und starten muss ein
    Doppelpunkt als Service angegeben werden, also -a : -o :


19. <a name="faq19"></a>
    **Welche Formatierung muss eine Partition haben auf der ein Backup abgelegt wird?**

    Prinzipiell kann jedes Filesystem benutzt werden was an Linux gemounted
    werden kann. Allerdings gibt es ein paar Dinge zu beachten:

    - Ein rsync Backup benutzt Hardlinks welche von ext3/4 unterstützt werden.
      Dann werden nur geänderte Dateien gesichert und gleiche Dateien per
      Hardlinks verknüpft. Ein ext4 Filesystem was über Samba freigegeben wird
      unterstützt keine Hardlinks. Eine Alternative ist NFS. Werden keine
      Hardlinks unterstützt kann rsync nicht genutzt werden.

    - FAT32 kann nur Dateien bis zu 4GB speichern. Ein dd Backup wird so gross
      wie die SD Karte (Ausser es wird die Konfigurationsoption
      DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY benutzt) und somit i.d.R.
      größer als 4GB. Selbiges trifft auf das tar Backup zu was auch sehr
      schnell größer als 4GB wird. Eine Alternative dazu ist NTFS.

    Allgemeine Empfehlung: Benutze wenn möglich ext3/4. Auf Linux benutze NFS
    für Netzwerklaufwerke. Auf Windows benutze NTFS auf exportierten samba
    Netzwerklaufwerken. Benutze FAT32 nur wenn sichergestellt ist, dass die
    Backups nicht größer werden als 4GB.

    WARNUNG: Wenn rsync benutzt werden soll darf kein NTFS genutzt werden! Das
    Backup scheint OK zu sein - ist es aber NICHT ! Die Linux Dateiownership
    kann nicht korrekt im NTFS Filesystem abgelegt werden. Siehe auch hier für
    zu benutzende Dateisysteme. Benutze stattdessen tar oder erstelle ein
    ext2/3/4 Dateisystem auf der Backuppartition.


20. <a name="faq20"></a>
    **Ich habe Probleme beim Sichern meiner Backups auf einer Synology. Wie kann ich die beseitigen?**

    Es gibt diverse Benutzer von raspiBackup die ihre Backups per nfs auf einer
    Synology erfolgreich sichern. Es gibt eine spezielle Seite wo ich und
    Benutzer von raspiBackup beschrieben haben, was sie an der Synology
    konfiguriert haben, damit alles funktioniert.


21. <a name="faq21"></a>
    **Der Inhalt der Bootpartition ändert sich doch nicht. Warum wir trotzdem immer die Bootpartition bei jedem Backup neu gesichert?**

    Das stimmt in 98% der Fälle. Allerdings kann ein Firmwareupdate die
    Bootpartition ändern. Mit dem Konfigurationsparameter
    DEFAULT_LINK_BOOTPARTITIONFILES werden die Bootpartitionen im Backup mit
    Hardlinks verknüpft - sofern diese unterstützt werden. Damit kann man also
    pro Backup 60MB Backupspace sparen. Allerdings wird immer die Bootpartition
    erst einmal gesichert um dann zu testen ob sie sich zum vorhergehenden
    Backup geändert hat und dann durch einen Hardlink ersetzt. D.h. diese
    Option ist nur sinnvoll, wenn man einen sehr kleinen Backupspace hat.


22. <a name="faq22"></a>
    **Wie kann man verschiedene Backupkonfigurationen in verschiedenen Backupläufen benutzen?**

    Die Konfigurationsparameter von raspiBackup werden in folgender Reihenfolge
    eingelesen und wirksam. Dabei können spätere Dateien bzw Optionen vorherige
    Optionen überschreiben.

    1. /usr/local/etc/raspiBackup.conf
    1. ./.raspiBackup.conf (aktuelles Verzeichnis)
    1. ~/.raspiBackup.conf (Home Verzeichnis)
    1. Die optionale Konfigurationdatei, die mit der Option -f angegeben wurde
    1. Aufrufparameter


23. <a name="faq23"></a>
    **Ich möchte den Backupfortschritt verfolgen. Gibt es eine Option um einen Fortschrittsbalken zu erhalten?**

    Es gibt dazu die Option -g fuer dd, tar und rsync. Die Option sollte nur
    genutzt werden wenn man raspiBackup manuell startet.


24. <a name="faq24"></a>
    **raspiBackup meldet einen Fehler `ACL_TYPE_ACCESS, Operation not supported` bei der Benutzung des Backuptypen rsync**

    Die Fehlermeldung sieht in etwas wie folgt aus:

        ??? RBK0024E: Backupprogramm rsync hat einen Fehler bekommen.
        rsync: set_acl: sys_acl_set_file(media/pi, ACL_TYPE_ACCESS): Operation not supported (95)

    Die Ursache liegt darin, dass nfs version 4 mit rsync keine Posix ACLs
    unterstützt. Diese sind aber auch in 99% der Fälle nicht notwendig. Die
    folgende Zeile in der /etc/mke2fs.conf

        default_mntopts = acl,user_xattr

    bewirkt dass jeder mount immer die acl für eine Partition einschaltet. Das
    trifft dann auch für die Backuppartition von raspiBackup zu, die
    standardmäßig auf /backup gemounted wird. Somit wird immer versucht acl
    Daten zu schreiben was von rsync nicht unterstützt wird.

    Hinweis: Synology unterstützt keine ACLs mit NFSv3 as of 13.5.2022.

    Hinweis: Mit folgendem Befehl findet mal alle Dateien mit ACLs: sudo
    getfacl -Rs /Der Befehl braucht Zeit bis er fertig ist.

    Mögliche Lösungen:

    1. Füge die folgende Zeile

           DEFAULT_RSYNC_BACKUP_OPTIONS="-aHx --delete --force --sparse"

       (kein grosses A) in `/usr/local/etc/raspiBackup.conf`
       ein und damit sichert *rsync* keine ACLs mehr.

    2. Nutze *tar* und nicht *rsync*

    3. Benutze ein lokal angeschlossenes Gerät welches mit *ext4* formatiert ist

    4. Benutze *nfs* version2 oder *nfs* version3. Lies dazu diesen Artikel. Diese
       Option funktioniert aber nicht mit einer Synology.

    5. Benutze `raspiBackupWrapper.sh`, in dem sich Code befindet, der ein Loop
       Device welches ein mit *ext4* formatiertes Image als Backuppartition
       benutzt und somit ACLs speichern kann. Details finden sich dazu [hier](http://cintrabatista.net/nfs_with_posix_acl.html).
       (Nur für erfahrene Benutzer).

    In Bullseye hat Debian persistentes Journaling eingeführt und somit
    existiert /var/log/journal mit ACLs auf dem System. Wer raspiBackup Release
    0.6.6 oder früher nutzt muss mindestens auf Release 0.6.6.1 upgraden oder
    den Workaround, der [hier](https://github.com/framps/raspiBackup/issues/393) beschrieben ist, anwenden.


25. <a name="faq25"></a>
    **Fehlermeldung `dev/... has unsupported feature(s): metadata_csum E2FSCK: Get a newer version of e2fsck`**

    Lösung:
    Vor dem Restore die /etc/mke2fs.conf editieren und bei beiden ext4 Optionen
    das metadata_csum entfernen. Dann den Restore mit raspiBackup durchführen.

    <!-- _ TODO: Workaround für Problem beim Syntax-Highlighting in vim-markdown (non-balanced-underlines -->


26. <a name="faq26"></a>
    **Wieso bekommen ich die die Meldung `??? RBK0160E: Ziel /dev/sda mit xx GiB ist kleiner als die Backupquelle mit yy GiB`
    obwohl beide SD Karten gleich gross sind?**

    SD Karten die mit einer bestimmten Grösse angegeben sind (z.B. 16GB) sind
    trotzdem unterschiedlich gross. Mit dem Befehl `sudo fdisk -l /dev/mmcblk0`
    erhält man z.B. folgende Ausgabe die einem genau die Größe mitteilt:

        sudo fdisk -l /dev/mmcblk0

        Disk /dev/mmcblk0: 15.5 GB, 15548284928 bytes
        Bei einer anderen ebenfalls 16GB grossen SD Karte erhält man z.B.
        Disk /dev/mmcblk0: 15.9 GB, 15931539456 bytes

    D.h. man kann zwar das erste Image auf die zweite SD Karte bringen aber nicht umgekehrt.

    Lösung:

    - Eine grössere SD Karte nehmen
    - Das Quellimage verkleinern. Das Tool pishrink eignet sich dazu.
    - Das Backup mit dem Parameter
      DEFAULT_DD_BACKUP_SAVE_USED_PARTITIONS_ONLY erstellen (Siehe dazu
      auch FAQ16)
    - Vor dem Erstellen des Backups die Rootpartition mit *gparted* etwas
      verkleinern (Mehrere hundert MB oder gleich 1 GB). Dann passt der
      Backup auch auf SD Karten die etwas kleiner sind.


27. <a name="faq27"></a>
    **Ich habe ein tar oder rsync Backup und möchte das in ein dd Backup umwandeln. Geht das?**

    Es gibt ein Script mit dem Namen raspiBackupRestore2Image.sh welches hier
    zu finden ist. Damit kann man im Backupverzeichnis ein dd aus einem tar
    oder rsync Backup erzeugen.


28. <a name="faq28"></a>
    **Wieso verschwinden Dateiänderungen nach einem Reboot wieder von einem zurückgespieltem Backup?**

    Die SD Karte ist unglücklicherweise an der Stelle defekt, wo das Filesystem
    Änderungen ablegt (Superblock). Da dieser im Hauptspeicher gehalten wird
    bemerkt man den Fehler nur nach einem Reboot.

    Lösung:
    Das Backup muss noch einmal auf eine neue fehlerfreie SD Karte
    zurueckgespielt werden.


29. <a name="faq29"></a>
    **Ich bekomme die Meldung rsync: chown "(datei-fad)" failed: Operation not permitted (1). Wie kann ich das lösen?**

    Kurt hat dieses Problem bekommen, die Lösung gefunden und freundlicherweise
    mitgeteilt. DougieLawson hat hier die Lösung des Problems beschrieben.

    Letztendlich musste der folgende Eintrag in der /etc/fstab

        192.168.2.203:/data/raspi /media/nas nfs defaults 0 0

    wie folgt geändert werden

        192.168.2.203:/data/raspi /media/nas nfs defaults,noatime,noauto,x-systemd.automount 0 0

    BastiFanta hat einen anderen Grund dafür gefunden:

    > Ich musste den NFS-Share mit der Option no_root_squash erstellen, siehe
    > für weitere Details: <https://www.selflinux.org/selflinux/html/nfs03.html>


30. <a name="faq30"></a>
    **Mir gefällt raspiBackup und ich möchte die Entwicklung und den Support honorieren. Wie kann ich das tun?**

    Details zu einem Trinkgeld finden sich [hier](trinkgeld.md)


31. <a name="faq31"></a>
    **Ich bekomme eine Fehlermeldung von raspiBackup. Was kann ich tun um sie zu beseitgen?**

    Es gibt eine Seite wo alle häufigsten Fehlermeldungen von raspiBackup
    genauer beschrieben sind inklusive Aktionen, mit denen man sie beseitigen
    kann. Besuche dazu diese Seite.


32. <a name="faq32"></a>
    **Nach dem Upgrade auf v0.6.3.2 bekomme ich Fehlermeldungen RBK0021E: Backupprogramm des Typs tar beendete sich mit RC 1 oder RBK0021E: Backupprogramm des Typs rsync beendete sich mit RC 23.**

    Diese Fehler wurden in vorhergehenden Versionen ignoriert. Da dadurch aber
    inkonsistente Backups erstellt werden können werden sie nicht mehr
    ignoriert.

    Folgende Optionen existieren um das Problem zu beseitigen:

      - Stoppe den Service der die Datei während des Backups ändert. Das kann
        man entweder mit dem Installer vornehmen (M3->C6) sofern es ein System
        Service ist oder man muss manuell in der Konfigurationsdatei die beiden
        Optionen DEFAULT_STOPSERVICES und DEFAULT_STARTSERVICES um die Befehle
        erweiteren um den Service zu stoppen und zu starten.
        Tipp: Mit der Option --systemstatus erhält man im Debuglog eine Liste
        der aktiven Services und ihrer offenen Dateien. Damit kann man
        herausfinden welcher Service eine Datei während des Backups
        modifiziert.

      - Mit der option DEFAULT_EXCLUDE_LIST kann man die Dateien die sich
        während des Backups ändern vom Backup ausnehmen Achtung: Wenn diese
        Dateien wichtige Dateien einer Anwendung sind dann wird die restorte
        Anwendung nicht mehr starten. Also dringend vorher prüfen ob sich
        wichtig ist und gründlich testen ob die restorte Anwendung wieder
        startet wenn die Dateien fehlen..

      - inotifywait -m -e delete -e create -e move -e modify -e attrib <Verzeichnis>

    U.U. muss noch die Option -r zugefügt werden damit auch alle
    Unterverzeichnisse überwacht werden.


33. <a name="faq33"></a>
    **Ich habe einen Cubieboard, Banana Pi, Odroid, Hummingboard, oder Beagle Board. Kann nraspiBackup diese auch sichern?**

    Prinzipiell sollte das gehen bzw geht es schon für bestimmte nicht
    Raspberry Hardware. Einfach ausprobieren. raspiBackup wird aber nur für
    RaspbianOS und Raspberry HW unterstützt. D.h. wenn es funktioniert sei
    glücklich. Wenn es nicht funktioniert frage aber nicht nach Support. :-)


34. <a name="faq34"></a>
    **Ich möchte mein 16GB dd Backup zurückspielen und bekommen die Meldung dass die Ziel SDKarte zu klein ist. Wieso?**

    SD Karten haben zwar eine bestimmte Größe wie z.B. 16GB aber sie SD Karten
    haben nie genau diese Größe sondern es gibt kleine Abweichungen nach unten
    und oben. Da das dd Backup genauso gross ist wie die SD Karte kann das dd
    Backup nciht zurueckgeschrieben werden wenn man eine geringfuegig kleinere
    SD Karte erwischt. Deshalb sollte man bei einem DD Backup die letzte
    Partition immer etwas kleiner als maximal möglich erstellen. Siehe dazu
    auch FAQ16. Man kann aber mit pishrink das dd Image verkleinern und danach
    mit raspiBackup zurücksichern.


35. <a name="faq35"></a>
    **Ich möchte mein Rootfilesystem auf eine USB Platte verschieben. Kann ich das mit raspiBackup beim Restore machen?**

    Sofern es ein tar oder rsync Backup ist geht das. Einfach bei Restore die
    Option -R nutzen.


36. <a name="faq36"></a>
    **Was bedeuten die Returncodes (RC) mit denen raspiBackup im Fehlerfalle endet?**

        101 - Ein Programmfehler wurde festgestellt
        102 - Ein Linux Befehl liefert einen Fehler
        103 - raspiBackup wurde mit CTRLC beendet.
        104 - Eine Erweiterung hat einen Fehler gemeldet
        105 - Beim Stoppen von Services gab es Fehler
        106 - Beim Starten von Services gab es Fehler
        107 - Ein Parameter in einer Option ist fehlerhalft
        108 - Es werden Dateien nicht gefunden
        109 - Das verwendete Linux Backupprogramm dd, tar oder rsync hat einen Fehler beim Backup bekommen
        110 - Ein Link zu einer Datei kann nicht erstellt werden
        111 - Beim Sammeln der Partitionsinformationen gibt es Fehler
        112 - Beim Restore gibt es Fehler beim Erstellen der Partitionen
        114 - Ein dd Image kann nicht erstellt werden
        115 - Benötigte Partitionen wurden nicht gefunden
        116 - Der Restore wurde vom Benutzer abgebrochen
        117 - Das verwendete Linkx Backupprogramm dd, tar oder rsync hat einen Fehler beim Wiederherstellen bekommen

        118 - Angegebene Geraete wurden nicht gefunden
        119 - Ein Verzeichnis kann nicht angelegt werden
        120 - Linux Tools fehlen die von raspiBackup benötigt werden
        121 - Es konnte keine gültige Bootpartition gefunden werden


37. <a name="faq37"></a>
    **Der eMail Betreff hat manchmal am Anfang einen Smiley. Was bedeutet er?**

    | smiley | Bedeutung |
    | ------ | --------- |
    | ;-)    | Es gibt eine neuere Release von raspiBackup. Ein Upgrade sollte mit der Option -U vorgenommen werden. Zurückgehen kann man wieder mit der Option -V. |
    | :-D    | Es existiert eine Betaversion der nächsten raspiBackup Release. Beta Tester sind willkommen und können mit der Option -U die Beta installieren. Nach dem test kann man auf die aktuelle Version wieder mit der Option -V zurückgehen. |
    | O.o    | Eine Warnmeldung wurde geschrieben. |
    | :-(    |Die raspiBackup Release ist veraltet und enthält einen schwerwiegenden Fehler. Sie sollte dringend durch die aktuelle Release mit der Option -U ersetzt werden. |


38. <a name="faq38"></a>
    **Wo kann ich Fragen stellen und Hilfe bekommen zu Linuxfragen und -problemen die im eigentlichen Sinne nichts mit raspiBackup zu tun haben?**

    raspiBackup wurde entwickelt um auch Linux Einsteigern das Sichern ihrer
    Raspberry einfach zu ermöglichen. Allerdings sind dazu trotzdem gewisse
    Linuxkenntnisse notwendig.  Häufige Probleme mit raspiBackup sind bei Linux
    Einsteigern einfache Linuxprobleme. Diese hier auf der Webseite zu
    beantworten sprengt den Rahmen dieser Webseite. Dazu gibt es Foren mit
    kompetenten Mitgliedern die gerne helfen. Eines was ich empfehle ist das
    Deutsche Raspberry Pi Forum. Wenn man dort im Beitrag @framp einfügt werde
    ich über den Beitrag automatisch informiert und kann ggf Informationen zu
    raspiBackup zufügen.


39. <a name="faq39"></a>
    **Wo finde ich das Debuglog von raspiBackup?**

    Das Debuglog eines Backuplaufes raspiBackup.log sowie die Meldungen
    raspiBackup.msg wird während des Backuplaufes im /tmp Verzeichnis angelegt.
    Wenn der Backuplauf erfolgreich war werden die Dateien ins
    Backupverzeichnis kopiert. Wenn der Backup fehlerhaft abbricht werden die
    Logs ins Homeverzeichnis des Aufrufers kopiert. Bricht der automatischen
    Backuplauf ab ist das Homeverzeichnis /root. Mit der Option -L kann man das
    Ziel der Log- und Msgdatei ändern.

    Das Debuglog eines Restorelaufes findet sich im Homeverzeichnis des
    Aufrufers und hat die Extension logr bzw msgr.


40. <a name="faq40"></a>
    **Wie kann ich meine Konfiguration nach einem Versionsupdate auf den neuesten Stand bringen?**

    In der Regel gibt es bei Versionsudates neue Konfigurationsoptionen. Diese
    kann man natürlich manuell einpflegen. Einfacher geht es aber mit einem
    kleinen Scriptwelches automatisch eine neue Konfigurationsdatei erstellt
    die alle aktuellen Optionen beinhaltet und die eigenen lokalen Optionen
    automatisch zusammenfügt. Sofern es Konflikte beim Zusammenfügen gibt gibt
    muss man diese manuell lösen. Details zu dem Script finden sich hier.


41. <a name="faq41"></a>
    **Wo finde ich das Debuglog von raspiBackup?**

    Das Debuglog heisst raspiBackup.log beim Backup und raspiBackup.logr beim
    Restore.

    - Wenn raspiBackup erfolgreich endet steht das Logfile im Backupverzeichnis
    - Wenn raspiBackup nicht erfolgreich endet steht das Logfile im Heimverzeichnis des Aufrufers
        - Wenn raspiBackup über die Konsole gestartet wurde steht das Logfile entweder in /home/<user> oder /root
        - Wenn raspiBackup über Cron oder systemd im Hintergrund gestartet wurde steht das Logfile in /root
    - Wenn raspiBackup unerwartet ende oder mit kill gestoppt wurde findet sich das Logfile in /tmp
    - Das Logfile beim Restore steht entweder in  /home/<user> oder /root


42. <a name="faq42"></a>
    **Wo können die /boot und /root Partition liegen (SD Karte und SSD bzw Platte)**

    raspiBackup unterstützt folgende Konfigurationen wobei immer nur die /boot
    und /root gesichert werden. Weitere Partitionen werden ignoriert.

    - /boot und /root auf SD Karte
    - /boot auf SD Karte und /root auf SSD oder Platte
    - /boot und /root auf SSD oder Platte


43. <a name="faq43"></a>
    **Wie finde ich alle Dokumentationsseiten zu raspiBackup bzw Seiten zu einem speziellen Thema?**

    In dem Menu zu raspiBackup auf der rechten Seite finden sich die
    wichtigsten Links zu der raspiBackup Dokumentation. Alle Seiten zu
    raspiBackup werden über den letzten Menupunkt Liste aller Seiten zu
    raspiBackup angezeigt. Sucht man etwas zu einem speziellen Thema kann man
    das Stichwort auch oben rechts in das Suchfeld eintragen und danach auf
    dieser Webseite suchen.


44. <a name="faq44"></a>
    **Warum startet das Image mit dem restorten Backup nicht?**

    Diese Frage wird immer wieder gestellt und die Ursache liegt zu 90% darin
    dass die SD Karte die für den Restore benutzt wurde defekt ist.


45. <a name="faq45"></a>
    **Wie kann ich Optione temporär im Aufruf an- und ausschalten?**

    Viele Optionen dienen dazu etwas ein- oder auszuschalten. Normalerweise
    definiert man die Optionen einmal in der Konfigurationsdatei und gut ist.
    Möchte man aber kurzzeitig Optionen der Konfigurationsdatei überschreiben
    kann man die Option mit einem + für einschalten und - für ausschalten
    benutzen. Beispiel: Hat man standardmässig das Zippen von dd Backups
    eingeschaltet kann man das temporär mit der Option  -z- ausschalten.


46. <a name="faq46"></a>
    **Warum ist es nicht zu empfehlen den Backuptyp dd zu benutzen?**

    Siehe dazu diesen Artiklel.


47. <a name="faq47"></a>
    **Wo bekomme ich Hilfe bei reinen Linuxfragen oder -problemen die nichts mit raspiBackup im eigentlichen Sinne zu tun haben?**

    Häufig gibt es Fragen oder Probleme bei der Konfiguration von raspiBackup
    die reine Linuxfragen oder -probleme sind. Diese werden in keinen
    Kontaktkanälen beantwortet denn das geht über den Support von raspiBackup
    den ich gebe hinaus und werden mit einem Hinweis auf FAQ 47 beantwortet.
    Ansonsten bin ich 7/24 beschäftigt.

    Es gibt ein gutes deutsches Raspberry Forum mit sehr kompetenten
    Forenteilnehmern die helfen gerne bei allgemeinen Fragen oder Problemen zur
    Raspberry und Linux. Siehe auch FAQ38. Sollte meine Hilfe erforderlich sein
    mich einfach mit @framp auf den Thread aufmerksam machen .


48. <a name="faq48"></a>
    **Kann ich den Backup auf ein laufendes System zurückspielen?**

    Technisch geht das aber das Ergebnis ist alles andere als ein laufendes
    System. Deshalb bricht raspiBackup sofort ab wenn man das versucht. Man
    muss immer den Restore auf eine weitere SD Karte die per USB SD Kartenlesen
    an die Raspberry angeschlossen ist vornehmen.


49. <a name="faq49"></a>
    **Mein Backup welche ist auch SD Karte restored habe startet nicht. Warum nicht?**

    In 99.9% der Fälle ist die SD Karte auf die restored wird defekt. Wenn man
    auf eine andere, möglichst neue, SD Karte restored tritt das Problem
    üblicherweise nicht mehr auf. Es gibt auch die Option -C die man beim
    Restore nutzen kann um die SD Karte auf Bad Blocks beim Formatieren zu
    prüfen. Dadurch dauert aber der Restoreprozess wesentlich laenger. Siehe
    auch diese Seite zu Problemen eines dd Backups.


50. <a name="faq50"></a>
    **Mein Backup oder restore dauert ewig. Woran kann das liegen?**

    Die Backup- wie auch Restorezeit ist abhängig von der Größe der zu
    sichernden Daten wie auch der Performance der Backuppartition. Wird über
    das Netz per Samba oder nfs gesichert dauert es noch einmal länger. Beim
    rsync dauert der erste Backup länger da das erste Backup ein Vollbackup
    ist. Erst die folgenden Backups sind nur noch inkrementelle Backups und
    deshalb i.d.R. schneller.

    Es kann vorkommen dass der Backup- oder Restorelauf nicht endet bzw extrem
    lange dauert. Das liegt i.d.R. daran dass Fehler bei der Sicherung
    auftreten - Schreib- oder Lesefehler die von den  genutzen Linux
    Backuptools dd, tar oder rsync gemeldet werden.

    Bei rsync kann es auch daran liegen dass ACLs gesichert werden sollen aber
    dazu die Berechtigung nicht existiert oder ACLs nicht von der
    Backuppartition unterstützt werden. Letzteres trifft zu für nfs und Samba
    gemountete Backuppartitionen. Siehe dazu FAQ24.

    Falls mount Option sync genutzt wird sollte diese durch die Option async
    ersetzt werden.

    Option --timestamps hilft den Schritt zu finden wo raspiBackup so lange
    braucht. Danach hilft das Debuglog weiter.


51. <a name="faq51"></a>
    **Wie werden die Statistiken der Fortschrittsanzeige berechnet ?**

    raspiBackup berechnet nichts. Stattdessen nutzt werden die Optionen der
    angebotenen Fortschrittsanzeige genutzt. Dei dd ist es die Option
    status=progress und bei rsync die Option info=progress2. tar hat keine
    eigene Fortschrittsanzeige und es wird deshalb der Datenstrom durch pv
    gestreamt. Die Details der jeweiligen Fortschrittsanzeige sind in der
    Dokumentation den Optionen in den jeweiligen Tools und sowie dem Linux Tool
    pv erklärt.


52. <a name="faq52"></a>
    **Wie kann ich eine Testversion oder einen temporären Fix von aus dem github downloaden und ausführen?**

    Dazu gibt es ein Script im github. Dieses muss man wie folgt aufrufen:

        curl -s https://raw.githubusercontent.com/framps/raspiBackup/master/scripts/raspiBackupDownloadFromGit.sh | sudo bash -s -- <Branchname>

    Dabei muss <Branchname> der github Branch sein von dem man sich
    raspibackup.sh downloaden möchte. Danach ruft man diese raspiBackup Version
    wie folgt auf:

        sudo ./raspiBackup.sh <Optionen>


53. <a name="faq53"></a>
    **Was sind raspiBackup Snapshots?**

    raspiBackup Snapshots sind spezielle Backups mit zwei besonderen
    Eigenschaften:

    - Sie werden nicht beim Backuprecycle berücksichtigt und müssen somit
      manuell im Backupverzeichnis gelöscht werden
    - Sie haben eine Beschreibung im Backupverzeichnisnamen anhand derer ein
      raspiBackup Snapshot leicht zu erkennen ist und mit dem man eine
      sprechende Beschreibung dem Snapshot geben kann damit er leicht zu
      erkennen ist.

    Ein Snapshot wird mit der Option -M erstellt und kann sehr gut dazu genutzt
    werden beim Neuaufsetzen oder Änderungen am System zu bestimmten
    Zeitpunkten einen Snapshot zu ziehen damit man im Fehlerfalle zurückgehen
    kann. Anhand der Beschreibung kann man erkennen welchen Stand man mit dem
    Snapshot gesichert hat.


54. <a name="faq54"></a>
    **Wie kann ich auf die boot Partitionsdateien im Backupverzeichnis zugreifen?**

    raspiBackup speichert die Bootpartitionsdaten in einem Imagefile. Mit den
    folgenden Befehlen kann man auf die Dateien in diesem Image zugreifen:

        sudo losetup -f <hostname>-backup.img
        sudo mount /dev/loop0 /mnt


55. <a name="faq55"></a>
    **Warum habe ich pötzlich PARTUUIDs doppelt auf meinem System?**

    Während des Restores eine Backups wird die PARTUUID der Originalsystems für
    die Partitionen wieder genutzt. Wenn dieses restorte System an dem
    Originalsystem gemounted wird tauchen die PARTUUIDs doppelt auf und es wird
    i.d.R. Probleme beim Booten des Originalsystems geben. Für diese Fälle gibt
    es die Option -updateUUIDs beim Restore wodurch nicht dieselbe PARTUUID
    beim restorten System genutzt wird. Ab der Release 0.6.9 wird immer eine
    neue PARTUUID generiert. Will man das nicht muss mit der Option
    -updateUUIDs- dieses ausgeschaltet werden.


56. <a name="faq56"></a>
    **Wie kann ich raspiBackup auf einem unsupporteten System automatisch starten lassen?**

    Dazu muss die Datei /etc/systemd/system/raspiBackup.service geändert
    werden:

    Ändere die Zeile ExecStart=/usr/local/bin/raspiBackup.sh in

    ExecStart=/usr/local/bin/raspiBackup.sh --unsupportedEnvironment.


57. <a name="faq57"></a>
    **Wie kann ich raspiBackup auf ein neues Release updaten?**

    raspiBackup meldet wenn eine neue Release oder eine Beta verfügbar ist. Ein
    Update wird mit der Option -U gestartet. Mit der Option -V kann man wieder
    auf eine vorhergehende Release zurückgehen. Betas werden oft mehrere Male
    ergneuert. Um dann den neuesten Stand zu installieren müssen die Optionen
    -U und -S genutzt werden.


58. <a name="faq58"></a>
    **Was muß ich beachten wenn ich mit rsync auf eine nfs gemountete Backuppartition sichern will?**

    Die Partition muss vom NFS Server mit no_root_squash exportiert werden.


59. <a name="faq59"></a>
    **rsync meldet dass Dateien während des Backuprozesses am System verschwunden sind und bricht mit Returncode 24 ab. Wie kann ich das verhindern?**

    Es gibt folgende Möglichkeiten:

    - Der Service der die Datei löscht wird vor dem Backup gestoppt und wieder gestartet
    - Die Datei oder auch das Verzeichnis in der sich die Datei befindet wird vom Backup excluded
    - Wenn das alles nicht genutzt werden kann gibt es noch die Option
      DEFAULT_RSYNC_IGNORE_ERRORS="24" mit dem raspiBackup den RC24 ignoriert.

    Achtung:  Es gibt seltene Umstände in denen ein rsync RC 24 ein nicht zu
    ignorierender Fehler ist. Siehe dazu hier. D.h. man sollte möglichst
    versuchen den Fehler mit Möglichkeit 1 oder 2 zu beseitigen.

