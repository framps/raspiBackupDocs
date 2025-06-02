# raspiBackup Dokumentation

<!-- Hinweis:
     Hier in der `README.md` und den anderen GitHub-Dateien wird *GitHub Flavored Markdown* verwendet.
     Siehe z.B. https://docs.github.com/de/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
-->

> [!NOTE]
> Diese Dokumentation entsteht gerade erst.
> Und zwar initial aus den Original-Texten der Webseite von framp.
>
> Aktuell ist die Struktur noch nicht final und auch viele Seiten noch "kaputt",
> insbesondere bezüglich Formatierung und Verlinkung.
>
> **Also bitte im Moment als Prototyp sehen!**


## Der Plan

Die neue Dokumentation von raspiBackup könnte in Zukunft als eine Sammlung
von thematisch aufgeteilten Dateien im Markdown-Format vorliegen.

Dies sind Textdateien, die sich gut bearbeiten und, zum Beispiel mit *git*, versionieren lassen.
Über ein Repository wäre dann auch eine Teamarbeit an der Dokumentation möglich (über *Pull-Requests*).

*Markdown* ist eine von vielen Auszeichnungssprachen,
die sich mit Hilfe von Software gut in andere Formate umwandeln lassen.

Um das Ergebnis in eine ansprechende und gut zu navigierende Form zu bringen,
ist natürlich noch etwas mehr "Drumherum" nötig, das hier kurz beschrieben wird.

> [!NOTE]
> Im Folgenden wird in den Verzeichnis-/Projektnamen bzw. in der URL an verschiedenen Stellen **raspiBackupDocs** verwendet.
> Das ist natürlich an die eigenen Bedürfnisse anpassbar.


## Arbeitsablauf

Der allgemeine Arbeitsablauf ist dann folgendermaßen:

  1. Editieren von Markdown-Datei(en) für Struktur und Inhalt
  1. Versionieren (git)
  1. Generieren der Webseite (automatisch oder manuell)
  1. bei Bedarf weiter bei 1.

Im Detail also ...

### ... für den Repo-Eigentümer (bzw. Webserver-Admin)

#### ... mit automatischer Generierung bei z.B. *GitHub Pages*

  1. Editieren von Markdown-Datei(en), lokal oder im Browser
  1. commit + push
  1. ca. 30 Sekunden warten, bis die neue Doku generiert und deployed wurde

Die generierte Dokumentation ist über folgenden Links (GitHub Pages) zu erreichen:

  - https://rpi-simonz.github.io/raspiBackupDocs/
  - https://rpi-simonz.github.io/raspiBackupDocs/de/



#### ... mit Veröffentlichung auf einem (normalen) Webserver


> [!IMPORTANT]
> Voraussetzungen beim lokalen Generieren:
> Die Rust-Umgebung inkl. Compiler `rustc`, `mdbook` und der Präprozessor `mdbook-admonish` müssen installiert sein.
> Siehe [DEVELOPMENT.md](DEVELOPMENT.md).

  1. lokales Editieren von Markdown-Datei(en)
  1. lokales Generieren der Webseite(n)
     (Zielverzeichnis ist jeweils `book` in den Sprachverzeichnissen.)

         mdbook build en     # "en" ist Default und Fallback
         mdbook build de     # "de" ist eine von evtl. mehreren zusätzlichen Übersetzungen

     Testen geht mit einem lokalen Development-Webservice im Browser: http://localhost:3000  
     Da `mdbook serve` bei jeder Änderung der Quelldateien intern ein 'build' aufruft,
     kann lokal nur jede Sprache einzeln getestet werden.

         mdbook serve en

     beziehungsweise

         mdbook serve de

  1. Hochladen der Webseite zu einem Webserver

     Hier eine mögliche Variante mit `lftp`:

     **Hinweis**: Beim Upload die Reihenfolge und Zielverzeichnisse der Sprachen beachten, "en" ist Default und damit Erster!

         lftp sftp://${WEBSERVER} -e "cd ${WEBSERVER_ROOTDIR} ; rm -r raspiBackupDocs; mirror -R en/book raspiBackupDocs; cd raspiBackupDocs ; mirror -R de/book de ; put htaccess -o .htaccess ; dir ; quit"

     Details zur Konfiguration des Webservers siehe [README.webserver.md](README.webserver.md)

  1. commit + push


> [!TIP]
> Zur Vereinfachung wird ein einfaches `Makefile` im Repository zur Verfügung gestellt.


> [!TIP]
> Wenn unbedingt nötig, geht es auch ohne lokales Generieren:  
> Man kann aus dem *GitGub Actions Workflow* die automatisch gebauten Artifacts herunterladen und auspacken.
> Das ist dann die generierte Webseite.
>
> Dann ist allerdings obiger Aufruf von `lftp` noch anzupassen, weil die Webseite schon in finaler Struktur vorliegt.


**TODO**: URL der generierten Dokumentation besprechen und hier nachtragen.



### ... für andere Nutzer, die etwas beitragen möchten

  1. Das Repository clonen/forken
  1. Editieren von Markdown-Datei(en), lokal oder im Browser
  1. commit + push
  1. Pull-Request (PR) erstellen
  1. warten, bis der Repo-Owner den PR annimmt  ;-)




## Arbeiten an/in/mit dem Buch

Siehe <https://rust-lang.github.io/mdBook/guide/creating.html>

**Hinweis**: *mdbook* verwendet den Markdown-"Dialekt"
Erweitertes CommonMark (<https://rust-lang.github.io/mdBook/format/markdown.html>).


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

-----------------------------

**Das war es eigentlich auch schon für das "normale" Arbeiten an der Dokumentation.**

Entwicker und technisch Neugierige finden in [DEVELOPMENT.md](DEVELOPMENT.md) weitere Informationen.

