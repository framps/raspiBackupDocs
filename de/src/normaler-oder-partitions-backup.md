Vergleich partitionsorientierter Backup und normaler Backup

Es existieren zwei Backupmodi:

1) Normaler Backup

In diesem Modus werden die ersten zwei Partitionen (die Bootpartition und die
Rootpartition) der SD Karte gesichert. Ausserdem wird beim tar und rsync Backup
auch eine externe Rootpartition, d.h. eine auf einen USB Stick oder USB Platte
ausgelagerte Rootpartition, gesichert. Mit dem dd Backup kann auch die gesamte
SD Karte gesichert werden. Dieses kann man benutzen um z.B. NOOBS Images zu
sichern. Falls die Ziel SD Karte beim Restore größer ist als die Quell SD Karte
wird automatisch die zweite Partition entsprechend erweitert.

2) Partitionsorientierter Backup

In diesem Modus wird jede auf der SD Karte befindliche oder eine bestimmte
Anzahl von Partitionen als tar oder rsync gesichert. Dabei ist die Anzahl der
Partitionen beliebig. Falls die Ziel SD Karte beim Restore größer ist als die
Quell SD Karte wird der zusätzliche Platz nicht benutzt.

