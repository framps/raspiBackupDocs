# Für Entwickler

Folgende Informationen sind für Entwickler und technisch Interessierte.

Entwickler, die die Dokumentation (auch) lokal generieren möchten, benötigen ein paar Tools.

<a name="rust-compiler"></a>
## Rust-Compiler

Ein Rust-Compiler ist Grundlage, da die weiteren Tools in Rust programmiert sind,
und zumindest teilweise compiliert werden müssen.

Dabei ist zu beachten, dass die Rust-Version ziemlich aktuell sein sollte,
damit das aktuelle *mdbook* kompilierbar ist (siehe unten).

> mdBook currently requires at least Rust version 1.82.

Zum Beispiel beim aktuellen *Raspberry Pi OS* *Bookworm* ist *rustc* Version 1.63 in den Repositories, also zu alt.

  - https://www.rust-lang.org/tools/install
  - https://www.rust-lang.org/learn/get-started


## Generator - mdbook

Das Wichtigste ist der "Generator", der die Markdown-Textdateien einliest und nach HTML umwandelt.

Ich habe erst einmal *mdbook* gewählt.
Dieses Tools kommt aus dem Rust-Umfeld und wird auch für die Rust-Dokumentation selbst eingesetzt.
Siehe <https://rust-lang.github.io/mdBook>

### Installation

Siehe <https://rust-lang.github.io/mdBook/guide/installation.html>

Kurzfassung hier:

#### Binaries

Für Apple, Windows und x86_64-Linux gibt es fertige Binaries zum Herunterladen.

<a name="compile-from-sources"></a>
#### Compilation aus den Quelltexten

Ansonsten lässt es sich auch aus den Sourcen selbst kompilieren.
<https://rust-lang.github.io/mdBook/guide/installation.html#build-from-source-using-rust>

Dafür ist ein [Rust-Compiler](#rust-compiler) mit der entsprechenden Umgebung erforderlich.

Wenn der `rustc`-Compiler dann installiert ist, wird *mdbook* installiert/compiliert:

    cargo install mdbook

Aktuell, aber eigentlich optional, sollte dann noch ein Präprozessor installiert werden,
der in der Doku für schöneres Rendering von Hinweisen verwendet wird.

Den gibt es aber nur per Quelltext:

    cargo install mdbook-admonish

Das ganze Prozedere inklusive *Rust* dauert selbst auf einem Pi5 nur wenige Minuten!


## Das Arbeitsverzeichnis und die Quelldateien

Offizielle Dokumentation:

  - <https://rust-lang.github.io/mdBook/index.html>
  - <https://rust-lang.github.io/mdBook/guide/creating.html>

Für die Arbeit an einem neuen Dokument/Buch wird ein neues Verzeichnis angelegt

    $ mkdir ~/mein_buch

Oder es wird ein vorhandenes Repository wie dieses hier geklont.

*mdbook* gibt eine gewisse - einfache - Verzeichnis-/Dateistruktur vor und legt diese auch an.
(Inklusive der Datei `book.toml`, die ein paar Verwaltungsdaten enthält.)

Hier der Ablauf der Einrichtung eines neuen "Buches" in einem ursprünglich leeren Arbeitsverzeichnis:

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


## Generieren der Webseite

Beim Aufruf von

        mdbook build

wird anhand der `SUMMARY.md` eine Webseite im Verzeichnis `book/` generiert.


## Lokaler Webserver während der Entwicklung des Buches

Zum lokalen Ansehen im Browser <http://localhost:3000> gibt es

    mdbook serve

welches einen lokalen Webserver startet.

    2025-05-26 13:24:48 [INFO] (mdbook::book): Book building has started
    2025-05-26 13:24:48 [INFO] (mdbook::book): Running the html backend
    2025-05-26 13:24:49 [INFO] (mdbook::cmd::serve): Serving on: http://localhost:3000
    2025-05-26 13:24:49 [INFO] (mdbook::cmd::watch::poller): Watching for changes...
    2025-05-26 13:24:49 [INFO] (warp::server): Server::run; addr=[::1]:3000
    2025-05-26 13:24:49 [INFO] (warp::server): listening on http://[::1]:3000

Dieser Webserver bemerkt Änderungen an Dateien im Verzeichnis `src/` und generiert dann neu,
so dass der lokalen Browser synchron ist (manchmal ist allerdings ein Auffrischen - F5 erforderlich).


## Veröffentlichung

Wenn nun das Ergebnis im lokalen Webserver/Browser zufriedenstellend ist,
muss die Webseite, also die Sammlung von HTML- und anderen Dateien im Verzeichnis `book/`,
natürlich noch veröffentlicht werden.

Dies kann im einfachsten Fall durch Hochladen zu einem Webserver/Webhoster o.Ä. geschehen.

Siehe [README.md](README.md)



# Mögliche Fehlermeldungen

Da die Doku hier im Repository noch nicht fertig ist, kann es sein, dass beim `mdbook build` Fehler auftreten.

1. Falls der Präprozessor `mdbook-admonish` nicht installiert ist:

        2025-05-27 02:53:49 [INFO] (mdbook::book): Book building has started
        2025-05-27 02:53:49 [WARN] (mdbook::preprocess::cmd): The command wasn't found, is the "admonish" preprocessor installed?
        2025-05-27 02:53:49 [WARN] (mdbook::preprocess::cmd): 	Command: mdbook-admonish

   Siehe dazu oben bei [Compilation aus den Quelltexten](#compile-from-sources)


# Alternativen

Dank des Quelltext-Formats *Markdown* wäre es - auch nachträglich - möglich,
auf ein anderes Produkt bzw. eine andere Zielplattform umzustellen.

Mögliche Alternativen: [Sphinx](https://www.sphinx-doc.org/en/master/index.html), [MkDocs](https://www.mkdocs.org/), [readthedocs](https://readsthedocs.com/) und Einige mehr...

Bisher hat sich aber *mdbook* als angenehm zu nutzen und sehr tauglich erwiesen.

