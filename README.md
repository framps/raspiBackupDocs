# raspiBackup Dokumentation


> [!NOTE]
> Diese Dokumentation entsteht gerade erst. Und zwar initial aus den Original-Texten der Webseite von framp.
>
> Aktuell ist die Struktur noch nicht final und auch viele Seiten noch "kaputt", insbesondere bezüglich Formatierung und Verlinkung.
>
> **Also bitte im Moment als Prototyp sehen!**
>
> Die generierte Dokumentation ist über folgenden Links (GitHub Pages) zu erreichen:

>  - https://rpi-simonz.github.io/raspiBackupDocs/
>  - https://rpi-simonz.github.io/raspiBackupDocs/de/



## Der Plan

Die neue Dokumentation von raspiBackup könnte in Zukunft als eine Sammlung von thematisch aufgeteilten Dateien im Markdown-Format vorliegen.

Dies sind Textdateien, die sich gut bearbeiten und, zum Beispiel mit *git*, versionieren lassen.
Über ein Repository wäre dann auch eine Teamarbeit an der Dokumentation möglich (über *Pull-Requests*).

*Markdown* ist eine von vielen Auszeichnungssprachen, die sich mit Hilfe von Software gut in andere Formate umwandeln lassen.

Um das Ergebnis in eine ansprechende und gut zu navigierende Form zu bringen, ist natürlich noch etwas mehr "Drumherum" nötig.


### Arbeitsablauf

Der allgemeine Arbeitsablauf ist dann folgendermaßen:

  1. Editieren von Markdown-Datei(en) für Struktur und Inhalt
  1. Versionieren (git)
  1. Generieren der Webseite (automatisch oder manuell)
  1. Hochladen der Webseite (nur beim manuellen Generieren)
  1. bei Bedarf weiter bei 1.

Im einfachsten Fall, der automatischen Generierung, ist das dann...

#### ... für den Repo-Eigentümer

  1. Editieren von Markdown-Datei(en), lokal oder im Browser
  1. commit / push
  1. ca. 30 Sekunden warten, bis die neue Doku generiert und deployed wurde

#### ... für andere Nutzer, die etwas beitragen möchten

  1. Das Repository clonen/forken
  1. Editieren von Markdown-Datei(en), lokal oder im Browser
  1. commit / push
  1. Pull-Request (PR) erstellen
  1. warten, bis der Repo-Owner den PR annimmt  ;-)


### Arbeiten an/in/mit dem Buch

Siehe <https://rust-lang.github.io/mdBook/guide/creating.html>

> [!NOTE]
> *mdbook* verwendet den Markdown-"Dialekt"
> Erweitertes CommonMark (<https://rust-lang.github.io/mdBook/format/markdown.html>),
> der sich vom hier in der `README.md` verwendeten *GitHub Flavored Markdown* etwas unterscheidet!


#### Das Inhaltsverzeichnis / Die Struktur des Buches

In der Datei `src/SUMMARY.md` (Groß-/Kleinschreibung ist relevant!) wird die Struktur des zu erzeugenden Buches erfasst.
Und zwar durch einen "Baum" von Links mit Kapitelnamen und den dazugehörigen Dateien im Filesystem (src/*.md).

Das entspricht dem zukünftigen Inhaltsverzeichnis.

Beispiel:

    # raspiBackup

    [Einführung](einfuehrung.md)

    - [Installation]()
        - [Installation in 5 Minuten](installation-in-5-minuten.md)
        - [Updates]()
    - [Backup]()
    - [Restore]()

Wenn dort die Links schon Dateinamen enthalten, werden diese Dateien automatisch angelegt
und sie sind im Inhaltsverzeichnis anklickbar.

Bei leeren Links (wie bei `[Updates]()`) wird nur ein nicht anklickbarer Eintrag erzeugt,
die Struktur also auch im HTML-Dokument gut sichtbar

-----------------------------

**Das war es eigentlich auch schon für das "normale" Arbeiten an der Dokumentation.**

Entwicker und technisch Neugierige finden in [DEVELOPMENT.md](DEVELOPMENT.md) weitere Informationen.

