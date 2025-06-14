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

Zur Installation von *Rust* siehe:

  - https://www.rust-lang.org/tools/install
  - https://www.rust-lang.org/learn/get-started

Am Einfachsten geht die Installation von Rust folgendermassen:

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Das bitte **ohne** `sudo` aufrufen, da es eine benutzerspezifische Installation ist!


## Generator - mdbook

Das Wichtigste ist der "Generator", der die Markdown-Textdateien einliest und nach HTML umwandelt.

Ich habe *mdbook* gewählt.

Dieses Tools kommt aus dem Rust-Umfeld und wird auch für die Rust-Dokumentation selbst eingesetzt.
Siehe <https://rust-lang.github.io/mdBook>

### Installation

Siehe <https://rust-lang.github.io/mdBook/guide/installation.html>

Kurzfassung hier:

#### Binaries

Für Apple, Windows und x86_64-Linux gibt es zwar fertige Binaries zum Herunterladen.

Da aber die weiteren erforderlichen Tool auf jeden Fall compiliert werden müssen,
macht es Sinn, auch *mdbook* zu compilieren:

<a name="compile-from-sources"></a>
#### Compilation aus den Quelltexten

Alle benötigten Tools lassen sich auch aus den Sourcen selbst kompilieren.
<https://rust-lang.github.io/mdBook/guide/installation.html#build-from-source-using-rust>

Dafür ist ein Rust-Compiler mit der entsprechenden Umgebung erforderlich.

Wenn der Compiler `rustc` dann installiert ist ([s.o.](#rust-compiler)), wird *mdbook* compiliert und installiert:

    cargo install mdbook

Dann kommen noch zwei Präprozessoren dazu.
Sie werden in der Doku für schöneres Rendering von Hinweisen
und zur Erzeugung lokaler Inhaltsverzeichnisse verwendet.

    cargo install mdbook-admonish
    cargo install mdbook-toc

Das ganze Prozedere inklusive *Rust* dauert selbst auf einem Pi5 nur wenige Minuten!


## Das Arbeitsverzeichnis und die Quelldateien

Offizielle Dokumentation:

  - <https://rust-lang.github.io/mdBook/index.html>
  - <https://rust-lang.github.io/mdBook/guide/creating.html>


**Hinweis**: Folgende Beschreibung bezieht sich allgemein auf das Arbeiten mit *mdbook*.
Bei *raspiBackupDocs* werden mehrere Zielsprachen erstellt, daher ist dort die
Aufteilung der Quelldateien und der Aufruf der Tools etwas anders.
Die Sprachen liegen dort in Unterverzeichnissen je Sprache, was den Tools mitgeteilt werden muss.
Siehe [EDIT.md](EDIT.md) und [MAINTAIN.md](MAINTAIN.md).

Für die Arbeit an einem neuen Dokument/Buch wird ein neues Verzeichnis angelegt

    $ mkdir ~/mein_buch

Oder es wird ein vorhandenes Repository wie dieses hier geklont.
Dann mag aber die Verzeichnisstruktur abweichen, siehe Hinweis oben.

*mdbook* gibt eine gewisse - einfache - Verzeichnis-/Dateistruktur vor und legt diese auch an.
(Inklusive der Datei `book.toml`, die ein paar Verwaltungsdaten enthält.)

Hier der Ablauf der Einrichtung eines neuen "Buches" in einem ursprünglich leeren Arbeitsverzeichnis:

    $ cd ~/mein_buch

    $ mdbook init

        Do you want a .gitignore to be created? (y/n)
        y
        What title would you like to give the book?
        Mein erstes Buch
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
        title = "Mein erstes Buch"


Die Sprachangabe in der Datei sollte den zukünftigen Inhalten angepasst werden,
damit der Browser des Lesers korrekt damit umgehen kann.


## Editieren/Erstellen des Inhalts

Zum Aufbau der Markdown-Dateien siehe [EDIT.md](EDIT.md)


## Generieren der Webseite

Beim Aufruf von

        mdbook build

wird anhand der `SUMMARY.md` eine Webseite im Verzeichnis `book/` generiert.


## Lokaler Webserver während der Entwicklung des Buches

Zum lokalen Ansehen im Browser unter der Adresse <http://localhost:3000> gibt es das Kommando

    mdbook serve
    
und dabei muss noch die Sprache de oder en als Parameter mitgegeben werden. 

welches einen kleinen lokalen Webserver startet.

    2025-05-26 13:24:48 [INFO] (mdbook::book): Book building has started
    2025-05-26 13:24:48 [INFO] (mdbook::book): Running the html backend
    2025-05-26 13:24:49 [INFO] (mdbook::cmd::serve): Serving on: http://localhost:3000
    2025-05-26 13:24:49 [INFO] (mdbook::cmd::watch::poller): Watching for changes...
    2025-05-26 13:24:49 [INFO] (warp::server): Server::run; addr=[::1]:3000
    2025-05-26 13:24:49 [INFO] (warp::server): listening on http://[::1]:3000

Dieser Webserver bemerkt Änderungen an Dateien im Verzeichnis `src/` und generiert dann automatisch neu,
so dass der lokale Browser synchron ist (manchmal ist allerdings ein Auffrischen - F5 erforderlich).


## Veröffentlichung

Wenn nun das Ergebnis im lokalen Webserver/Browser zufriedenstellend ist,
muss die Webseite, also die generierte Sammlung von HTML- und anderen Dateien im Verzeichnis `book/`,
natürlich noch veröffentlicht werden.

Dies kann .z.B. durch Hochladen zu einem Webserver/Webhoster o.Ä. geschehen.
Oder per *GitHub Pages*. Siehe [MAINTAIN.md](MAINTAIN.md)



# Mögliche Fehlermeldungen

Es kann natürlich sein, dass beim `mdbook build` Fehler auftreten.

 - Falls der Präprozessor `mdbook-admonish` nicht installiert ist:

        2025-05-27 02:53:49 [INFO] (mdbook::book): Book building has started
        2025-05-27 02:53:49 [WARN] (mdbook::preprocess::cmd): The command wasn't found, is the "admonish" preprocessor installed?
        2025-05-27 02:53:49 [WARN] (mdbook::preprocess::cmd): 	Command: mdbook-admonish

   Siehe dazu oben bei [Compilation aus den Quelltexten](#compile-from-sources)

