# Unterstützung für Raspberry Compute Module 4 und NVMe

Es wurde eine *CM4* mit 1GB main memory, 32GB eMMC und 128 GB NVMe gespendet.
Vielen Dank an den Spender!

CM4 war schon von *raspiBackup* unterstützt, aber nur wenn es von einer SD Karte,
dem eMMC oder per USB Boot gestartet wurde. Man kann NVMe schon nutzen, aber nur
wenn er sich in einem USB Stick befindet, da er als normale Platte als `/dev/sdx`
exposed wird, aber es gibt bislang keinen Weg, NVMe zu nutzen, wenn es in die PCi
Lane gesteckt wurde, da er dann als `/dev/nvme` exposed wird.
So war es möglich, auch diesen Support in *raspiBackup* einzubauen.
Der Support ist ab Release 0.6.8 verfügbar.

![Foto eines Compute Moduls CM4](images/CM4.jpg)

## Wie man CM4 NVMe device auf Linux verfügbar macht, um ein NVMe Backup von *raspiBackup* zu restoren

Die Beschreibung findet sich auf der entsprechenden [englischsprachigen Seite](../support-for-raspberry-compute-module-4-and-nvme.md).


[.status]: done
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/613-unterstuetzung-fuer-raspberry-compute-module-4-und-nvme
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/612-support-for-raspberry-compute-module-4-and-nvme

