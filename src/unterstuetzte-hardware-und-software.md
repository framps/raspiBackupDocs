# Unterstützte Hardware und Software

Quelle: https://linux-tips-and-tricks.de/de/raspibackupcategoried/608-unterstuetzte-hard-und-software/



![Icon](images/icons/Icon_rot_blau_final_128.png)

raspiBackup wird nur mit dem RaspbianOS und Ubuntu und Raspberry Hardware
unterstützt. Es läuft aber auch auf anderer Raspberry kompatiblen Hardware und
Linux Distributions erfolgreich. Aber es ist zu beachten dass raspiBackup die
beiden Partitionen /boot und /root benoetigt wie sie bei RaspbianOS existieren.

D.h. Du kannst raspiBackup auf dem jeweiligen Environment ausprobieren und wenn
es erfolgreich läuft kannst Du Dich freuen und es nutzen. Wenn es aber nicht
läuft bzw Fehlermeldungen bringt wird kein Support gegeben. Du kannst einen
Issue in github erstellen und das Debuglog beifügen und ich prüfe ob mit ein
paar kleinen Änderungen das Problem beseitigt werden kann. Aber auch dann
bleibt das Environment nicht unterstützt.

Unter der Tatsache, dass **raspiBackup ~~umsonst~~ gratis** ist, ist es

 1) zu teuer für mich sich alle mögliche Hardware für die Tests anzuschaffen
 1) zu aufwändig für mich alle mögliche Hardware- und Softwaretestkombinationen aufzubauen
 1) zu aufwändig für mich jeweils alles bei einer neuen Release zu testen

kann ich raspiBackup nur unter den genannten Voraussetzungen unterstüzen.



Es besteht die Möglichkeit der Donation und je nach Aufwand besteht die Möglichkeit dass auch ein nicht unterstütztes Environment von raspiBackup unterstützt wird.



raspiBackup prüft beim Aufruf ob eine unterstützte Hard- und Software vorliegt
und beendet sich sonst. Mit der Option `--unsupportedEnvironment` wird diese
Prüfung nicht vorgenommen.

