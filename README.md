# raspiBackup Dokumentation

Diese Dokumentation entsteht gerade erst. Und zwar initial aus den Original-Texten der Webseite von framp.

Aktuell ist die Struktur noch nicht final und auch viele Seiten noch "kaputt", insbesondere bezüglich Formatierung und Verlinkung.

**Also bitte im Moment als Prototyp sehen!**

Die generierte Dokumentation ist über folgenden Link (GitHub Pages) zu erreichen:  
https://rpi-simonz.github.io/raspiBackupDocs/


## README.md

Zur Dokumentation der Dokumentation habe ich im Arbeitsverzeichnis eine Datei `README.md` angelegt,
die z.B. von GitHub angezeigt wird. Das ist die Datei, die ihr gerade lest.

> [!NOTE]
> Die `README.md` ist wie auch die "normalen" Seite (Wiki etc.) auf *GitHub* in *GitHub Flavored Markdown* geschrieben,
> siehe z.B. hier: <https://docs.github.com/de/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github>


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

#### für Repo-Owner

Im einfachsten Fall, der automatischen Generierung, ist das dann für den Repo-Owner:

  1. Editieren von Markdown-Datei(en), lokal oder im Browser
  1. commit / push
  1. ca. 30 Sekunden warten, bis die neue Doku generiert und deployed wurde

#### Für Contributors

Für "externe" Contributors:

  1. Das Repository clonen/forken
  1. Editieren von Markdown-Datei(en), lokal oder im Browser
  1. commit / push
  1. Pull-Request (PR) erstellen
  1. warten, bis der Repo-Owner den PR annimmt  ;-)


<https://rust-lang.github.io/mdBook/guide/creating.html>

