# Wie kann ich die Betaversion installieren und ausprobieren ?

Von Zeit zu Zeit gibt es eine neue Version von *raspiBackup*, die neue
Funktionen, Erweiterungen und auch Fehlerkorrekturen enthält.

Diese Version durchläuft einen automatisierten Regressiontest, der die
eigentliche Backup- und Restorefunktionialität testet. Danach werden die neuen
Funktionen, Erweiterungen und Bug Fixes, die während der Entwicklung schon
getestet wurden, noch einmal manuell verifiziert.

Danach wird die neue Version als Beta allgemein zur Verfügung gestellt. Dieses
ist erkennbar daran, dass dem eMail Subject das Smiley :-D vorangestellt wird.
Dann hat jeder Benutzer von *raspiBackup* die Möglichkeit, die zukünftige neue
Version vorneweg mit den neuen Funktionen, Erweiterungen und Fehlerkorrekturen
zu testen, und im Fehlerfalle ein Problemrecord zu erstellen, so dass das
Problem gefixed werden kann.

Es ist einfach nicht möglich, alle möglichen Systemumgebungsbedingungen zu
testen. Deshalb hilft das Testen der Betaversion auch, für die Community
sicherzustellen, dass sich möglichst keine Fehler in der neuen Version
eingeschlichen haben.

Nun folgend wird beschrieben wie man eine Beta installieren kann,
sie wieder deinstallieren und Problemberichte erstellen kann.

Die Installation der Beta ist relativ einfach. Man benutzt

```
sudo raspiBackup -U
```

Dabei wird die aktuelle *raspiBackup* Version gesichert, so
dass man jederzeit wieder auf die vorhergehenden Version zurückgehen kann. Dazu
gibt man

```
sudo raspiBackup.sh -V
```
ein und wählt aus der Liste der vorherigen Versionen die letze aus die dann
wieder aktiviert wird.

Sollte wieder Erwarten ein Problem entdeckt werden, sollte auf [github](https://github.com/framps/raspiBackup/issues) ein
Problemrecord bzw. Issue erstellt werden. Extrem wichtig ist dann immer die
Ausgabe von `sudo *raspiBackup*.sh --version`, damit genau klar ist, welcher
Codestand benutzt wird.

Da auch von internationalen *raspiBackup* Nutzern
die Records gelesen werden,wäre es gut, sie in Englisch zu erstellen. Es ist
aber auch kein Problem, nur Deutsch zu schreiben. Die Records werden dann
bearbeitet und gefixed. Wenn eine neue Version bereitsteht, wird der Ersteller
über github informiert werden und sie kann mit `sudo *raspiBackup*.sh -U -S`
erneut runtergeladen und der Fix verifiziert werden.

[.status]: done
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/594-wie-kann-ich-die-betaversion-installieren-und-ausprobieren
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/595-how-can-i-install-and-test-the-beta-version

