# 10 Jahre *raspiBackup*

Heute (07. August 2023) vor 10 Jahren wurde die erste Version von *raspiBackup*
in meinem lokalen cvs abgelegt.

```
revision 1.1
date: 2013-08-07 21:28:14 +0200; author: framp; state: Exp; commitid: 10052029FC71A98602F;
Initial version
=============================================================================
```

Dieses cvs existiert leider nicht mehr, denn es wäre schon interessant zu sehen,
wie sich das Script in den 10 Jahren verändert hat. Initial waren es um die 50
Codezeilen. Jetzt sind es 8000 Codezeilen.

Update 5/2025: In der wayback machine habe ich auf dieser Webseite 6/2013 eine
initiale Version von *raspiBackup* gefunden. Ich habe sie [hier](https://www.linux-tips-and-tricks.de/raspiBackup/raspiBackup_201306.sh) abgelegt. Es
waren nicht 50 sondern 314 lines of code.

Weihnachten 2013 schenkte mir mein Sohn eine Raspberry. Mit Begeisterung begann
ich, mit ihr zu arbeiten und schnell kam eine zweite Raspberry dazu, die dann
auch in Produktion eingesetzt wurde. Da SD Karten leider nur eine beschränkte
Haltbarkeit haben, entstand *raspiBackup*. Erst nur privat genutzt - aber
nachdem es doch sehr gut seinen Dienst verrichtete, wurde es der Community zur
Verfügung gestellt.

Was dadurch an Aufwand zukam hatte ich unterschätzt: Es ist
ein Unterschied, ob man ein kleines Script selbst schreibt und nutzt, oder es von
anderen Usern genutzt wird. Es mussten sehr viele Tests auf falsche Eingaben
und Systemumgebungen zugefügt werden. Dazu mussten dann auch entsprechende
Fehlermeldungen geschrieben werden. Da die Fehlermeldungen nur kurz sind,
entstanden parallel diverse Webseiten, auf denen die Funktionsweiete von
*raspiBackup* beschrieben werden, sowie detailiertere Beschreibungen der
Fehlermeldungen wie auch die Fehlermeldungen beseitigt werden können.

Um die initiale Installation zu vereinfachen, entstand dann der Installer. Bald
fanden sich auch Freunde von *raspiBackup*, die halfen die Sprachunterstützung
für Finnisch, Chinesisch und Französisch zusätzlich zu Deutsch und Englisch
zuzufügen.

Es gab viel Feedback und Vorschläge von *raspiBackup* Nutzern, was noch
nützliche Features in *raspiBackup*.wären. Ohne diese Anregungen der
*raspiBackup* Nutzer würde *raspiBackup* immer noch die initialte Funktion, die
ich bei mir @home benötige, haben. Es gab und gibt viele Helfer. Initial hatte
ich mal eine Webseite gepflegt, auf der alle Helfer aufgeführt wurden.
irgendwann wurde es einfach zu viel und ich habe die Webseite vom Netz
genommen.

Durch diese Hilfe entwickelte sich *raspiBackup* über die 10 Jahre fortwährend
in seinem Funktionsumfang weiter. Zuerst kamen alle Feedbacks über die
Kommentarfunktion auf dieser Webseite. Das erwies sich aber als sehr
umständlich und schließlich wurde der cvs Code in github abgelegt. Dadurch
wurde das Erstellen von Featurerequests wesentlich vereinfacht. Zusätzlich ist
seitdem das Berichten von Fehlern und Fragen zur *raspiBackup* Nutzung
wesentlich einfacher.

Relativ schnell hatte ich mich dann in dem [deutschen Raspberry Forum](https://forum-raspberrypi.de/forum/)
angemeldet. Die Mitglieder dort halfen mir sehr, meine Raspberry kennenzulernen
und zu nutzen. Irgendwann fragte ich dann an, ob es nich Sinn macht, ein Backup
Subforum zu erstellen, was dann auch getan wurde. Seitdem helfe ich in dem Forum
bei Fragen zu *raspiBackup*.

Ich halte eigentlich nicht viel von Videos sondern präferiere textuelle
Beschreibungen (da kann man suchen) aber im langweiligen Coronazeitraum
erstellte ich dann doch verschiedene Videos zu *raspiBackup* und publizierte
sie auf [Youtube](https://www.youtube.com/channel/UCnFHtfMXVpWy6mzMazqyINg). Viel Aufwand habe ich dazu nicht getrieben im Gegensatz zu
anderen Leuten die sehr fancy Videos auf Youtube publizieren: Ein paar Slides
erstellt und die wurden dann im Präsentationsmodus erklärt. Später habe ich
dann noch ein paar Videos mit praktischer Nutzung von *raspiBackup* auf der
Befehlszeile erstellt. Aber die Zahl der Leute, die sich die Videos ansieht
wächst. Der Aufwand war also nicht unnütz.

Franjo vom Raspberryforum schrieb ein kleines Tool names [raspiBackupDialog](https://github.com/framps/raspiBackup/blob/master/helper/raspiBackupDialog.sh), mit
welchem der Backup und Restore mit *raspiBackup* dialoggeführt vorgenommen
werden kann.

Irgendwann erstellte ich auch eine [Facebookgruppe zu *raspiBackup*](https://www.facebook.com/raspiBackup). Initial
konnten mich darüber *raspiBackup* Nutzer direkt kontaktieren. Das wurde mir
dann aber irgendwann zu viel, da es letztendlich zu einem unbezahlten 7/24
Hotlinesupport für *raspiBackup* wurde.

Schliesslich habe ich mal ein Paypalkonto eingerichtet, auf welches jeder dem
*raspiBackup* gefällt, [spenden kann](introduction.md#trinkgeld). Reich werde ich dadurch natürlich nicht,
aber dadurch konnte und kann ich mir ab und zu dedizierte Test-Hardware kaufen, denn
ich kann und will nicht meine Produktivsysteme stilllegen, um *raspiBackup* zu
testen und zu maintainen. Auch gibt es einen grossen Verschleiss von SD Karten
und SSDs beim Testen, die erneuert werden müssen. Letztendlich konnte ich durch
die Spenden auch den Ubuntu Support einbauen und testen.

Zusätzlich entstanden viele [kleine Scripte](https://github.com/framps/raspiBackup/tree/master/scripts), die *raspiBackup* in seiner Nutzung
unterstützen.

Ein paar Statistiken zu raspiBackup:

* 5 Sprachen werden unterstützt (Deutsch, Englisch, Finnish, Französisch und
  Chinesisch)

* *raspiBackup* besteht aus knapp 12000 lines of code. Dabei sind 376 Meldungen
  in den verschiedenen Sprachen enthalten.

* Knapp 55000 Aufrufe von *raspiBackup* im Monat Juli 2023

* Durchschnittlich 1700 Aufrufe von *raspiBackup* pro Tag im Monat Juli 2023

* Durchschnitt 2800 Aufrufe am Sonntag. Sonntag ist der Defaulttag eines
  wöchentlichen Backups von *raspiBackup*

* 602 Githubnutzer haben *raspiBackup* mit einem Stern versehen und
  signalisieren damit dass sie es gut finden


Hiemit geben ich eine virtuelle Runde Freibier zur Feier des Tages aus.


[.status]: done
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/649-10-jahre-raspibackup
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/657-10-years-raspibackup