> [!NOTE]
> *mdbook* verwendet einen anderen Markdown-"Dialekt": Erweitertes CommonMark (<https://rust-lang.github.io/mdBook/format/markdown.html>),
> der sich vom hier in der `README.md` verwendeten *GitHub Flavored Markdown* etwas unterscheidet!

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


**Das war es eigentlich auch schon für das "normale" Arbeiten an der Dokumentation.**

Der Rest dieser Beschreibung richtet sich an Entwicker und technisch Neugierige.



-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------



## Für Entwickler

Entwickler, die die Dokumentation (auch) lokal generieren möchten, benötigen ein paar Tools.

### Rust-Compiler

Ein Rust-Compiler ist Grundlage, da die weiteren Tools in Rust programmiert sind,
und teilweise compiliert werden müssen.

Dabei ist zu beachten, dass die Rust-Version ziemlich aktuell sein sollte,
damit das aktuelle *mdbook* kompilierbar ist.

> mdBook currently requires at least Rust version 1.82.

Zum Beispiel beim aktuellen *Raspberry Pi OS* *Bookworm* ist *rustc* Version 1.63 in den Repositories, also zu alt.

  - https://www.rust-lang.org/tools/install
  - https://www.rust-lang.org/learn/get-started


### Generator - mdbook

Das Wichtigste ist der "Generator", der die Markdown-Textdateien einliest und nach HTML umwandelt.

Ich habe erst einmal *mdbook* gewählt. Dieses Tools kommt aus dem Rust-Umfeld und wird auch für die Rust-Dokumentation selber eingesetzt.
Siehe <https://rust-lang.github.io/mdBook>


#### Installation

Siehe <https://rust-lang.github.io/mdBook/guide/installation.html>

##### Binaries

Für Apple, Windows und x86_64-Linux gibt es fertige Binaries zum Herunterladen.

<a name="compile-from-sources"></a>
##### Compilation aus den Quelltexten

Ansonsten lässt es sich auch aus den Sourcen selbst kompilieren.
<https://rust-lang.github.io/mdBook/guide/installation.html#build-from-source-using-rust>

Dafür ist ein Rust-Compiler mit der entsprechenden Umgebung erforderlich.

Wenn der `rustc`-Compiler dann installiert ist, wird *mdbook* installiert/compiliert:

    cargo install mdbook

Aktuell, aber eigentlich optional, sollte dann noch ein Präprozessor installiert werden,
den ich in der Doku für schöneres rendering von Hinweise verwendet habe.

Den gibt es aber nur per Quelltext:

    cargo install mdbook-admonish

Das Ganze dauert selbst auf einem Pi5 nur wenige Minuten!


### Das Arbeitsverzeichnis und die Quelldateien

Offizielle Dokumentation:

  - <https://rust-lang.github.io/mdBook/index.html>
  - <https://rust-lang.github.io/mdBook/guide/creating.html>

Für die Arbeit am Dokument/Buch wird ein neues Verzeichnis angelegt

    $ mkdir ~/mein_buch

*mdbook* gibt eine gewisse - einfache - Verzeichnis-/Dateistruktur vor und legt diese auch an.
Inklusive der Datei `book.toml`, die ein paar Verwaltungsdaten enthält.

Hier der Ablauf der Einrichtung eines neuen "Buches" im ursprünglich leeren Arbeitsverzeichnis:

    $ cd ~/mein_buch

    $ mdbook init

        Do you want a .gitignore to be created? (y/n)
        y
        What title would you like to give the book?
        Das erste Buch
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
        title = "Das erste Buch"


#### meine aktuelle book.toml

Meine, inzwischen etwas erweitere `book.toml` sieht folgendermaßen aus.
Das hängt vor Allem mit der Nutzung eines optionalen Präprozessor-Programmes zusammen.

    [book]
    authors = ["framp", "simonz"]
    language = "de"
    src = "src"
    title = "raspiBackup"

    # Alle hier folgenden Zeilen stammen von der Installation von mdboo-admonish:

    [preprocessor]

    [preprocessor.admonish]
    command = "mdbook-admonish"
    assets_version = "3.0.3" # do not edit: managed by `mdbook-admonish install`

    [output]

    [output.html]
    additional-css = ["mdbook-admonish.css"]



### Generieren der Webseite

Beim Aufruf von

        mdbook build

wird anhand der `SUMMARY.md` eine Webseite im Verzeichnis `book/` generiert.


### Lokaler Webserver während der Entwicklung des Buches

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


### Veröffentlichung

Wenn nun das Ergebnis im lokalen Webserver/Browser zufriedenstellend ist,
muss die Webseite, also die Sammlung von HTML- und anderen Dateien im Verzeichnis `book/`,
natürlich noch veröffentlicht werden.

Dies kann im einfachsten Fall durch Hochladen zu einem Webserver/Webhoster o.Ä. geschehen.

Oder aber bei GitHub über *GitHub Pages*.

Dazu wird mit `git` eine neue Version erzeugt und zu *GitHub* ins Repository `push`ed.

Bei entsprechender Konfiguration im Repository geschieht die Generierung dann online bei GitHub, angestoßen durch den `push`.

Dazu wurde die Datei `.github/workflows/mdbook.yml` angelegt und bei *GitHub Pages*
von "deploy from branch" zu "GitHub Actions" umgestellt.
Und dort dann "mdbook" (im Gegensatz zur "Static HTML pages") ausgewählt.

- https://github.com/rust-lang/mdBook/wiki/Automated-Deployment%3A-GitHub-Actions
- https://github.com/rust-lang/mdBook/wiki/Automated-Deployment%3A-GitHub-Pages-%28Deploy-from-branch%29
- https://docs.github.com/de/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#creating-a-custom-github-actions-workflow-to-publish-your-site

> [!NOTE]
> Da bei jedem `git push` nun der Rust-Compiler installiert
> und sowohl `mdbook` als auch der Präprozessor `mdbook-admonish` compiliert würden,
> dauert es ca. 4 Minuten, bis die jeweilige neue Version der Webseite online geht!
> Um das zu minimieren (aktuell auf ca. 30 Sekunden), kann Caching verwendet werden.
> Das ist in der obigen `mdbook.yml` schon eingefügt.
> Siehe https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/caching-dependencies-to-speed-up-workflows




## Mögliche Fehlermeldungen

Da die Doku hier im Repository noch nicht fertig ist, kann es sein, dass beim `mdbook build` Fehler auftreten.

1. Falls der Präprozessor `mdbook-admonish` nicht installiert ist:

        2025-05-27 02:53:49 [INFO] (mdbook::book): Book building has started
        2025-05-27 02:53:49 [WARN] (mdbook::preprocess::cmd): The command wasn't found, is the "admonish" preprocessor installed?
        2025-05-27 02:53:49 [WARN] (mdbook::preprocess::cmd): 	Command: mdbook-admonish

   Siehe dazu oben bei [Compilation aus den Quelltexten](#compile-from-sources)

