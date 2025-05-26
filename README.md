# raspiBackup Dokumentation

Diese Dokumentation entsteht gerade erst. Und zwar initial aus den Original-Texten der Webseite von framp.

Aktuell ist die Struktur noch nicht final und auch viele Seiten noch "kaputt", insbesondere bezüglich Formatierung und Verlinkung.

Also bitte im Moment als Prototyp sehen!

Die generierte Dokumentation ist über folgenden Link (GitHub Pages) zu erreichen:
https://rpi-simonz.github.io/raspiBackupDocs/

## Der Plan

Die neue Dokumentation von raspiBackup könnte in Zukunft als eine Sammlung von thematisch aufgeteilten Dateien im Markdown-Format vorliegen.

Dies sind Textdateien, die sich gut bearbeiten und, zum Beispiel mit *git*, versionieren lassen.

Markdown ist eine von vielen Auszeichnungssprachen, die sich mit Hilfe von Software gut in andere Formate umwandeln lassen.
Als Zielformat ist hier HTML sinnvoll.

Um das Ergebnis in eine ansprechende und gut zu navigierende Form zu bringen, ist natürlich noch etwas mehr "Drumherum" nötig.

Der Arbeitsablauf ist dann folgendermaßen:

 1. Editieren von Markdown-Datei(en)
 2. Generieren der Webseite
 3. optional: Versionisieren
 4. Hochladen der Webseite
 5. bei Bedarf weiter bei 1.

Dafür werden natürlich Tools benötigt.


## Die Tools

### Texteditor

Grundlegend ist ein Texteditor. Sinnvollerweise kann er Syntax-Highlighting für Markdown.

(Ich nutze *vim* mit ein paar Plugins.)


### Generator - mdbook

Als nächstes kommt der "Generator", der die Markdown-Textdateien einliest und nach HTML umwandelt.

Ich habe mich erst einmal für *mdbook* entschieden.
Hinweis: *mdbook* verwendet den Markdown-"Dialekt" CommonMark.

#### TODO: Installation von mdbook.


## Das Arbeitsverzeichnis

Für die Arbeit am Dokument/Buch wird ein neues Verzeichnis angelegt

    $ mkdir ~/mein_buch
    $ cd ~/mein_buch


### README.md

Zur Dokumentation der Dokumentation habe ich im Arbeitsverzeichnis eine Datei `README.md` angelegt,
die z.B. von GitHub angezeigt wird. Das ist die Datei, die ihr gerade lest.


## Verwendung von *mdbook*

TODO: Link zur Doku von mdbook

### Grundlagen

*mdbook* gibt eine gewisse - einfache - Verzeichnis-/Dateistruktur vor und legt diese auch an.
Inklusive der Datei `book.toml` mit ein paar Verwaltungsdaten.

Hier der Ablauf der Einrichtung eines neuen "Buches" im ursprünglich leeren Arbeitsverzeichnis:

    $ cd ~/mein_buch

    $ mdbook init

        Do you want a .gitignore to be created? (y/n)
        y
        What title would you like to give the book?
        raspiBackup Dokumentation
        2025-05-26 13:04:56 [INFO] (mdbook::book::init): Creating a new book with stub content

        All done, no errors...

Das Ergebnis:

    $ tree

        .
        ├── book
        ├── book.toml
        └── src
            ├── chapter_1.md
            └── SUMMARY.md

        3 directories, 3 files

mit diesem Inhalt in der `book.toml`:

    $ cat book.toml

        [book]
        authors = []
        language = "en"
        src = "src"
        title = "raspiBackup Dokumentation"


#### meine aktuelle book.toml

Meine, inzwischen etwas erweitere `book.toml` sieht folgendermaßen aus.
Das hängt vor Allem mit der Nutzung eines optionalen Präprozessor-Programmes zusammen.

    [book]
    authors = ["framp", "simonz"]
    language = "de"
    src = "src"
    title = "raspiBackup"

    [preprocessor]

    [preprocessor.admonish]
    command = "mdbook-admonish"
    assets_version = "3.0.3" # do not edit: managed by `mdbook-admonish install`

    [output]

    [output.html]
    additional-css = ["mdbook-admonish.css"]


### Das Inhaltsverzeichnis / Die Struktur des Buches

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

## Generieren der Webseite

Beim Aufruf von

        mdbook build

wird anhand der `SUMMARY.md` eine Webseite im Verzeichnis `book/` generiert.


## Lokaler Webserver während der Entwicklung des Buches

Zum lokalen Ansehen gibt es

    mdbook serve

welches einen lokalen Webserver auf Port 3000 startet.

    2025-05-26 13:24:48 [INFO] (mdbook::book): Book building has started
    2025-05-26 13:24:48 [INFO] (mdbook::book): Running the html backend
    2025-05-26 13:24:49 [INFO] (mdbook::cmd::serve): Serving on: http://localhost:3000
    2025-05-26 13:24:49 [INFO] (mdbook::cmd::watch::poller): Watching for changes...
    2025-05-26 13:24:49 [INFO] (warp::server): Server::run; addr=[::1]:3000
    2025-05-26 13:24:49 [INFO] (warp::server): listening on http://[::1]:3000

Dieser bemerkt Änderungen an Dateien im Verzeichnis `src/` und generiert immer aktuell neu,
so dass der lokalen Browser synchron ist (manchmal ist allerdings ein Auffrischen - F5 erforderlich).


## Veröffentlichung

Wenn nun das Ergebnis im lokalen Webserver zufriedenstellend ist,
muss die Webseite, also die Sammlung von HTML- und anderen Dateien im Verzeichnis `book/`,
natürlich noch veröffentlicht werden.

Dies kann durch Hochladen zu einem Webserver/Webhoster o.Ä. geschehen.

Aktuelle nutze ich hier *GitHub Pages*.

Dazu wird mit `git` eine neue Version erzeugt und zu *GitHub* ins Repository `push`ed.

Hier muss unterschieden werden, wie die *GitHub Pages* entstehen.

  - Entweder automatisch per *GitHub Actions*

    Dann ist nur das `push`en der Quelldateien erforderlich. Der Rest geschieht
    auf dem *GitHub*-Server. Dazu ist aber dort einige Konfiguration erforderlich!

    Das habe ich noch nicht getestet.

  - Oder die Inhalte des lokalen Verzeichnisses `book/` werden mit `git`
    in einen extra Branch versioniert und `push`ed.
    Dazu ist lokal etwas git-Konfiguration erforderlich.

Ich habe aktuell den zweiten - lokalen - Weg gewählt.

TODO: Beschreiben...

