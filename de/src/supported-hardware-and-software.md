# Unterstützte Hardware und Software

![raspiBackup icon](images/icons/Icon_rot_blau_final_128.png)

*raspiBackup* wird nur mit dem *Raspberry Pi OS* und *Ubuntu* und Raspberry Hardware
unterstützt. Es läuft aber auch auf anderer Raspberry kompatiblen Hardware und
Linux Distributions erfolgreich. Aber es ist zu beachten, dass *raspiBackup* die
beiden Partitionen /boot und /root benötigt, wie sie bei *Raspberry Pi OS* existieren.

D.h. man kann *raspiBackup* auf dem jeweiligen Environment ausprobieren und wenn
es erfolgreich läuft kannst kann man sich freuen und es nutzen. Wenn es aber nicht
läuft bzw. Fehlermeldungen bringt, wird **kein** Support gegeben. Man kann einen
Issue in github erstellen und das Debuglog beifügen. So kann *framp* prüfen, ob mit ein
paar kleinen Änderungen das Problem beseitigt werden kann. Sind größere Änderungen notwendig
werden die nicht vorgenommen und somit kann raspiBackup in dem Environmen nicht genutzt werden.
Aber auch wenn ein Fix das problem beseitigt bleibt das Environment nicht unterstützt.

Unter der Tatsache, dass **raspiBackup ~~umsonst~~ gratis** ist, ist es zu teuer/zu aufwändig für *framp*,

 1) sich alle mögliche Hardware für die Tests anzuschaffen
 1) alle mögliche Hardware- und Softwaretestkombinationen aufzubauen
 1) jeweils alles bei einer neuen Release zu testen

Also kann *framp* *raspiBackup* nur unter den genannten Voraussetzungen unterstützen.

Es besteht die Möglichkeit der Donation und je nach Aufwand besteht die Möglichkeit,
dass auch ein nicht unterstütztes Environment von *raspiBackup* unterstützt wird.

*raspiBackup* prüft beim Aufruf, ob eine unterstützte Hard- und Software vorliegt
und beendet sich sonst. Mit der Option `--unsupportedEnvironment` wird diese
Prüfung nicht vorgenommen und führt u.U. zu Fehlern und Programmabbrüchen.


[.source]: https://linux-tips-and-tricks.de/de/raspibackupcategoried/608-unterstuetzte-hard-und-software/
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/609-supported-hard-and-software/
[.status]: rft "Ready for translation"



